package com.money.common.log;


import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.money.common.constant.WebRequestConstant;
import com.money.common.context.WebRequestContext;
import com.money.common.context.WebRequestContextHolder;
import com.money.common.util.IpUtil;
import com.money.common.util.WebUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.MDC;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.net.URL;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author : money
 * @version : 1.0.0
 * @description : 默认全局web日志方面
 * @createTime : 2022-01-01 13:26:12
 */
@Slf4j
@Aspect
@Order(-1)
@Component
@ConditionalOnProperty(prefix = "money.web", name = "web-log-aspect", matchIfMissing = true)
public class DefaultWebLogAspect {

    @Pointcut("execution(public * com.money..controller..*.*(..))")
    public void webLog() {
    }

    @Around("webLog()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        LocalDateTime now = LocalDateTime.now();
        long startTime = Instant.now().toEpochMilli();
        log.info("=============================================");
        // 获取当前请求对象
        HttpServletRequest request = WebUtil.getRequest();
        // 链路追踪
        String requestId = request.getHeader(WebRequestConstant.HEADER_REQUEST_ID);
        MDC.put("requestId", requestId);
        // 记录请求信息
        Signature signature = joinPoint.getSignature();
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
        String requestMethod = request.getMethod();
        String url = request.getRequestURL().toString();
        log.info("{} {}", requestMethod, url);
        // 填充上下文
        this.fillRequestContext(request);
        log.info("{}", WebRequestContextHolder.getContext());
        // 执行
        Object result = null;
        try {
           result = joinPoint.proceed();
        } finally {
            long endTime = Instant.now().toEpochMilli();
            long spendTime = endTime - startTime;
            WebLog webLog = WebLog.builder()
                    .basePath(url.replace(new URL(url).getPath(), ""))
                    .ip(IpUtil.getIp(request))
                    .method(requestMethod)
                    .parameter(this.getParameter(method, joinPoint.getArgs()))
                    .url(url)
                    .uri(request.getRequestURI())
                    .result(result)
                    .operationTime(now.toString())
                    .spendTime(spendTime)
                    .build();
            log.info("detail {}", JSONUtil.toJsonStr(webLog));
            log.info("spend time: {}ms", spendTime);
        }
        return result;
    }

    /**
     * 得到参数
     *
     * @param method 方法
     * @param args   arg
     * @return {@link Object}
     */
    private Object getParameter(Method method, Object[] args) {
        List<Object> argList = new ArrayList<>();
        Parameter[] parameters = method.getParameters();
        for (int i = 0; i < parameters.length; i++) {
            //将RequestParam注解修饰的参数作为请求参数
            RequestParam requestParam = parameters[i].getAnnotation(RequestParam.class);
            if (requestParam != null) {
                String key = requestParam.value().equals("") ? parameters[i].getName() : requestParam.value();
                argList.add(Collections.singletonMap(key, args[i]));
            } else {
                argList.add(Collections.singletonMap(parameters[i].getName(), args[i]));
            }
        }
        return argList.size() == 1 ? argList.get(0) : argList;
    }

    /**
     * 填补请求上下文中
     *
     * @param request 请求
     */
    private void fillRequestContext(HttpServletRequest request) {
        WebRequestContext context = new WebRequestContext();
        String requestId = request.getHeader(WebRequestConstant.HEADER_REQUEST_ID);
        String lang = request.getHeader(WebRequestConstant.HEADER_LANG);
        context.setRequestId(requestId);
        context.setLang(lang);
        String timezone = request.getHeader(WebRequestConstant.HEADER_TIMEZONE);
        if (StrUtil.isNotBlank(timezone)) {
            context.setTimezone(ZoneId.of(timezone));
        }
        WebRequestContextHolder.setContext(context);
    }

}