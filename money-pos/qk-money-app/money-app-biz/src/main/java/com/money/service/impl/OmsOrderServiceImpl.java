package com.money.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.money.common.exception.BaseException;
import com.money.common.util.BeanMapUtil;
import com.money.common.vo.PageVO;
import com.money.constant.OrderStatusEnum;
import com.money.dto.OmsOrder.*;
import com.money.dto.OmsOrderDetail.OmsOrderDetailVO;
import com.money.dto.UmsMember.UmsMemberVO;
import com.money.entity.OmsOrder;
import com.money.entity.OmsOrderDetail;
import com.money.entity.OmsOrderLog;
import com.money.mapper.OmsOrderMapper;
import com.money.service.*;
import com.money.util.PageUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author money
 * @since 2023-02-27
 */
@Service
@RequiredArgsConstructor
public class OmsOrderServiceImpl extends ServiceImpl<OmsOrderMapper, OmsOrder> implements OmsOrderService {

    private final UmsMemberService umsMemberService;
    private final GmsGoodsService gmsGoodsService;
    private final OmsOrderDetailService omsOrderDetailService;
    private final OmsOrderLogService omsOrderLogService;

    @Override
    public PageVO<OmsOrderVO> list(OmsOrderQueryDTO queryDTO) {
        Page<OmsOrder> page = this.lambdaQuery().eq(StrUtil.isNotBlank(queryDTO.getStatus()), OmsOrder::getStatus, queryDTO.getStatus())
                .like(StrUtil.isNotBlank(queryDTO.getOrderNo()), OmsOrder::getOrderNo, queryDTO.getOrderNo())
                .like(StrUtil.isNotBlank(queryDTO.getMember()), OmsOrder::getMember, queryDTO.getMember())
                .ge(queryDTO.getStartTime() != null, OmsOrder::getCreateTime, queryDTO.getStartTime())
                .le(queryDTO.getEndTime() != null, OmsOrder::getCreateTime, queryDTO.getEndTime())
                .orderByDesc(StrUtil.isBlank(queryDTO.getSort()), OmsOrder::getCreateTime)
                .last(StrUtil.isNotBlank(queryDTO.getSort()), queryDTO.getOrderBySql())
                .page(PageUtil.toPage(queryDTO));
        return PageUtil.toPageVO(page, OmsOrderVO::new);
    }

    @Override
    public OrderCountVO countOrderAndSales(LocalDateTime startTime, LocalDateTime endTime) {
        List<OmsOrderDetail> omsOrderDetails = omsOrderDetailService.lambdaQuery()
                .select(OmsOrderDetail::getOrderNo, OmsOrderDetail::getQuantity, OmsOrderDetail::getReturnQuantity,
                        OmsOrderDetail::getGoodsPrice, OmsOrderDetail::getPurchasePrice)
                .eq(OmsOrderDetail::getStatus, OrderStatusEnum.PAID)
                .ge(startTime != null, OmsOrderDetail::getCreateTime, startTime)
                .le(endTime != null, OmsOrderDetail::getCreateTime, endTime)
                .list();
        long count = omsOrderDetails.stream().map(OmsOrderDetail::getOrderNo).distinct().count();
        BigDecimal saleCount = BigDecimal.ZERO;
        BigDecimal costCount = BigDecimal.ZERO;
        for (OmsOrderDetail omsOrderDetail : omsOrderDetails) {
            int quantity = omsOrderDetail.getQuantity() - omsOrderDetail.getReturnQuantity();
            saleCount = saleCount.add(omsOrderDetail.getGoodsPrice().multiply(new BigDecimal(quantity)));
            costCount = costCount.add(omsOrderDetail.getPurchasePrice().multiply(new BigDecimal(quantity)));
        }
        OrderCountVO vo = new OrderCountVO();
        vo.setOrderCount(count);
        vo.setSaleCount(saleCount);
        vo.setCostCount(costCount);
        vo.setProfit(saleCount.subtract(costCount));
        return vo;
    }

    @Override
    public OrderDetailVO getDetail(Long id) {
        OrderDetailVO vo = new OrderDetailVO();
        OmsOrder order = this.getById(id);
        if (order == null) {
            throw new BaseException("订单不存在");
        }
        vo.setOrder(BeanMapUtil.to(order, OmsOrderVO::new));
        vo.setMember(BeanMapUtil.to(umsMemberService.getById(order.getMemberId()), UmsMemberVO::new));
        vo.setOrderDetail(BeanMapUtil.to(omsOrderDetailService.getOrderDetail(order.getOrderNo()), OmsOrderDetailVO::new));
        return vo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void returnOrder(Set<Long> ids) {
        ids.stream().map(this::getById).forEach(order -> {
            List<OmsOrderDetail> orderDetails = omsOrderDetailService.getOrderDetail(order.getOrderNo());
            AtomicReference<BigDecimal> returnPrice = new AtomicReference<>(BigDecimal.ZERO);
            AtomicReference<BigDecimal> returnCoupon = new AtomicReference<>(BigDecimal.ZERO);
            orderDetails.forEach(orderDetail -> {
                int returnQty = orderDetail.getQuantity() - orderDetail.getReturnQuantity();
                returnPrice.set(returnPrice.get().add(orderDetail.getGoodsPrice().multiply(new BigDecimal(returnQty))));
                returnCoupon.set(returnCoupon.get().add(orderDetail.getCoupon().multiply(new BigDecimal(returnQty))));
                // 更新库存
                gmsGoodsService.updateStock(orderDetail.getGoodsId(), returnQty);
                orderDetail.setReturnQuantity(orderDetail.getQuantity());
                orderDetail.setStatus(OrderStatusEnum.RETURN.name());
            });
            // 退款和抵用券
            umsMemberService.rebate(order.getMemberId(), returnPrice.get(), returnCoupon.get(), true);
            // 修改订单最终销售额
            order.setFinalSalesAmount(BigDecimal.ZERO);
            order.setStatus(OrderStatusEnum.RETURN.name());
            this.updateById(order);
            omsOrderDetailService.updateBatchById(orderDetails);
            // 订单日志
            OmsOrderLog log = new OmsOrderLog();
            log.setOrderId(order.getId());
            log.setDescription("<span style=\"color:red\">退单</span>");
            omsOrderLogService.save(log);
        });
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void returnGoods(ReturnGoodsDTO returnGoodsDTO) {
        // 修改明细
        Integer returnQty = returnGoodsDTO.getQuantity();
        OmsOrderDetail orderDetail = omsOrderDetailService.getById(returnGoodsDTO.getId());
        orderDetail.setReturnQuantity(orderDetail.getReturnQuantity() + returnQty);
        if (orderDetail.getReturnQuantity().compareTo(orderDetail.getQuantity()) == 0) {
            orderDetail.setStatus(OrderStatusEnum.RETURN.name());
        } else if (orderDetail.getReturnQuantity().compareTo(orderDetail.getQuantity()) > 0) {
            throw new BaseException("退货数量不能超过商品数量");
        }
        omsOrderDetailService.updateById(orderDetail);
        // 修改订单
        OmsOrder order = this.lambdaQuery().eq(OmsOrder::getOrderNo, orderDetail.getOrderNo()).one();
        BigDecimal returnPrice = orderDetail.getGoodsPrice().multiply(new BigDecimal(returnQty));
        BigDecimal finalSalesAmount = order.getFinalSalesAmount().subtract(returnPrice);
        order.setFinalSalesAmount(finalSalesAmount);
        this.updateById(order);
        // 退款和抵用券
        BigDecimal returnCoupon = orderDetail.getCoupon().multiply(new BigDecimal(returnQty));
        umsMemberService.rebate(order.getMemberId(), returnPrice, returnCoupon, false);
        // 更新库存
        gmsGoodsService.updateStock(orderDetail.getGoodsId(), returnQty);
        // 订单日志
        OmsOrderLog log = new OmsOrderLog();
        log.setOrderId(order.getId());
        log.setDescription("<span style=\"color:red\">退货</span>" + orderDetail.getGoodsName() + " X " + returnQty);
        omsOrderLogService.save(log);
    }

}
