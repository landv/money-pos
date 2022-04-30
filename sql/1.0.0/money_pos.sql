/*
 Navicat Premium Data Transfer

 Source Server         : t-money
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 175.178.102.32:3306
 Source Schema         : money_pos_demo

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 29/04/2022 20:04:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gms_brand
-- ----------------------------
DROP TABLE IF EXISTS `gms_brand`;
CREATE TABLE `gms_brand`  (
  `id` bigint UNSIGNED NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '品牌logo',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名称',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '品牌描述',
  `goods_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gms_brand
-- ----------------------------
INSERT INTO `gms_brand` VALUES (1511186250869108738, 'brand/1649129853343.jpg', '绿叶', '苏州绿叶日用品有限公司位于苏州国家高新区浒墅关工业园内，简称绿叶科技集团，是一家集科技研发、智能制造、自主品牌推广、互联网营销、绿叶惠购APP、连锁经营于一体的现代化集团企业。', 1, 99, 'money', '2022-04-05 11:37:33', 'money', '2022-04-05 11:40:37', 0);
INSERT INTO `gms_brand` VALUES (1512619833911414785, 'brand/1649471646171.jpg', '邻友', '广州市邻友电子商务有限公司，简称“邻友”，是一家致力于为消费者打造放心购物、分享创富的日用护肤品公司。邻友打破传统销售模式，实现信息化对称、去中间化、线上线下结合F2C新零售新电商。实施多品牌战略，已拥有兰素秀、韩乔菲、妞妞女孩、邻纯、安雅康五大自主品牌系列', 0, 99, 'money', '2022-04-09 10:34:06', 'money', '2022-04-09 10:34:06', 0);

-- ----------------------------
-- Table structure for gms_goods
-- ----------------------------
DROP TABLE IF EXISTS `gms_goods`;
CREATE TABLE `gms_goods`  (
  `id` bigint NOT NULL,
  `brand_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '品牌id',
  `category_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标签',
  `barcode` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '条码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `pinyin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品拼音',
  `pic` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '商品图片',
  `unit` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '单位',
  `size` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '规格',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '描述',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '进价',
  `sale_price` decimal(10, 2) NOT NULL COMMENT '售价',
  `vip_price` decimal(10, 2) NOT NULL COMMENT '会员价',
  `coupon` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用券',
  `stock` bigint NOT NULL DEFAULT 0 COMMENT '库存',
  `sales` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'SALE' COMMENT '状态',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gms_goods
-- ----------------------------

-- ----------------------------
-- Table structure for gms_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `gms_goods_category`;
CREATE TABLE `gms_goods_category`  (
  `id` bigint UNSIGNED NOT NULL,
  `pid` bigint UNSIGNED NOT NULL COMMENT '父分类id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类图标',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `goods_count` int NOT NULL DEFAULT 0 COMMENT '商品数量',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gms_goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint UNSIGNED NOT NULL,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `member` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '零售' COMMENT '会员名',
  `member_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员id',
  `vip` tinyint(1) NOT NULL COMMENT 'vip单',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `contact` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '联系方式',
  `province` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '地区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `cost_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '总成本',
  `total_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '总价',
  `pay_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '实付款',
  `coupon_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '抵用券',
  `final_sales_amount` decimal(10, 2) UNSIGNED NOT NULL COMMENT '最终销售金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `payment_time` datetime NOT NULL COMMENT '支付时间',
  `completion_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_detail`;
CREATE TABLE `oms_order_detail`  (
  `id` bigint NOT NULL,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单号',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `goods_barcode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品条码',
  `goods_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10, 2) NOT NULL COMMENT '实际单价',
  `quantity` int UNSIGNED NOT NULL COMMENT '数量',
  `sale_price` decimal(10, 2) NOT NULL COMMENT '售价',
  `purchase_price` decimal(10, 2) NOT NULL COMMENT '进价',
  `vip_price` decimal(10, 2) NOT NULL COMMENT '会员价',
  `coupon` decimal(10, 2) NOT NULL COMMENT '抵用券',
  `return_quantity` int NOT NULL DEFAULT 0 COMMENT '退货数量',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_log`;
CREATE TABLE `oms_order_log`  (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '描述',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `district_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city_geocode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district_geocode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES ('110100', '北京市', '北京市', '110100', '北京', '110100', '116.405285', '39.904989');
INSERT INTO `provinces` VALUES ('110101', '北京市', '北京市', '110100', '东城', '110101', '116.418757', '39.917544');
INSERT INTO `provinces` VALUES ('110102', '北京市', '北京市', '110100', '西城', '110102', '116.366794', '39.915309');
INSERT INTO `provinces` VALUES ('110105', '北京市', '北京市', '110100', '朝阳', '110105', '116.486409', '39.921489');
INSERT INTO `provinces` VALUES ('110106', '北京市', '北京市', '110100', '丰台', '110106', '116.286968', '39.863642');
INSERT INTO `provinces` VALUES ('110107', '北京市', '北京市', '110100', '石景山', '110107', '116.195445', '39.914601');
INSERT INTO `provinces` VALUES ('110108', '北京市', '北京市', '110100', '海淀', '110108', '116.310316', '39.956074');
INSERT INTO `provinces` VALUES ('110109', '北京市', '北京市', '110100', '门头沟', '110109', '116.105381', '39.937183');
INSERT INTO `provinces` VALUES ('110111', '北京市', '北京市', '110100', '房山', '110111', '116.139157', '39.735535');
INSERT INTO `provinces` VALUES ('110112', '北京市', '北京市', '110100', '通州', '110112', '116.658603', '39.902486');
INSERT INTO `provinces` VALUES ('110113', '北京市', '北京市', '110100', '顺义', '110113', '116.653525', '40.128936');
INSERT INTO `provinces` VALUES ('110114', '北京市', '北京市', '110100', '昌平', '110114', '116.235906', '40.218085');
INSERT INTO `provinces` VALUES ('110115', '北京市', '北京市', '110100', '大兴', '110115', '116.338033', '39.728908');
INSERT INTO `provinces` VALUES ('110116', '北京市', '北京市', '110100', '怀柔', '110116', '116.637122', '40.324272');
INSERT INTO `provinces` VALUES ('110117', '北京市', '北京市', '110100', '平谷', '110117', '117.112335', '40.144783');
INSERT INTO `provinces` VALUES ('110118', '北京市', '北京市', '110100', '密云', '110118', '116.843352', '40.377362');
INSERT INTO `provinces` VALUES ('110119', '北京市', '北京市', '110100', '延庆', '110119', '115.985006', '40.465325');
INSERT INTO `provinces` VALUES ('120100', '天津市', '天津市', '120100', '天津', '120100', '117.190182', '39.125596');
INSERT INTO `provinces` VALUES ('120101', '天津市', '天津市', '120100', '和平区', '120101', '117.195907', '39.118327');
INSERT INTO `provinces` VALUES ('120102', '天津市', '天津市', '120100', '河东区', '120102', '117.226568', '39.122125');
INSERT INTO `provinces` VALUES ('120103', '天津市', '天津市', '120100', '河西区', '120103', '117.217536', '39.101897');
INSERT INTO `provinces` VALUES ('120104', '天津市', '天津市', '120100', '南开区', '120104', '117.164143', '39.120474');
INSERT INTO `provinces` VALUES ('120105', '天津市', '天津市', '120100', '河北区', '120105', '117.201569', '39.156632');
INSERT INTO `provinces` VALUES ('120106', '天津市', '天津市', '120100', '红桥区', '120106', '117.163301', '39.175066');
INSERT INTO `provinces` VALUES ('120110', '天津市', '天津市', '120100', '东丽区', '120110', '117.313967', '39.087764');
INSERT INTO `provinces` VALUES ('120111', '天津市', '天津市', '120100', '西青区', '120111', '117.012247', '39.139446');
INSERT INTO `provinces` VALUES ('120112', '天津市', '天津市', '120100', '津南区', '120112', '117.382549', '38.989577');
INSERT INTO `provinces` VALUES ('120113', '天津市', '天津市', '120100', '北辰区', '120113', '117.13482', '39.225555');
INSERT INTO `provinces` VALUES ('120114', '天津市', '天津市', '120100', '武清区', '120114', '117.057959', '39.376925');
INSERT INTO `provinces` VALUES ('120115', '天津市', '天津市', '120100', '宝坻区', '120115', '117.308094', '39.716965');
INSERT INTO `provinces` VALUES ('120116', '天津市', '天津市', '120100', '滨海新区', '120116', '117.654173', '39.032846');
INSERT INTO `provinces` VALUES ('120117', '天津市', '天津市', '120100', '宁河区', '120117', '117.82828', '39.328886');
INSERT INTO `provinces` VALUES ('120118', '天津市', '天津市', '120100', '静海区', '120118', '116.925304', '38.935671');
INSERT INTO `provinces` VALUES ('120119', '天津市', '天津市', '120100', '蓟州区', '120119', '117.407449', '40.045342');
INSERT INTO `provinces` VALUES ('130100', '河北省', '石家庄市', '130100', '石家庄', '130100', '114.502461', '38.045474');
INSERT INTO `provinces` VALUES ('130102', '河北省', '石家庄市', '130100', '长安区', '130102', '114.548151', '38.047501');
INSERT INTO `provinces` VALUES ('130104', '河北省', '石家庄市', '130100', '桥西区', '130104', '114.462931', '38.028383');
INSERT INTO `provinces` VALUES ('130105', '河北省', '石家庄市', '130100', '新华区', '130105', '114.465974', '38.067142');
INSERT INTO `provinces` VALUES ('130107', '河北省', '石家庄市', '130100', '井陉矿区', '130107', '114.058178', '38.069748');
INSERT INTO `provinces` VALUES ('130108', '河北省', '石家庄市', '130100', '裕华', '130108', '114.533257', '38.027696');
INSERT INTO `provinces` VALUES ('130109', '河北省', '石家庄市', '130100', '藁城', '130109', '114.849647', '38.033767');
INSERT INTO `provinces` VALUES ('130110', '河北省', '石家庄市', '130100', '鹿泉', '130110', '114.321023', '38.093994');
INSERT INTO `provinces` VALUES ('130111', '河北省', '石家庄市', '130100', '栾城', '130111', '114.654281', '37.886911');
INSERT INTO `provinces` VALUES ('130121', '河北省', '石家庄市', '130100', '井陉', '130121', '114.144488', '38.033614');
INSERT INTO `provinces` VALUES ('130123', '河北省', '石家庄市', '130100', '正定', '130123', '114.569887', '38.147835');
INSERT INTO `provinces` VALUES ('130125', '河北省', '石家庄市', '130100', '行唐', '130125', '114.552734', '38.437422');
INSERT INTO `provinces` VALUES ('130126', '河北省', '石家庄市', '130100', '灵寿', '130126', '114.37946', '38.306546');
INSERT INTO `provinces` VALUES ('130127', '河北省', '石家庄市', '130100', '高邑', '130127', '114.610699', '37.605714');
INSERT INTO `provinces` VALUES ('130128', '河北省', '石家庄市', '130100', '深泽', '130128', '115.200207', '38.18454');
INSERT INTO `provinces` VALUES ('130129', '河北省', '石家庄市', '130100', '赞皇', '130129', '114.387756', '37.660199');
INSERT INTO `provinces` VALUES ('130130', '河北省', '石家庄市', '130100', '无极', '130130', '114.977845', '38.176376');
INSERT INTO `provinces` VALUES ('130131', '河北省', '石家庄市', '130100', '平山', '130131', '114.184144', '38.259311');
INSERT INTO `provinces` VALUES ('130132', '河北省', '石家庄市', '130100', '元氏', '130132', '114.52618', '37.762514');
INSERT INTO `provinces` VALUES ('130133', '河北省', '石家庄市', '130100', '赵县', '130133', '114.775362', '37.754341');
INSERT INTO `provinces` VALUES ('130181', '河北省', '石家庄市', '130100', '辛集', '130181', '115.217451', '37.92904');
INSERT INTO `provinces` VALUES ('130183', '河北省', '石家庄市', '130100', '晋州', '130183', '115.044886', '38.027478');
INSERT INTO `provinces` VALUES ('130184', '河北省', '石家庄市', '130100', '新乐', '130184', '114.68578', '38.344768');
INSERT INTO `provinces` VALUES ('130200', '河北省', '唐山市', '130200', '唐山', '130200', '118.175393', '39.635113');
INSERT INTO `provinces` VALUES ('130202', '河北省', '唐山市', '130200', '路南区', '130202', '118.210821', '39.615162');
INSERT INTO `provinces` VALUES ('130203', '河北省', '唐山市', '130200', '路北区', '130203', '118.174736', '39.628538');
INSERT INTO `provinces` VALUES ('130204', '河北省', '唐山市', '130200', '古冶', '130204', '118.45429', '39.715736');
INSERT INTO `provinces` VALUES ('130205', '河北省', '唐山市', '130200', '开平区', '130205', '118.264425', '39.676171');
INSERT INTO `provinces` VALUES ('130207', '河北省', '唐山市', '130200', '丰南', '130207', '118.110793', '39.56303');
INSERT INTO `provinces` VALUES ('130208', '河北省', '唐山市', '130200', '丰润', '130208', '118.155779', '39.831363');
INSERT INTO `provinces` VALUES ('130209', '河北省', '唐山市', '130200', '曹妃甸', '130209', '118.446585', '39.278277');
INSERT INTO `provinces` VALUES ('130224', '河北省', '唐山市', '130200', '滦南', '130224', '118.681552', '39.506201');
INSERT INTO `provinces` VALUES ('130225', '河北省', '唐山市', '130200', '乐亭', '130225', '118.905341', '39.42813');
INSERT INTO `provinces` VALUES ('130227', '河北省', '唐山市', '130200', '迁西', '130227', '118.305139', '40.146238');
INSERT INTO `provinces` VALUES ('130229', '河北省', '唐山市', '130200', '玉田', '130229', '117.753665', '39.887323');
INSERT INTO `provinces` VALUES ('130281', '河北省', '唐山市', '130200', '遵化', '130281', '117.965875', '40.188616');
INSERT INTO `provinces` VALUES ('130283', '河北省', '唐山市', '130200', '迁安', '130283', '118.701933', '40.012108');
INSERT INTO `provinces` VALUES ('130284', '河北省', '唐山市', '130200', '滦州', '130284', '118.71048', '39.747116');
INSERT INTO `provinces` VALUES ('130300', '河北省', '秦皇岛市', '130300', '秦皇岛', '130300', '119.586579', '39.942531');
INSERT INTO `provinces` VALUES ('130302', '河北省', '秦皇岛市', '130300', '海港区', '130302', '119.596224', '39.943458');
INSERT INTO `provinces` VALUES ('130303', '河北省', '秦皇岛市', '130300', '山海关', '130303', '119.753591', '39.998023');
INSERT INTO `provinces` VALUES ('130304', '河北省', '秦皇岛市', '130300', '北戴河', '130304', '119.486286', '39.825121');
INSERT INTO `provinces` VALUES ('130306', '河北省', '秦皇岛市', '130300', '抚宁', '130306', '119.240651', '39.887053');
INSERT INTO `provinces` VALUES ('130321', '河北省', '秦皇岛市', '130300', '青龙', '130321', '118.954555', '40.406023');
INSERT INTO `provinces` VALUES ('130322', '河北省', '秦皇岛市', '130300', '昌黎', '130322', '119.164541', '39.709729');
INSERT INTO `provinces` VALUES ('130324', '河北省', '秦皇岛市', '130300', '卢龙', '130324', '118.881809', '39.891639');
INSERT INTO `provinces` VALUES ('130400', '河北省', '邯郸市', '130400', '邯郸', '130400', '114.490686', '36.612273');
INSERT INTO `provinces` VALUES ('130402', '河北省', '邯郸市', '130400', '邯山区', '130402', '114.484989', '36.603196');
INSERT INTO `provinces` VALUES ('130403', '河北省', '邯郸市', '130400', '丛台区', '130403', '114.494703', '36.611082');
INSERT INTO `provinces` VALUES ('130404', '河北省', '邯郸市', '130400', '复兴区', '130404', '114.458242', '36.615484');
INSERT INTO `provinces` VALUES ('130406', '河北省', '邯郸市', '130400', '峰峰', '130406', '114.209936', '36.420487');
INSERT INTO `provinces` VALUES ('130407', '河北省', '邯郸市', '130400', '肥乡', '130407', '114.805154', '36.555778');
INSERT INTO `provinces` VALUES ('130408', '河北省', '邯郸市', '130400', '永年', '130408', '114.496162', '36.776413');
INSERT INTO `provinces` VALUES ('130423', '河北省', '邯郸市', '130400', '临漳', '130423', '114.610703', '36.337604');
INSERT INTO `provinces` VALUES ('130424', '河北省', '邯郸市', '130400', '成安', '130424', '114.680356', '36.443832');
INSERT INTO `provinces` VALUES ('130425', '河北省', '邯郸市', '130400', '大名', '130425', '115.152586', '36.283316');
INSERT INTO `provinces` VALUES ('130426', '河北省', '邯郸市', '130400', '涉县', '130426', '113.673297', '36.563143');
INSERT INTO `provinces` VALUES ('130427', '河北省', '邯郸市', '130400', '磁县', '130427', '114.38208', '36.367673');
INSERT INTO `provinces` VALUES ('130430', '河北省', '邯郸市', '130400', '邱县', '130430', '115.168584', '36.81325');
INSERT INTO `provinces` VALUES ('130431', '河北省', '邯郸市', '130400', '鸡泽', '130431', '114.878517', '36.914908');
INSERT INTO `provinces` VALUES ('130432', '河北省', '邯郸市', '130400', '广平', '130432', '114.950859', '36.483603');
INSERT INTO `provinces` VALUES ('130433', '河北省', '邯郸市', '130400', '馆陶', '130433', '115.289057', '36.539461');
INSERT INTO `provinces` VALUES ('130434', '河北省', '邯郸市', '130400', '魏县', '130434', '114.93411', '36.354248');
INSERT INTO `provinces` VALUES ('130435', '河北省', '邯郸市', '130400', '曲周', '130435', '114.957588', '36.773398');
INSERT INTO `provinces` VALUES ('130481', '河北省', '邯郸市', '130400', '武安', '130481', '114.194581', '36.696115');
INSERT INTO `provinces` VALUES ('130500', '河北省', '邢台市', '130500', '邢台', '130500', '114.561132', '37.05073');
INSERT INTO `provinces` VALUES ('130502', '河北省', '邢台市', '130500', '桥东区', '130502', '114.507131', '37.064125');
INSERT INTO `provinces` VALUES ('130503', '河北省', '邢台市', '130500', '桥西区', '130503', '114.473687', '37.068009');
INSERT INTO `provinces` VALUES ('130521', '河北省', '邢台市', '130500', '邢台县', '130521', '114.143411', '37.177109');
INSERT INTO `provinces` VALUES ('130522', '河北省', '邢台市', '130500', '临城', '130522', '114.506873', '37.444009');
INSERT INTO `provinces` VALUES ('130523', '河北省', '邢台市', '130500', '内丘', '130523', '114.511523', '37.287663');
INSERT INTO `provinces` VALUES ('130524', '河北省', '邢台市', '130500', '柏乡', '130524', '114.693382', '37.483596');
INSERT INTO `provinces` VALUES ('130525', '河北省', '邢台市', '130500', '隆尧', '130525', '114.776348', '37.350925');
INSERT INTO `provinces` VALUES ('130526', '河北省', '邢台市', '130500', '任县', '130526', '114.684469', '37.129952');
INSERT INTO `provinces` VALUES ('130527', '河北省', '邢台市', '130500', '南和', '130527', '114.691377', '37.003812');
INSERT INTO `provinces` VALUES ('130528', '河北省', '邢台市', '130500', '宁晋', '130528', '114.921027', '37.618956');
INSERT INTO `provinces` VALUES ('130529', '河北省', '邢台市', '130500', '巨鹿', '130529', '115.038782', '37.21768');
INSERT INTO `provinces` VALUES ('130530', '河北省', '邢台市', '130500', '新河', '130530', '115.247537', '37.526216');
INSERT INTO `provinces` VALUES ('130531', '河北省', '邢台市', '130500', '广宗', '130531', '115.142797', '37.075548');
INSERT INTO `provinces` VALUES ('130532', '河北省', '邢台市', '130500', '平乡', '130532', '115.029218', '37.069404');
INSERT INTO `provinces` VALUES ('130533', '河北省', '邢台市', '130500', '威县', '130533', '115.272749', '36.983272');
INSERT INTO `provinces` VALUES ('130534', '河北省', '邢台市', '130500', '清河', '130534', '115.668999', '37.059991');
INSERT INTO `provinces` VALUES ('130535', '河北省', '邢台市', '130500', '临西', '130535', '115.498684', '36.8642');
INSERT INTO `provinces` VALUES ('130581', '河北省', '邢台市', '130500', '南宫', '130581', '115.398102', '37.359668');
INSERT INTO `provinces` VALUES ('130582', '河北省', '邢台市', '130500', '沙河', '130582', '114.504902', '36.861903');
INSERT INTO `provinces` VALUES ('130600', '河北省', '保定市', '130600', '保定', '130600', '115.482331', '38.867657');
INSERT INTO `provinces` VALUES ('130602', '河北省', '保定市', '130600', '竞秀', '130602', '115.470659', '38.88662');
INSERT INTO `provinces` VALUES ('130606', '河北省', '保定市', '130600', '莲池', '130606', '115.500934', '38.865005');
INSERT INTO `provinces` VALUES ('130607', '河北省', '保定市', '130600', '满城', '130607', '115.32442', '38.95138');
INSERT INTO `provinces` VALUES ('130608', '河北省', '保定市', '130600', '清苑', '130608', '115.492221', '38.771012');
INSERT INTO `provinces` VALUES ('130609', '河北省', '保定市', '130600', '徐水', '130609', '115.64941', '39.020395');
INSERT INTO `provinces` VALUES ('130623', '河北省', '保定市', '130600', '涞水', '130623', '115.711985', '39.393148');
INSERT INTO `provinces` VALUES ('130624', '河北省', '保定市', '130600', '阜平', '130624', '114.198801', '38.847276');
INSERT INTO `provinces` VALUES ('130626', '河北省', '保定市', '130600', '定兴', '130626', '115.796895', '39.266195');
INSERT INTO `provinces` VALUES ('130627', '河北省', '保定市', '130600', '唐县', '130627', '114.981241', '38.748542');
INSERT INTO `provinces` VALUES ('130628', '河北省', '保定市', '130600', '高阳', '130628', '115.778878', '38.690092');
INSERT INTO `provinces` VALUES ('130629', '河北省', '保定市', '130600', '容城', '130629', '115.866247', '39.05282');
INSERT INTO `provinces` VALUES ('130630', '河北省', '保定市', '130600', '涞源', '130630', '114.692567', '39.35755');
INSERT INTO `provinces` VALUES ('130631', '河北省', '保定市', '130600', '望都', '130631', '115.154009', '38.707448');
INSERT INTO `provinces` VALUES ('130632', '河北省', '保定市', '130600', '安新', '130632', '115.931979', '38.929912');
INSERT INTO `provinces` VALUES ('130633', '河北省', '保定市', '130600', '易县', '130633', '115.501146', '39.35297');
INSERT INTO `provinces` VALUES ('130634', '河北省', '保定市', '130600', '曲阳', '130634', '114.704055', '38.619992');
INSERT INTO `provinces` VALUES ('130635', '河北省', '保定市', '130600', '蠡县', '130635', '115.583631', '38.496429');
INSERT INTO `provinces` VALUES ('130636', '河北省', '保定市', '130600', '顺平', '130636', '115.132749', '38.845127');
INSERT INTO `provinces` VALUES ('130637', '河北省', '保定市', '130600', '博野', '130637', '115.461798', '38.458271');
INSERT INTO `provinces` VALUES ('130638', '河北省', '保定市', '130600', '雄县', '130638', '116.107474', '38.990819');
INSERT INTO `provinces` VALUES ('130681', '河北省', '保定市', '130600', '涿州', '130681', '115.973409', '39.485765');
INSERT INTO `provinces` VALUES ('130682', '河北省', '保定市', '130600', '定州', '130682', '114.991389', '38.517602');
INSERT INTO `provinces` VALUES ('130683', '河北省', '保定市', '130600', '安国', '130683', '115.33141', '38.421367');
INSERT INTO `provinces` VALUES ('130684', '河北省', '保定市', '130600', '高碑店', '130684', '115.882704', '39.327689');
INSERT INTO `provinces` VALUES ('130700', '河北省', '张家口市', '130700', '张家口', '130700', '114.884091', '40.811901');
INSERT INTO `provinces` VALUES ('130702', '河北省', '张家口市', '130700', '桥东区', '130702', '114.885658', '40.813875');
INSERT INTO `provinces` VALUES ('130703', '河北省', '张家口市', '130700', '桥西区', '130703', '114.882127', '40.824385');
INSERT INTO `provinces` VALUES ('130705', '河北省', '张家口市', '130700', '宣化', '130705', '115.0632', '40.609368');
INSERT INTO `provinces` VALUES ('130706', '河北省', '张家口市', '130700', '下花园', '130706', '115.281002', '40.488645');
INSERT INTO `provinces` VALUES ('130708', '河北省', '张家口市', '130700', '万全', '130708', '114.736131', '40.765136');
INSERT INTO `provinces` VALUES ('130709', '河北省', '张家口市', '130700', '崇礼', '130709', '115.281652', '40.971302');
INSERT INTO `provinces` VALUES ('130722', '河北省', '张家口市', '130700', '张北', '130722', '114.715951', '41.151713');
INSERT INTO `provinces` VALUES ('130723', '河北省', '张家口市', '130700', '康保', '130723', '114.615809', '41.850046');
INSERT INTO `provinces` VALUES ('130724', '河北省', '张家口市', '130700', '沽源', '130724', '115.684836', '41.667419');
INSERT INTO `provinces` VALUES ('130725', '河北省', '张家口市', '130700', '尚义', '130725', '113.977713', '41.080091');
INSERT INTO `provinces` VALUES ('130726', '河北省', '张家口市', '130700', '蔚县', '130726', '114.582695', '39.837181');
INSERT INTO `provinces` VALUES ('130727', '河北省', '张家口市', '130700', '阳原', '130727', '114.167343', '40.113419');
INSERT INTO `provinces` VALUES ('130728', '河北省', '张家口市', '130700', '怀安', '130728', '114.422364', '40.671274');
INSERT INTO `provinces` VALUES ('130730', '河北省', '张家口市', '130700', '怀来', '130730', '115.520846', '40.405405');
INSERT INTO `provinces` VALUES ('130731', '河北省', '张家口市', '130700', '涿鹿', '130731', '115.219246', '40.378701');
INSERT INTO `provinces` VALUES ('130732', '河北省', '张家口市', '130700', '赤城', '130732', '115.832708', '40.912081');
INSERT INTO `provinces` VALUES ('130800', '河北省', '承德市', '130800', '承德', '130800', '117.939152', '40.976204');
INSERT INTO `provinces` VALUES ('130802', '河北省', '承德市', '130800', '双桥', '130802', '117.939152', '40.976204');
INSERT INTO `provinces` VALUES ('130803', '河北省', '承德市', '130800', '双滦', '130803', '117.797485', '40.959756');
INSERT INTO `provinces` VALUES ('130804', '河北省', '承德市', '130800', '鹰手营子', '130804', '117.661154', '40.546956');
INSERT INTO `provinces` VALUES ('130821', '河北省', '承德市', '130800', '承德县', '130821', '118.172496', '40.768637');
INSERT INTO `provinces` VALUES ('130822', '河北省', '承德市', '130800', '兴隆', '130822', '117.507098', '40.418525');
INSERT INTO `provinces` VALUES ('130824', '河北省', '承德市', '130800', '滦平', '130824', '117.337124', '40.936644');
INSERT INTO `provinces` VALUES ('130825', '河北省', '承德市', '130800', '隆化', '130825', '117.736343', '41.316667');
INSERT INTO `provinces` VALUES ('130826', '河北省', '承德市', '130800', '丰宁', '130826', '116.65121', '41.209903');
INSERT INTO `provinces` VALUES ('130827', '河北省', '承德市', '130800', '宽城', '130827', '118.488642', '40.607981');
INSERT INTO `provinces` VALUES ('130828', '河北省', '承德市', '130800', '围场', '130828', '117.764086', '41.949404');
INSERT INTO `provinces` VALUES ('130881', '河北省', '承德市', '130800', '平泉', '130881', '118.690238', '41.00561');
INSERT INTO `provinces` VALUES ('130900', '河北省', '沧州市', '130900', '沧州', '130900', '116.857461', '38.310582');
INSERT INTO `provinces` VALUES ('130902', '河北省', '沧州市', '130900', '新华区', '130902', '116.873049', '38.308273');
INSERT INTO `provinces` VALUES ('130903', '河北省', '沧州市', '130900', '运河', '130903', '116.840063', '38.307405');
INSERT INTO `provinces` VALUES ('130921', '河北省', '沧州市', '130900', '沧县', '130921', '117.007478', '38.219856');
INSERT INTO `provinces` VALUES ('130922', '河北省', '沧州市', '130900', '青县', '130922', '116.838384', '38.569646');
INSERT INTO `provinces` VALUES ('130923', '河北省', '沧州市', '130900', '东光', '130923', '116.542062', '37.88655');
INSERT INTO `provinces` VALUES ('130924', '河北省', '沧州市', '130900', '海兴', '130924', '117.496606', '38.141582');
INSERT INTO `provinces` VALUES ('130925', '河北省', '沧州市', '130900', '盐山', '130925', '117.229814', '38.056141');
INSERT INTO `provinces` VALUES ('130926', '河北省', '沧州市', '130900', '肃宁', '130926', '115.835856', '38.427102');
INSERT INTO `provinces` VALUES ('130927', '河北省', '沧州市', '130900', '南皮', '130927', '116.709171', '38.042439');
INSERT INTO `provinces` VALUES ('130928', '河北省', '沧州市', '130900', '吴桥', '130928', '116.391512', '37.628182');
INSERT INTO `provinces` VALUES ('130929', '河北省', '沧州市', '130900', '献县', '130929', '116.123844', '38.189661');
INSERT INTO `provinces` VALUES ('130930', '河北省', '沧州市', '130900', '孟村', '130930', '117.105104', '38.057953');
INSERT INTO `provinces` VALUES ('130981', '河北省', '沧州市', '130900', '泊头', '130981', '116.570163', '38.073479');
INSERT INTO `provinces` VALUES ('130982', '河北省', '沧州市', '130900', '任丘', '130982', '116.106764', '38.706513');
INSERT INTO `provinces` VALUES ('130983', '河北省', '沧州市', '130900', '黄骅', '130983', '117.343803', '38.369238');
INSERT INTO `provinces` VALUES ('130984', '河北省', '沧州市', '130900', '河间', '130984', '116.089452', '38.44149');
INSERT INTO `provinces` VALUES ('131000', '河北省', '廊坊市', '131000', '廊坊', '131000', '116.704441', '39.523927');
INSERT INTO `provinces` VALUES ('131002', '河北省', '廊坊市', '131000', '安次', '131002', '116.694544', '39.502569');
INSERT INTO `provinces` VALUES ('131003', '河北省', '廊坊市', '131000', '广阳', '131003', '116.713708', '39.521931');
INSERT INTO `provinces` VALUES ('131022', '河北省', '廊坊市', '131000', '固安', '131022', '116.299894', '39.436468');
INSERT INTO `provinces` VALUES ('131023', '河北省', '廊坊市', '131000', '永清', '131023', '116.498089', '39.319717');
INSERT INTO `provinces` VALUES ('131024', '河北省', '廊坊市', '131000', '香河', '131024', '117.007161', '39.757212');
INSERT INTO `provinces` VALUES ('131025', '河北省', '廊坊市', '131000', '大城', '131025', '116.640735', '38.699215');
INSERT INTO `provinces` VALUES ('131026', '河北省', '廊坊市', '131000', '文安', '131026', '116.460107', '38.866801');
INSERT INTO `provinces` VALUES ('131028', '河北省', '廊坊市', '131000', '大厂', '131028', '116.986501', '39.889266');
INSERT INTO `provinces` VALUES ('131081', '河北省', '廊坊市', '131000', '霸州', '131081', '116.392021', '39.117331');
INSERT INTO `provinces` VALUES ('131082', '河北省', '廊坊市', '131000', '三河', '131082', '117.077018', '39.982778');
INSERT INTO `provinces` VALUES ('131100', '河北省', '衡水市', '131100', '衡水', '131100', '115.665993', '37.735097');
INSERT INTO `provinces` VALUES ('131102', '河北省', '衡水市', '131100', '桃城', '131102', '115.694945', '37.732237');
INSERT INTO `provinces` VALUES ('131103', '河北省', '衡水市', '131100', '冀州', '131103', '115.579173', '37.542788');
INSERT INTO `provinces` VALUES ('131121', '河北省', '衡水市', '131100', '枣强', '131121', '115.726499', '37.511512');
INSERT INTO `provinces` VALUES ('131122', '河北省', '衡水市', '131100', '武邑', '131122', '115.892415', '37.803774');
INSERT INTO `provinces` VALUES ('131123', '河北省', '衡水市', '131100', '武强', '131123', '115.970236', '38.03698');
INSERT INTO `provinces` VALUES ('131124', '河北省', '衡水市', '131100', '饶阳', '131124', '115.726577', '38.232671');
INSERT INTO `provinces` VALUES ('131125', '河北省', '衡水市', '131100', '安平', '131125', '115.519627', '38.233511');
INSERT INTO `provinces` VALUES ('131126', '河北省', '衡水市', '131100', '故城', '131126', '115.966747', '37.350981');
INSERT INTO `provinces` VALUES ('131127', '河北省', '衡水市', '131100', '景县', '131127', '116.258446', '37.686622');
INSERT INTO `provinces` VALUES ('131128', '河北省', '衡水市', '131100', '阜城', '131128', '116.164727', '37.869945');
INSERT INTO `provinces` VALUES ('131182', '河北省', '衡水市', '131100', '深州', '131182', '115.554596', '38.00347');
INSERT INTO `provinces` VALUES ('140100', '山西省', '太原市', '140100', '太原', '140100', '112.549248', '37.857014');
INSERT INTO `provinces` VALUES ('140105', '山西省', '太原市', '140100', '小店', '140105', '112.564273', '37.817974');
INSERT INTO `provinces` VALUES ('140106', '山西省', '太原市', '140100', '迎泽', '140106', '112.558851', '37.855804');
INSERT INTO `provinces` VALUES ('140107', '山西省', '太原市', '140100', '杏花岭', '140107', '112.560743', '37.879291');
INSERT INTO `provinces` VALUES ('140108', '山西省', '太原市', '140100', '尖草坪', '140108', '112.487122', '37.939893');
INSERT INTO `provinces` VALUES ('140109', '山西省', '太原市', '140100', '万柏林', '140109', '112.522258', '37.862653');
INSERT INTO `provinces` VALUES ('140110', '山西省', '太原市', '140100', '晋源', '140110', '112.477849', '37.715619');
INSERT INTO `provinces` VALUES ('140121', '山西省', '太原市', '140100', '清徐', '140121', '112.357961', '37.60729');
INSERT INTO `provinces` VALUES ('140122', '山西省', '太原市', '140100', '阳曲', '140122', '112.673818', '38.058797');
INSERT INTO `provinces` VALUES ('140123', '山西省', '太原市', '140100', '娄烦', '140123', '111.793798', '38.066035');
INSERT INTO `provinces` VALUES ('140181', '山西省', '太原市', '140100', '古交', '140181', '112.174353', '37.908534');
INSERT INTO `provinces` VALUES ('140200', '山西省', '大同市', '140200', '大同', '140200', '113.301438', '40.090511');
INSERT INTO `provinces` VALUES ('140212', '山西省', '大同市', '140200', '新荣', '140212', '113.141044', '40.258269');
INSERT INTO `provinces` VALUES ('140213', '山西省', '大同市', '140200', '平城', '140213', '113.304425', '40.081998');
INSERT INTO `provinces` VALUES ('140214', '山西省', '大同市', '140200', '云冈', '140214', '113.162402', '39.996839');
INSERT INTO `provinces` VALUES ('140215', '山西省', '大同市', '140200', '云州', '140215', '113.618471', '40.04623');
INSERT INTO `provinces` VALUES ('140221', '山西省', '大同市', '140200', '阳高', '140221', '113.749871', '40.364927');
INSERT INTO `provinces` VALUES ('140222', '山西省', '大同市', '140200', '天镇', '140222', '114.09112', '40.421336');
INSERT INTO `provinces` VALUES ('140223', '山西省', '大同市', '140200', '广灵', '140223', '114.279252', '39.763051');
INSERT INTO `provinces` VALUES ('140224', '山西省', '大同市', '140200', '灵丘', '140224', '114.23576', '39.438867');
INSERT INTO `provinces` VALUES ('140225', '山西省', '大同市', '140200', '浑源', '140225', '113.698091', '39.699099');
INSERT INTO `provinces` VALUES ('140226', '山西省', '大同市', '140200', '左云', '140226', '112.70641', '40.012873');
INSERT INTO `provinces` VALUES ('140300', '山西省', '阳泉市', '140300', '阳泉', '140300', '113.583285', '37.861188');
INSERT INTO `provinces` VALUES ('140302', '山西省', '阳泉市', '140300', '城区', '140302', '113.583285', '37.861188');
INSERT INTO `provinces` VALUES ('140303', '山西省', '阳泉市', '140300', '矿区', '140303', '113.559066', '37.870085');
INSERT INTO `provinces` VALUES ('140311', '山西省', '阳泉市', '140300', '郊区', '140311', '113.58664', '37.94096');
INSERT INTO `provinces` VALUES ('140321', '山西省', '阳泉市', '140300', '平定', '140321', '113.631049', '37.800289');
INSERT INTO `provinces` VALUES ('140322', '山西省', '阳泉市', '140300', '盂县', '140322', '113.41223', '38.086131');
INSERT INTO `provinces` VALUES ('140400', '山西省', '长治市', '140400', '长治', '140400', '113.113556', '36.191112');
INSERT INTO `provinces` VALUES ('140403', '山西省', '长治市', '140400', '潞州', '140403', '113.129521', '36.209472');
INSERT INTO `provinces` VALUES ('140404', '山西省', '长治市', '140400', '上党', '140404', '113.057416', '36.059287');
INSERT INTO `provinces` VALUES ('140405', '山西省', '长治市', '140400', '屯留', '140405', '112.892741', '36.314072');
INSERT INTO `provinces` VALUES ('140406', '山西省', '长治市', '140400', '潞城', '140406', '113.223245', '36.332233');
INSERT INTO `provinces` VALUES ('140423', '山西省', '长治市', '140400', '襄垣', '140423', '113.050094', '36.532854');
INSERT INTO `provinces` VALUES ('140425', '山西省', '长治市', '140400', '平顺', '140425', '113.438791', '36.200202');
INSERT INTO `provinces` VALUES ('140426', '山西省', '长治市', '140400', '黎城', '140426', '113.387366', '36.502971');
INSERT INTO `provinces` VALUES ('140427', '山西省', '长治市', '140400', '壶关', '140427', '113.206138', '36.110938');
INSERT INTO `provinces` VALUES ('140428', '山西省', '长治市', '140400', '长子', '140428', '112.884656', '36.119484');
INSERT INTO `provinces` VALUES ('140429', '山西省', '长治市', '140400', '武乡', '140429', '112.8653', '36.834315');
INSERT INTO `provinces` VALUES ('140430', '山西省', '长治市', '140400', '沁县', '140430', '112.70138', '36.757123');
INSERT INTO `provinces` VALUES ('140431', '山西省', '长治市', '140400', '沁源', '140431', '112.340878', '36.500777');
INSERT INTO `provinces` VALUES ('140500', '山西省', '晋城市', '140500', '晋城', '140500', '112.851274', '35.497553');
INSERT INTO `provinces` VALUES ('140502', '山西省', '晋城市', '140500', '城区', '140502', '112.8514', '35.4976');
INSERT INTO `provinces` VALUES ('140521', '山西省', '晋城市', '140500', '沁水', '140521', '112.187213', '35.689472');
INSERT INTO `provinces` VALUES ('140522', '山西省', '晋城市', '140500', '阳城', '140522', '112.422014', '35.482177');
INSERT INTO `provinces` VALUES ('140524', '山西省', '晋城市', '140500', '陵川', '140524', '113.278877', '35.775614');
INSERT INTO `provinces` VALUES ('140525', '山西省', '晋城市', '140500', '泽州', '140525', '112.899137', '35.617221');
INSERT INTO `provinces` VALUES ('140581', '山西省', '晋城市', '140500', '高平', '140581', '112.930691', '35.791355');
INSERT INTO `provinces` VALUES ('140600', '山西省', '朔州市', '140600', '朔州', '140600', '112.433387', '39.331261');
INSERT INTO `provinces` VALUES ('140602', '山西省', '朔州市', '140600', '朔城', '140602', '112.428676', '39.324525');
INSERT INTO `provinces` VALUES ('140603', '山西省', '朔州市', '140600', '平鲁', '140603', '112.295227', '39.515603');
INSERT INTO `provinces` VALUES ('140621', '山西省', '朔州市', '140600', '山阴', '140621', '112.816396', '39.52677');
INSERT INTO `provinces` VALUES ('140622', '山西省', '朔州市', '140600', '应县', '140622', '113.187505', '39.559187');
INSERT INTO `provinces` VALUES ('140623', '山西省', '朔州市', '140600', '右玉', '140623', '112.465588', '39.988812');
INSERT INTO `provinces` VALUES ('140681', '山西省', '朔州市', '140600', '怀仁', '140681', '113.100512', '39.82079');
INSERT INTO `provinces` VALUES ('140700', '山西省', '晋中市', '140700', '晋中', '140700', '112.736465', '37.696495');
INSERT INTO `provinces` VALUES ('140702', '山西省', '晋中市', '140700', '榆次', '140702', '112.740056', '37.6976');
INSERT INTO `provinces` VALUES ('140721', '山西省', '晋中市', '140700', '榆社', '140721', '112.973521', '37.069019');
INSERT INTO `provinces` VALUES ('140722', '山西省', '晋中市', '140700', '左权', '140722', '113.377834', '37.079672');
INSERT INTO `provinces` VALUES ('140723', '山西省', '晋中市', '140700', '和顺', '140723', '113.572919', '37.327027');
INSERT INTO `provinces` VALUES ('140724', '山西省', '晋中市', '140700', '昔阳', '140724', '113.706166', '37.60437');
INSERT INTO `provinces` VALUES ('140725', '山西省', '晋中市', '140700', '寿阳', '140725', '113.177708', '37.891136');
INSERT INTO `provinces` VALUES ('140726', '山西省', '晋中市', '140700', '太谷', '140726', '112.554103', '37.424595');
INSERT INTO `provinces` VALUES ('140727', '山西省', '晋中市', '140700', '祁县', '140727', '112.330532', '37.358739');
INSERT INTO `provinces` VALUES ('140728', '山西省', '晋中市', '140700', '平遥', '140728', '112.174059', '37.195474');
INSERT INTO `provinces` VALUES ('140729', '山西省', '晋中市', '140700', '灵石', '140729', '111.772759', '36.847469');
INSERT INTO `provinces` VALUES ('140781', '山西省', '晋中市', '140700', '介休', '140781', '111.913857', '37.027616');
INSERT INTO `provinces` VALUES ('140800', '山西省', '运城市', '140800', '运城', '140800', '111.003957', '35.022778');
INSERT INTO `provinces` VALUES ('140802', '山西省', '运城市', '140800', '盐湖', '140802', '111.000627', '35.025643');
INSERT INTO `provinces` VALUES ('140821', '山西省', '运城市', '140800', '临猗', '140821', '110.77493', '35.141883');
INSERT INTO `provinces` VALUES ('140822', '山西省', '运城市', '140800', '万荣', '140822', '110.843561', '35.417042');
INSERT INTO `provinces` VALUES ('140823', '山西省', '运城市', '140800', '闻喜', '140823', '111.220306', '35.353839');
INSERT INTO `provinces` VALUES ('140824', '山西省', '运城市', '140800', '稷山', '140824', '110.978996', '35.600412');
INSERT INTO `provinces` VALUES ('140825', '山西省', '运城市', '140800', '新绛', '140825', '111.225205', '35.613697');
INSERT INTO `provinces` VALUES ('140826', '山西省', '运城市', '140800', '绛县', '140826', '111.576182', '35.49045');
INSERT INTO `provinces` VALUES ('140827', '山西省', '运城市', '140800', '垣曲', '140827', '111.67099', '35.298293');
INSERT INTO `provinces` VALUES ('140828', '山西省', '运城市', '140800', '夏县', '140828', '111.223174', '35.140441');
INSERT INTO `provinces` VALUES ('140829', '山西省', '运城市', '140800', '平陆', '140829', '111.212377', '34.837256');
INSERT INTO `provinces` VALUES ('140830', '山西省', '运城市', '140800', '芮城', '140830', '110.69114', '34.694769');
INSERT INTO `provinces` VALUES ('140881', '山西省', '运城市', '140800', '永济', '140881', '110.447984', '34.865125');
INSERT INTO `provinces` VALUES ('140882', '山西省', '运城市', '140800', '河津', '140882', '110.710268', '35.59715');
INSERT INTO `provinces` VALUES ('140900', '山西省', '忻州市', '140900', '忻州', '140900', '112.733538', '38.41769');
INSERT INTO `provinces` VALUES ('140902', '山西省', '忻州市', '140900', '忻府', '140902', '112.734112', '38.417743');
INSERT INTO `provinces` VALUES ('140921', '山西省', '忻州市', '140900', '定襄', '140921', '112.963231', '38.484948');
INSERT INTO `provinces` VALUES ('140922', '山西省', '忻州市', '140900', '五台', '140922', '113.259012', '38.725711');
INSERT INTO `provinces` VALUES ('140923', '山西省', '忻州市', '140900', '代县', '140923', '112.962519', '39.065138');
INSERT INTO `provinces` VALUES ('140924', '山西省', '忻州市', '140900', '繁峙', '140924', '113.267707', '39.188104');
INSERT INTO `provinces` VALUES ('140925', '山西省', '忻州市', '140900', '宁武', '140925', '112.307936', '39.001718');
INSERT INTO `provinces` VALUES ('140926', '山西省', '忻州市', '140900', '静乐', '140926', '111.940231', '38.355947');
INSERT INTO `provinces` VALUES ('140927', '山西省', '忻州市', '140900', '神池', '140927', '112.200438', '39.088467');
INSERT INTO `provinces` VALUES ('140928', '山西省', '忻州市', '140900', '五寨', '140928', '111.841015', '38.912761');
INSERT INTO `provinces` VALUES ('140929', '山西省', '忻州市', '140900', '岢岚', '140929', '111.56981', '38.705625');
INSERT INTO `provinces` VALUES ('140930', '山西省', '忻州市', '140900', '河曲', '140930', '111.146609', '39.381895');
INSERT INTO `provinces` VALUES ('140931', '山西省', '忻州市', '140900', '保德', '140931', '111.085688', '39.022576');
INSERT INTO `provinces` VALUES ('140932', '山西省', '忻州市', '140900', '偏关', '140932', '111.500477', '39.442153');
INSERT INTO `provinces` VALUES ('140981', '山西省', '忻州市', '140900', '原平', '140981', '112.713132', '38.729186');
INSERT INTO `provinces` VALUES ('141000', '山西省', '临汾市', '141000', '临汾', '141000', '111.517973', '36.08415');
INSERT INTO `provinces` VALUES ('141002', '山西省', '临汾市', '141000', '尧都', '141002', '111.522945', '36.080366');
INSERT INTO `provinces` VALUES ('141021', '山西省', '临汾市', '141000', '曲沃', '141021', '111.475529', '35.641387');
INSERT INTO `provinces` VALUES ('141022', '山西省', '临汾市', '141000', '翼城', '141022', '111.713508', '35.738621');
INSERT INTO `provinces` VALUES ('141023', '山西省', '临汾市', '141000', '襄汾', '141023', '111.442932', '35.876139');
INSERT INTO `provinces` VALUES ('141024', '山西省', '临汾市', '141000', '洪洞', '141024', '111.673692', '36.255742');
INSERT INTO `provinces` VALUES ('141025', '山西省', '临汾市', '141000', '古县', '141025', '111.920207', '36.26855');
INSERT INTO `provinces` VALUES ('141026', '山西省', '临汾市', '141000', '安泽', '141026', '112.251372', '36.146032');
INSERT INTO `provinces` VALUES ('141027', '山西省', '临汾市', '141000', '浮山', '141027', '111.850039', '35.971359');
INSERT INTO `provinces` VALUES ('141028', '山西省', '临汾市', '141000', '吉县', '141028', '110.682853', '36.099355');
INSERT INTO `provinces` VALUES ('141029', '山西省', '临汾市', '141000', '乡宁', '141029', '110.857365', '35.975402');
INSERT INTO `provinces` VALUES ('141030', '山西省', '临汾市', '141000', '大宁', '141030', '110.751283', '36.46383');
INSERT INTO `provinces` VALUES ('141031', '山西省', '临汾市', '141000', '隰县', '141031', '110.935809', '36.692675');
INSERT INTO `provinces` VALUES ('141032', '山西省', '临汾市', '141000', '永和', '141032', '110.631276', '36.760614');
INSERT INTO `provinces` VALUES ('141033', '山西省', '临汾市', '141000', '蒲县', '141033', '111.09733', '36.411682');
INSERT INTO `provinces` VALUES ('141034', '山西省', '临汾市', '141000', '汾西', '141034', '111.563021', '36.653368');
INSERT INTO `provinces` VALUES ('141081', '山西省', '临汾市', '141000', '侯马', '141081', '111.371272', '35.620302');
INSERT INTO `provinces` VALUES ('141082', '山西省', '临汾市', '141000', '霍州', '141082', '111.723103', '36.57202');
INSERT INTO `provinces` VALUES ('141100', '山西省', '吕梁市', '141100', '吕梁', '141100', '111.134335', '37.524366');
INSERT INTO `provinces` VALUES ('141102', '山西省', '吕梁市', '141100', '离石', '141102', '111.134462', '37.524037');
INSERT INTO `provinces` VALUES ('141121', '山西省', '吕梁市', '141100', '文水', '141121', '112.032595', '37.436314');
INSERT INTO `provinces` VALUES ('141122', '山西省', '吕梁市', '141100', '交城', '141122', '112.159154', '37.555155');
INSERT INTO `provinces` VALUES ('141123', '山西省', '吕梁市', '141100', '兴县', '141123', '111.124816', '38.464136');
INSERT INTO `provinces` VALUES ('141124', '山西省', '吕梁市', '141100', '临县', '141124', '110.995963', '37.960806');
INSERT INTO `provinces` VALUES ('141125', '山西省', '吕梁市', '141100', '柳林', '141125', '110.89613', '37.431664');
INSERT INTO `provinces` VALUES ('141126', '山西省', '吕梁市', '141100', '石楼', '141126', '110.837119', '36.999426');
INSERT INTO `provinces` VALUES ('141127', '山西省', '吕梁市', '141100', '岚县', '141127', '111.671555', '38.278654');
INSERT INTO `provinces` VALUES ('141128', '山西省', '吕梁市', '141100', '方山', '141128', '111.238885', '37.892632');
INSERT INTO `provinces` VALUES ('141129', '山西省', '吕梁市', '141100', '中阳', '141129', '111.193319', '37.342054');
INSERT INTO `provinces` VALUES ('141130', '山西省', '吕梁市', '141100', '交口', '141130', '111.183188', '36.983068');
INSERT INTO `provinces` VALUES ('141181', '山西省', '吕梁市', '141100', '孝义', '141181', '111.781568', '37.144474');
INSERT INTO `provinces` VALUES ('141182', '山西省', '吕梁市', '141100', '汾阳', '141182', '111.785273', '37.267742');
INSERT INTO `provinces` VALUES ('150100', '内蒙古自治区', '呼和浩特市', '150100', '呼和浩特', '150100', '111.670801', '40.818311');
INSERT INTO `provinces` VALUES ('150102', '内蒙古自治区', '呼和浩特市', '150100', '新城区', '150102', '111.685964', '40.826225');
INSERT INTO `provinces` VALUES ('150103', '内蒙古自治区', '呼和浩特市', '150100', '回民区', '150103', '111.662162', '40.815149');
INSERT INTO `provinces` VALUES ('150104', '内蒙古自治区', '呼和浩特市', '150100', '玉泉区', '150104', '111.66543', '40.799421');
INSERT INTO `provinces` VALUES ('150105', '内蒙古自治区', '呼和浩特市', '150100', '赛罕区', '150105', '111.698463', '40.807834');
INSERT INTO `provinces` VALUES ('150121', '内蒙古自治区', '呼和浩特市', '150100', '土左旗', '150121', '111.09', '40.41');
INSERT INTO `provinces` VALUES ('150122', '内蒙古自治区', '呼和浩特市', '150100', '托克托', '150122', '111.11', '40.16');
INSERT INTO `provinces` VALUES ('150123', '内蒙古自治区', '呼和浩特市', '150100', '和林格尔', '150123', '111.824143', '40.380288');
INSERT INTO `provinces` VALUES ('150124', '内蒙古自治区', '呼和浩特市', '150100', '清水河', '150124', '111.67222', '39.912479');
INSERT INTO `provinces` VALUES ('150125', '内蒙古自治区', '呼和浩特市', '150100', '武川', '150125', '111.456563', '41.094483');
INSERT INTO `provinces` VALUES ('150200', '内蒙古自治区', '包头市', '150200', '包头', '150200', '109.840405', '40.658168');
INSERT INTO `provinces` VALUES ('150202', '内蒙古自治区', '包头市', '150200', '东河区', '150202', '110.026895', '40.587056');
INSERT INTO `provinces` VALUES ('150203', '内蒙古自治区', '包头市', '150200', '昆都仑区', '150203', '109.822932', '40.661345');
INSERT INTO `provinces` VALUES ('150204', '内蒙古自治区', '包头市', '150200', '青山区', '150204', '109.880049', '40.668558');
INSERT INTO `provinces` VALUES ('150205', '内蒙古自治区', '包头市', '150200', '石拐区', '150205', '110.272565', '40.672094');
INSERT INTO `provinces` VALUES ('150206', '内蒙古自治区', '包头市', '150200', '白云鄂博', '150206', '109.97016', '41.769246');
INSERT INTO `provinces` VALUES ('150207', '内蒙古自治区', '包头市', '150200', '九原区', '150207', '109.968122', '40.600581');
INSERT INTO `provinces` VALUES ('150221', '内蒙古自治区', '包头市', '150200', '土右旗', '150221', '110.32', '40.33');
INSERT INTO `provinces` VALUES ('150222', '内蒙古自治区', '包头市', '150200', '固阳', '150222', '110.063421', '41.030004');
INSERT INTO `provinces` VALUES ('150223', '内蒙古自治区', '包头市', '150200', '达茂旗', '150223', '110.26', '41.42');
INSERT INTO `provinces` VALUES ('150300', '内蒙古自治区', '乌海市', '150300', '乌海', '150300', '106.825563', '39.673734');
INSERT INTO `provinces` VALUES ('150302', '内蒙古自治区', '乌海市', '150300', '海勃湾区', '150302', '106.817762', '39.673527');
INSERT INTO `provinces` VALUES ('150303', '内蒙古自治区', '乌海市', '150300', '海南区', '150303', '106.884789', '39.44153');
INSERT INTO `provinces` VALUES ('150304', '内蒙古自治区', '乌海市', '150300', '乌达', '150304', '106.722711', '39.502288');
INSERT INTO `provinces` VALUES ('150400', '内蒙古自治区', '赤峰市', '150400', '赤峰', '150400', '118.956806', '42.275317');
INSERT INTO `provinces` VALUES ('150402', '内蒙古自治区', '赤峰市', '150400', '红山', '150402', '118.961087', '42.269732');
INSERT INTO `provinces` VALUES ('150403', '内蒙古自治区', '赤峰市', '150400', '元宝山', '150403', '119.289877', '42.041168');
INSERT INTO `provinces` VALUES ('150404', '内蒙古自治区', '赤峰市', '150400', '松山', '150404', '118.938958', '42.281046');
INSERT INTO `provinces` VALUES ('150421', '内蒙古自治区', '赤峰市', '150400', '阿鲁旗', '150421', '120.03', '43.53');
INSERT INTO `provinces` VALUES ('150422', '内蒙古自治区', '赤峰市', '150400', '巴林左旗', '150422', '119.391737', '43.980715');
INSERT INTO `provinces` VALUES ('150423', '内蒙古自治区', '赤峰市', '150400', '巴林右旗', '150423', '118.678347', '43.528963');
INSERT INTO `provinces` VALUES ('150424', '内蒙古自治区', '赤峰市', '150400', '林西', '150424', '118.05775', '43.605326');
INSERT INTO `provinces` VALUES ('150425', '内蒙古自治区', '赤峰市', '150400', '克什克腾旗', '150425', '117.542465', '43.256233');
INSERT INTO `provinces` VALUES ('150426', '内蒙古自治区', '赤峰市', '150400', '翁牛特旗', '150426', '119.022619', '42.937128');
INSERT INTO `provinces` VALUES ('150428', '内蒙古自治区', '赤峰市', '150400', '喀喇沁旗', '150428', '118.708572', '41.92778');
INSERT INTO `provinces` VALUES ('150429', '内蒙古自治区', '赤峰市', '150400', '宁城', '150429', '119.339242', '41.598692');
INSERT INTO `provinces` VALUES ('150430', '内蒙古自治区', '赤峰市', '150400', '敖汉旗', '150430', '119.906486', '42.287012');
INSERT INTO `provinces` VALUES ('150500', '内蒙古自治区', '通辽市', '150500', '通辽', '150500', '122.263119', '43.617429');
INSERT INTO `provinces` VALUES ('150502', '内蒙古自治区', '通辽市', '150500', '科尔沁区', '150502', '121.472818', '45.059645');
INSERT INTO `provinces` VALUES ('150521', '内蒙古自治区', '通辽市', '150500', '科左中旗', '150521', '123.18', '44.08');
INSERT INTO `provinces` VALUES ('150522', '内蒙古自治区', '通辽市', '150500', '科左后旗', '150522', '122.21', '42.58');
INSERT INTO `provinces` VALUES ('150523', '内蒙古自治区', '通辽市', '150500', '开鲁', '150523', '121.308797', '43.602432');
INSERT INTO `provinces` VALUES ('150524', '内蒙古自治区', '通辽市', '150500', '库伦旗', '150524', '121.774886', '42.734692');
INSERT INTO `provinces` VALUES ('150525', '内蒙古自治区', '通辽市', '150500', '奈曼旗', '150525', '120.662543', '42.84685');
INSERT INTO `provinces` VALUES ('150526', '内蒙古自治区', '通辽市', '150500', '扎鲁特旗', '150526', '120.905275', '44.555294');
INSERT INTO `provinces` VALUES ('150581', '内蒙古自治区', '通辽市', '150500', '霍林郭勒', '150581', '119.657862', '45.532361');
INSERT INTO `provinces` VALUES ('150600', '内蒙古自治区', '鄂尔多斯市', '150600', '鄂尔多斯', '150600', '109.99029', '39.817179');
INSERT INTO `provinces` VALUES ('150602', '内蒙古自治区', '鄂尔多斯市', '150600', '东胜', '150602', '109.98945', '39.81788');
INSERT INTO `provinces` VALUES ('150603', '内蒙古自治区', '鄂尔多斯市', '150600', '康巴什', '150603', '109.868118', '39.615711');
INSERT INTO `provinces` VALUES ('150621', '内蒙古自治区', '鄂尔多斯市', '150600', '达拉特旗', '150621', '110.040281', '40.404076');
INSERT INTO `provinces` VALUES ('150622', '内蒙古自治区', '鄂尔多斯市', '150600', '准格尔旗', '150622', '111.238332', '39.865221');
INSERT INTO `provinces` VALUES ('150623', '内蒙古自治区', '鄂尔多斯市', '150600', '鄂前旗', '150623', '107.29', '38.11');
INSERT INTO `provinces` VALUES ('150624', '内蒙古自治区', '鄂尔多斯市', '150600', '鄂托克旗', '150624', '107.982604', '39.095752');
INSERT INTO `provinces` VALUES ('150625', '内蒙古自治区', '鄂尔多斯市', '150600', '杭锦旗', '150625', '108.736324', '39.831789');
INSERT INTO `provinces` VALUES ('150626', '内蒙古自治区', '鄂尔多斯市', '150600', '乌审旗', '150626', '108.842454', '38.596611');
INSERT INTO `provinces` VALUES ('150627', '内蒙古自治区', '鄂尔多斯市', '150600', '伊金霍洛', '150627', '109.787402', '39.604312');
INSERT INTO `provinces` VALUES ('150700', '内蒙古自治区', '呼伦贝尔市', '150700', '呼伦贝尔', '150700', '119.758168', '49.215333');
INSERT INTO `provinces` VALUES ('150702', '内蒙古自治区', '呼伦贝尔市', '150700', '海拉尔', '150702', '119.764923', '49.213889');
INSERT INTO `provinces` VALUES ('150703', '内蒙古自治区', '呼伦贝尔市', '150700', '扎赉诺尔', '150703', '117.716373', '49.456567');
INSERT INTO `provinces` VALUES ('150721', '内蒙古自治区', '呼伦贝尔市', '150700', '阿荣旗', '150721', '123.464615', '48.130503');
INSERT INTO `provinces` VALUES ('150722', '内蒙古自治区', '呼伦贝尔市', '150700', '莫力达瓦', '150722', '124.507401', '48.478385');
INSERT INTO `provinces` VALUES ('150723', '内蒙古自治区', '呼伦贝尔市', '150700', '鄂伦春旗', '150723', '123.44', '50.35');
INSERT INTO `provinces` VALUES ('150724', '内蒙古自治区', '呼伦贝尔市', '150700', '鄂温克旗', '150724', '119.45', '49.09');
INSERT INTO `provinces` VALUES ('150725', '内蒙古自治区', '呼伦贝尔市', '150700', '陈旗', '150725', '119.26', '49.19');
INSERT INTO `provinces` VALUES ('150726', '内蒙古自治区', '呼伦贝尔市', '150700', '新左旗', '150726', '118.16', '48.13');
INSERT INTO `provinces` VALUES ('150727', '内蒙古自治区', '呼伦贝尔市', '150700', '新右旗', '150727', '116.49', '48.4');
INSERT INTO `provinces` VALUES ('150781', '内蒙古自治区', '呼伦贝尔市', '150700', '满洲里', '150781', '117.455561', '49.590788');
INSERT INTO `provinces` VALUES ('150782', '内蒙古自治区', '呼伦贝尔市', '150700', '牙克石', '150782', '120.729005', '49.287024');
INSERT INTO `provinces` VALUES ('150783', '内蒙古自治区', '呼伦贝尔市', '150700', '扎兰屯', '150783', '122.744401', '48.007412');
INSERT INTO `provinces` VALUES ('150784', '内蒙古自治区', '呼伦贝尔市', '150700', '额尔古纳', '150784', '120.178636', '50.2439');
INSERT INTO `provinces` VALUES ('150785', '内蒙古自治区', '呼伦贝尔市', '150700', '根河', '150785', '121.532724', '50.780454');
INSERT INTO `provinces` VALUES ('150800', '内蒙古自治区', '巴彦淖尔市', '150800', '巴彦淖尔', '150800', '107.416959', '40.757402');
INSERT INTO `provinces` VALUES ('150802', '内蒙古自治区', '巴彦淖尔市', '150800', '临河', '150802', '107.417018', '40.757092');
INSERT INTO `provinces` VALUES ('150821', '内蒙古自治区', '巴彦淖尔市', '150800', '五原', '150821', '108.270658', '41.097639');
INSERT INTO `provinces` VALUES ('150822', '内蒙古自治区', '巴彦淖尔市', '150800', '磴口', '150822', '107.006056', '40.330479');
INSERT INTO `provinces` VALUES ('150823', '内蒙古自治区', '巴彦淖尔市', '150800', '乌前旗', '150823', '108.39', '40.44');
INSERT INTO `provinces` VALUES ('150824', '内蒙古自治区', '巴彦淖尔市', '150800', '乌中旗', '150824', '108.31', '41.34');
INSERT INTO `provinces` VALUES ('150825', '内蒙古自治区', '巴彦淖尔市', '150800', '乌后旗', '150825', '106.59', '41.27');
INSERT INTO `provinces` VALUES ('150826', '内蒙古自治区', '巴彦淖尔市', '150800', '杭锦后旗', '150826', '107.147682', '40.888797');
INSERT INTO `provinces` VALUES ('150900', '内蒙古自治区', '乌兰察布市', '150900', '乌兰察布', '150900', '113.114543', '41.034126');
INSERT INTO `provinces` VALUES ('150902', '内蒙古自治区', '乌兰察布市', '150900', '集宁', '150902', '113.116453', '41.034134');
INSERT INTO `provinces` VALUES ('150921', '内蒙古自治区', '乌兰察布市', '150900', '卓资', '150921', '112.577702', '40.89576');
INSERT INTO `provinces` VALUES ('150922', '内蒙古自治区', '乌兰察布市', '150900', '化德', '150922', '114.01008', '41.899335');
INSERT INTO `provinces` VALUES ('150923', '内蒙古自治区', '乌兰察布市', '150900', '商都', '150923', '113.560643', '41.560163');
INSERT INTO `provinces` VALUES ('150924', '内蒙古自治区', '乌兰察布市', '150900', '兴和', '150924', '113.834009', '40.872437');
INSERT INTO `provinces` VALUES ('150925', '内蒙古自治区', '乌兰察布市', '150900', '凉城', '150925', '112.500911', '40.531627');
INSERT INTO `provinces` VALUES ('150926', '内蒙古自治区', '乌兰察布市', '150900', '察右前旗', '150926', '113.13', '40.48');
INSERT INTO `provinces` VALUES ('150927', '内蒙古自治区', '乌兰察布市', '150900', '察右中旗', '150927', '112.37', '41.16');
INSERT INTO `provinces` VALUES ('150928', '内蒙古自治区', '乌兰察布市', '150900', '察右后旗', '150928', '113.11', '41.27');
INSERT INTO `provinces` VALUES ('150929', '内蒙古自治区', '乌兰察布市', '150900', '四子王旗', '150929', '111.70123', '41.528114');
INSERT INTO `provinces` VALUES ('150981', '内蒙古自治区', '乌兰察布市', '150900', '丰镇', '150981', '113.163462', '40.437534');
INSERT INTO `provinces` VALUES ('152200', '内蒙古自治区', '兴安盟', '152200', '兴安盟', '152200', '122.070317', '46.076268');
INSERT INTO `provinces` VALUES ('152201', '内蒙古自治区', '兴安盟', '152200', '乌兰浩特', '152201', '122.068975', '46.077238');
INSERT INTO `provinces` VALUES ('152202', '内蒙古自治区', '兴安盟', '152200', '阿尔山', '152202', '119.943656', '47.177');
INSERT INTO `provinces` VALUES ('152221', '内蒙古自治区', '兴安盟', '152200', '科右前旗', '152221', '122.069', '46.063');
INSERT INTO `provinces` VALUES ('152222', '内蒙古自治区', '兴安盟', '152200', '科右中旗', '152222', '121.28', '45.03');
INSERT INTO `provinces` VALUES ('152223', '内蒙古自治区', '兴安盟', '152200', '扎赉特旗', '152223', '122.909332', '46.725136');
INSERT INTO `provinces` VALUES ('152224', '内蒙古自治区', '兴安盟', '152200', '突泉', '152224', '121.564856', '45.380986');
INSERT INTO `provinces` VALUES ('152500', '内蒙古自治区', '锡林郭勒盟', '152500', '锡林郭勒', '152500', '116.090996', '43.944018');
INSERT INTO `provinces` VALUES ('152501', '内蒙古自治区', '锡林郭勒盟', '152500', '二连浩特', '152501', '111.97981', '43.652895');
INSERT INTO `provinces` VALUES ('152502', '内蒙古自治区', '锡林郭勒盟', '152500', '锡林浩特', '152502', '116.091903', '43.944301');
INSERT INTO `provinces` VALUES ('152522', '内蒙古自治区', '锡林郭勒盟', '152500', '阿巴嘎旗', '152522', '114.970618', '44.022728');
INSERT INTO `provinces` VALUES ('152523', '内蒙古自治区', '锡林郭勒盟', '152500', '苏左旗', '152523', '113.38', '43.52');
INSERT INTO `provinces` VALUES ('152524', '内蒙古自治区', '锡林郭勒盟', '152500', '苏右旗', '152524', '112.39', '42.45');
INSERT INTO `provinces` VALUES ('152525', '内蒙古自治区', '锡林郭勒盟', '152500', '东乌旗', '152525', '116.58', '45.31');
INSERT INTO `provinces` VALUES ('152526', '内蒙古自治区', '锡林郭勒盟', '152500', '西乌旗', '152526', '117.36', '44.35');
INSERT INTO `provinces` VALUES ('152527', '内蒙古自治区', '锡林郭勒盟', '152500', '太仆寺旗', '152527', '115.28728', '41.895199');
INSERT INTO `provinces` VALUES ('152528', '内蒙古自治区', '锡林郭勒盟', '152500', '镶黄旗', '152528', '113.843869', '42.239229');
INSERT INTO `provinces` VALUES ('152529', '内蒙古自治区', '锡林郭勒盟', '152500', '正镶白旗', '152529', '115.031423', '42.286807');
INSERT INTO `provinces` VALUES ('152530', '内蒙古自治区', '锡林郭勒盟', '152500', '正蓝旗', '152530', '116.003311', '42.245895');
INSERT INTO `provinces` VALUES ('152531', '内蒙古自治区', '锡林郭勒盟', '152500', '多伦', '152531', '116.477288', '42.197962');
INSERT INTO `provinces` VALUES ('152900', '内蒙古自治区', '阿拉善盟', '152900', '阿拉善', '152900', '105.706422', '38.844814');
INSERT INTO `provinces` VALUES ('152921', '内蒙古自治区', '阿拉善盟', '152900', '阿左旗', '152921', '105.111', '39.641');
INSERT INTO `provinces` VALUES ('152922', '内蒙古自治区', '阿拉善盟', '152900', '阿右旗', '152922', '101.41', '39.13');
INSERT INTO `provinces` VALUES ('152923', '内蒙古自治区', '阿拉善盟', '152900', '额济纳旗', '152923', '101.06944', '41.958813');
INSERT INTO `provinces` VALUES ('210100', '辽宁省', '沈阳市', '210100', '沈阳', '210100', '123.429096', '41.796767');
INSERT INTO `provinces` VALUES ('210102', '辽宁省', '沈阳市', '210100', '和平区', '210102', '123.406664', '41.788074');
INSERT INTO `provinces` VALUES ('210103', '辽宁省', '沈阳市', '210100', '沈河区', '210103', '123.445696', '41.795591');
INSERT INTO `provinces` VALUES ('210104', '辽宁省', '沈阳市', '210100', '大东区', '210104', '123.469956', '41.808503');
INSERT INTO `provinces` VALUES ('210105', '辽宁省', '沈阳市', '210100', '皇姑区', '210105', '123.405677', '41.822336');
INSERT INTO `provinces` VALUES ('210106', '辽宁省', '沈阳市', '210100', '铁西区', '210106', '123.350664', '41.787808');
INSERT INTO `provinces` VALUES ('210111', '辽宁省', '沈阳市', '210100', '苏家屯', '210111', '123.341604', '41.665904');
INSERT INTO `provinces` VALUES ('210112', '辽宁省', '沈阳市', '210100', '浑南', '210112', '123.458981', '41.741946');
INSERT INTO `provinces` VALUES ('210113', '辽宁省', '沈阳市', '210100', '沈北新区', '210113', '123.521471', '42.052312');
INSERT INTO `provinces` VALUES ('210114', '辽宁省', '沈阳市', '210100', '于洪区', '210114', '123.310829', '41.795833');
INSERT INTO `provinces` VALUES ('210115', '辽宁省', '沈阳市', '210100', '辽中区', '210115', '122.731269', '41.512725');
INSERT INTO `provinces` VALUES ('210123', '辽宁省', '沈阳市', '210100', '康平', '210123', '123.352703', '42.741533');
INSERT INTO `provinces` VALUES ('210124', '辽宁省', '沈阳市', '210100', '法库', '210124', '123.416722', '42.507045');
INSERT INTO `provinces` VALUES ('210181', '辽宁省', '沈阳市', '210100', '新民', '210181', '122.828868', '41.996508');
INSERT INTO `provinces` VALUES ('210200', '辽宁省', '大连市', '210200', '大连', '210200', '121.618622', '38.91459');
INSERT INTO `provinces` VALUES ('210202', '辽宁省', '大连市', '210200', '中山区', '210202', '121.64376', '38.921553');
INSERT INTO `provinces` VALUES ('210203', '辽宁省', '大连市', '210200', '西岗区', '210203', '121.616112', '38.914266');
INSERT INTO `provinces` VALUES ('210204', '辽宁省', '大连市', '210200', '沙河口', '210204', '121.593702', '38.912859');
INSERT INTO `provinces` VALUES ('210211', '辽宁省', '大连市', '210200', '甘井子', '210211', '121.582614', '38.975148');
INSERT INTO `provinces` VALUES ('210212', '辽宁省', '大连市', '210200', '旅顺', '210212', '121.26713', '38.812043');
INSERT INTO `provinces` VALUES ('210213', '辽宁省', '大连市', '210200', '金州', '210213', '121.789413', '39.052745');
INSERT INTO `provinces` VALUES ('210214', '辽宁省', '大连市', '210200', '普兰店', '210214', '121.9705', '39.401555');
INSERT INTO `provinces` VALUES ('210224', '辽宁省', '大连市', '210200', '长海', '210224', '122.587824', '39.272399');
INSERT INTO `provinces` VALUES ('210281', '辽宁省', '大连市', '210200', '瓦房店', '210281', '122.002656', '39.63065');
INSERT INTO `provinces` VALUES ('210283', '辽宁省', '大连市', '210200', '庄河', '210283', '122.970612', '39.69829');
INSERT INTO `provinces` VALUES ('210300', '辽宁省', '鞍山市', '210300', '鞍山', '210300', '122.995632', '41.110626');
INSERT INTO `provinces` VALUES ('210302', '辽宁省', '鞍山市', '210300', '铁东区', '210302', '122.994475', '41.110344');
INSERT INTO `provinces` VALUES ('210303', '辽宁省', '鞍山市', '210300', '铁西区', '210303', '122.971834', '41.11069');
INSERT INTO `provinces` VALUES ('210304', '辽宁省', '鞍山市', '210300', '立山', '210304', '123.024806', '41.150622');
INSERT INTO `provinces` VALUES ('210311', '辽宁省', '鞍山市', '210300', '千山', '210311', '122.949298', '41.068909');
INSERT INTO `provinces` VALUES ('210321', '辽宁省', '鞍山市', '210300', '台安', '210321', '122.429736', '41.38686');
INSERT INTO `provinces` VALUES ('210323', '辽宁省', '鞍山市', '210300', '岫岩', '210323', '123.28833', '40.281509');
INSERT INTO `provinces` VALUES ('210381', '辽宁省', '鞍山市', '210300', '海城', '210381', '122.752199', '40.852533');
INSERT INTO `provinces` VALUES ('210400', '辽宁省', '抚顺市', '210400', '抚顺', '210400', '124.097979', '41.922644');
INSERT INTO `provinces` VALUES ('210402', '辽宁省', '抚顺市', '210400', '新抚区', '210402', '123.902858', '41.86082');
INSERT INTO `provinces` VALUES ('210403', '辽宁省', '抚顺市', '210400', '东洲区', '210403', '124.047219', '41.866829');
INSERT INTO `provinces` VALUES ('210404', '辽宁省', '抚顺市', '210400', '望花区', '210404', '123.801509', '41.851803');
INSERT INTO `provinces` VALUES ('210411', '辽宁省', '抚顺市', '210400', '顺城区', '210411', '123.917165', '41.881132');
INSERT INTO `provinces` VALUES ('210421', '辽宁省', '抚顺市', '210400', '抚顺县', '210421', '123.9216', '41.88704');
INSERT INTO `provinces` VALUES ('210422', '辽宁省', '抚顺市', '210400', '新宾', '210422', '125.037547', '41.732456');
INSERT INTO `provinces` VALUES ('210423', '辽宁省', '抚顺市', '210400', '清原', '210423', '124.927192', '42.10135');
INSERT INTO `provinces` VALUES ('210500', '辽宁省', '本溪市', '210500', '本溪', '210500', '123.770519', '41.297909');
INSERT INTO `provinces` VALUES ('210502', '辽宁省', '本溪市', '210500', '平山区', '210502', '123.761231', '41.291581');
INSERT INTO `provinces` VALUES ('210503', '辽宁省', '本溪市', '210500', '溪湖', '210503', '123.765226', '41.330056');
INSERT INTO `provinces` VALUES ('210504', '辽宁省', '本溪市', '210500', '明山', '210504', '123.763288', '41.302429');
INSERT INTO `provinces` VALUES ('210505', '辽宁省', '本溪市', '210500', '南芬', '210505', '123.748381', '41.104093');
INSERT INTO `provinces` VALUES ('210521', '辽宁省', '本溪市', '210500', '本溪县', '210521', '124.17', '41.18');
INSERT INTO `provinces` VALUES ('210522', '辽宁省', '本溪市', '210500', '桓仁', '210522', '125.359195', '41.268997');
INSERT INTO `provinces` VALUES ('210600', '辽宁省', '丹东市', '210600', '丹东', '210600', '124.383044', '40.124296');
INSERT INTO `provinces` VALUES ('210602', '辽宁省', '丹东市', '210600', '元宝', '210602', '124.397814', '40.136483');
INSERT INTO `provinces` VALUES ('210603', '辽宁省', '丹东市', '210600', '振兴', '210603', '124.361153', '40.102801');
INSERT INTO `provinces` VALUES ('210604', '辽宁省', '丹东市', '210600', '振安', '210604', '124.427709', '40.158557');
INSERT INTO `provinces` VALUES ('210624', '辽宁省', '丹东市', '210600', '宽甸', '210624', '124.784867', '40.730412');
INSERT INTO `provinces` VALUES ('210681', '辽宁省', '丹东市', '210600', '东港', '210681', '124.149437', '39.883467');
INSERT INTO `provinces` VALUES ('210682', '辽宁省', '丹东市', '210600', '凤城', '210682', '124.071067', '40.457567');
INSERT INTO `provinces` VALUES ('210700', '辽宁省', '锦州市', '210700', '锦州', '210700', '121.135742', '41.119269');
INSERT INTO `provinces` VALUES ('210702', '辽宁省', '锦州市', '210700', '古塔', '210702', '121.130085', '41.115719');
INSERT INTO `provinces` VALUES ('210703', '辽宁省', '锦州市', '210700', '凌河', '210703', '121.151304', '41.114662');
INSERT INTO `provinces` VALUES ('210711', '辽宁省', '锦州市', '210700', '太和区', '210711', '121.107297', '41.105378');
INSERT INTO `provinces` VALUES ('210726', '辽宁省', '锦州市', '210700', '黑山', '210726', '122.117915', '41.691804');
INSERT INTO `provinces` VALUES ('210727', '辽宁省', '锦州市', '210700', '义县', '210727', '121.242831', '41.537224');
INSERT INTO `provinces` VALUES ('210781', '辽宁省', '锦州市', '210700', '凌海', '210781', '121.364236', '41.171738');
INSERT INTO `provinces` VALUES ('210782', '辽宁省', '锦州市', '210700', '北镇', '210782', '121.795962', '41.598764');
INSERT INTO `provinces` VALUES ('210800', '辽宁省', '营口市', '210800', '营口', '210800', '122.235151', '40.667432');
INSERT INTO `provinces` VALUES ('210802', '辽宁省', '营口市', '210800', '站前区', '210802', '122.253235', '40.669949');
INSERT INTO `provinces` VALUES ('210803', '辽宁省', '营口市', '210800', '西市区', '210803', '122.210067', '40.663086');
INSERT INTO `provinces` VALUES ('210804', '辽宁省', '营口市', '210800', '鲅鱼圈', '210804', '122.127242', '40.263646');
INSERT INTO `provinces` VALUES ('210811', '辽宁省', '营口市', '210800', '老边区', '210811', '122.382584', '40.682723');
INSERT INTO `provinces` VALUES ('210881', '辽宁省', '营口市', '210800', '盖州', '210881', '122.355534', '40.405234');
INSERT INTO `provinces` VALUES ('210882', '辽宁省', '营口市', '210800', '大石桥', '210882', '122.505894', '40.633973');
INSERT INTO `provinces` VALUES ('210900', '辽宁省', '阜新市', '210900', '阜新', '210900', '121.743125', '42.058607');
INSERT INTO `provinces` VALUES ('210902', '辽宁省', '阜新市', '210900', '海州区', '210902', '121.657639', '42.011162');
INSERT INTO `provinces` VALUES ('210903', '辽宁省', '阜新市', '210900', '新邱', '210903', '121.790541', '42.086603');
INSERT INTO `provinces` VALUES ('210904', '辽宁省', '阜新市', '210900', '太平', '210904', '121.677575', '42.011145');
INSERT INTO `provinces` VALUES ('210905', '辽宁省', '阜新市', '210900', '清河门', '210905', '121.42018', '41.780477');
INSERT INTO `provinces` VALUES ('210911', '辽宁省', '阜新市', '210900', '细河', '210911', '121.654791', '42.019218');
INSERT INTO `provinces` VALUES ('210921', '辽宁省', '阜新市', '210900', '阜新县', '210921', '121.763574', '42.07137');
INSERT INTO `provinces` VALUES ('210922', '辽宁省', '阜新市', '210900', '彰武', '210922', '122.537444', '42.384823');
INSERT INTO `provinces` VALUES ('211000', '辽宁省', '辽阳市', '211000', '辽阳', '211000', '123.18152', '41.269402');
INSERT INTO `provinces` VALUES ('211002', '辽宁省', '辽阳市', '211000', '白塔区', '211002', '123.172611', '41.26745');
INSERT INTO `provinces` VALUES ('211003', '辽宁省', '辽阳市', '211000', '文圣区', '211003', '123.188227', '41.266765');
INSERT INTO `provinces` VALUES ('211004', '辽宁省', '辽阳市', '211000', '宏伟区', '211004', '123.200461', '41.205747');
INSERT INTO `provinces` VALUES ('211005', '辽宁省', '辽阳市', '211000', '弓长岭', '211005', '123.431633', '41.157831');
INSERT INTO `provinces` VALUES ('211011', '辽宁省', '辽阳市', '211000', '太子河', '211011', '123.185336', '41.251682');
INSERT INTO `provinces` VALUES ('211021', '辽宁省', '辽阳市', '211000', '辽阳县', '211021', '123.079674', '41.216479');
INSERT INTO `provinces` VALUES ('211081', '辽宁省', '辽阳市', '211000', '灯塔市', '211081', '123.325864', '41.427836');
INSERT INTO `provinces` VALUES ('211100', '辽宁省', '盘锦市', '211100', '盘锦', '211100', '122.06957', '41.124484');
INSERT INTO `provinces` VALUES ('211102', '辽宁省', '盘锦市', '211100', '双台子', '211102', '122.055733', '41.190365');
INSERT INTO `provinces` VALUES ('211103', '辽宁省', '盘锦市', '211100', '兴隆台', '211103', '122.071624', '41.122423');
INSERT INTO `provinces` VALUES ('211104', '辽宁省', '盘锦市', '211100', '大洼', '211104', '122.071708', '40.994428');
INSERT INTO `provinces` VALUES ('211122', '辽宁省', '盘锦市', '211100', '盘山', '211122', '121.98528', '41.240701');
INSERT INTO `provinces` VALUES ('211200', '辽宁省', '铁岭市', '211200', '铁岭', '211200', '123.725669', '42.223316');
INSERT INTO `provinces` VALUES ('211202', '辽宁省', '铁岭市', '211200', '银州', '211202', '123.844877', '42.292278');
INSERT INTO `provinces` VALUES ('211204', '辽宁省', '铁岭市', '211200', '清河区', '211204', '124.14896', '42.542978');
INSERT INTO `provinces` VALUES ('211221', '辽宁省', '铁岭市', '211200', '铁岭县', '211221', '123.735372', '42.229226');
INSERT INTO `provinces` VALUES ('211223', '辽宁省', '铁岭市', '211200', '西丰', '211223', '124.72332', '42.738091');
INSERT INTO `provinces` VALUES ('211224', '辽宁省', '铁岭市', '211200', '昌图', '211224', '124.11017', '42.784441');
INSERT INTO `provinces` VALUES ('211281', '辽宁省', '铁岭市', '211200', '调兵山', '211281', '123.545366', '42.450734');
INSERT INTO `provinces` VALUES ('211282', '辽宁省', '铁岭市', '211200', '开原', '211282', '124.045551', '42.542141');
INSERT INTO `provinces` VALUES ('211300', '辽宁省', '朝阳市', '211300', '朝阳', '211300', '120.451176', '41.576758');
INSERT INTO `provinces` VALUES ('211302', '辽宁省', '朝阳市', '211300', '双塔', '211302', '120.44877', '41.579389');
INSERT INTO `provinces` VALUES ('211303', '辽宁省', '朝阳市', '211300', '龙城', '211303', '120.413376', '41.576749');
INSERT INTO `provinces` VALUES ('211321', '辽宁省', '朝阳市', '211300', '朝阳县', '211321', '120.25939', '41.241076');
INSERT INTO `provinces` VALUES ('211322', '辽宁省', '朝阳市', '211300', '建平', '211322', '119.642363', '41.402576');
INSERT INTO `provinces` VALUES ('211324', '辽宁省', '朝阳市', '211300', '喀左', '211324', '119.43', '41.05');
INSERT INTO `provinces` VALUES ('211381', '辽宁省', '朝阳市', '211300', '北票', '211381', '120.766951', '41.803286');
INSERT INTO `provinces` VALUES ('211382', '辽宁省', '朝阳市', '211300', '凌源', '211382', '119.404789', '41.243086');
INSERT INTO `provinces` VALUES ('211400', '辽宁省', '葫芦岛市', '211400', '葫芦岛', '211400', '120.856394', '40.755572');
INSERT INTO `provinces` VALUES ('211402', '辽宁省', '葫芦岛市', '211400', '连山区', '211402', '120.85937', '40.755143');
INSERT INTO `provinces` VALUES ('211403', '辽宁省', '葫芦岛市', '211400', '龙港', '211403', '120.838569', '40.709991');
INSERT INTO `provinces` VALUES ('211404', '辽宁省', '葫芦岛市', '211400', '南票', '211404', '120.752314', '41.098813');
INSERT INTO `provinces` VALUES ('211421', '辽宁省', '葫芦岛市', '211400', '绥中', '211421', '120.342112', '40.328407');
INSERT INTO `provinces` VALUES ('211422', '辽宁省', '葫芦岛市', '211400', '建昌', '211422', '119.807776', '40.812871');
INSERT INTO `provinces` VALUES ('211481', '辽宁省', '葫芦岛市', '211400', '兴城', '211481', '120.729365', '40.619413');
INSERT INTO `provinces` VALUES ('220100', '吉林省', '长春市', '220100', '长春', '220100', '125.3245', '43.886841');
INSERT INTO `provinces` VALUES ('220102', '吉林省', '长春市', '220100', '南关', '220102', '125.337237', '43.890235');
INSERT INTO `provinces` VALUES ('220103', '吉林省', '长春市', '220100', '宽城区', '220103', '125.342828', '43.903823');
INSERT INTO `provinces` VALUES ('220104', '吉林省', '长春市', '220100', '朝阳区', '220104', '125.318042', '43.86491');
INSERT INTO `provinces` VALUES ('220105', '吉林省', '长春市', '220100', '二道区', '220105', '125.384727', '43.870824');
INSERT INTO `provinces` VALUES ('220106', '吉林省', '长春市', '220100', '绿园区', '220106', '125.272467', '43.892177');
INSERT INTO `provinces` VALUES ('220112', '吉林省', '长春市', '220100', '双阳', '220112', '125.659018', '43.525168');
INSERT INTO `provinces` VALUES ('220113', '吉林省', '长春市', '220100', '九台', '220113', '125.844682', '44.157155');
INSERT INTO `provinces` VALUES ('220122', '吉林省', '长春市', '220100', '农安', '220122', '125.175287', '44.431258');
INSERT INTO `provinces` VALUES ('220182', '吉林省', '长春市', '220100', '榆树', '220182', '126.550107', '44.827642');
INSERT INTO `provinces` VALUES ('220183', '吉林省', '长春市', '220100', '德惠', '220183', '125.703327', '44.533909');
INSERT INTO `provinces` VALUES ('220200', '吉林省', '吉林市', '220200', '吉林', '220200', '126.55302', '43.843577');
INSERT INTO `provinces` VALUES ('220202', '吉林省', '吉林市', '220200', '昌邑区', '220202', '126.570766', '43.851118');
INSERT INTO `provinces` VALUES ('220203', '吉林省', '吉林市', '220200', '龙潭', '220203', '126.561429', '43.909755');
INSERT INTO `provinces` VALUES ('220204', '吉林省', '吉林市', '220200', '船营', '220204', '126.55239', '43.843804');
INSERT INTO `provinces` VALUES ('220211', '吉林省', '吉林市', '220200', '丰满', '220211', '126.560759', '43.816594');
INSERT INTO `provinces` VALUES ('220221', '吉林省', '吉林市', '220200', '永吉', '220221', '126.501622', '43.667416');
INSERT INTO `provinces` VALUES ('220281', '吉林省', '吉林市', '220200', '蛟河', '220281', '127.342739', '43.720579');
INSERT INTO `provinces` VALUES ('220282', '吉林省', '吉林市', '220200', '桦甸', '220282', '126.745445', '42.972093');
INSERT INTO `provinces` VALUES ('220283', '吉林省', '吉林市', '220200', '舒兰', '220283', '126.947813', '44.410906');
INSERT INTO `provinces` VALUES ('220284', '吉林省', '吉林市', '220200', '磐石', '220284', '126.059929', '42.942476');
INSERT INTO `provinces` VALUES ('220300', '吉林省', '四平市', '220300', '四平', '220300', '124.370785', '43.170344');
INSERT INTO `provinces` VALUES ('220302', '吉林省', '四平市', '220300', '铁西', '220302', '124.360894', '43.176263');
INSERT INTO `provinces` VALUES ('220303', '吉林省', '四平市', '220300', '铁东', '220303', '124.388464', '43.16726');
INSERT INTO `provinces` VALUES ('220322', '吉林省', '四平市', '220300', '梨树', '220322', '124.335802', '43.30831');
INSERT INTO `provinces` VALUES ('220323', '吉林省', '四平市', '220300', '伊通', '220323', '125.303124', '43.345464');
INSERT INTO `provinces` VALUES ('220381', '吉林省', '四平市', '220300', '公主岭', '220381', '124.817588', '43.509474');
INSERT INTO `provinces` VALUES ('220382', '吉林省', '四平市', '220300', '双辽', '220382', '123.505283', '43.518275');
INSERT INTO `provinces` VALUES ('220400', '吉林省', '辽源市', '220400', '辽源', '220400', '125.145349', '42.902692');
INSERT INTO `provinces` VALUES ('220402', '吉林省', '辽源市', '220400', '龙山区', '220402', '125.145164', '42.902702');
INSERT INTO `provinces` VALUES ('220403', '吉林省', '辽源市', '220400', '西安区', '220403', '125.151424', '42.920415');
INSERT INTO `provinces` VALUES ('220421', '吉林省', '辽源市', '220400', '东丰', '220421', '125.529623', '42.675228');
INSERT INTO `provinces` VALUES ('220422', '吉林省', '辽源市', '220400', '东辽', '220422', '124.991995', '42.927724');
INSERT INTO `provinces` VALUES ('220500', '吉林省', '通化市', '220500', '通化', '220500', '125.936501', '41.721177');
INSERT INTO `provinces` VALUES ('220502', '吉林省', '通化市', '220500', '东昌区', '220502', '125.936716', '41.721233');
INSERT INTO `provinces` VALUES ('220503', '吉林省', '通化市', '220500', '二道江', '220503', '126.045987', '41.777564');
INSERT INTO `provinces` VALUES ('220521', '吉林省', '通化市', '220500', '通化县', '220521', '125.753121', '41.677918');
INSERT INTO `provinces` VALUES ('220523', '吉林省', '通化市', '220500', '辉南', '220523', '126.042821', '42.683459');
INSERT INTO `provinces` VALUES ('220524', '吉林省', '通化市', '220500', '柳河', '220524', '125.740536', '42.281484');
INSERT INTO `provinces` VALUES ('220581', '吉林省', '通化市', '220500', '梅河口', '220581', '125.687336', '42.530002');
INSERT INTO `provinces` VALUES ('220582', '吉林省', '通化市', '220500', '集安', '220582', '126.186204', '41.126276');
INSERT INTO `provinces` VALUES ('220600', '吉林省', '白山市', '220600', '白山', '220600', '126.427839', '41.942505');
INSERT INTO `provinces` VALUES ('220602', '吉林省', '白山市', '220600', '浑江', '220602', '126.428035', '41.943065');
INSERT INTO `provinces` VALUES ('220605', '吉林省', '白山市', '220600', '江源', '220605', '126.584229', '42.048109');
INSERT INTO `provinces` VALUES ('220621', '吉林省', '白山市', '220600', '抚松', '220621', '127.273796', '42.332643');
INSERT INTO `provinces` VALUES ('220622', '吉林省', '白山市', '220600', '靖宇', '220622', '126.808386', '42.389689');
INSERT INTO `provinces` VALUES ('220623', '吉林省', '白山市', '220600', '长白', '220623', '128.203384', '41.419361');
INSERT INTO `provinces` VALUES ('220681', '吉林省', '白山市', '220600', '临江', '220681', '126.919296', '41.810689');
INSERT INTO `provinces` VALUES ('220700', '吉林省', '松原市', '220700', '松原', '220700', '124.823608', '45.118243');
INSERT INTO `provinces` VALUES ('220702', '吉林省', '松原市', '220700', '宁江', '220702', '124.827851', '45.176498');
INSERT INTO `provinces` VALUES ('220721', '吉林省', '松原市', '220700', '前郭', '220721', '124.826808', '45.116288');
INSERT INTO `provinces` VALUES ('220722', '吉林省', '松原市', '220700', '长岭', '220722', '123.985184', '44.276579');
INSERT INTO `provinces` VALUES ('220723', '吉林省', '松原市', '220700', '乾安', '220723', '124.024361', '45.006846');
INSERT INTO `provinces` VALUES ('220781', '吉林省', '松原市', '220700', '扶余', '220781', '126.042758', '44.986199');
INSERT INTO `provinces` VALUES ('220800', '吉林省', '白城市', '220800', '白城', '220800', '122.841114', '45.619026');
INSERT INTO `provinces` VALUES ('220802', '吉林省', '白城市', '220800', '洮北', '220802', '122.842499', '45.619253');
INSERT INTO `provinces` VALUES ('220821', '吉林省', '白城市', '220800', '镇赉', '220821', '123.202246', '45.846089');
INSERT INTO `provinces` VALUES ('220822', '吉林省', '白城市', '220800', '通榆', '220822', '123.088543', '44.80915');
INSERT INTO `provinces` VALUES ('220881', '吉林省', '白城市', '220800', '洮南', '220881', '122.783779', '45.339113');
INSERT INTO `provinces` VALUES ('220882', '吉林省', '白城市', '220800', '大安', '220882', '124.291512', '45.507648');
INSERT INTO `provinces` VALUES ('222400', '吉林省', '延边朝鲜族自治州', '222400', '延边', '222400', '129.513228', '42.904823');
INSERT INTO `provinces` VALUES ('222401', '吉林省', '延边朝鲜族自治州', '222400', '延吉', '222401', '129.51579', '42.906964');
INSERT INTO `provinces` VALUES ('222402', '吉林省', '延边朝鲜族自治州', '222400', '图们', '222402', '129.846701', '42.966621');
INSERT INTO `provinces` VALUES ('222403', '吉林省', '延边朝鲜族自治州', '222400', '敦化', '222403', '128.22986', '43.366921');
INSERT INTO `provinces` VALUES ('222404', '吉林省', '延边朝鲜族自治州', '222400', '珲春', '222404', '130.365787', '42.871057');
INSERT INTO `provinces` VALUES ('222405', '吉林省', '延边朝鲜族自治州', '222400', '龙井', '222405', '129.425747', '42.771029');
INSERT INTO `provinces` VALUES ('222406', '吉林省', '延边朝鲜族自治州', '222400', '和龙', '222406', '129.008748', '42.547004');
INSERT INTO `provinces` VALUES ('222424', '吉林省', '延边朝鲜族自治州', '222400', '汪清', '222424', '129.766161', '43.315426');
INSERT INTO `provinces` VALUES ('222426', '吉林省', '延边朝鲜族自治州', '222400', '安图', '222426', '128.901865', '43.110994');
INSERT INTO `provinces` VALUES ('230100', '黑龙江省', '哈尔滨市', '230100', '哈尔滨', '230100', '126.642464', '45.756967');
INSERT INTO `provinces` VALUES ('230102', '黑龙江省', '哈尔滨市', '230100', '道里区', '230102', '126.612532', '45.762035');
INSERT INTO `provinces` VALUES ('230103', '黑龙江省', '哈尔滨市', '230100', '南岗区', '230103', '126.652098', '45.755971');
INSERT INTO `provinces` VALUES ('230104', '黑龙江省', '哈尔滨市', '230100', '道外区', '230104', '126.648838', '45.78454');
INSERT INTO `provinces` VALUES ('230108', '黑龙江省', '哈尔滨市', '230100', '平房区', '230108', '126.629257', '45.605567');
INSERT INTO `provinces` VALUES ('230109', '黑龙江省', '哈尔滨市', '230100', '松北区', '230109', '126.563066', '45.814656');
INSERT INTO `provinces` VALUES ('230110', '黑龙江省', '哈尔滨市', '230100', '香坊区', '230110', '126.667049', '45.713067');
INSERT INTO `provinces` VALUES ('230111', '黑龙江省', '哈尔滨市', '230100', '呼兰', '230111', '126.603302', '45.98423');
INSERT INTO `provinces` VALUES ('230112', '黑龙江省', '哈尔滨市', '230100', '阿城', '230112', '126.972726', '45.538372');
INSERT INTO `provinces` VALUES ('230113', '黑龙江省', '哈尔滨市', '230100', '双城区', '230113', '126.308784', '45.377942');
INSERT INTO `provinces` VALUES ('230123', '黑龙江省', '哈尔滨市', '230100', '依兰', '230123', '129.565594', '46.315105');
INSERT INTO `provinces` VALUES ('230124', '黑龙江省', '哈尔滨市', '230100', '方正', '230124', '128.836131', '45.839536');
INSERT INTO `provinces` VALUES ('230125', '黑龙江省', '哈尔滨市', '230100', '宾县', '230125', '127.48594', '45.759369');
INSERT INTO `provinces` VALUES ('230126', '黑龙江省', '哈尔滨市', '230100', '巴彦', '230126', '127.403602', '46.081889');
INSERT INTO `provinces` VALUES ('230127', '黑龙江省', '哈尔滨市', '230100', '木兰', '230127', '128.042675', '45.949826');
INSERT INTO `provinces` VALUES ('230128', '黑龙江省', '哈尔滨市', '230100', '通河', '230128', '128.747786', '45.977618');
INSERT INTO `provinces` VALUES ('230129', '黑龙江省', '哈尔滨市', '230100', '延寿', '230129', '128.331886', '45.455648');
INSERT INTO `provinces` VALUES ('230183', '黑龙江省', '哈尔滨市', '230100', '尚志', '230183', '127.968539', '45.214953');
INSERT INTO `provinces` VALUES ('230184', '黑龙江省', '哈尔滨市', '230100', '五常', '230184', '127.15759', '44.919418');
INSERT INTO `provinces` VALUES ('230200', '黑龙江省', '齐齐哈尔市', '230200', '齐齐哈尔', '230200', '123.95792', '47.342081');
INSERT INTO `provinces` VALUES ('230202', '黑龙江省', '齐齐哈尔市', '230200', '龙沙', '230202', '123.957338', '47.341736');
INSERT INTO `provinces` VALUES ('230203', '黑龙江省', '齐齐哈尔市', '230200', '建华', '230203', '123.955888', '47.354494');
INSERT INTO `provinces` VALUES ('230204', '黑龙江省', '齐齐哈尔市', '230200', '铁锋', '230204', '123.973555', '47.339499');
INSERT INTO `provinces` VALUES ('230205', '黑龙江省', '齐齐哈尔市', '230200', '昂昂溪', '230205', '123.813181', '47.156867');
INSERT INTO `provinces` VALUES ('230206', '黑龙江省', '齐齐哈尔市', '230200', '富拉尔基', '230206', '123.638873', '47.20697');
INSERT INTO `provinces` VALUES ('230207', '黑龙江省', '齐齐哈尔市', '230200', '碾子山', '230207', '122.887972', '47.51401');
INSERT INTO `provinces` VALUES ('230208', '黑龙江省', '齐齐哈尔市', '230200', '梅里斯', '230208', '123.754599', '47.311113');
INSERT INTO `provinces` VALUES ('230221', '黑龙江省', '齐齐哈尔市', '230200', '龙江', '230221', '123.187225', '47.336388');
INSERT INTO `provinces` VALUES ('230223', '黑龙江省', '齐齐哈尔市', '230200', '依安', '230223', '125.307561', '47.890098');
INSERT INTO `provinces` VALUES ('230224', '黑龙江省', '齐齐哈尔市', '230200', '泰来', '230224', '123.41953', '46.39233');
INSERT INTO `provinces` VALUES ('230225', '黑龙江省', '齐齐哈尔市', '230200', '甘南县', '230225', '123.506034', '47.917838');
INSERT INTO `provinces` VALUES ('230227', '黑龙江省', '齐齐哈尔市', '230200', '富裕', '230227', '124.469106', '47.797172');
INSERT INTO `provinces` VALUES ('230229', '黑龙江省', '齐齐哈尔市', '230200', '克山', '230229', '125.874355', '48.034342');
INSERT INTO `provinces` VALUES ('230230', '黑龙江省', '齐齐哈尔市', '230200', '克东', '230230', '126.249094', '48.03732');
INSERT INTO `provinces` VALUES ('230231', '黑龙江省', '齐齐哈尔市', '230200', '拜泉', '230231', '126.091911', '47.607363');
INSERT INTO `provinces` VALUES ('230281', '黑龙江省', '齐齐哈尔市', '230200', '讷河', '230281', '124.882172', '48.481133');
INSERT INTO `provinces` VALUES ('230300', '黑龙江省', '鸡西市', '230300', '鸡西', '230300', '130.975966', '45.300046');
INSERT INTO `provinces` VALUES ('230302', '黑龙江省', '鸡西市', '230300', '鸡冠区', '230302', '130.974374', '45.30034');
INSERT INTO `provinces` VALUES ('230303', '黑龙江省', '鸡西市', '230300', '恒山区', '230303', '130.910636', '45.213242');
INSERT INTO `provinces` VALUES ('230304', '黑龙江省', '鸡西市', '230300', '滴道区', '230304', '130.846823', '45.348812');
INSERT INTO `provinces` VALUES ('230305', '黑龙江省', '鸡西市', '230300', '梨树区', '230305', '130.697781', '45.092195');
INSERT INTO `provinces` VALUES ('230306', '黑龙江省', '鸡西市', '230300', '城子河', '230306', '131.010501', '45.338248');
INSERT INTO `provinces` VALUES ('230307', '黑龙江省', '鸡西市', '230300', '麻山', '230307', '130.481126', '45.209607');
INSERT INTO `provinces` VALUES ('230321', '黑龙江省', '鸡西市', '230300', '鸡东', '230321', '131.148907', '45.250892');
INSERT INTO `provinces` VALUES ('230381', '黑龙江省', '鸡西市', '230300', '虎林', '230381', '132.973881', '45.767985');
INSERT INTO `provinces` VALUES ('230382', '黑龙江省', '鸡西市', '230300', '密山', '230382', '131.874137', '45.54725');
INSERT INTO `provinces` VALUES ('230400', '黑龙江省', '鹤岗市', '230400', '鹤岗', '230400', '130.277487', '47.332085');
INSERT INTO `provinces` VALUES ('230402', '黑龙江省', '鹤岗市', '230400', '向阳区', '230402', '130.292478', '47.345372');
INSERT INTO `provinces` VALUES ('230403', '黑龙江省', '鹤岗市', '230400', '工农区', '230403', '130.276652', '47.331678');
INSERT INTO `provinces` VALUES ('230404', '黑龙江省', '鹤岗市', '230400', '南山区', '230404', '130.275533', '47.31324');
INSERT INTO `provinces` VALUES ('230405', '黑龙江省', '鹤岗市', '230400', '兴安区', '230405', '130.236169', '47.252911');
INSERT INTO `provinces` VALUES ('230406', '黑龙江省', '鹤岗市', '230400', '东山区', '230406', '130.31714', '47.337385');
INSERT INTO `provinces` VALUES ('230407', '黑龙江省', '鹤岗市', '230400', '兴山区', '230407', '130.30534', '47.35997');
INSERT INTO `provinces` VALUES ('230421', '黑龙江省', '鹤岗市', '230400', '萝北', '230421', '130.829087', '47.577577');
INSERT INTO `provinces` VALUES ('230422', '黑龙江省', '鹤岗市', '230400', '绥滨', '230422', '131.860526', '47.289892');
INSERT INTO `provinces` VALUES ('230500', '黑龙江省', '双鸭山市', '230500', '双鸭山', '230500', '131.157304', '46.643442');
INSERT INTO `provinces` VALUES ('230502', '黑龙江省', '双鸭山市', '230500', '尖山区', '230502', '131.15896', '46.642961');
INSERT INTO `provinces` VALUES ('230503', '黑龙江省', '双鸭山市', '230500', '岭东区', '230503', '131.163675', '46.591076');
INSERT INTO `provinces` VALUES ('230505', '黑龙江省', '双鸭山市', '230500', '四方台', '230505', '131.333181', '46.594347');
INSERT INTO `provinces` VALUES ('230506', '黑龙江省', '双鸭山市', '230500', '宝山区', '230506', '131.404294', '46.573366');
INSERT INTO `provinces` VALUES ('230521', '黑龙江省', '双鸭山市', '230500', '集贤', '230521', '131.13933', '46.72898');
INSERT INTO `provinces` VALUES ('230522', '黑龙江省', '双鸭山市', '230500', '友谊', '230522', '131.810622', '46.775159');
INSERT INTO `provinces` VALUES ('230523', '黑龙江省', '双鸭山市', '230500', '宝清', '230523', '132.206415', '46.328781');
INSERT INTO `provinces` VALUES ('230524', '黑龙江省', '双鸭山市', '230500', '饶河', '230524', '134.021162', '46.801288');
INSERT INTO `provinces` VALUES ('230600', '黑龙江省', '大庆市', '230600', '大庆', '230600', '125.11272', '46.590734');
INSERT INTO `provinces` VALUES ('230602', '黑龙江省', '大庆市', '230600', '萨尔图', '230602', '125.114643', '46.596356');
INSERT INTO `provinces` VALUES ('230603', '黑龙江省', '大庆市', '230600', '龙凤区', '230603', '125.145794', '46.573948');
INSERT INTO `provinces` VALUES ('230604', '黑龙江省', '大庆市', '230600', '让胡路', '230604', '124.868341', '46.653254');
INSERT INTO `provinces` VALUES ('230605', '黑龙江省', '大庆市', '230600', '红岗区', '230605', '124.889528', '46.403049');
INSERT INTO `provinces` VALUES ('230606', '黑龙江省', '大庆市', '230600', '大同区', '230606', '124.818509', '46.034304');
INSERT INTO `provinces` VALUES ('230621', '黑龙江省', '大庆市', '230600', '肇州', '230621', '125.273254', '45.708685');
INSERT INTO `provinces` VALUES ('230622', '黑龙江省', '大庆市', '230600', '肇源', '230622', '125.081974', '45.518832');
INSERT INTO `provinces` VALUES ('230623', '黑龙江省', '大庆市', '230600', '林甸', '230623', '124.877742', '47.186411');
INSERT INTO `provinces` VALUES ('230624', '黑龙江省', '大庆市', '230600', '杜尔伯特', '230624', '124.446259', '46.865973');
INSERT INTO `provinces` VALUES ('230700', '黑龙江省', '伊春市', '230700', '伊春', '230700', '128.899284', '47.726851');
INSERT INTO `provinces` VALUES ('230702', '黑龙江省', '伊春市', '230700', '伊春区', '230702', '128.913459', '47.733954');
INSERT INTO `provinces` VALUES ('230703', '黑龙江省', '伊春市', '230700', '南岔区', '230703', '129.28246', '47.137314');
INSERT INTO `provinces` VALUES ('230704', '黑龙江省', '伊春市', '230700', '友好区', '230704', '128.838961', '47.854303');
INSERT INTO `provinces` VALUES ('230705', '黑龙江省', '伊春市', '230700', '西林区', '230705', '129.311441', '47.479437');
INSERT INTO `provinces` VALUES ('230706', '黑龙江省', '伊春市', '230700', '翠峦', '230706', '128.671746', '47.726228');
INSERT INTO `provinces` VALUES ('230707', '黑龙江省', '伊春市', '230700', '新青', '230707', '129.52995', '48.288292');
INSERT INTO `provinces` VALUES ('230708', '黑龙江省', '伊春市', '230700', '美溪', '230708', '129.133411', '47.636102');
INSERT INTO `provinces` VALUES ('230709', '黑龙江省', '伊春市', '230700', '金山屯', '230709', '129.435944', '47.41295');
INSERT INTO `provinces` VALUES ('230710', '黑龙江省', '伊春市', '230700', '五营', '230710', '129.245028', '48.108204');
INSERT INTO `provinces` VALUES ('230711', '黑龙江省', '伊春市', '230700', '乌马河', '230711', '128.802941', '47.726961');
INSERT INTO `provinces` VALUES ('230712', '黑龙江省', '伊春市', '230700', '汤旺河', '230712', '129.57224', '48.453651');
INSERT INTO `provinces` VALUES ('230713', '黑龙江省', '伊春市', '230700', '带岭', '230713', '129.021151', '47.027532');
INSERT INTO `provinces` VALUES ('230714', '黑龙江省', '伊春市', '230700', '乌伊岭', '230714', '129.437847', '48.59112');
INSERT INTO `provinces` VALUES ('230715', '黑龙江省', '伊春市', '230700', '红星区', '230715', '129.388796', '48.238368');
INSERT INTO `provinces` VALUES ('230716', '黑龙江省', '伊春市', '230700', '上甘岭', '230716', '129.02508', '47.974859');
INSERT INTO `provinces` VALUES ('230722', '黑龙江省', '伊春市', '230700', '嘉荫', '230722', '130.397684', '48.891378');
INSERT INTO `provinces` VALUES ('230781', '黑龙江省', '伊春市', '230700', '铁力', '230781', '128.030561', '46.985772');
INSERT INTO `provinces` VALUES ('230800', '黑龙江省', '佳木斯市', '230800', '佳木斯', '230800', '130.361634', '46.809606');
INSERT INTO `provinces` VALUES ('230803', '黑龙江省', '佳木斯市', '230800', '向阳区', '230803', '130.361786', '46.809645');
INSERT INTO `provinces` VALUES ('230804', '黑龙江省', '佳木斯市', '230800', '前进区', '230804', '130.377684', '46.812345');
INSERT INTO `provinces` VALUES ('230805', '黑龙江省', '佳木斯市', '230800', '东风区', '230805', '130.403297', '46.822476');
INSERT INTO `provinces` VALUES ('230811', '黑龙江省', '佳木斯市', '230800', '郊区', '230811', '130.351588', '46.80712');
INSERT INTO `provinces` VALUES ('230822', '黑龙江省', '佳木斯市', '230800', '桦南', '230822', '130.570112', '46.240118');
INSERT INTO `provinces` VALUES ('230826', '黑龙江省', '佳木斯市', '230800', '桦川', '230826', '130.723713', '47.023039');
INSERT INTO `provinces` VALUES ('230828', '黑龙江省', '佳木斯市', '230800', '汤原', '230828', '129.904463', '46.730048');
INSERT INTO `provinces` VALUES ('230881', '黑龙江省', '佳木斯市', '230800', '同江', '230881', '132.510119', '47.651131');
INSERT INTO `provinces` VALUES ('230882', '黑龙江省', '佳木斯市', '230800', '富锦', '230882', '132.037951', '47.250747');
INSERT INTO `provinces` VALUES ('230883', '黑龙江省', '佳木斯市', '230800', '抚远', '230883', '134.294501', '48.364707');
INSERT INTO `provinces` VALUES ('230900', '黑龙江省', '七台河市', '230900', '七台河', '230900', '131.015584', '45.771266');
INSERT INTO `provinces` VALUES ('230902', '黑龙江省', '七台河市', '230900', '新兴区', '230902', '130.889482', '45.794258');
INSERT INTO `provinces` VALUES ('230903', '黑龙江省', '七台河市', '230900', '桃山区', '230903', '131.015848', '45.771217');
INSERT INTO `provinces` VALUES ('230904', '黑龙江省', '七台河市', '230900', '茄子河', '230904', '131.071561', '45.776587');
INSERT INTO `provinces` VALUES ('230921', '黑龙江省', '七台河市', '230900', '勃利', '230921', '130.575025', '45.751573');
INSERT INTO `provinces` VALUES ('231000', '黑龙江省', '牡丹江市', '231000', '牡丹江', '231000', '129.618602', '44.582962');
INSERT INTO `provinces` VALUES ('231002', '黑龙江省', '牡丹江市', '231000', '东安区', '231002', '129.623292', '44.582399');
INSERT INTO `provinces` VALUES ('231003', '黑龙江省', '牡丹江市', '231000', '阳明', '231003', '129.634645', '44.596328');
INSERT INTO `provinces` VALUES ('231004', '黑龙江省', '牡丹江市', '231000', '爱民', '231004', '129.601232', '44.595443');
INSERT INTO `provinces` VALUES ('231005', '黑龙江省', '牡丹江市', '231000', '西安区', '231005', '129.61311', '44.581032');
INSERT INTO `provinces` VALUES ('231025', '黑龙江省', '牡丹江市', '231000', '林口', '231025', '130.268402', '45.286645');
INSERT INTO `provinces` VALUES ('231081', '黑龙江省', '牡丹江市', '231000', '绥芬河', '231081', '131.164856', '44.396864');
INSERT INTO `provinces` VALUES ('231083', '黑龙江省', '牡丹江市', '231000', '海林', '231083', '129.387902', '44.574149');
INSERT INTO `provinces` VALUES ('231084', '黑龙江省', '牡丹江市', '231000', '宁安', '231084', '129.470019', '44.346836');
INSERT INTO `provinces` VALUES ('231085', '黑龙江省', '牡丹江市', '231000', '穆棱', '231085', '130.527085', '44.91967');
INSERT INTO `provinces` VALUES ('231086', '黑龙江省', '牡丹江市', '231000', '东宁', '231086', '131.125296', '44.063578');
INSERT INTO `provinces` VALUES ('231100', '黑龙江省', '黑河市', '231100', '黑河', '231100', '127.499023', '50.249585');
INSERT INTO `provinces` VALUES ('231102', '黑龙江省', '黑河市', '231100', '爱辉', '231102', '127.497639', '50.249027');
INSERT INTO `provinces` VALUES ('231121', '黑龙江省', '黑河市', '231100', '嫩江', '231121', '125.229904', '49.177461');
INSERT INTO `provinces` VALUES ('231123', '黑龙江省', '黑河市', '231100', '逊克', '231123', '128.476152', '49.582974');
INSERT INTO `provinces` VALUES ('231124', '黑龙江省', '黑河市', '231100', '孙吴', '231124', '127.327315', '49.423941');
INSERT INTO `provinces` VALUES ('231181', '黑龙江省', '黑河市', '231100', '北安', '231181', '126.508737', '48.245437');
INSERT INTO `provinces` VALUES ('231182', '黑龙江省', '黑河市', '231100', '五大连池', '231182', '126.197694', '48.512688');
INSERT INTO `provinces` VALUES ('231200', '黑龙江省', '绥化市', '231200', '绥化', '231200', '126.99293', '46.637393');
INSERT INTO `provinces` VALUES ('231202', '黑龙江省', '绥化市', '231200', '北林', '231202', '126.990665', '46.634912');
INSERT INTO `provinces` VALUES ('231221', '黑龙江省', '绥化市', '231200', '望奎', '231221', '126.484191', '46.83352');
INSERT INTO `provinces` VALUES ('231222', '黑龙江省', '绥化市', '231200', '兰西', '231222', '126.289315', '46.259037');
INSERT INTO `provinces` VALUES ('231223', '黑龙江省', '绥化市', '231200', '青冈', '231223', '126.112268', '46.686596');
INSERT INTO `provinces` VALUES ('231224', '黑龙江省', '绥化市', '231200', '庆安', '231224', '127.510024', '46.879203');
INSERT INTO `provinces` VALUES ('231225', '黑龙江省', '绥化市', '231200', '明水', '231225', '125.907544', '47.183527');
INSERT INTO `provinces` VALUES ('231226', '黑龙江省', '绥化市', '231200', '绥棱', '231226', '127.111121', '47.247195');
INSERT INTO `provinces` VALUES ('231281', '黑龙江省', '绥化市', '231200', '安达', '231281', '125.329926', '46.410614');
INSERT INTO `provinces` VALUES ('231282', '黑龙江省', '绥化市', '231200', '肇东', '231282', '125.991402', '46.069471');
INSERT INTO `provinces` VALUES ('231283', '黑龙江省', '绥化市', '231200', '海伦', '231283', '126.969383', '47.460428');
INSERT INTO `provinces` VALUES ('232700', '黑龙江省', '大兴安岭地区', '232700', '大兴安岭', '232700', '124.711526', '52.335262');
INSERT INTO `provinces` VALUES ('232701', '黑龙江省', '大兴安岭地区', '232700', '漠河', '232701', '122.536256', '52.972074');
INSERT INTO `provinces` VALUES ('232721', '黑龙江省', '大兴安岭地区', '232700', '呼玛', '232721', '126.662105', '51.726998');
INSERT INTO `provinces` VALUES ('232722', '黑龙江省', '大兴安岭地区', '232700', '塔河', '232722', '124.710516', '52.335229');
INSERT INTO `provinces` VALUES ('232723', '黑龙江省', '大兴安岭地区', '232700', '大兴安岭地区直辖', '232723', '122.536256', '52.972074');
INSERT INTO `provinces` VALUES ('310100', '上海市', '上海市', '310100', '上海', '310100', '121.472644', '31.231706');
INSERT INTO `provinces` VALUES ('310101', '上海市', '上海市', '310100', '黄浦', '310101', '121.490317', '31.222771');
INSERT INTO `provinces` VALUES ('310104', '上海市', '上海市', '310100', '徐汇', '310104', '121.43752', '31.179973');
INSERT INTO `provinces` VALUES ('310105', '上海市', '上海市', '310100', '长宁区', '310105', '121.4222', '31.218123');
INSERT INTO `provinces` VALUES ('310106', '上海市', '上海市', '310100', '静安', '310106', '121.448224', '31.229003');
INSERT INTO `provinces` VALUES ('310107', '上海市', '上海市', '310100', '普陀区', '310107', '121.392499', '31.241701');
INSERT INTO `provinces` VALUES ('310109', '上海市', '上海市', '310100', '虹口', '310109', '121.491832', '31.26097');
INSERT INTO `provinces` VALUES ('310110', '上海市', '上海市', '310100', '杨浦', '310110', '121.522797', '31.270755');
INSERT INTO `provinces` VALUES ('310112', '上海市', '上海市', '310100', '闵行', '310112', '121.375972', '31.111658');
INSERT INTO `provinces` VALUES ('310113', '上海市', '上海市', '310100', '宝山', '310113', '121.489934', '31.398896');
INSERT INTO `provinces` VALUES ('310114', '上海市', '上海市', '310100', '嘉定', '310114', '121.250333', '31.383524');
INSERT INTO `provinces` VALUES ('310115', '上海市', '上海市', '310100', '浦东新区', '310115', '121.567706', '31.245944');
INSERT INTO `provinces` VALUES ('310116', '上海市', '上海市', '310100', '金山', '310116', '121.330736', '30.724697');
INSERT INTO `provinces` VALUES ('310117', '上海市', '上海市', '310100', '松江', '310117', '121.223543', '31.03047');
INSERT INTO `provinces` VALUES ('310118', '上海市', '上海市', '310100', '青浦', '310118', '121.113021', '31.151209');
INSERT INTO `provinces` VALUES ('310120', '上海市', '上海市', '310100', '奉贤', '310120', '121.458472', '30.912345');
INSERT INTO `provinces` VALUES ('310151', '上海市', '上海市', '310100', '崇明', '310151', '121.397516', '31.626946');
INSERT INTO `provinces` VALUES ('320100', '江苏省', '南京市', '320100', '南京', '320100', '118.767413', '32.041544');
INSERT INTO `provinces` VALUES ('320102', '江苏省', '南京市', '320100', '玄武', '320102', '118.792199', '32.050678');
INSERT INTO `provinces` VALUES ('320104', '江苏省', '南京市', '320100', '秦淮', '320104', '118.786088', '32.033818');
INSERT INTO `provinces` VALUES ('320105', '江苏省', '南京市', '320100', '建邺', '320105', '118.732688', '32.004538');
INSERT INTO `provinces` VALUES ('320106', '江苏省', '南京市', '320100', '鼓楼', '320106', '118.769739', '32.066966');
INSERT INTO `provinces` VALUES ('320111', '江苏省', '南京市', '320100', '浦口', '320111', '118.625307', '32.05839');
INSERT INTO `provinces` VALUES ('320113', '江苏省', '南京市', '320100', '栖霞区', '320113', '118.808702', '32.102147');
INSERT INTO `provinces` VALUES ('320114', '江苏省', '南京市', '320100', '雨花台', '320114', '118.77207', '31.995946');
INSERT INTO `provinces` VALUES ('320115', '江苏省', '南京市', '320100', '江宁', '320115', '118.850621', '31.953418');
INSERT INTO `provinces` VALUES ('320116', '江苏省', '南京市', '320100', '六合', '320116', '118.85065', '32.340655');
INSERT INTO `provinces` VALUES ('320117', '江苏省', '南京市', '320100', '溧水', '320117', '119.028732', '31.653061');
INSERT INTO `provinces` VALUES ('320118', '江苏省', '南京市', '320100', '高淳', '320118', '118.87589', '31.327132');
INSERT INTO `provinces` VALUES ('320200', '江苏省', '无锡市', '320200', '无锡', '320200', '120.301663', '31.574729');
INSERT INTO `provinces` VALUES ('320205', '江苏省', '无锡市', '320200', '锡山', '320205', '120.357298', '31.585559');
INSERT INTO `provinces` VALUES ('320206', '江苏省', '无锡市', '320200', '惠山', '320206', '120.303543', '31.681019');
INSERT INTO `provinces` VALUES ('320211', '江苏省', '无锡市', '320200', '滨湖', '320211', '120.266053', '31.550228');
INSERT INTO `provinces` VALUES ('320213', '江苏省', '无锡市', '320200', '梁溪', '320213', '120.296595', '31.575706');
INSERT INTO `provinces` VALUES ('320214', '江苏省', '无锡市', '320200', '新吴', '320214', '120.352782', '31.550966');
INSERT INTO `provinces` VALUES ('320281', '江苏省', '无锡市', '320200', '江阴', '320281', '120.275891', '31.910984');
INSERT INTO `provinces` VALUES ('320282', '江苏省', '无锡市', '320200', '宜兴', '320282', '119.820538', '31.364384');
INSERT INTO `provinces` VALUES ('320300', '江苏省', '徐州市', '320300', '徐州', '320300', '117.184811', '34.261792');
INSERT INTO `provinces` VALUES ('320302', '江苏省', '徐州市', '320300', '鼓楼区', '320302', '117.192941', '34.269397');
INSERT INTO `provinces` VALUES ('320303', '江苏省', '徐州市', '320300', '云龙区', '320303', '117.194589', '34.254805');
INSERT INTO `provinces` VALUES ('320305', '江苏省', '徐州市', '320300', '贾汪', '320305', '117.450212', '34.441642');
INSERT INTO `provinces` VALUES ('320311', '江苏省', '徐州市', '320300', '泉山', '320311', '117.182225', '34.262249');
INSERT INTO `provinces` VALUES ('320312', '江苏省', '徐州市', '320300', '铜山', '320312', '117.183894', '34.19288');
INSERT INTO `provinces` VALUES ('320321', '江苏省', '徐州市', '320300', '丰县', '320321', '116.592888', '34.696946');
INSERT INTO `provinces` VALUES ('320322', '江苏省', '徐州市', '320300', '沛县', '320322', '116.937182', '34.729044');
INSERT INTO `provinces` VALUES ('320324', '江苏省', '徐州市', '320300', '睢宁', '320324', '117.95066', '33.899222');
INSERT INTO `provinces` VALUES ('320381', '江苏省', '徐州市', '320300', '新沂', '320381', '118.345828', '34.368779');
INSERT INTO `provinces` VALUES ('320382', '江苏省', '徐州市', '320300', '邳州', '320382', '117.963923', '34.314708');
INSERT INTO `provinces` VALUES ('320400', '江苏省', '常州市', '320400', '常州', '320400', '119.946973', '31.772752');
INSERT INTO `provinces` VALUES ('320402', '江苏省', '常州市', '320400', '天宁', '320402', '119.963783', '31.779632');
INSERT INTO `provinces` VALUES ('320404', '江苏省', '常州市', '320400', '钟楼', '320404', '119.948388', '31.78096');
INSERT INTO `provinces` VALUES ('320411', '江苏省', '常州市', '320400', '新北区', '320411', '119.974654', '31.824664');
INSERT INTO `provinces` VALUES ('320412', '江苏省', '常州市', '320400', '武进', '320412', '119.958773', '31.718566');
INSERT INTO `provinces` VALUES ('320413', '江苏省', '常州市', '320400', '金坛', '320413', '119.573395', '31.744399');
INSERT INTO `provinces` VALUES ('320481', '江苏省', '常州市', '320400', '溧阳', '320481', '119.487816', '31.427081');
INSERT INTO `provinces` VALUES ('320500', '江苏省', '苏州市', '320500', '苏州', '320500', '120.619585', '31.299379');
INSERT INTO `provinces` VALUES ('320505', '江苏省', '苏州市', '320500', '虎丘', '320505', '120.566833', '31.294845');
INSERT INTO `provinces` VALUES ('320506', '江苏省', '苏州市', '320500', '吴中', '320506', '120.624621', '31.270839');
INSERT INTO `provinces` VALUES ('320507', '江苏省', '苏州市', '320500', '相城', '320507', '120.618956', '31.396684');
INSERT INTO `provinces` VALUES ('320508', '江苏省', '苏州市', '320500', '姑苏', '320508', '120.622249', '31.311414');
INSERT INTO `provinces` VALUES ('320509', '江苏省', '苏州市', '320500', '吴江', '320509', '120.641601', '31.160404');
INSERT INTO `provinces` VALUES ('320571', '江苏省', '苏州市', '320500', '苏州工业园区', '320571', '120.72989', '31.33044');
INSERT INTO `provinces` VALUES ('320581', '江苏省', '苏州市', '320500', '常熟', '320581', '120.74852', '31.658156');
INSERT INTO `provinces` VALUES ('320582', '江苏省', '苏州市', '320500', '张家港', '320582', '120.543441', '31.865553');
INSERT INTO `provinces` VALUES ('320583', '江苏省', '苏州市', '320500', '昆山', '320583', '120.958137', '31.381925');
INSERT INTO `provinces` VALUES ('320585', '江苏省', '苏州市', '320500', '太仓', '320585', '121.112275', '31.452568');
INSERT INTO `provinces` VALUES ('320600', '江苏省', '南通市', '320600', '南通', '320600', '120.864608', '32.016212');
INSERT INTO `provinces` VALUES ('320602', '江苏省', '南通市', '320600', '崇川', '320602', '120.86635', '32.015278');
INSERT INTO `provinces` VALUES ('320611', '江苏省', '南通市', '320600', '港闸', '320611', '120.8339', '32.040299');
INSERT INTO `provinces` VALUES ('320612', '江苏省', '南通市', '320600', '通州区', '320612', '121.073171', '32.084287');
INSERT INTO `provinces` VALUES ('320623', '江苏省', '南通市', '320600', '如东', '320623', '121.186088', '32.311832');
INSERT INTO `provinces` VALUES ('320681', '江苏省', '南通市', '320600', '启东', '320681', '121.659724', '31.810158');
INSERT INTO `provinces` VALUES ('320682', '江苏省', '南通市', '320600', '如皋', '320682', '120.566324', '32.391591');
INSERT INTO `provinces` VALUES ('320684', '江苏省', '南通市', '320600', '海门', '320684', '121.176609', '31.893528');
INSERT INTO `provinces` VALUES ('320685', '江苏省', '南通市', '320600', '海安', '320685', '120.465995', '32.540289');
INSERT INTO `provinces` VALUES ('320700', '江苏省', '连云港市', '320700', '连云港', '320700', '119.178821', '34.600018');
INSERT INTO `provinces` VALUES ('320703', '江苏省', '连云港市', '320700', '连云', '320703', '119.347378', '34.763261');
INSERT INTO `provinces` VALUES ('320706', '江苏省', '连云港市', '320700', '海州', '320706', '119.179793', '34.601584');
INSERT INTO `provinces` VALUES ('320707', '江苏省', '连云港市', '320700', '赣榆', '320707', '119.128774', '34.839154');
INSERT INTO `provinces` VALUES ('320722', '江苏省', '连云港市', '320700', '东海', '320722', '118.766489', '34.522859');
INSERT INTO `provinces` VALUES ('320723', '江苏省', '连云港市', '320700', '灌云', '320723', '119.255741', '34.298436');
INSERT INTO `provinces` VALUES ('320724', '江苏省', '连云港市', '320700', '灌南', '320724', '119.352331', '34.092553');
INSERT INTO `provinces` VALUES ('320800', '江苏省', '淮安市', '320800', '淮安', '320800', '119.021265', '33.597506');
INSERT INTO `provinces` VALUES ('320803', '江苏省', '淮安市', '320800', '淮安区', '320803', '119.14634', '33.507499');
INSERT INTO `provinces` VALUES ('320804', '江苏省', '淮安市', '320800', '淮阴', '320804', '119.020817', '33.622452');
INSERT INTO `provinces` VALUES ('320812', '江苏省', '淮安市', '320800', '清江浦', '320812', '119.029713', '33.552726');
INSERT INTO `provinces` VALUES ('320813', '江苏省', '淮安市', '320800', '洪泽', '320813', '118.867875', '33.294975');
INSERT INTO `provinces` VALUES ('320826', '江苏省', '淮安市', '320800', '涟水', '320826', '119.266078', '33.771308');
INSERT INTO `provinces` VALUES ('320830', '江苏省', '淮安市', '320800', '盱眙', '320830', '118.493823', '33.00439');
INSERT INTO `provinces` VALUES ('320831', '江苏省', '淮安市', '320800', '金湖', '320831', '119.016936', '33.018162');
INSERT INTO `provinces` VALUES ('320900', '江苏省', '盐城市', '320900', '盐城', '320900', '120.139998', '33.377631');
INSERT INTO `provinces` VALUES ('320902', '江苏省', '盐城市', '320900', '亭湖', '320902', '120.136078', '33.383912');
INSERT INTO `provinces` VALUES ('320903', '江苏省', '盐城市', '320900', '盐都', '320903', '120.139753', '33.341288');
INSERT INTO `provinces` VALUES ('320904', '江苏省', '盐城市', '320900', '大丰', '320904', '120.470324', '33.199531');
INSERT INTO `provinces` VALUES ('320921', '江苏省', '盐城市', '320900', '响水', '320921', '119.579573', '34.19996');
INSERT INTO `provinces` VALUES ('320922', '江苏省', '盐城市', '320900', '滨海', '320922', '119.828434', '33.989888');
INSERT INTO `provinces` VALUES ('320923', '江苏省', '盐城市', '320900', '阜宁', '320923', '119.805338', '33.78573');
INSERT INTO `provinces` VALUES ('320924', '江苏省', '盐城市', '320900', '射阳', '320924', '120.257444', '33.773779');
INSERT INTO `provinces` VALUES ('320925', '江苏省', '盐城市', '320900', '建湖', '320925', '119.793105', '33.472621');
INSERT INTO `provinces` VALUES ('320981', '江苏省', '盐城市', '320900', '东台', '320981', '120.314101', '32.853174');
INSERT INTO `provinces` VALUES ('321000', '江苏省', '扬州市', '321000', '扬州', '321000', '119.421003', '32.393159');
INSERT INTO `provinces` VALUES ('321002', '江苏省', '扬州市', '321000', '广陵', '321002', '119.442267', '32.392154');
INSERT INTO `provinces` VALUES ('321003', '江苏省', '扬州市', '321000', '邗江', '321003', '119.397777', '32.377899');
INSERT INTO `provinces` VALUES ('321012', '江苏省', '扬州市', '321000', '江都', '321012', '119.567481', '32.426564');
INSERT INTO `provinces` VALUES ('321023', '江苏省', '扬州市', '321000', '宝应', '321023', '119.321284', '33.23694');
INSERT INTO `provinces` VALUES ('321081', '江苏省', '扬州市', '321000', '仪征', '321081', '119.182443', '32.271965');
INSERT INTO `provinces` VALUES ('321084', '江苏省', '扬州市', '321000', '高邮', '321084', '119.443842', '32.785164');
INSERT INTO `provinces` VALUES ('321100', '江苏省', '镇江市', '321100', '镇江', '321100', '119.452753', '32.204402');
INSERT INTO `provinces` VALUES ('321102', '江苏省', '镇江市', '321100', '京口', '321102', '119.454571', '32.206191');
INSERT INTO `provinces` VALUES ('321111', '江苏省', '镇江市', '321100', '润州', '321111', '119.414877', '32.213501');
INSERT INTO `provinces` VALUES ('321112', '江苏省', '镇江市', '321100', '丹徒', '321112', '119.433883', '32.128972');
INSERT INTO `provinces` VALUES ('321181', '江苏省', '镇江市', '321100', '丹阳', '321181', '119.581911', '31.991459');
INSERT INTO `provinces` VALUES ('321182', '江苏省', '镇江市', '321100', '扬中', '321182', '119.828054', '32.237266');
INSERT INTO `provinces` VALUES ('321183', '江苏省', '镇江市', '321100', '句容', '321183', '119.167135', '31.947355');
INSERT INTO `provinces` VALUES ('321200', '江苏省', '泰州市', '321200', '泰州', '321200', '119.915176', '32.484882');
INSERT INTO `provinces` VALUES ('321202', '江苏省', '泰州市', '321200', '海陵', '321202', '119.920187', '32.488406');
INSERT INTO `provinces` VALUES ('321203', '江苏省', '泰州市', '321200', '高港', '321203', '119.88166', '32.315701');
INSERT INTO `provinces` VALUES ('321204', '江苏省', '泰州市', '321200', '姜堰', '321204', '120.148208', '32.508483');
INSERT INTO `provinces` VALUES ('321281', '江苏省', '泰州市', '321200', '兴化', '321281', '119.840162', '32.938065');
INSERT INTO `provinces` VALUES ('321282', '江苏省', '泰州市', '321200', '靖江', '321282', '120.26825', '32.018168');
INSERT INTO `provinces` VALUES ('321283', '江苏省', '泰州市', '321200', '泰兴', '321283', '120.020228', '32.168784');
INSERT INTO `provinces` VALUES ('321300', '江苏省', '宿迁市', '321300', '宿迁', '321300', '118.275162', '33.963008');
INSERT INTO `provinces` VALUES ('321302', '江苏省', '宿迁市', '321300', '宿城', '321302', '118.278984', '33.937726');
INSERT INTO `provinces` VALUES ('321311', '江苏省', '宿迁市', '321300', '宿豫', '321311', '118.330012', '33.941071');
INSERT INTO `provinces` VALUES ('321322', '江苏省', '宿迁市', '321300', '沭阳', '321322', '118.775889', '34.129097');
INSERT INTO `provinces` VALUES ('321323', '江苏省', '宿迁市', '321300', '泗阳', '321323', '118.681284', '33.711433');
INSERT INTO `provinces` VALUES ('321324', '江苏省', '宿迁市', '321300', '泗洪', '321324', '118.211824', '33.456538');
INSERT INTO `provinces` VALUES ('330100', '浙江省', '杭州市', '330100', '杭州', '330100', '120.153576', '30.287459');
INSERT INTO `provinces` VALUES ('330102', '浙江省', '杭州市', '330100', '上城区', '330102', '120.171465', '30.250236');
INSERT INTO `provinces` VALUES ('330103', '浙江省', '杭州市', '330100', '下城区', '330103', '120.172763', '30.276271');
INSERT INTO `provinces` VALUES ('330104', '浙江省', '杭州市', '330100', '江干', '330104', '120.202633', '30.266603');
INSERT INTO `provinces` VALUES ('330105', '浙江省', '杭州市', '330100', '拱墅', '330105', '120.150053', '30.314697');
INSERT INTO `provinces` VALUES ('330106', '浙江省', '杭州市', '330100', '西湖', '330106', '120.147376', '30.272934');
INSERT INTO `provinces` VALUES ('330108', '浙江省', '杭州市', '330100', '滨江', '330108', '120.21062', '30.206615');
INSERT INTO `provinces` VALUES ('330109', '浙江省', '杭州市', '330100', '萧山', '330109', '120.27069', '30.162932');
INSERT INTO `provinces` VALUES ('330110', '浙江省', '杭州市', '330100', '余杭', '330110', '120.301737', '30.421187');
INSERT INTO `provinces` VALUES ('330111', '浙江省', '杭州市', '330100', '富阳', '330111', '119.949869', '30.049871');
INSERT INTO `provinces` VALUES ('330112', '浙江省', '杭州市', '330100', '临安', '330112', '119.715101', '30.231153');
INSERT INTO `provinces` VALUES ('330122', '浙江省', '杭州市', '330100', '桐庐', '330122', '119.685045', '29.797437');
INSERT INTO `provinces` VALUES ('330127', '浙江省', '杭州市', '330100', '淳安', '330127', '119.044276', '29.604177');
INSERT INTO `provinces` VALUES ('330182', '浙江省', '杭州市', '330100', '建德', '330182', '119.279089', '29.472284');
INSERT INTO `provinces` VALUES ('330200', '浙江省', '宁波市', '330200', '宁波', '330200', '121.549792', '29.868388');
INSERT INTO `provinces` VALUES ('330203', '浙江省', '宁波市', '330200', '海曙', '330203', '121.539698', '29.874452');
INSERT INTO `provinces` VALUES ('330205', '浙江省', '宁波市', '330200', '江北区', '330205', '121.559282', '29.888361');
INSERT INTO `provinces` VALUES ('330206', '浙江省', '宁波市', '330200', '北仑', '330206', '121.831303', '29.90944');
INSERT INTO `provinces` VALUES ('330211', '浙江省', '宁波市', '330200', '镇海', '330211', '121.713162', '29.952107');
INSERT INTO `provinces` VALUES ('330212', '浙江省', '宁波市', '330200', '鄞州', '330212', '121.558436', '29.831662');
INSERT INTO `provinces` VALUES ('330213', '浙江省', '宁波市', '330200', '奉化', '330213', '121.41089', '29.662348');
INSERT INTO `provinces` VALUES ('330225', '浙江省', '宁波市', '330200', '象山', '330225', '121.877091', '29.470206');
INSERT INTO `provinces` VALUES ('330226', '浙江省', '宁波市', '330200', '宁海', '330226', '121.432606', '29.299836');
INSERT INTO `provinces` VALUES ('330281', '浙江省', '宁波市', '330200', '余姚', '330281', '121.156294', '30.045404');
INSERT INTO `provinces` VALUES ('330282', '浙江省', '宁波市', '330200', '慈溪', '330282', '121.248052', '30.177142');
INSERT INTO `provinces` VALUES ('330300', '浙江省', '温州市', '330300', '温州', '330300', '120.672111', '28.000575');
INSERT INTO `provinces` VALUES ('330302', '浙江省', '温州市', '330300', '鹿城', '330302', '120.674231', '28.003352');
INSERT INTO `provinces` VALUES ('330303', '浙江省', '温州市', '330300', '龙湾', '330303', '120.763469', '27.970254');
INSERT INTO `provinces` VALUES ('330304', '浙江省', '温州市', '330300', '瓯海', '330304', '120.637145', '28.006444');
INSERT INTO `provinces` VALUES ('330305', '浙江省', '温州市', '330300', '洞头', '330305', '121.156181', '27.836057');
INSERT INTO `provinces` VALUES ('330324', '浙江省', '温州市', '330300', '永嘉', '330324', '120.690968', '28.153886');
INSERT INTO `provinces` VALUES ('330326', '浙江省', '温州市', '330300', '平阳', '330326', '120.564387', '27.6693');
INSERT INTO `provinces` VALUES ('330327', '浙江省', '温州市', '330300', '苍南', '330327', '120.406256', '27.507743');
INSERT INTO `provinces` VALUES ('330328', '浙江省', '温州市', '330300', '文成', '330328', '120.09245', '27.789133');
INSERT INTO `provinces` VALUES ('330329', '浙江省', '温州市', '330300', '泰顺', '330329', '119.71624', '27.557309');
INSERT INTO `provinces` VALUES ('330381', '浙江省', '温州市', '330300', '瑞安', '330381', '120.646171', '27.779321');
INSERT INTO `provinces` VALUES ('330382', '浙江省', '温州市', '330300', '乐清', '330382', '120.967147', '28.116083');
INSERT INTO `provinces` VALUES ('330400', '浙江省', '嘉兴市', '330400', '嘉兴', '330400', '120.750865', '30.762653');
INSERT INTO `provinces` VALUES ('330402', '浙江省', '嘉兴市', '330400', '南湖', '330402', '120.749953', '30.764652');
INSERT INTO `provinces` VALUES ('330411', '浙江省', '嘉兴市', '330400', '秀洲', '330411', '120.720431', '30.763323');
INSERT INTO `provinces` VALUES ('330421', '浙江省', '嘉兴市', '330400', '嘉善', '330421', '120.921871', '30.841352');
INSERT INTO `provinces` VALUES ('330424', '浙江省', '嘉兴市', '330400', '海盐', '330424', '120.942017', '30.522223');
INSERT INTO `provinces` VALUES ('330481', '浙江省', '嘉兴市', '330400', '海宁', '330481', '120.688821', '30.525544');
INSERT INTO `provinces` VALUES ('330482', '浙江省', '嘉兴市', '330400', '平湖', '330482', '121.014666', '30.698921');
INSERT INTO `provinces` VALUES ('330483', '浙江省', '嘉兴市', '330400', '桐乡', '330483', '120.551085', '30.629065');
INSERT INTO `provinces` VALUES ('330500', '浙江省', '湖州市', '330500', '湖州', '330500', '120.102398', '30.867198');
INSERT INTO `provinces` VALUES ('330502', '浙江省', '湖州市', '330500', '吴兴', '330502', '120.101416', '30.867252');
INSERT INTO `provinces` VALUES ('330503', '浙江省', '湖州市', '330500', '南浔', '330503', '120.417195', '30.872742');
INSERT INTO `provinces` VALUES ('330521', '浙江省', '湖州市', '330500', '德清', '330521', '119.967662', '30.534927');
INSERT INTO `provinces` VALUES ('330522', '浙江省', '湖州市', '330500', '长兴', '330522', '119.910122', '31.00475');
INSERT INTO `provinces` VALUES ('330523', '浙江省', '湖州市', '330500', '安吉', '330523', '119.687891', '30.631974');
INSERT INTO `provinces` VALUES ('330600', '浙江省', '绍兴市', '330600', '绍兴', '330600', '120.582112', '29.997117');
INSERT INTO `provinces` VALUES ('330602', '浙江省', '绍兴市', '330600', '越城', '330602', '120.585315', '29.996993');
INSERT INTO `provinces` VALUES ('330603', '浙江省', '绍兴市', '330600', '柯桥', '330603', '120.476075', '30.078038');
INSERT INTO `provinces` VALUES ('330604', '浙江省', '绍兴市', '330600', '上虞', '330604', '120.874185', '30.016769');
INSERT INTO `provinces` VALUES ('330624', '浙江省', '绍兴市', '330600', '新昌', '330624', '120.905665', '29.501205');
INSERT INTO `provinces` VALUES ('330681', '浙江省', '绍兴市', '330600', '诸暨', '330681', '120.244326', '29.713662');
INSERT INTO `provinces` VALUES ('330683', '浙江省', '绍兴市', '330600', '嵊州', '330683', '120.82888', '29.586606');
INSERT INTO `provinces` VALUES ('330700', '浙江省', '金华市', '330700', '金华', '330700', '119.649506', '29.089524');
INSERT INTO `provinces` VALUES ('330702', '浙江省', '金华市', '330700', '婺城', '330702', '119.652579', '29.082607');
INSERT INTO `provinces` VALUES ('330703', '浙江省', '金华市', '330700', '金东', '330703', '119.681264', '29.095835');
INSERT INTO `provinces` VALUES ('330723', '浙江省', '金华市', '330700', '武义', '330723', '119.819159', '28.896563');
INSERT INTO `provinces` VALUES ('330726', '浙江省', '金华市', '330700', '浦江', '330726', '119.893363', '29.451254');
INSERT INTO `provinces` VALUES ('330727', '浙江省', '金华市', '330700', '磐安', '330727', '120.44513', '29.052627');
INSERT INTO `provinces` VALUES ('330781', '浙江省', '金华市', '330700', '兰溪', '330781', '119.460521', '29.210065');
INSERT INTO `provinces` VALUES ('330782', '浙江省', '金华市', '330700', '义乌', '330782', '120.074911', '29.306863');
INSERT INTO `provinces` VALUES ('330783', '浙江省', '金华市', '330700', '东阳', '330783', '120.23334', '29.262546');
INSERT INTO `provinces` VALUES ('330784', '浙江省', '金华市', '330700', '永康', '330784', '120.036328', '28.895293');
INSERT INTO `provinces` VALUES ('330800', '浙江省', '衢州市', '330800', '衢州', '330800', '118.87263', '28.941708');
INSERT INTO `provinces` VALUES ('330802', '浙江省', '衢州市', '330800', '柯城', '330802', '118.873041', '28.944539');
INSERT INTO `provinces` VALUES ('330803', '浙江省', '衢州市', '330800', '衢江', '330803', '118.957683', '28.973195');
INSERT INTO `provinces` VALUES ('330822', '浙江省', '衢州市', '330800', '常山', '330822', '118.521654', '28.900039');
INSERT INTO `provinces` VALUES ('330824', '浙江省', '衢州市', '330800', '开化', '330824', '118.414435', '29.136503');
INSERT INTO `provinces` VALUES ('330825', '浙江省', '衢州市', '330800', '龙游', '330825', '119.172525', '29.031364');
INSERT INTO `provinces` VALUES ('330881', '浙江省', '衢州市', '330800', '江山', '330881', '118.627879', '28.734674');
INSERT INTO `provinces` VALUES ('330900', '浙江省', '舟山市', '330900', '舟山', '330900', '122.106863', '30.016028');
INSERT INTO `provinces` VALUES ('330902', '浙江省', '舟山市', '330900', '定海', '330902', '122.108496', '30.016423');
INSERT INTO `provinces` VALUES ('330903', '浙江省', '舟山市', '330900', '普陀', '330903', '122.301953', '29.945614');
INSERT INTO `provinces` VALUES ('330921', '浙江省', '舟山市', '330900', '岱山', '330921', '122.201132', '30.242865');
INSERT INTO `provinces` VALUES ('330922', '浙江省', '舟山市', '330900', '嵊泗', '330922', '122.457809', '30.727166');
INSERT INTO `provinces` VALUES ('331000', '浙江省', '台州市', '331000', '台州', '331000', '121.428599', '28.661378');
INSERT INTO `provinces` VALUES ('331002', '浙江省', '台州市', '331000', '椒江', '331002', '121.431049', '28.67615');
INSERT INTO `provinces` VALUES ('331003', '浙江省', '台州市', '331000', '黄岩', '331003', '121.262138', '28.64488');
INSERT INTO `provinces` VALUES ('331004', '浙江省', '台州市', '331000', '路桥', '331004', '121.37292', '28.581799');
INSERT INTO `provinces` VALUES ('331022', '浙江省', '台州市', '331000', '三门', '331022', '121.376429', '29.118955');
INSERT INTO `provinces` VALUES ('331023', '浙江省', '台州市', '331000', '天台', '331023', '121.031227', '29.141126');
INSERT INTO `provinces` VALUES ('331024', '浙江省', '台州市', '331000', '仙居', '331024', '120.735074', '28.849213');
INSERT INTO `provinces` VALUES ('331081', '浙江省', '台州市', '331000', '温岭', '331081', '121.373611', '28.368781');
INSERT INTO `provinces` VALUES ('331082', '浙江省', '台州市', '331000', '临海', '331082', '121.131229', '28.845441');
INSERT INTO `provinces` VALUES ('331083', '浙江省', '台州市', '331000', '玉环', '331083', '121.232337', '28.12842');
INSERT INTO `provinces` VALUES ('331100', '浙江省', '丽水市', '331100', '丽水', '331100', '119.921786', '28.451993');
INSERT INTO `provinces` VALUES ('331102', '浙江省', '丽水市', '331100', '莲都', '331102', '119.922293', '28.451103');
INSERT INTO `provinces` VALUES ('331121', '浙江省', '丽水市', '331100', '青田', '331121', '120.291939', '28.135247');
INSERT INTO `provinces` VALUES ('331122', '浙江省', '丽水市', '331100', '缙云', '331122', '120.078965', '28.654208');
INSERT INTO `provinces` VALUES ('331123', '浙江省', '丽水市', '331100', '遂昌', '331123', '119.27589', '28.5924');
INSERT INTO `provinces` VALUES ('331124', '浙江省', '丽水市', '331100', '松阳', '331124', '119.485292', '28.449937');
INSERT INTO `provinces` VALUES ('331125', '浙江省', '丽水市', '331100', '云和', '331125', '119.569458', '28.111077');
INSERT INTO `provinces` VALUES ('331126', '浙江省', '丽水市', '331100', '庆元', '331126', '119.067233', '27.618231');
INSERT INTO `provinces` VALUES ('331127', '浙江省', '丽水市', '331100', '景宁', '331127', '119.634669', '27.977247');
INSERT INTO `provinces` VALUES ('331181', '浙江省', '丽水市', '331100', '龙泉', '331181', '119.132319', '28.069177');
INSERT INTO `provinces` VALUES ('340100', '安徽省', '合肥市', '340100', '合肥', '340100', '117.283042', '31.86119');
INSERT INTO `provinces` VALUES ('340102', '安徽省', '合肥市', '340100', '瑶海', '340102', '117.315358', '31.86961');
INSERT INTO `provinces` VALUES ('340103', '安徽省', '合肥市', '340100', '庐阳', '340103', '117.283776', '31.869011');
INSERT INTO `provinces` VALUES ('340104', '安徽省', '合肥市', '340100', '蜀山', '340104', '117.262072', '31.855868');
INSERT INTO `provinces` VALUES ('340111', '安徽省', '合肥市', '340100', '包河', '340111', '117.285751', '31.82956');
INSERT INTO `provinces` VALUES ('340121', '安徽省', '合肥市', '340100', '长丰', '340121', '117.164699', '32.478548');
INSERT INTO `provinces` VALUES ('340122', '安徽省', '合肥市', '340100', '肥东', '340122', '117.463222', '31.883992');
INSERT INTO `provinces` VALUES ('340123', '安徽省', '合肥市', '340100', '肥西', '340123', '117.166118', '31.719646');
INSERT INTO `provinces` VALUES ('340124', '安徽省', '合肥市', '340100', '庐江', '340124', '117.289844', '31.251488');
INSERT INTO `provinces` VALUES ('340181', '安徽省', '合肥市', '340100', '巢湖', '340181', '117.874155', '31.600518');
INSERT INTO `provinces` VALUES ('340200', '安徽省', '芜湖市', '340200', '芜湖', '340200', '118.376451', '31.326319');
INSERT INTO `provinces` VALUES ('340202', '安徽省', '芜湖市', '340200', '镜湖', '340202', '118.376343', '31.32559');
INSERT INTO `provinces` VALUES ('340203', '安徽省', '芜湖市', '340200', '弋江', '340203', '118.377476', '31.313394');
INSERT INTO `provinces` VALUES ('340207', '安徽省', '芜湖市', '340200', '鸠江', '340207', '118.400174', '31.362716');
INSERT INTO `provinces` VALUES ('340208', '安徽省', '芜湖市', '340200', '三山', '340208', '118.233987', '31.225423');
INSERT INTO `provinces` VALUES ('340221', '安徽省', '芜湖市', '340200', '芜湖县', '340221', '118.572301', '31.145262');
INSERT INTO `provinces` VALUES ('340222', '安徽省', '芜湖市', '340200', '繁昌', '340222', '118.201349', '31.080896');
INSERT INTO `provinces` VALUES ('340223', '安徽省', '芜湖市', '340200', '南陵', '340223', '118.337104', '30.919638');
INSERT INTO `provinces` VALUES ('340225', '安徽省', '芜湖市', '340200', '无为', '340225', '117.911432', '31.303075');
INSERT INTO `provinces` VALUES ('340300', '安徽省', '蚌埠市', '340300', '蚌埠', '340300', '117.363228', '32.939667');
INSERT INTO `provinces` VALUES ('340302', '安徽省', '蚌埠市', '340300', '龙子湖', '340302', '117.382312', '32.950452');
INSERT INTO `provinces` VALUES ('340303', '安徽省', '蚌埠市', '340300', '蚌山', '340303', '117.355789', '32.938066');
INSERT INTO `provinces` VALUES ('340304', '安徽省', '蚌埠市', '340300', '禹会', '340304', '117.35259', '32.931933');
INSERT INTO `provinces` VALUES ('340311', '安徽省', '蚌埠市', '340300', '淮上', '340311', '117.34709', '32.963147');
INSERT INTO `provinces` VALUES ('340321', '安徽省', '蚌埠市', '340300', '怀远', '340321', '117.200171', '32.956934');
INSERT INTO `provinces` VALUES ('340322', '安徽省', '蚌埠市', '340300', '五河', '340322', '117.888809', '33.146202');
INSERT INTO `provinces` VALUES ('340323', '安徽省', '蚌埠市', '340300', '固镇', '340323', '117.315962', '33.318679');
INSERT INTO `provinces` VALUES ('340400', '安徽省', '淮南市', '340400', '淮南', '340400', '117.018329', '32.647574');
INSERT INTO `provinces` VALUES ('340402', '安徽省', '淮南市', '340400', '大通区', '340402', '117.052927', '32.632066');
INSERT INTO `provinces` VALUES ('340403', '安徽省', '淮南市', '340400', '田家庵', '340403', '117.018318', '32.644342');
INSERT INTO `provinces` VALUES ('340404', '安徽省', '淮南市', '340400', '谢家集', '340404', '116.865354', '32.598289');
INSERT INTO `provinces` VALUES ('340405', '安徽省', '淮南市', '340400', '八公山', '340405', '116.841111', '32.628229');
INSERT INTO `provinces` VALUES ('340406', '安徽省', '淮南市', '340400', '潘集', '340406', '116.816879', '32.782117');
INSERT INTO `provinces` VALUES ('340421', '安徽省', '淮南市', '340400', '凤台', '340421', '116.722769', '32.705382');
INSERT INTO `provinces` VALUES ('340422', '安徽省', '淮南市', '340400', '寿县', '340422', '116.785349', '32.577304');
INSERT INTO `provinces` VALUES ('340500', '安徽省', '马鞍山市', '340500', '马鞍山', '340500', '118.507906', '31.689362');
INSERT INTO `provinces` VALUES ('340503', '安徽省', '马鞍山市', '340500', '花山', '340503', '118.511308', '31.69902');
INSERT INTO `provinces` VALUES ('340504', '安徽省', '马鞍山市', '340500', '雨山', '340504', '118.493104', '31.685912');
INSERT INTO `provinces` VALUES ('340506', '安徽省', '马鞍山市', '340500', '博望', '340506', '118.843742', '31.562321');
INSERT INTO `provinces` VALUES ('340521', '安徽省', '马鞍山市', '340500', '当涂', '340521', '118.489873', '31.556167');
INSERT INTO `provinces` VALUES ('340522', '安徽省', '马鞍山市', '340500', '含山', '340522', '118.105545', '31.727758');
INSERT INTO `provinces` VALUES ('340523', '安徽省', '马鞍山市', '340500', '和县', '340523', '118.362998', '31.716634');
INSERT INTO `provinces` VALUES ('340600', '安徽省', '淮北市', '340600', '淮北', '340600', '116.794664', '33.971707');
INSERT INTO `provinces` VALUES ('340602', '安徽省', '淮北市', '340600', '杜集', '340602', '116.833925', '33.991218');
INSERT INTO `provinces` VALUES ('340603', '安徽省', '淮北市', '340600', '相山', '340603', '116.790775', '33.970916');
INSERT INTO `provinces` VALUES ('340604', '安徽省', '淮北市', '340600', '烈山', '340604', '116.809465', '33.889529');
INSERT INTO `provinces` VALUES ('340621', '安徽省', '淮北市', '340600', '濉溪', '340621', '116.767435', '33.916407');
INSERT INTO `provinces` VALUES ('340700', '安徽省', '铜陵市', '340700', '铜陵', '340700', '117.816576', '30.929935');
INSERT INTO `provinces` VALUES ('340705', '安徽省', '铜陵市', '340700', '铜官', '340705', '117.818427', '30.93182');
INSERT INTO `provinces` VALUES ('340706', '安徽省', '铜陵市', '340700', '义安', '340706', '117.792288', '30.952338');
INSERT INTO `provinces` VALUES ('340711', '安徽省', '铜陵市', '340700', '郊区', '340711', '117.80707', '30.908927');
INSERT INTO `provinces` VALUES ('340722', '安徽省', '铜陵市', '340700', '枞阳', '340722', '117.222027', '30.700615');
INSERT INTO `provinces` VALUES ('340800', '安徽省', '安庆市', '340800', '安庆', '340800', '117.043551', '30.50883');
INSERT INTO `provinces` VALUES ('340802', '安徽省', '安庆市', '340800', '迎江', '340802', '117.044965', '30.506375');
INSERT INTO `provinces` VALUES ('340803', '安徽省', '安庆市', '340800', '大观', '340803', '117.034512', '30.505632');
INSERT INTO `provinces` VALUES ('340811', '安徽省', '安庆市', '340800', '宜秀', '340811', '117.070003', '30.541323');
INSERT INTO `provinces` VALUES ('340822', '安徽省', '安庆市', '340800', '怀宁', '340822', '116.828664', '30.734994');
INSERT INTO `provinces` VALUES ('340825', '安徽省', '安庆市', '340800', '太湖', '340825', '116.305225', '30.451869');
INSERT INTO `provinces` VALUES ('340826', '安徽省', '安庆市', '340800', '宿松', '340826', '116.120204', '30.158327');
INSERT INTO `provinces` VALUES ('340827', '安徽省', '安庆市', '340800', '望江', '340827', '116.690927', '30.12491');
INSERT INTO `provinces` VALUES ('340828', '安徽省', '安庆市', '340800', '岳西', '340828', '116.360482', '30.848502');
INSERT INTO `provinces` VALUES ('340881', '安徽省', '安庆市', '340800', '桐城', '340881', '116.959656', '31.050576');
INSERT INTO `provinces` VALUES ('340882', '安徽省', '安庆市', '340800', '潜山', '340882', '116.573666', '30.638222');
INSERT INTO `provinces` VALUES ('341000', '安徽省', '黄山市', '341000', '黄山', '341000', '118.317325', '29.709239');
INSERT INTO `provinces` VALUES ('341002', '安徽省', '黄山市', '341000', '屯溪', '341002', '118.317354', '29.709186');
INSERT INTO `provinces` VALUES ('341003', '安徽省', '黄山市', '341000', '黄山区', '341003', '118.136639', '30.294517');
INSERT INTO `provinces` VALUES ('341004', '安徽省', '黄山市', '341000', '徽州', '341004', '118.339743', '29.825201');
INSERT INTO `provinces` VALUES ('341021', '安徽省', '黄山市', '341000', '歙县', '341021', '118.428025', '29.867748');
INSERT INTO `provinces` VALUES ('341022', '安徽省', '黄山市', '341000', '休宁', '341022', '118.188531', '29.788878');
INSERT INTO `provinces` VALUES ('341023', '安徽省', '黄山市', '341000', '黟县', '341023', '117.942911', '29.923812');
INSERT INTO `provinces` VALUES ('341024', '安徽省', '黄山市', '341000', '祁门', '341024', '117.717237', '29.853472');
INSERT INTO `provinces` VALUES ('341100', '安徽省', '滁州市', '341100', '滁州', '341100', '118.316264', '32.303627');
INSERT INTO `provinces` VALUES ('341102', '安徽省', '滁州市', '341100', '琅琊', '341102', '118.316475', '32.303797');
INSERT INTO `provinces` VALUES ('341103', '安徽省', '滁州市', '341100', '南谯', '341103', '118.296955', '32.329841');
INSERT INTO `provinces` VALUES ('341122', '安徽省', '滁州市', '341100', '来安', '341122', '118.433293', '32.450231');
INSERT INTO `provinces` VALUES ('341124', '安徽省', '滁州市', '341100', '全椒', '341124', '118.268576', '32.09385');
INSERT INTO `provinces` VALUES ('341125', '安徽省', '滁州市', '341100', '定远', '341125', '117.683713', '32.527105');
INSERT INTO `provinces` VALUES ('341126', '安徽省', '滁州市', '341100', '凤阳', '341126', '117.562461', '32.867146');
INSERT INTO `provinces` VALUES ('341181', '安徽省', '滁州市', '341100', '天长', '341181', '119.011212', '32.6815');
INSERT INTO `provinces` VALUES ('341182', '安徽省', '滁州市', '341100', '明光', '341182', '117.998048', '32.781206');
INSERT INTO `provinces` VALUES ('341200', '安徽省', '阜阳市', '341200', '阜阳', '341200', '115.819729', '32.896969');
INSERT INTO `provinces` VALUES ('341202', '安徽省', '阜阳市', '341200', '颍州', '341202', '115.813914', '32.891238');
INSERT INTO `provinces` VALUES ('341203', '安徽省', '阜阳市', '341200', '颍东', '341203', '115.858747', '32.908861');
INSERT INTO `provinces` VALUES ('341204', '安徽省', '阜阳市', '341200', '颍泉', '341204', '115.804525', '32.924797');
INSERT INTO `provinces` VALUES ('341221', '安徽省', '阜阳市', '341200', '临泉', '341221', '115.261688', '33.062698');
INSERT INTO `provinces` VALUES ('341222', '安徽省', '阜阳市', '341200', '太和', '341222', '115.627243', '33.16229');
INSERT INTO `provinces` VALUES ('341225', '安徽省', '阜阳市', '341200', '阜南', '341225', '115.590534', '32.638102');
INSERT INTO `provinces` VALUES ('341226', '安徽省', '阜阳市', '341200', '颍上', '341226', '116.259122', '32.637065');
INSERT INTO `provinces` VALUES ('341282', '安徽省', '阜阳市', '341200', '界首', '341282', '115.362117', '33.26153');
INSERT INTO `provinces` VALUES ('341300', '安徽省', '宿州市', '341300', '宿州', '341300', '116.984084', '33.633891');
INSERT INTO `provinces` VALUES ('341302', '安徽省', '宿州市', '341300', '埇桥', '341302', '116.983309', '33.633853');
INSERT INTO `provinces` VALUES ('341321', '安徽省', '宿州市', '341300', '砀山', '341321', '116.351113', '34.426247');
INSERT INTO `provinces` VALUES ('341322', '安徽省', '宿州市', '341300', '萧县', '341322', '116.945399', '34.183266');
INSERT INTO `provinces` VALUES ('341323', '安徽省', '宿州市', '341300', '灵璧', '341323', '117.551493', '33.540629');
INSERT INTO `provinces` VALUES ('341324', '安徽省', '宿州市', '341300', '泗县', '341324', '117.885443', '33.47758');
INSERT INTO `provinces` VALUES ('341500', '安徽省', '六安市', '341500', '六安', '341500', '116.507676', '31.752889');
INSERT INTO `provinces` VALUES ('341502', '安徽省', '六安市', '341500', '金安', '341502', '116.503288', '31.754491');
INSERT INTO `provinces` VALUES ('341503', '安徽省', '六安市', '341500', '裕安', '341503', '116.494543', '31.750692');
INSERT INTO `provinces` VALUES ('341504', '安徽省', '六安市', '341500', '叶集', '341504', '115.913594', '31.84768');
INSERT INTO `provinces` VALUES ('341522', '安徽省', '六安市', '341500', '霍邱', '341522', '116.278875', '32.341305');
INSERT INTO `provinces` VALUES ('341523', '安徽省', '六安市', '341500', '舒城', '341523', '116.944088', '31.462848');
INSERT INTO `provinces` VALUES ('341524', '安徽省', '六安市', '341500', '金寨', '341524', '115.878514', '31.681624');
INSERT INTO `provinces` VALUES ('341525', '安徽省', '六安市', '341500', '霍山', '341525', '116.333078', '31.402456');
INSERT INTO `provinces` VALUES ('341600', '安徽省', '亳州市', '341600', '亳州', '341600', '115.782939', '33.869338');
INSERT INTO `provinces` VALUES ('341602', '安徽省', '亳州市', '341600', '谯城', '341602', '115.781214', '33.869284');
INSERT INTO `provinces` VALUES ('341621', '安徽省', '亳州市', '341600', '涡阳', '341621', '116.211551', '33.502831');
INSERT INTO `provinces` VALUES ('341622', '安徽省', '亳州市', '341600', '蒙城', '341622', '116.560337', '33.260814');
INSERT INTO `provinces` VALUES ('341623', '安徽省', '亳州市', '341600', '利辛', '341623', '116.207782', '33.143503');
INSERT INTO `provinces` VALUES ('341700', '安徽省', '池州市', '341700', '池州', '341700', '117.489157', '30.656037');
INSERT INTO `provinces` VALUES ('341702', '安徽省', '池州市', '341700', '贵池', '341702', '117.488342', '30.657378');
INSERT INTO `provinces` VALUES ('341721', '安徽省', '池州市', '341700', '东至', '341721', '117.021476', '30.096568');
INSERT INTO `provinces` VALUES ('341722', '安徽省', '池州市', '341700', '石台', '341722', '117.482907', '30.210324');
INSERT INTO `provinces` VALUES ('341723', '安徽省', '池州市', '341700', '青阳', '341723', '117.857395', '30.63818');
INSERT INTO `provinces` VALUES ('341800', '安徽省', '宣城市', '341800', '宣城', '341800', '118.757995', '30.945667');
INSERT INTO `provinces` VALUES ('341802', '安徽省', '宣城市', '341800', '宣州', '341802', '118.758412', '30.946003');
INSERT INTO `provinces` VALUES ('341821', '安徽省', '宣城市', '341800', '郎溪', '341821', '119.185024', '31.127834');
INSERT INTO `provinces` VALUES ('341822', '安徽省', '宣城市', '341800', '广德', '341822', '119.417521', '30.893116');
INSERT INTO `provinces` VALUES ('341823', '安徽省', '宣城市', '341800', '泾县', '341823', '118.412397', '30.685975');
INSERT INTO `provinces` VALUES ('341824', '安徽省', '宣城市', '341800', '绩溪', '341824', '118.594705', '30.065267');
INSERT INTO `provinces` VALUES ('341825', '安徽省', '宣城市', '341800', '旌德', '341825', '118.543081', '30.288057');
INSERT INTO `provinces` VALUES ('341881', '安徽省', '宣城市', '341800', '宁国', '341881', '118.983407', '30.626529');
INSERT INTO `provinces` VALUES ('350100', '福建省', '福州市', '350100', '福州', '350100', '119.306239', '26.075302');
INSERT INTO `provinces` VALUES ('350102', '福建省', '福州市', '350100', '鼓楼区', '350102', '119.29929', '26.082284');
INSERT INTO `provinces` VALUES ('350103', '福建省', '福州市', '350100', '台江区', '350103', '119.310156', '26.058616');
INSERT INTO `provinces` VALUES ('350104', '福建省', '福州市', '350100', '仓山', '350104', '119.320988', '26.038912');
INSERT INTO `provinces` VALUES ('350105', '福建省', '福州市', '350100', '马尾', '350105', '119.458725', '25.991975');
INSERT INTO `provinces` VALUES ('350111', '福建省', '福州市', '350100', '晋安', '350111', '119.328597', '26.078837');
INSERT INTO `provinces` VALUES ('350112', '福建省', '福州市', '350100', '长乐', '350112', '119.510849', '25.960583');
INSERT INTO `provinces` VALUES ('350121', '福建省', '福州市', '350100', '闽侯', '350121', '119.145117', '26.148567');
INSERT INTO `provinces` VALUES ('350122', '福建省', '福州市', '350100', '连江', '350122', '119.538365', '26.202109');
INSERT INTO `provinces` VALUES ('350123', '福建省', '福州市', '350100', '罗源', '350123', '119.552645', '26.487234');
INSERT INTO `provinces` VALUES ('350124', '福建省', '福州市', '350100', '闽清', '350124', '118.868416', '26.223793');
INSERT INTO `provinces` VALUES ('350125', '福建省', '福州市', '350100', '永泰', '350125', '118.939089', '25.864825');
INSERT INTO `provinces` VALUES ('350128', '福建省', '福州市', '350100', '平潭', '350128', '119.791197', '25.503672');
INSERT INTO `provinces` VALUES ('350181', '福建省', '福州市', '350100', '福清', '350181', '119.376992', '25.720402');
INSERT INTO `provinces` VALUES ('350200', '福建省', '厦门市', '350200', '厦门', '350200', '118.11022', '24.490474');
INSERT INTO `provinces` VALUES ('350203', '福建省', '厦门市', '350200', '思明', '350203', '118.087828', '24.462059');
INSERT INTO `provinces` VALUES ('350205', '福建省', '厦门市', '350200', '海沧', '350205', '118.036364', '24.492512');
INSERT INTO `provinces` VALUES ('350206', '福建省', '厦门市', '350200', '湖里', '350206', '118.10943', '24.512764');
INSERT INTO `provinces` VALUES ('350211', '福建省', '厦门市', '350200', '集美', '350211', '118.100869', '24.572874');
INSERT INTO `provinces` VALUES ('350212', '福建省', '厦门市', '350200', '同安', '350212', '118.150455', '24.729333');
INSERT INTO `provinces` VALUES ('350213', '福建省', '厦门市', '350200', '翔安', '350213', '118.242811', '24.637479');
INSERT INTO `provinces` VALUES ('350300', '福建省', '莆田市', '350300', '莆田', '350300', '119.007558', '25.431011');
INSERT INTO `provinces` VALUES ('350302', '福建省', '莆田市', '350300', '城厢', '350302', '119.001028', '25.433737');
INSERT INTO `provinces` VALUES ('350303', '福建省', '莆田市', '350300', '涵江', '350303', '119.119102', '25.459273');
INSERT INTO `provinces` VALUES ('350304', '福建省', '莆田市', '350300', '荔城', '350304', '119.020047', '25.430047');
INSERT INTO `provinces` VALUES ('350305', '福建省', '莆田市', '350300', '秀屿', '350305', '119.092607', '25.316141');
INSERT INTO `provinces` VALUES ('350322', '福建省', '莆田市', '350300', '仙游', '350322', '118.694331', '25.356529');
INSERT INTO `provinces` VALUES ('350400', '福建省', '三明市', '350400', '三明', '350400', '117.635001', '26.265444');
INSERT INTO `provinces` VALUES ('350402', '福建省', '三明市', '350400', '梅列', '350402', '117.63687', '26.269208');
INSERT INTO `provinces` VALUES ('350403', '福建省', '三明市', '350400', '三元', '350403', '117.607418', '26.234191');
INSERT INTO `provinces` VALUES ('350421', '福建省', '三明市', '350400', '明溪', '350421', '117.201845', '26.357375');
INSERT INTO `provinces` VALUES ('350423', '福建省', '三明市', '350400', '清流', '350423', '116.815821', '26.17761');
INSERT INTO `provinces` VALUES ('350424', '福建省', '三明市', '350400', '宁化', '350424', '116.659725', '26.259932');
INSERT INTO `provinces` VALUES ('350425', '福建省', '三明市', '350400', '大田', '350425', '117.849355', '25.690803');
INSERT INTO `provinces` VALUES ('350426', '福建省', '三明市', '350400', '尤溪', '350426', '118.188577', '26.169261');
INSERT INTO `provinces` VALUES ('350427', '福建省', '三明市', '350400', '沙县', '350427', '117.789095', '26.397361');
INSERT INTO `provinces` VALUES ('350428', '福建省', '三明市', '350400', '将乐', '350428', '117.473558', '26.728667');
INSERT INTO `provinces` VALUES ('350429', '福建省', '三明市', '350400', '泰宁', '350429', '117.177522', '26.897995');
INSERT INTO `provinces` VALUES ('350430', '福建省', '三明市', '350400', '建宁', '350430', '116.845832', '26.831398');
INSERT INTO `provinces` VALUES ('350481', '福建省', '三明市', '350400', '永安', '350481', '117.364447', '25.974075');
INSERT INTO `provinces` VALUES ('350500', '福建省', '泉州市', '350500', '泉州', '350500', '118.589421', '24.908853');
INSERT INTO `provinces` VALUES ('350502', '福建省', '泉州市', '350500', '鲤城', '350502', '118.588929', '24.907645');
INSERT INTO `provinces` VALUES ('350503', '福建省', '泉州市', '350500', '丰泽', '350503', '118.605147', '24.896041');
INSERT INTO `provinces` VALUES ('350504', '福建省', '泉州市', '350500', '洛江', '350504', '118.670312', '24.941153');
INSERT INTO `provinces` VALUES ('350505', '福建省', '泉州市', '350500', '泉港', '350505', '118.912285', '25.126859');
INSERT INTO `provinces` VALUES ('350521', '福建省', '泉州市', '350500', '惠安', '350521', '118.798954', '25.028718');
INSERT INTO `provinces` VALUES ('350524', '福建省', '泉州市', '350500', '安溪', '350524', '118.186014', '25.056824');
INSERT INTO `provinces` VALUES ('350525', '福建省', '泉州市', '350500', '永春', '350525', '118.29503', '25.320721');
INSERT INTO `provinces` VALUES ('350526', '福建省', '泉州市', '350500', '德化', '350526', '118.242986', '25.489004');
INSERT INTO `provinces` VALUES ('350527', '福建省', '泉州市', '350500', '金门', '350527', '118.323221', '24.436417');
INSERT INTO `provinces` VALUES ('350581', '福建省', '泉州市', '350500', '石狮', '350581', '118.628402', '24.731978');
INSERT INTO `provinces` VALUES ('350582', '福建省', '泉州市', '350500', '晋江', '350582', '118.577338', '24.807322');
INSERT INTO `provinces` VALUES ('350583', '福建省', '泉州市', '350500', '南安', '350583', '118.387031', '24.959494');
INSERT INTO `provinces` VALUES ('350600', '福建省', '漳州市', '350600', '漳州', '350600', '117.661801', '24.510897');
INSERT INTO `provinces` VALUES ('350602', '福建省', '漳州市', '350600', '芗城', '350602', '117.656461', '24.509955');
INSERT INTO `provinces` VALUES ('350603', '福建省', '漳州市', '350600', '龙文', '350603', '117.671387', '24.515656');
INSERT INTO `provinces` VALUES ('350622', '福建省', '漳州市', '350600', '云霄', '350622', '117.340946', '23.950486');
INSERT INTO `provinces` VALUES ('350623', '福建省', '漳州市', '350600', '漳浦', '350623', '117.614023', '24.117907');
INSERT INTO `provinces` VALUES ('350624', '福建省', '漳州市', '350600', '诏安', '350624', '117.176083', '23.710834');
INSERT INTO `provinces` VALUES ('350625', '福建省', '漳州市', '350600', '长泰', '350625', '117.755913', '24.621475');
INSERT INTO `provinces` VALUES ('350626', '福建省', '漳州市', '350600', '东山', '350626', '117.427679', '23.702845');
INSERT INTO `provinces` VALUES ('350627', '福建省', '漳州市', '350600', '南靖', '350627', '117.365462', '24.516425');
INSERT INTO `provinces` VALUES ('350628', '福建省', '漳州市', '350600', '平和', '350628', '117.313549', '24.366158');
INSERT INTO `provinces` VALUES ('350629', '福建省', '漳州市', '350600', '华安', '350629', '117.53631', '25.001416');
INSERT INTO `provinces` VALUES ('350681', '福建省', '漳州市', '350600', '龙海', '350681', '117.817292', '24.445341');
INSERT INTO `provinces` VALUES ('350700', '福建省', '南平市', '350700', '南平', '350700', '118.178459', '26.635627');
INSERT INTO `provinces` VALUES ('350702', '福建省', '南平市', '350700', '延平', '350702', '118.178918', '26.636079');
INSERT INTO `provinces` VALUES ('350703', '福建省', '南平市', '350700', '建阳', '350703', '118.12267', '27.332067');
INSERT INTO `provinces` VALUES ('350721', '福建省', '南平市', '350700', '顺昌', '350721', '117.80771', '26.792851');
INSERT INTO `provinces` VALUES ('350722', '福建省', '南平市', '350700', '浦城', '350722', '118.536822', '27.920412');
INSERT INTO `provinces` VALUES ('350723', '福建省', '南平市', '350700', '光泽', '350723', '117.337897', '27.542803');
INSERT INTO `provinces` VALUES ('350724', '福建省', '南平市', '350700', '松溪', '350724', '118.783491', '27.525785');
INSERT INTO `provinces` VALUES ('350725', '福建省', '南平市', '350700', '政和', '350725', '118.858661', '27.365398');
INSERT INTO `provinces` VALUES ('350781', '福建省', '南平市', '350700', '邵武', '350781', '117.491544', '27.337952');
INSERT INTO `provinces` VALUES ('350782', '福建省', '南平市', '350700', '武夷山', '350782', '118.032796', '27.751733');
INSERT INTO `provinces` VALUES ('350783', '福建省', '南平市', '350700', '建瓯', '350783', '118.321765', '27.03502');
INSERT INTO `provinces` VALUES ('350800', '福建省', '龙岩市', '350800', '龙岩', '350800', '117.02978', '25.091603');
INSERT INTO `provinces` VALUES ('350802', '福建省', '龙岩市', '350800', '新罗', '350802', '117.030721', '25.0918');
INSERT INTO `provinces` VALUES ('350803', '福建省', '龙岩市', '350800', '永定区', '350803', '116.732691', '24.720442');
INSERT INTO `provinces` VALUES ('350821', '福建省', '龙岩市', '350800', '长汀', '350821', '116.361007', '25.842278');
INSERT INTO `provinces` VALUES ('350823', '福建省', '龙岩市', '350800', '上杭', '350823', '116.424774', '25.050019');
INSERT INTO `provinces` VALUES ('350824', '福建省', '龙岩市', '350800', '武平', '350824', '116.100928', '25.08865');
INSERT INTO `provinces` VALUES ('350825', '福建省', '龙岩市', '350800', '连城', '350825', '116.756687', '25.708506');
INSERT INTO `provinces` VALUES ('350881', '福建省', '龙岩市', '350800', '漳平', '350881', '117.42073', '25.291597');
INSERT INTO `provinces` VALUES ('350900', '福建省', '宁德市', '350900', '宁德', '350900', '119.527082', '26.65924');
INSERT INTO `provinces` VALUES ('350902', '福建省', '宁德市', '350900', '蕉城', '350902', '119.527225', '26.659253');
INSERT INTO `provinces` VALUES ('350921', '福建省', '宁德市', '350900', '霞浦', '350921', '120.005214', '26.882068');
INSERT INTO `provinces` VALUES ('350922', '福建省', '宁德市', '350900', '古田', '350922', '118.743156', '26.577491');
INSERT INTO `provinces` VALUES ('350923', '福建省', '宁德市', '350900', '屏南', '350923', '118.987544', '26.910826');
INSERT INTO `provinces` VALUES ('350924', '福建省', '宁德市', '350900', '寿宁', '350924', '119.506733', '27.457798');
INSERT INTO `provinces` VALUES ('350925', '福建省', '宁德市', '350900', '周宁', '350925', '119.338239', '27.103106');
INSERT INTO `provinces` VALUES ('350926', '福建省', '宁德市', '350900', '柘荣', '350926', '119.898226', '27.236163');
INSERT INTO `provinces` VALUES ('350981', '福建省', '宁德市', '350900', '福安', '350981', '119.650798', '27.084246');
INSERT INTO `provinces` VALUES ('350982', '福建省', '宁德市', '350900', '福鼎', '350982', '120.219761', '27.318884');
INSERT INTO `provinces` VALUES ('360100', '江西省', '南昌市', '360100', '南昌', '360100', '115.892151', '28.676493');
INSERT INTO `provinces` VALUES ('360102', '江西省', '南昌市', '360100', '东湖区', '360102', '115.889675', '28.682988');
INSERT INTO `provinces` VALUES ('360103', '江西省', '南昌市', '360100', '西湖区', '360103', '115.91065', '28.662901');
INSERT INTO `provinces` VALUES ('360104', '江西省', '南昌市', '360100', '青云谱', '360104', '115.907292', '28.635724');
INSERT INTO `provinces` VALUES ('360105', '江西省', '南昌市', '360100', '湾里', '360105', '115.731324', '28.714803');
INSERT INTO `provinces` VALUES ('360111', '江西省', '南昌市', '360100', '青山湖', '360111', '115.949044', '28.689292');
INSERT INTO `provinces` VALUES ('360112', '江西省', '南昌市', '360100', '新建区', '360112', '115.820806', '28.690788');
INSERT INTO `provinces` VALUES ('360121', '江西省', '南昌市', '360100', '南昌县', '360121', '115.942465', '28.543781');
INSERT INTO `provinces` VALUES ('360123', '江西省', '南昌市', '360100', '安义', '360123', '115.553109', '28.841334');
INSERT INTO `provinces` VALUES ('360124', '江西省', '南昌市', '360100', '进贤', '360124', '116.267671', '28.365681');
INSERT INTO `provinces` VALUES ('360200', '江西省', '景德镇市', '360200', '景德镇', '360200', '117.214664', '29.29256');
INSERT INTO `provinces` VALUES ('360202', '江西省', '景德镇市', '360200', '昌江区', '360202', '117.195023', '29.288465');
INSERT INTO `provinces` VALUES ('360203', '江西省', '景德镇市', '360200', '珠山', '360203', '117.214814', '29.292812');
INSERT INTO `provinces` VALUES ('360222', '江西省', '景德镇市', '360200', '浮梁', '360222', '117.217611', '29.352251');
INSERT INTO `provinces` VALUES ('360281', '江西省', '景德镇市', '360200', '乐平', '360281', '117.129376', '28.967361');
INSERT INTO `provinces` VALUES ('360300', '江西省', '萍乡市', '360300', '萍乡', '360300', '113.852186', '27.622946');
INSERT INTO `provinces` VALUES ('360302', '江西省', '萍乡市', '360300', '安源', '360302', '113.855044', '27.625826');
INSERT INTO `provinces` VALUES ('360313', '江西省', '萍乡市', '360300', '湘东', '360313', '113.7456', '27.639319');
INSERT INTO `provinces` VALUES ('360321', '江西省', '萍乡市', '360300', '莲花', '360321', '113.955582', '27.127807');
INSERT INTO `provinces` VALUES ('360322', '江西省', '萍乡市', '360300', '上栗', '360322', '113.800525', '27.877041');
INSERT INTO `provinces` VALUES ('360323', '江西省', '萍乡市', '360300', '芦溪', '360323', '114.041206', '27.633633');
INSERT INTO `provinces` VALUES ('360400', '江西省', '九江市', '360400', '九江', '360400', '115.992811', '29.712034');
INSERT INTO `provinces` VALUES ('360402', '江西省', '九江市', '360400', '濂溪', '360402', '116.043743', '29.456169');
INSERT INTO `provinces` VALUES ('360403', '江西省', '九江市', '360400', '浔阳', '360403', '115.995947', '29.72465');
INSERT INTO `provinces` VALUES ('360404', '江西省', '九江市', '360400', '柴桑', '360404', '115.919706', '29.616312');
INSERT INTO `provinces` VALUES ('360423', '江西省', '九江市', '360400', '武宁', '360423', '115.105646', '29.260182');
INSERT INTO `provinces` VALUES ('360424', '江西省', '九江市', '360400', '修水', '360424', '114.573428', '29.032729');
INSERT INTO `provinces` VALUES ('360425', '江西省', '九江市', '360400', '永修', '360425', '115.809055', '29.018212');
INSERT INTO `provinces` VALUES ('360426', '江西省', '九江市', '360400', '德安', '360426', '115.762611', '29.327474');
INSERT INTO `provinces` VALUES ('360428', '江西省', '九江市', '360400', '都昌', '360428', '116.205114', '29.275105');
INSERT INTO `provinces` VALUES ('360429', '江西省', '九江市', '360400', '湖口', '360429', '116.244313', '29.7263');
INSERT INTO `provinces` VALUES ('360430', '江西省', '九江市', '360400', '彭泽', '360430', '116.55584', '29.898865');
INSERT INTO `provinces` VALUES ('360481', '江西省', '九江市', '360400', '瑞昌', '360481', '115.669081', '29.676599');
INSERT INTO `provinces` VALUES ('360482', '江西省', '九江市', '360400', '共青城', '360482', '115.805712', '29.247884');
INSERT INTO `provinces` VALUES ('360483', '江西省', '九江市', '360400', '庐山', '360483', '116.047974', '29.455041');
INSERT INTO `provinces` VALUES ('360500', '江西省', '新余市', '360500', '新余', '360500', '114.930835', '27.810834');
INSERT INTO `provinces` VALUES ('360502', '江西省', '新余市', '360500', '渝水', '360502', '114.923923', '27.819171');
INSERT INTO `provinces` VALUES ('360521', '江西省', '新余市', '360500', '分宜', '360521', '114.675262', '27.811301');
INSERT INTO `provinces` VALUES ('360600', '江西省', '鹰潭市', '360600', '鹰潭', '360600', '117.033838', '28.238638');
INSERT INTO `provinces` VALUES ('360602', '江西省', '鹰潭市', '360600', '月湖', '360602', '117.034112', '28.239076');
INSERT INTO `provinces` VALUES ('360603', '江西省', '鹰潭市', '360600', '余江', '360603', '116.822763', '28.206177');
INSERT INTO `provinces` VALUES ('360681', '江西省', '鹰潭市', '360600', '贵溪', '360681', '117.212103', '28.283693');
INSERT INTO `provinces` VALUES ('360700', '江西省', '赣州市', '360700', '赣州', '360700', '114.940278', '25.85097');
INSERT INTO `provinces` VALUES ('360702', '江西省', '赣州市', '360700', '章贡', '360702', '114.93872', '25.851367');
INSERT INTO `provinces` VALUES ('360703', '江西省', '赣州市', '360700', '南康', '360703', '114.756933', '25.661721');
INSERT INTO `provinces` VALUES ('360704', '江西省', '赣州市', '360700', '赣县', '360704', '115.018461', '25.865432');
INSERT INTO `provinces` VALUES ('360722', '江西省', '赣州市', '360700', '信丰', '360722', '114.930893', '25.38023');
INSERT INTO `provinces` VALUES ('360723', '江西省', '赣州市', '360700', '大余', '360723', '114.362243', '25.395937');
INSERT INTO `provinces` VALUES ('360724', '江西省', '赣州市', '360700', '上犹', '360724', '114.540537', '25.794284');
INSERT INTO `provinces` VALUES ('360725', '江西省', '赣州市', '360700', '崇义', '360725', '114.307348', '25.687911');
INSERT INTO `provinces` VALUES ('360726', '江西省', '赣州市', '360700', '安远', '360726', '115.392328', '25.134591');
INSERT INTO `provinces` VALUES ('360727', '江西省', '赣州市', '360700', '龙南', '360727', '114.792657', '24.90476');
INSERT INTO `provinces` VALUES ('360728', '江西省', '赣州市', '360700', '定南', '360728', '115.03267', '24.774277');
INSERT INTO `provinces` VALUES ('360729', '江西省', '赣州市', '360700', '全南', '360729', '114.531589', '24.742651');
INSERT INTO `provinces` VALUES ('360730', '江西省', '赣州市', '360700', '宁都', '360730', '116.018782', '26.472054');
INSERT INTO `provinces` VALUES ('360731', '江西省', '赣州市', '360700', '于都', '360731', '115.411198', '25.955033');
INSERT INTO `provinces` VALUES ('360732', '江西省', '赣州市', '360700', '兴国', '360732', '115.351896', '26.330489');
INSERT INTO `provinces` VALUES ('360733', '江西省', '赣州市', '360700', '会昌', '360733', '115.791158', '25.599125');
INSERT INTO `provinces` VALUES ('360734', '江西省', '赣州市', '360700', '寻乌', '360734', '115.651399', '24.954136');
INSERT INTO `provinces` VALUES ('360735', '江西省', '赣州市', '360700', '石城', '360735', '116.342249', '26.326582');
INSERT INTO `provinces` VALUES ('360781', '江西省', '赣州市', '360700', '瑞金', '360781', '116.034854', '25.875278');
INSERT INTO `provinces` VALUES ('360800', '江西省', '吉安市', '360800', '吉安', '360800', '114.986373', '27.111699');
INSERT INTO `provinces` VALUES ('360802', '江西省', '吉安市', '360800', '吉州', '360802', '114.987331', '27.112367');
INSERT INTO `provinces` VALUES ('360803', '江西省', '吉安市', '360800', '青原', '360803', '115.016306', '27.105879');
INSERT INTO `provinces` VALUES ('360821', '江西省', '吉安市', '360800', '吉安县', '360821', '114.905117', '27.040042');
INSERT INTO `provinces` VALUES ('360822', '江西省', '吉安市', '360800', '吉水', '360822', '115.134569', '27.213445');
INSERT INTO `provinces` VALUES ('360823', '江西省', '吉安市', '360800', '峡江', '360823', '115.319331', '27.580862');
INSERT INTO `provinces` VALUES ('360824', '江西省', '吉安市', '360800', '新干', '360824', '115.399294', '27.755758');
INSERT INTO `provinces` VALUES ('360825', '江西省', '吉安市', '360800', '永丰', '360825', '115.435559', '27.321087');
INSERT INTO `provinces` VALUES ('360826', '江西省', '吉安市', '360800', '泰和', '360826', '114.901393', '26.790164');
INSERT INTO `provinces` VALUES ('360827', '江西省', '吉安市', '360800', '遂川', '360827', '114.51689', '26.323705');
INSERT INTO `provinces` VALUES ('360828', '江西省', '吉安市', '360800', '万安', '360828', '114.784694', '26.462085');
INSERT INTO `provinces` VALUES ('360829', '江西省', '吉安市', '360800', '安福', '360829', '114.61384', '27.382746');
INSERT INTO `provinces` VALUES ('360830', '江西省', '吉安市', '360800', '永新', '360830', '114.242534', '26.944721');
INSERT INTO `provinces` VALUES ('360881', '江西省', '吉安市', '360800', '井冈山', '360881', '114.284421', '26.745919');
INSERT INTO `provinces` VALUES ('360900', '江西省', '宜春市', '360900', '宜春', '360900', '114.391136', '27.8043');
INSERT INTO `provinces` VALUES ('360902', '江西省', '宜春市', '360900', '袁州', '360902', '114.387379', '27.800117');
INSERT INTO `provinces` VALUES ('360921', '江西省', '宜春市', '360900', '奉新', '360921', '115.389899', '28.700672');
INSERT INTO `provinces` VALUES ('360922', '江西省', '宜春市', '360900', '万载', '360922', '114.449012', '28.104528');
INSERT INTO `provinces` VALUES ('360923', '江西省', '宜春市', '360900', '上高', '360923', '114.932653', '28.234789');
INSERT INTO `provinces` VALUES ('360924', '江西省', '宜春市', '360900', '宜丰', '360924', '114.787381', '28.388289');
INSERT INTO `provinces` VALUES ('360925', '江西省', '宜春市', '360900', '靖安', '360925', '115.361744', '28.86054');
INSERT INTO `provinces` VALUES ('360926', '江西省', '宜春市', '360900', '铜鼓', '360926', '114.37014', '28.520956');
INSERT INTO `provinces` VALUES ('360981', '江西省', '宜春市', '360900', '丰城', '360981', '115.786005', '28.191584');
INSERT INTO `provinces` VALUES ('360982', '江西省', '宜春市', '360900', '樟树', '360982', '115.543388', '28.055898');
INSERT INTO `provinces` VALUES ('360983', '江西省', '宜春市', '360900', '高安', '360983', '115.381527', '28.420951');
INSERT INTO `provinces` VALUES ('361000', '江西省', '抚州市', '361000', '抚州', '361000', '116.358351', '27.98385');
INSERT INTO `provinces` VALUES ('361002', '江西省', '抚州市', '361000', '临川', '361002', '116.361404', '27.981919');
INSERT INTO `provinces` VALUES ('361003', '江西省', '抚州市', '361000', '东乡区', '361003', '116.605341', '28.2325');
INSERT INTO `provinces` VALUES ('361021', '江西省', '抚州市', '361000', '南城', '361021', '116.63945', '27.55531');
INSERT INTO `provinces` VALUES ('361022', '江西省', '抚州市', '361000', '黎川', '361022', '116.91457', '27.292561');
INSERT INTO `provinces` VALUES ('361023', '江西省', '抚州市', '361000', '南丰', '361023', '116.532994', '27.210132');
INSERT INTO `provinces` VALUES ('361024', '江西省', '抚州市', '361000', '崇仁', '361024', '116.059109', '27.760907');
INSERT INTO `provinces` VALUES ('361025', '江西省', '抚州市', '361000', '乐安', '361025', '115.838432', '27.420101');
INSERT INTO `provinces` VALUES ('361026', '江西省', '抚州市', '361000', '宜黄', '361026', '116.223023', '27.546512');
INSERT INTO `provinces` VALUES ('361027', '江西省', '抚州市', '361000', '金溪', '361027', '116.778751', '27.907387');
INSERT INTO `provinces` VALUES ('361028', '江西省', '抚州市', '361000', '资溪', '361028', '117.066095', '27.70653');
INSERT INTO `provinces` VALUES ('361030', '江西省', '抚州市', '361000', '广昌', '361030', '116.327291', '26.838426');
INSERT INTO `provinces` VALUES ('361100', '江西省', '上饶市', '361100', '上饶', '361100', '117.971185', '28.44442');
INSERT INTO `provinces` VALUES ('361102', '江西省', '上饶市', '361100', '信州', '361102', '117.970522', '28.445378');
INSERT INTO `provinces` VALUES ('361103', '江西省', '上饶市', '361100', '广丰', '361103', '118.189852', '28.440285');
INSERT INTO `provinces` VALUES ('361121', '江西省', '上饶市', '361100', '上饶县', '361121', '117.90612', '28.453897');
INSERT INTO `provinces` VALUES ('361123', '江西省', '上饶市', '361100', '玉山', '361123', '118.244408', '28.673479');
INSERT INTO `provinces` VALUES ('361124', '江西省', '上饶市', '361100', '铅山', '361124', '117.711906', '28.310892');
INSERT INTO `provinces` VALUES ('361125', '江西省', '上饶市', '361100', '横峰', '361125', '117.608247', '28.415103');
INSERT INTO `provinces` VALUES ('361126', '江西省', '上饶市', '361100', '弋阳', '361126', '117.435002', '28.402391');
INSERT INTO `provinces` VALUES ('361127', '江西省', '上饶市', '361100', '余干', '361127', '116.691072', '28.69173');
INSERT INTO `provinces` VALUES ('361128', '江西省', '上饶市', '361100', '鄱阳', '361128', '116.673748', '28.993374');
INSERT INTO `provinces` VALUES ('361129', '江西省', '上饶市', '361100', '万年', '361129', '117.07015', '28.692589');
INSERT INTO `provinces` VALUES ('361130', '江西省', '上饶市', '361100', '婺源', '361130', '117.86219', '29.254015');
INSERT INTO `provinces` VALUES ('361181', '江西省', '上饶市', '361100', '德兴', '361181', '117.578732', '28.945034');
INSERT INTO `provinces` VALUES ('370100', '山东省', '济南市', '370100', '济南', '370100', '117.000923', '36.675807');
INSERT INTO `provinces` VALUES ('370102', '山东省', '济南市', '370100', '历下', '370102', '117.03862', '36.664169');
INSERT INTO `provinces` VALUES ('370103', '山东省', '济南市', '370100', '市中', '370103', '116.99898', '36.657354');
INSERT INTO `provinces` VALUES ('370104', '山东省', '济南市', '370100', '槐荫', '370104', '116.947921', '36.668205');
INSERT INTO `provinces` VALUES ('370105', '山东省', '济南市', '370100', '天桥', '370105', '116.996086', '36.693374');
INSERT INTO `provinces` VALUES ('370112', '山东省', '济南市', '370100', '历城', '370112', '117.063744', '36.681744');
INSERT INTO `provinces` VALUES ('370113', '山东省', '济南市', '370100', '长清', '370113', '116.74588', '36.561049');
INSERT INTO `provinces` VALUES ('370114', '山东省', '济南市', '370100', '章丘', '370114', '117.54069', '36.71209');
INSERT INTO `provinces` VALUES ('370115', '山东省', '济南市', '370100', '济阳', '370115', '117.176035', '36.976772');
INSERT INTO `provinces` VALUES ('370116', '山东省', '济南市', '370100', '莱芜', '370116', '117.6666', '36.20884');
INSERT INTO `provinces` VALUES ('370117', '山东省', '济南市', '370100', '钢城', '370117', '117.817496', '36.06472');
INSERT INTO `provinces` VALUES ('370124', '山东省', '济南市', '370100', '平阴', '370124', '116.455054', '36.286923');
INSERT INTO `provinces` VALUES ('370126', '山东省', '济南市', '370100', '商河', '370126', '117.156369', '37.310544');
INSERT INTO `provinces` VALUES ('370200', '山东省', '青岛市', '370200', '青岛', '370200', '120.355173', '36.082982');
INSERT INTO `provinces` VALUES ('370202', '山东省', '青岛市', '370200', '市南区', '370202', '120.395966', '36.070892');
INSERT INTO `provinces` VALUES ('370203', '山东省', '青岛市', '370200', '市北区', '370203', '120.355026', '36.083819');
INSERT INTO `provinces` VALUES ('370211', '山东省', '青岛市', '370200', '黄岛', '370211', '119.995518', '35.875138');
INSERT INTO `provinces` VALUES ('370212', '山东省', '青岛市', '370200', '崂山', '370212', '120.467393', '36.102569');
INSERT INTO `provinces` VALUES ('370213', '山东省', '青岛市', '370200', '李沧', '370213', '120.421236', '36.160023');
INSERT INTO `provinces` VALUES ('370214', '山东省', '青岛市', '370200', '城阳', '370214', '120.389135', '36.306833');
INSERT INTO `provinces` VALUES ('370215', '山东省', '青岛市', '370200', '即墨', '370215', '120.447352', '36.390847');
INSERT INTO `provinces` VALUES ('370281', '山东省', '青岛市', '370200', '胶州', '370281', '120.006202', '36.285878');
INSERT INTO `provinces` VALUES ('370283', '山东省', '青岛市', '370200', '平度', '370283', '119.959012', '36.788828');
INSERT INTO `provinces` VALUES ('370285', '山东省', '青岛市', '370200', '莱西', '370285', '120.526226', '36.86509');
INSERT INTO `provinces` VALUES ('370300', '山东省', '淄博市', '370300', '淄博', '370300', '118.047648', '36.814939');
INSERT INTO `provinces` VALUES ('370302', '山东省', '淄博市', '370300', '淄川', '370302', '117.967696', '36.647272');
INSERT INTO `provinces` VALUES ('370303', '山东省', '淄博市', '370300', '张店', '370303', '118.053521', '36.807049');
INSERT INTO `provinces` VALUES ('370304', '山东省', '淄博市', '370300', '博山', '370304', '117.85823', '36.497567');
INSERT INTO `provinces` VALUES ('370305', '山东省', '淄博市', '370300', '临淄', '370305', '118.306018', '36.816657');
INSERT INTO `provinces` VALUES ('370306', '山东省', '淄博市', '370300', '周村', '370306', '117.851036', '36.803699');
INSERT INTO `provinces` VALUES ('370321', '山东省', '淄博市', '370300', '桓台', '370321', '118.101556', '36.959773');
INSERT INTO `provinces` VALUES ('370322', '山东省', '淄博市', '370300', '高青', '370322', '117.829839', '37.169581');
INSERT INTO `provinces` VALUES ('370323', '山东省', '淄博市', '370300', '沂源', '370323', '118.166161', '36.186282');
INSERT INTO `provinces` VALUES ('370400', '山东省', '枣庄市', '370400', '枣庄', '370400', '117.557964', '34.856424');
INSERT INTO `provinces` VALUES ('370402', '山东省', '枣庄市', '370400', '市中区', '370402', '117.557281', '34.856651');
INSERT INTO `provinces` VALUES ('370403', '山东省', '枣庄市', '370400', '薛城', '370403', '117.265293', '34.79789');
INSERT INTO `provinces` VALUES ('370404', '山东省', '枣庄市', '370400', '峄城', '370404', '117.586316', '34.767713');
INSERT INTO `provinces` VALUES ('370405', '山东省', '枣庄市', '370400', '台儿庄', '370405', '117.734747', '34.564815');
INSERT INTO `provinces` VALUES ('370406', '山东省', '枣庄市', '370400', '山亭', '370406', '117.458968', '35.096077');
INSERT INTO `provinces` VALUES ('370481', '山东省', '枣庄市', '370400', '滕州', '370481', '117.162098', '35.088498');
INSERT INTO `provinces` VALUES ('370500', '山东省', '东营市', '370500', '东营', '370500', '118.507543', '37.461567');
INSERT INTO `provinces` VALUES ('370502', '山东省', '东营市', '370500', '东营区', '370502', '118.58846', '37.45485');
INSERT INTO `provinces` VALUES ('370503', '山东省', '东营市', '370500', '河口区', '370503', '118.529613', '37.886015');
INSERT INTO `provinces` VALUES ('370505', '山东省', '东营市', '370500', '垦利', '370505', '118.551314', '37.588679');
INSERT INTO `provinces` VALUES ('370522', '山东省', '东营市', '370500', '利津', '370522', '118.248854', '37.493365');
INSERT INTO `provinces` VALUES ('370523', '山东省', '东营市', '370500', '广饶', '370523', '118.407522', '37.05161');
INSERT INTO `provinces` VALUES ('370600', '山东省', '烟台市', '370600', '烟台', '370600', '121.391382', '37.539297');
INSERT INTO `provinces` VALUES ('370602', '山东省', '烟台市', '370600', '芝罘', '370602', '121.385877', '37.540925');
INSERT INTO `provinces` VALUES ('370611', '山东省', '烟台市', '370600', '福山', '370611', '121.264741', '37.496875');
INSERT INTO `provinces` VALUES ('370612', '山东省', '烟台市', '370600', '牟平', '370612', '121.60151', '37.388356');
INSERT INTO `provinces` VALUES ('370613', '山东省', '烟台市', '370600', '莱山', '370613', '121.448866', '37.473549');
INSERT INTO `provinces` VALUES ('370634', '山东省', '烟台市', '370600', '长岛', '370634', '120.738345', '37.916194');
INSERT INTO `provinces` VALUES ('370681', '山东省', '烟台市', '370600', '龙口', '370681', '120.528328', '37.648446');
INSERT INTO `provinces` VALUES ('370682', '山东省', '烟台市', '370600', '莱阳', '370682', '120.711151', '36.977037');
INSERT INTO `provinces` VALUES ('370683', '山东省', '烟台市', '370600', '莱州', '370683', '119.942135', '37.182725');
INSERT INTO `provinces` VALUES ('370684', '山东省', '烟台市', '370600', '蓬莱', '370684', '120.762689', '37.811168');
INSERT INTO `provinces` VALUES ('370685', '山东省', '烟台市', '370600', '招远', '370685', '120.403142', '37.364919');
INSERT INTO `provinces` VALUES ('370686', '山东省', '烟台市', '370600', '栖霞', '370686', '120.834097', '37.305854');
INSERT INTO `provinces` VALUES ('370687', '山东省', '烟台市', '370600', '海阳', '370687', '121.168392', '36.780657');
INSERT INTO `provinces` VALUES ('370700', '山东省', '潍坊市', '370700', '潍坊', '370700', '119.107078', '36.70925');
INSERT INTO `provinces` VALUES ('370702', '山东省', '潍坊市', '370700', '潍城', '370702', '119.103784', '36.710062');
INSERT INTO `provinces` VALUES ('370703', '山东省', '潍坊市', '370700', '寒亭', '370703', '119.207866', '36.772103');
INSERT INTO `provinces` VALUES ('370704', '山东省', '潍坊市', '370700', '坊子', '370704', '119.166326', '36.654616');
INSERT INTO `provinces` VALUES ('370705', '山东省', '潍坊市', '370700', '奎文', '370705', '119.137357', '36.709494');
INSERT INTO `provinces` VALUES ('370724', '山东省', '潍坊市', '370700', '临朐', '370724', '118.539876', '36.516371');
INSERT INTO `provinces` VALUES ('370725', '山东省', '潍坊市', '370700', '昌乐', '370725', '118.839995', '36.703253');
INSERT INTO `provinces` VALUES ('370781', '山东省', '潍坊市', '370700', '青州', '370781', '118.484693', '36.697855');
INSERT INTO `provinces` VALUES ('370782', '山东省', '潍坊市', '370700', '诸城', '370782', '119.403182', '35.997093');
INSERT INTO `provinces` VALUES ('370783', '山东省', '潍坊市', '370700', '寿光', '370783', '118.736451', '36.874411');
INSERT INTO `provinces` VALUES ('370784', '山东省', '潍坊市', '370700', '安丘', '370784', '119.206886', '36.427417');
INSERT INTO `provinces` VALUES ('370785', '山东省', '潍坊市', '370700', '高密', '370785', '119.757033', '36.37754');
INSERT INTO `provinces` VALUES ('370786', '山东省', '潍坊市', '370700', '昌邑', '370786', '119.394502', '36.854937');
INSERT INTO `provinces` VALUES ('370800', '山东省', '济宁市', '370800', '济宁', '370800', '116.587245', '35.415393');
INSERT INTO `provinces` VALUES ('370811', '山东省', '济宁市', '370800', '任城', '370811', '116.595261', '35.414828');
INSERT INTO `provinces` VALUES ('370812', '山东省', '济宁市', '370800', '兖州', '370812', '116.828996', '35.556445');
INSERT INTO `provinces` VALUES ('370826', '山东省', '济宁市', '370800', '微山', '370826', '117.12861', '34.809525');
INSERT INTO `provinces` VALUES ('370827', '山东省', '济宁市', '370800', '鱼台', '370827', '116.650023', '34.997706');
INSERT INTO `provinces` VALUES ('370828', '山东省', '济宁市', '370800', '金乡', '370828', '116.310364', '35.06977');
INSERT INTO `provinces` VALUES ('370829', '山东省', '济宁市', '370800', '嘉祥', '370829', '116.342885', '35.398098');
INSERT INTO `provinces` VALUES ('370830', '山东省', '济宁市', '370800', '汶上', '370830', '116.487146', '35.721746');
INSERT INTO `provinces` VALUES ('370831', '山东省', '济宁市', '370800', '泗水', '370831', '117.273605', '35.653216');
INSERT INTO `provinces` VALUES ('370832', '山东省', '济宁市', '370800', '梁山', '370832', '116.08963', '35.801843');
INSERT INTO `provinces` VALUES ('370881', '山东省', '济宁市', '370800', '曲阜', '370881', '116.991885', '35.592788');
INSERT INTO `provinces` VALUES ('370883', '山东省', '济宁市', '370800', '邹城', '370883', '116.96673', '35.405259');
INSERT INTO `provinces` VALUES ('370900', '山东省', '泰安市', '370900', '泰安', '370900', '117.129063', '36.194968');
INSERT INTO `provinces` VALUES ('370902', '山东省', '泰安市', '370900', '泰山', '370902', '117.129984', '36.189313');
INSERT INTO `provinces` VALUES ('370911', '山东省', '泰安市', '370900', '岱岳', '370911', '117.04353', '36.1841');
INSERT INTO `provinces` VALUES ('370921', '山东省', '泰安市', '370900', '宁阳', '370921', '116.799297', '35.76754');
INSERT INTO `provinces` VALUES ('370923', '山东省', '泰安市', '370900', '东平', '370923', '116.461052', '35.930467');
INSERT INTO `provinces` VALUES ('370982', '山东省', '泰安市', '370900', '新泰', '370982', '117.766092', '35.910387');
INSERT INTO `provinces` VALUES ('370983', '山东省', '泰安市', '370900', '肥城', '370983', '116.763703', '36.1856');
INSERT INTO `provinces` VALUES ('371000', '山东省', '威海市', '371000', '威海', '371000', '122.116394', '37.509691');
INSERT INTO `provinces` VALUES ('371002', '山东省', '威海市', '371000', '环翠', '371002', '122.116189', '37.510754');
INSERT INTO `provinces` VALUES ('371003', '山东省', '威海市', '371000', '文登', '371003', '122.057139', '37.196211');
INSERT INTO `provinces` VALUES ('371082', '山东省', '威海市', '371000', '荣成', '371082', '122.422896', '37.160134');
INSERT INTO `provinces` VALUES ('371083', '山东省', '威海市', '371000', '乳山', '371083', '121.536346', '36.919622');
INSERT INTO `provinces` VALUES ('371100', '山东省', '日照市', '371100', '日照', '371100', '119.461208', '35.428588');
INSERT INTO `provinces` VALUES ('371102', '山东省', '日照市', '371100', '东港区', '371102', '119.457703', '35.426152');
INSERT INTO `provinces` VALUES ('371103', '山东省', '日照市', '371100', '岚山', '371103', '119.315844', '35.119794');
INSERT INTO `provinces` VALUES ('371121', '山东省', '日照市', '371100', '五莲', '371121', '119.206745', '35.751936');
INSERT INTO `provinces` VALUES ('371122', '山东省', '日照市', '371100', '莒县', '371122', '118.832859', '35.588115');
INSERT INTO `provinces` VALUES ('371300', '山东省', '临沂市', '371300', '临沂', '371300', '118.326443', '35.065282');
INSERT INTO `provinces` VALUES ('371302', '山东省', '临沂市', '371300', '兰山', '371302', '118.327667', '35.061631');
INSERT INTO `provinces` VALUES ('371311', '山东省', '临沂市', '371300', '罗庄', '371311', '118.284795', '34.997204');
INSERT INTO `provinces` VALUES ('371312', '山东省', '临沂市', '371300', '河东区', '371312', '118.398296', '35.085004');
INSERT INTO `provinces` VALUES ('371321', '山东省', '临沂市', '371300', '沂南', '371321', '118.455395', '35.547002');
INSERT INTO `provinces` VALUES ('371322', '山东省', '临沂市', '371300', '郯城', '371322', '118.342963', '34.614741');
INSERT INTO `provinces` VALUES ('371323', '山东省', '临沂市', '371300', '沂水', '371323', '118.634543', '35.787029');
INSERT INTO `provinces` VALUES ('371324', '山东省', '临沂市', '371300', '兰陵', '371324', '118.049968', '34.855573');
INSERT INTO `provinces` VALUES ('371325', '山东省', '临沂市', '371300', '费县', '371325', '117.968869', '35.269174');
INSERT INTO `provinces` VALUES ('371326', '山东省', '临沂市', '371300', '平邑', '371326', '117.631884', '35.511519');
INSERT INTO `provinces` VALUES ('371327', '山东省', '临沂市', '371300', '莒南', '371327', '118.838322', '35.175911');
INSERT INTO `provinces` VALUES ('371328', '山东省', '临沂市', '371300', '蒙阴', '371328', '117.943271', '35.712435');
INSERT INTO `provinces` VALUES ('371329', '山东省', '临沂市', '371300', '临沭', '371329', '118.648379', '34.917062');
INSERT INTO `provinces` VALUES ('371400', '山东省', '德州市', '371400', '德州', '371400', '116.307428', '37.453968');
INSERT INTO `provinces` VALUES ('371402', '山东省', '德州市', '371400', '德城', '371402', '116.307076', '37.453923');
INSERT INTO `provinces` VALUES ('371403', '山东省', '德州市', '371400', '陵城', '371403', '116.574929', '37.332848');
INSERT INTO `provinces` VALUES ('371422', '山东省', '德州市', '371400', '宁津', '371422', '116.79372', '37.649619');
INSERT INTO `provinces` VALUES ('371423', '山东省', '德州市', '371400', '庆云', '371423', '117.390507', '37.777724');
INSERT INTO `provinces` VALUES ('371424', '山东省', '德州市', '371400', '临邑', '371424', '116.867028', '37.192044');
INSERT INTO `provinces` VALUES ('371425', '山东省', '德州市', '371400', '齐河', '371425', '116.758394', '36.795497');
INSERT INTO `provinces` VALUES ('371426', '山东省', '德州市', '371400', '平原', '371426', '116.433904', '37.164465');
INSERT INTO `provinces` VALUES ('371427', '山东省', '德州市', '371400', '夏津', '371427', '116.003816', '36.950501');
INSERT INTO `provinces` VALUES ('371428', '山东省', '德州市', '371400', '武城', '371428', '116.078627', '37.209527');
INSERT INTO `provinces` VALUES ('371481', '山东省', '德州市', '371400', '乐陵', '371481', '117.216657', '37.729115');
INSERT INTO `provinces` VALUES ('371482', '山东省', '德州市', '371400', '禹城', '371482', '116.642554', '36.934485');
INSERT INTO `provinces` VALUES ('371500', '山东省', '聊城市', '371500', '聊城', '371500', '115.980367', '36.456013');
INSERT INTO `provinces` VALUES ('371502', '山东省', '聊城市', '371500', '东昌府', '371502', '115.980023', '36.45606');
INSERT INTO `provinces` VALUES ('371521', '山东省', '聊城市', '371500', '阳谷', '371521', '115.784287', '36.113708');
INSERT INTO `provinces` VALUES ('371522', '山东省', '聊城市', '371500', '莘县', '371522', '115.667291', '36.237597');
INSERT INTO `provinces` VALUES ('371523', '山东省', '聊城市', '371500', '茌平', '371523', '116.25335', '36.591934');
INSERT INTO `provinces` VALUES ('371524', '山东省', '聊城市', '371500', '东阿', '371524', '116.248855', '36.336004');
INSERT INTO `provinces` VALUES ('371525', '山东省', '聊城市', '371500', '冠县', '371525', '115.444808', '36.483753');
INSERT INTO `provinces` VALUES ('371526', '山东省', '聊城市', '371500', '高唐', '371526', '116.229662', '36.859755');
INSERT INTO `provinces` VALUES ('371581', '山东省', '聊城市', '371500', '临清', '371581', '115.713462', '36.842598');
INSERT INTO `provinces` VALUES ('371600', '山东省', '滨州市', '371600', '滨州', '371600', '118.016974', '37.383542');
INSERT INTO `provinces` VALUES ('371602', '山东省', '滨州市', '371600', '滨城', '371602', '118.020149', '37.384842');
INSERT INTO `provinces` VALUES ('371603', '山东省', '滨州市', '371600', '沾化', '371603', '118.129902', '37.698456');
INSERT INTO `provinces` VALUES ('371621', '山东省', '滨州市', '371600', '惠民', '371621', '117.508941', '37.483876');
INSERT INTO `provinces` VALUES ('371622', '山东省', '滨州市', '371600', '阳信', '371622', '117.581326', '37.640492');
INSERT INTO `provinces` VALUES ('371623', '山东省', '滨州市', '371600', '无棣', '371623', '117.616325', '37.740848');
INSERT INTO `provinces` VALUES ('371625', '山东省', '滨州市', '371600', '博兴', '371625', '118.123096', '37.147002');
INSERT INTO `provinces` VALUES ('371681', '山东省', '滨州市', '371600', '邹平', '371681', '117.736807', '36.87803');
INSERT INTO `provinces` VALUES ('371700', '山东省', '菏泽市', '371700', '菏泽', '371700', '115.469381', '35.246531');
INSERT INTO `provinces` VALUES ('371702', '山东省', '菏泽市', '371700', '牡丹', '371702', '115.470946', '35.24311');
INSERT INTO `provinces` VALUES ('371703', '山东省', '菏泽市', '371700', '定陶', '371703', '115.569601', '35.072701');
INSERT INTO `provinces` VALUES ('371721', '山东省', '菏泽市', '371700', '曹县', '371721', '115.549482', '34.823253');
INSERT INTO `provinces` VALUES ('371722', '山东省', '菏泽市', '371700', '单县', '371722', '116.08262', '34.790851');
INSERT INTO `provinces` VALUES ('371723', '山东省', '菏泽市', '371700', '成武', '371723', '115.897349', '34.947366');
INSERT INTO `provinces` VALUES ('371724', '山东省', '菏泽市', '371700', '巨野', '371724', '116.089341', '35.390999');
INSERT INTO `provinces` VALUES ('371725', '山东省', '菏泽市', '371700', '郓城', '371725', '115.93885', '35.594773');
INSERT INTO `provinces` VALUES ('371726', '山东省', '菏泽市', '371700', '鄄城', '371726', '115.51434', '35.560257');
INSERT INTO `provinces` VALUES ('371728', '山东省', '菏泽市', '371700', '东明', '371728', '115.098412', '35.289637');
INSERT INTO `provinces` VALUES ('410100', '河南省', '郑州市', '410100', '郑州', '410100', '113.665412', '34.757975');
INSERT INTO `provinces` VALUES ('410102', '河南省', '郑州市', '410100', '中原', '410102', '113.611576', '34.748286');
INSERT INTO `provinces` VALUES ('410103', '河南省', '郑州市', '410100', '二七区', '410103', '113.645422', '34.730936');
INSERT INTO `provinces` VALUES ('410104', '河南省', '郑州市', '410100', '管城', '410104', '113.685313', '34.746453');
INSERT INTO `provinces` VALUES ('410105', '河南省', '郑州市', '410100', '金水', '410105', '113.686037', '34.775838');
INSERT INTO `provinces` VALUES ('410106', '河南省', '郑州市', '410100', '上街', '410106', '113.298282', '34.808689');
INSERT INTO `provinces` VALUES ('410108', '河南省', '郑州市', '410100', '惠济', '410108', '113.61836', '34.828591');
INSERT INTO `provinces` VALUES ('410122', '河南省', '郑州市', '410100', '中牟', '410122', '114.022521', '34.721976');
INSERT INTO `provinces` VALUES ('410181', '河南省', '郑州市', '410100', '巩义', '410181', '112.98283', '34.75218');
INSERT INTO `provinces` VALUES ('410182', '河南省', '郑州市', '410100', '荥阳', '410182', '113.391523', '34.789077');
INSERT INTO `provinces` VALUES ('410183', '河南省', '郑州市', '410100', '新密', '410183', '113.380616', '34.537846');
INSERT INTO `provinces` VALUES ('410184', '河南省', '郑州市', '410100', '新郑', '410184', '113.73967', '34.394219');
INSERT INTO `provinces` VALUES ('410185', '河南省', '郑州市', '410100', '登封', '410185', '113.037768', '34.459939');
INSERT INTO `provinces` VALUES ('410200', '河南省', '开封市', '410200', '开封', '410200', '114.341447', '34.797049');
INSERT INTO `provinces` VALUES ('410202', '河南省', '开封市', '410200', '龙亭', '410202', '114.353348', '34.799833');
INSERT INTO `provinces` VALUES ('410203', '河南省', '开封市', '410200', '顺河', '410203', '114.364875', '34.800459');
INSERT INTO `provinces` VALUES ('410204', '河南省', '开封市', '410200', '鼓楼区', '410204', '114.3485', '34.792383');
INSERT INTO `provinces` VALUES ('410205', '河南省', '开封市', '410200', '禹王台', '410205', '114.350246', '34.779727');
INSERT INTO `provinces` VALUES ('410212', '河南省', '开封市', '410200', '祥符', '410212', '114.437622', '34.756476');
INSERT INTO `provinces` VALUES ('410221', '河南省', '开封市', '410200', '杞县', '410221', '114.770472', '34.554585');
INSERT INTO `provinces` VALUES ('410222', '河南省', '开封市', '410200', '通许', '410222', '114.467734', '34.477302');
INSERT INTO `provinces` VALUES ('410223', '河南省', '开封市', '410200', '尉氏', '410223', '114.193927', '34.412256');
INSERT INTO `provinces` VALUES ('410225', '河南省', '开封市', '410200', '兰考', '410225', '114.820572', '34.829899');
INSERT INTO `provinces` VALUES ('410300', '河南省', '洛阳市', '410300', '洛阳', '410300', '112.434468', '34.663041');
INSERT INTO `provinces` VALUES ('410302', '河南省', '洛阳市', '410300', '老城区', '410302', '112.477298', '34.682945');
INSERT INTO `provinces` VALUES ('410303', '河南省', '洛阳市', '410300', '西工', '410303', '112.443232', '34.667847');
INSERT INTO `provinces` VALUES ('410304', '河南省', '洛阳市', '410300', '瀍河', '410304', '112.491625', '34.684738');
INSERT INTO `provinces` VALUES ('410305', '河南省', '洛阳市', '410300', '涧西', '410305', '112.399243', '34.654251');
INSERT INTO `provinces` VALUES ('410306', '河南省', '洛阳市', '410300', '吉利', '410306', '112.584796', '34.899093');
INSERT INTO `provinces` VALUES ('410311', '河南省', '洛阳市', '410300', '洛龙', '410311', '112.456634', '34.618557');
INSERT INTO `provinces` VALUES ('410322', '河南省', '洛阳市', '410300', '孟津', '410322', '112.443892', '34.826485');
INSERT INTO `provinces` VALUES ('410323', '河南省', '洛阳市', '410300', '新安', '410323', '112.141403', '34.728679');
INSERT INTO `provinces` VALUES ('410324', '河南省', '洛阳市', '410300', '栾川', '410324', '111.618386', '33.783195');
INSERT INTO `provinces` VALUES ('410325', '河南省', '洛阳市', '410300', '嵩县', '410325', '112.087765', '34.131563');
INSERT INTO `provinces` VALUES ('410326', '河南省', '洛阳市', '410300', '汝阳', '410326', '112.473789', '34.15323');
INSERT INTO `provinces` VALUES ('410327', '河南省', '洛阳市', '410300', '宜阳', '410327', '112.179989', '34.516478');
INSERT INTO `provinces` VALUES ('410328', '河南省', '洛阳市', '410300', '洛宁', '410328', '111.655399', '34.387179');
INSERT INTO `provinces` VALUES ('410329', '河南省', '洛阳市', '410300', '伊川', '410329', '112.429384', '34.423416');
INSERT INTO `provinces` VALUES ('410381', '河南省', '洛阳市', '410300', '偃师', '410381', '112.787739', '34.723042');
INSERT INTO `provinces` VALUES ('410400', '河南省', '平顶山市', '410400', '平顶山', '410400', '113.307718', '33.735241');
INSERT INTO `provinces` VALUES ('410402', '河南省', '平顶山市', '410400', '新华区', '410402', '113.299061', '33.737579');
INSERT INTO `provinces` VALUES ('410403', '河南省', '平顶山市', '410400', '卫东', '410403', '113.310327', '33.739285');
INSERT INTO `provinces` VALUES ('410404', '河南省', '平顶山市', '410400', '石龙', '410404', '112.889885', '33.901538');
INSERT INTO `provinces` VALUES ('410411', '河南省', '平顶山市', '410400', '湛河', '410411', '113.320873', '33.725681');
INSERT INTO `provinces` VALUES ('410421', '河南省', '平顶山市', '410400', '宝丰', '410421', '113.066812', '33.866359');
INSERT INTO `provinces` VALUES ('410422', '河南省', '平顶山市', '410400', '叶县', '410422', '113.358298', '33.621252');
INSERT INTO `provinces` VALUES ('410423', '河南省', '平顶山市', '410400', '鲁山', '410423', '112.906703', '33.740325');
INSERT INTO `provinces` VALUES ('410425', '河南省', '平顶山市', '410400', '郏县', '410425', '113.220451', '33.971993');
INSERT INTO `provinces` VALUES ('410481', '河南省', '平顶山市', '410400', '舞钢', '410481', '113.52625', '33.302082');
INSERT INTO `provinces` VALUES ('410482', '河南省', '平顶山市', '410400', '汝州', '410482', '112.845336', '34.167408');
INSERT INTO `provinces` VALUES ('410500', '河南省', '安阳市', '410500', '安阳', '410500', '114.352482', '36.103442');
INSERT INTO `provinces` VALUES ('410502', '河南省', '安阳市', '410500', '文峰', '410502', '114.352562', '36.098101');
INSERT INTO `provinces` VALUES ('410503', '河南省', '安阳市', '410500', '北关', '410503', '114.352646', '36.10978');
INSERT INTO `provinces` VALUES ('410505', '河南省', '安阳市', '410500', '殷都', '410505', '114.300098', '36.108974');
INSERT INTO `provinces` VALUES ('410506', '河南省', '安阳市', '410500', '龙安', '410506', '114.323522', '36.095568');
INSERT INTO `provinces` VALUES ('410522', '河南省', '安阳市', '410500', '安阳县', '410522', '114.23838', '36.218907');
INSERT INTO `provinces` VALUES ('410523', '河南省', '安阳市', '410500', '汤阴', '410523', '114.362357', '35.922349');
INSERT INTO `provinces` VALUES ('410526', '河南省', '安阳市', '410500', '滑县', '410526', '114.524', '35.574628');
INSERT INTO `provinces` VALUES ('410527', '河南省', '安阳市', '410500', '内黄', '410527', '114.904582', '35.953702');
INSERT INTO `provinces` VALUES ('410581', '河南省', '安阳市', '410500', '林州', '410581', '113.823767', '36.063403');
INSERT INTO `provinces` VALUES ('410600', '河南省', '鹤壁市', '410600', '鹤壁', '410600', '114.295444', '35.748236');
INSERT INTO `provinces` VALUES ('410602', '河南省', '鹤壁市', '410600', '鹤山区', '410602', '114.166551', '35.936128');
INSERT INTO `provinces` VALUES ('410603', '河南省', '鹤壁市', '410600', '山城', '410603', '114.184202', '35.896058');
INSERT INTO `provinces` VALUES ('410611', '河南省', '鹤壁市', '410600', '淇滨', '410611', '114.293917', '35.748382');
INSERT INTO `provinces` VALUES ('410621', '河南省', '鹤壁市', '410600', '浚县', '410621', '114.550162', '35.671282');
INSERT INTO `provinces` VALUES ('410622', '河南省', '鹤壁市', '410600', '淇县', '410622', '114.200379', '35.609478');
INSERT INTO `provinces` VALUES ('410700', '河南省', '新乡市', '410700', '新乡', '410700', '113.806186', '35.190021');
INSERT INTO `provinces` VALUES ('410702', '河南省', '新乡市', '410700', '红旗', '410702', '113.878158', '35.302684');
INSERT INTO `provinces` VALUES ('410703', '河南省', '新乡市', '410700', '卫滨', '410703', '113.866065', '35.304905');
INSERT INTO `provinces` VALUES ('410704', '河南省', '新乡市', '410700', '凤泉', '410704', '113.906712', '35.379855');
INSERT INTO `provinces` VALUES ('410711', '河南省', '新乡市', '410700', '牧野', '410711', '113.89716', '35.312974');
INSERT INTO `provinces` VALUES ('410721', '河南省', '新乡市', '410700', '新乡县', '410721', '113.81159', '35.19564');
INSERT INTO `provinces` VALUES ('410724', '河南省', '新乡市', '410700', '获嘉', '410724', '113.657249', '35.261685');
INSERT INTO `provinces` VALUES ('410725', '河南省', '新乡市', '410700', '原阳', '410725', '113.965966', '35.054001');
INSERT INTO `provinces` VALUES ('410726', '河南省', '新乡市', '410700', '延津', '410726', '114.200982', '35.149515');
INSERT INTO `provinces` VALUES ('410727', '河南省', '新乡市', '410700', '封丘', '410727', '114.423405', '35.04057');
INSERT INTO `provinces` VALUES ('410728', '河南省', '新乡市', '410700', '长垣', '410728', '114.673807', '35.19615');
INSERT INTO `provinces` VALUES ('410781', '河南省', '新乡市', '410700', '卫辉', '410781', '114.065855', '35.404295');
INSERT INTO `provinces` VALUES ('410782', '河南省', '新乡市', '410700', '辉县', '410782', '113.802518', '35.461318');
INSERT INTO `provinces` VALUES ('410800', '河南省', '焦作市', '410800', '焦作', '410800', '113.238266', '35.23904');
INSERT INTO `provinces` VALUES ('410802', '河南省', '焦作市', '410800', '解放', '410802', '113.226126', '35.241353');
INSERT INTO `provinces` VALUES ('410803', '河南省', '焦作市', '410800', '中站', '410803', '113.175485', '35.236145');
INSERT INTO `provinces` VALUES ('410804', '河南省', '焦作市', '410800', '马村', '410804', '113.321703', '35.265453');
INSERT INTO `provinces` VALUES ('410811', '河南省', '焦作市', '410800', '山阳区', '410811', '113.26766', '35.21476');
INSERT INTO `provinces` VALUES ('410821', '河南省', '焦作市', '410800', '修武', '410821', '113.447465', '35.229923');
INSERT INTO `provinces` VALUES ('410822', '河南省', '焦作市', '410800', '博爱', '410822', '113.069313', '35.170351');
INSERT INTO `provinces` VALUES ('410823', '河南省', '焦作市', '410800', '武陟', '410823', '113.408334', '35.09885');
INSERT INTO `provinces` VALUES ('410825', '河南省', '焦作市', '410800', '温县', '410825', '113.079118', '34.941233');
INSERT INTO `provinces` VALUES ('410882', '河南省', '焦作市', '410800', '沁阳', '410882', '112.934538', '35.08901');
INSERT INTO `provinces` VALUES ('410883', '河南省', '焦作市', '410800', '孟州', '410883', '112.78708', '34.90963');
INSERT INTO `provinces` VALUES ('410900', '河南省', '濮阳市', '410900', '濮阳', '410900', '115.041299', '35.768234');
INSERT INTO `provinces` VALUES ('410902', '河南省', '濮阳市', '410900', '华龙', '410902', '115.03184', '35.760473');
INSERT INTO `provinces` VALUES ('410922', '河南省', '濮阳市', '410900', '清丰', '410922', '115.107287', '35.902413');
INSERT INTO `provinces` VALUES ('410923', '河南省', '濮阳市', '410900', '南乐', '410923', '115.204336', '36.075204');
INSERT INTO `provinces` VALUES ('410926', '河南省', '濮阳市', '410900', '范县', '410926', '115.504212', '35.851977');
INSERT INTO `provinces` VALUES ('410927', '河南省', '濮阳市', '410900', '台前', '410927', '115.855681', '35.996474');
INSERT INTO `provinces` VALUES ('410928', '河南省', '濮阳市', '410900', '濮阳县', '410928', '115.035584', '35.717889');
INSERT INTO `provinces` VALUES ('411000', '河南省', '许昌市', '411000', '许昌', '411000', '113.826063', '34.022956');
INSERT INTO `provinces` VALUES ('411002', '河南省', '许昌市', '411000', '魏都', '411002', '113.828307', '34.02711');
INSERT INTO `provinces` VALUES ('411003', '河南省', '许昌市', '411000', '建安', '411003', '113.829043', '34.130445');
INSERT INTO `provinces` VALUES ('411024', '河南省', '许昌市', '411000', '鄢陵', '411024', '114.188507', '34.100502');
INSERT INTO `provinces` VALUES ('411025', '河南省', '许昌市', '411000', '襄城', '411025', '113.493166', '33.855943');
INSERT INTO `provinces` VALUES ('411081', '河南省', '许昌市', '411000', '禹州', '411081', '113.471316', '34.154403');
INSERT INTO `provinces` VALUES ('411082', '河南省', '许昌市', '411000', '长葛', '411082', '113.768912', '34.219257');
INSERT INTO `provinces` VALUES ('411100', '河南省', '漯河市', '411100', '漯河', '411100', '114.026405', '33.575855');
INSERT INTO `provinces` VALUES ('411102', '河南省', '漯河市', '411100', '源汇', '411102', '114.017948', '33.565441');
INSERT INTO `provinces` VALUES ('411103', '河南省', '漯河市', '411100', '郾城', '411103', '114.016813', '33.588897');
INSERT INTO `provinces` VALUES ('411104', '河南省', '漯河市', '411100', '召陵', '411104', '114.051686', '33.567555');
INSERT INTO `provinces` VALUES ('411121', '河南省', '漯河市', '411100', '舞阳', '411121', '113.610565', '33.436278');
INSERT INTO `provinces` VALUES ('411122', '河南省', '漯河市', '411100', '临颍', '411122', '113.938891', '33.80609');
INSERT INTO `provinces` VALUES ('411200', '河南省', '三门峡市', '411200', '三门峡', '411200', '111.194099', '34.777338');
INSERT INTO `provinces` VALUES ('411202', '河南省', '三门峡市', '411200', '湖滨区', '411202', '111.19487', '34.77812');
INSERT INTO `provinces` VALUES ('411203', '河南省', '三门峡市', '411200', '陕州', '411203', '111.103851', '34.720244');
INSERT INTO `provinces` VALUES ('411221', '河南省', '三门峡市', '411200', '渑池', '411221', '111.762992', '34.763487');
INSERT INTO `provinces` VALUES ('411224', '河南省', '三门峡市', '411200', '卢氏', '411224', '111.052649', '34.053995');
INSERT INTO `provinces` VALUES ('411281', '河南省', '三门峡市', '411200', '义马', '411281', '111.869417', '34.746868');
INSERT INTO `provinces` VALUES ('411282', '河南省', '三门峡市', '411200', '灵宝', '411282', '110.88577', '34.521264');
INSERT INTO `provinces` VALUES ('411300', '河南省', '南阳市', '411300', '南阳', '411300', '112.540918', '32.999082');
INSERT INTO `provinces` VALUES ('411302', '河南省', '南阳市', '411300', '宛城', '411302', '112.544591', '32.994857');
INSERT INTO `provinces` VALUES ('411303', '河南省', '南阳市', '411300', '卧龙', '411303', '112.528789', '32.989877');
INSERT INTO `provinces` VALUES ('411321', '河南省', '南阳市', '411300', '南召', '411321', '112.435583', '33.488617');
INSERT INTO `provinces` VALUES ('411322', '河南省', '南阳市', '411300', '方城', '411322', '113.010933', '33.255138');
INSERT INTO `provinces` VALUES ('411323', '河南省', '南阳市', '411300', '西峡', '411323', '111.485772', '33.302981');
INSERT INTO `provinces` VALUES ('411324', '河南省', '南阳市', '411300', '镇平', '411324', '112.232722', '33.036651');
INSERT INTO `provinces` VALUES ('411325', '河南省', '南阳市', '411300', '内乡', '411325', '111.843801', '33.046358');
INSERT INTO `provinces` VALUES ('411326', '河南省', '南阳市', '411300', '淅川', '411326', '111.489026', '33.136106');
INSERT INTO `provinces` VALUES ('411327', '河南省', '南阳市', '411300', '社旗', '411327', '112.938279', '33.056126');
INSERT INTO `provinces` VALUES ('411328', '河南省', '南阳市', '411300', '唐河', '411328', '112.838492', '32.687892');
INSERT INTO `provinces` VALUES ('411329', '河南省', '南阳市', '411300', '新野', '411329', '112.365624', '32.524006');
INSERT INTO `provinces` VALUES ('411330', '河南省', '南阳市', '411300', '桐柏', '411330', '113.406059', '32.367153');
INSERT INTO `provinces` VALUES ('411381', '河南省', '南阳市', '411300', '邓州', '411381', '112.092716', '32.681642');
INSERT INTO `provinces` VALUES ('411400', '河南省', '商丘市', '411400', '商丘', '411400', '115.650497', '34.437054');
INSERT INTO `provinces` VALUES ('411402', '河南省', '商丘市', '411400', '梁园', '411402', '115.65459', '34.436553');
INSERT INTO `provinces` VALUES ('411403', '河南省', '商丘市', '411400', '睢阳', '411403', '115.653813', '34.390536');
INSERT INTO `provinces` VALUES ('411421', '河南省', '商丘市', '411400', '民权', '411421', '115.148146', '34.648455');
INSERT INTO `provinces` VALUES ('411422', '河南省', '商丘市', '411400', '睢县', '411422', '115.070109', '34.428433');
INSERT INTO `provinces` VALUES ('411423', '河南省', '商丘市', '411400', '宁陵', '411423', '115.320055', '34.449299');
INSERT INTO `provinces` VALUES ('411424', '河南省', '商丘市', '411400', '柘城', '411424', '115.307433', '34.075277');
INSERT INTO `provinces` VALUES ('411425', '河南省', '商丘市', '411400', '虞城', '411425', '115.863811', '34.399634');
INSERT INTO `provinces` VALUES ('411426', '河南省', '商丘市', '411400', '夏邑', '411426', '116.13989', '34.240894');
INSERT INTO `provinces` VALUES ('411481', '河南省', '商丘市', '411400', '永城', '411481', '116.449672', '33.931318');
INSERT INTO `provinces` VALUES ('411500', '河南省', '信阳市', '411500', '信阳', '411500', '114.075031', '32.123274');
INSERT INTO `provinces` VALUES ('411502', '河南省', '信阳市', '411500', '浉河', '411502', '114.075031', '32.123274');
INSERT INTO `provinces` VALUES ('411503', '河南省', '信阳市', '411500', '平桥', '411503', '114.126027', '32.098395');
INSERT INTO `provinces` VALUES ('411521', '河南省', '信阳市', '411500', '罗山', '411521', '114.533414', '32.203206');
INSERT INTO `provinces` VALUES ('411522', '河南省', '信阳市', '411500', '光山', '411522', '114.903577', '32.010398');
INSERT INTO `provinces` VALUES ('411523', '河南省', '信阳市', '411500', '新县', '411523', '114.87705', '31.63515');
INSERT INTO `provinces` VALUES ('411524', '河南省', '信阳市', '411500', '商城', '411524', '115.406297', '31.799982');
INSERT INTO `provinces` VALUES ('411525', '河南省', '信阳市', '411500', '固始', '411525', '115.667328', '32.183074');
INSERT INTO `provinces` VALUES ('411526', '河南省', '信阳市', '411500', '潢川', '411526', '115.050123', '32.134024');
INSERT INTO `provinces` VALUES ('411527', '河南省', '信阳市', '411500', '淮滨', '411527', '115.415451', '32.452639');
INSERT INTO `provinces` VALUES ('411528', '河南省', '信阳市', '411500', '息县', '411528', '114.740713', '32.344744');
INSERT INTO `provinces` VALUES ('411600', '河南省', '周口市', '411600', '周口', '411600', '114.649653', '33.620357');
INSERT INTO `provinces` VALUES ('411602', '河南省', '周口市', '411600', '川汇', '411602', '114.652136', '33.614836');
INSERT INTO `provinces` VALUES ('411621', '河南省', '周口市', '411600', '扶沟', '411621', '114.392008', '34.054061');
INSERT INTO `provinces` VALUES ('411622', '河南省', '周口市', '411600', '西华', '411622', '114.530067', '33.784378');
INSERT INTO `provinces` VALUES ('411623', '河南省', '周口市', '411600', '商水', '411623', '114.60927', '33.543845');
INSERT INTO `provinces` VALUES ('411624', '河南省', '周口市', '411600', '沈丘', '411624', '115.078375', '33.395514');
INSERT INTO `provinces` VALUES ('411625', '河南省', '周口市', '411600', '郸城', '411625', '115.189', '33.643852');
INSERT INTO `provinces` VALUES ('411626', '河南省', '周口市', '411600', '淮阳', '411626', '114.870166', '33.732547');
INSERT INTO `provinces` VALUES ('411627', '河南省', '周口市', '411600', '太康', '411627', '114.853834', '34.065312');
INSERT INTO `provinces` VALUES ('411628', '河南省', '周口市', '411600', '鹿邑', '411628', '115.486386', '33.861067');
INSERT INTO `provinces` VALUES ('411681', '河南省', '周口市', '411600', '项城', '411681', '114.899521', '33.443085');
INSERT INTO `provinces` VALUES ('411700', '河南省', '驻马店市', '411700', '驻马店', '411700', '114.024736', '32.980169');
INSERT INTO `provinces` VALUES ('411702', '河南省', '驻马店市', '411700', '驿城', '411702', '114.029149', '32.977559');
INSERT INTO `provinces` VALUES ('411721', '河南省', '驻马店市', '411700', '西平', '411721', '114.026864', '33.382315');
INSERT INTO `provinces` VALUES ('411722', '河南省', '驻马店市', '411700', '上蔡', '411722', '114.266892', '33.264719');
INSERT INTO `provinces` VALUES ('411723', '河南省', '驻马店市', '411700', '平舆', '411723', '114.637105', '32.955626');
INSERT INTO `provinces` VALUES ('411724', '河南省', '驻马店市', '411700', '正阳', '411724', '114.38948', '32.601826');
INSERT INTO `provinces` VALUES ('411725', '河南省', '驻马店市', '411700', '确山', '411725', '114.026679', '32.801538');
INSERT INTO `provinces` VALUES ('411726', '河南省', '驻马店市', '411700', '泌阳', '411726', '113.32605', '32.725129');
INSERT INTO `provinces` VALUES ('411727', '河南省', '驻马店市', '411700', '汝南', '411727', '114.359495', '33.004535');
INSERT INTO `provinces` VALUES ('411728', '河南省', '驻马店市', '411700', '遂平', '411728', '114.00371', '33.14698');
INSERT INTO `provinces` VALUES ('411729', '河南省', '驻马店市', '411700', '新蔡', '411729', '114.975246', '32.749948');
INSERT INTO `provinces` VALUES ('419001', '河南省', '济源市', '419001', '济源', '419001', '112.590047', '35.090378');
INSERT INTO `provinces` VALUES ('420100', '湖北省', '武汉市', '420100', '武汉', '420100', '114.298572', '30.584355');
INSERT INTO `provinces` VALUES ('420102', '湖北省', '武汉市', '420100', '江岸', '420102', '114.30304', '30.594911');
INSERT INTO `provinces` VALUES ('420103', '湖北省', '武汉市', '420100', '江汉', '420103', '114.283109', '30.578771');
INSERT INTO `provinces` VALUES ('420104', '湖北省', '武汉市', '420100', '硚口', '420104', '114.264568', '30.57061');
INSERT INTO `provinces` VALUES ('420105', '湖北省', '武汉市', '420100', '汉阳', '420105', '114.265807', '30.549326');
INSERT INTO `provinces` VALUES ('420106', '湖北省', '武汉市', '420100', '武昌', '420106', '114.307344', '30.546536');
INSERT INTO `provinces` VALUES ('420107', '湖北省', '武汉市', '420100', '青山', '420107', '114.39707', '30.634215');
INSERT INTO `provinces` VALUES ('420111', '湖北省', '武汉市', '420100', '洪山', '420111', '114.400718', '30.504259');
INSERT INTO `provinces` VALUES ('420112', '湖北省', '武汉市', '420100', '东西湖', '420112', '114.142483', '30.622467');
INSERT INTO `provinces` VALUES ('420113', '湖北省', '武汉市', '420100', '汉南', '420113', '114.08124', '30.309637');
INSERT INTO `provinces` VALUES ('420114', '湖北省', '武汉市', '420100', '蔡甸', '420114', '114.029341', '30.582186');
INSERT INTO `provinces` VALUES ('420115', '湖北省', '武汉市', '420100', '江夏', '420115', '114.313961', '30.349045');
INSERT INTO `provinces` VALUES ('420116', '湖北省', '武汉市', '420100', '黄陂', '420116', '114.374025', '30.874155');
INSERT INTO `provinces` VALUES ('420117', '湖北省', '武汉市', '420100', '新洲', '420117', '114.802108', '30.842149');
INSERT INTO `provinces` VALUES ('420200', '湖北省', '黄石市', '420200', '黄石', '420200', '115.077048', '30.220074');
INSERT INTO `provinces` VALUES ('420202', '湖北省', '黄石市', '420200', '黄石港', '420202', '115.090164', '30.212086');
INSERT INTO `provinces` VALUES ('420203', '湖北省', '黄石市', '420200', '西塞山', '420203', '115.093354', '30.205365');
INSERT INTO `provinces` VALUES ('420204', '湖北省', '黄石市', '420200', '下陆', '420204', '114.975755', '30.177845');
INSERT INTO `provinces` VALUES ('420205', '湖北省', '黄石市', '420200', '铁山', '420205', '114.901366', '30.20601');
INSERT INTO `provinces` VALUES ('420222', '湖北省', '黄石市', '420200', '阳新', '420222', '115.212883', '29.841572');
INSERT INTO `provinces` VALUES ('420281', '湖北省', '黄石市', '420200', '大冶', '420281', '114.974842', '30.098804');
INSERT INTO `provinces` VALUES ('420300', '湖北省', '十堰市', '420300', '十堰', '420300', '110.787916', '32.646907');
INSERT INTO `provinces` VALUES ('420302', '湖北省', '十堰市', '420300', '茅箭', '420302', '110.78621', '32.644463');
INSERT INTO `provinces` VALUES ('420303', '湖北省', '十堰市', '420300', '张湾', '420303', '110.772365', '32.652516');
INSERT INTO `provinces` VALUES ('420304', '湖北省', '十堰市', '420300', '郧阳', '420304', '110.812099', '32.838267');
INSERT INTO `provinces` VALUES ('420322', '湖北省', '十堰市', '420300', '郧西', '420322', '110.426472', '32.991457');
INSERT INTO `provinces` VALUES ('420323', '湖北省', '十堰市', '420300', '竹山', '420323', '110.2296', '32.22586');
INSERT INTO `provinces` VALUES ('420324', '湖北省', '十堰市', '420300', '竹溪', '420324', '109.717196', '32.315342');
INSERT INTO `provinces` VALUES ('420325', '湖北省', '十堰市', '420300', '房县', '420325', '110.741966', '32.055002');
INSERT INTO `provinces` VALUES ('420381', '湖北省', '十堰市', '420300', '丹江口', '420381', '111.513793', '32.538839');
INSERT INTO `provinces` VALUES ('420500', '湖北省', '宜昌市', '420500', '宜昌', '420500', '111.290843', '30.702636');
INSERT INTO `provinces` VALUES ('420502', '湖北省', '宜昌市', '420500', '西陵', '420502', '111.295468', '30.702476');
INSERT INTO `provinces` VALUES ('420503', '湖北省', '宜昌市', '420500', '伍家岗', '420503', '111.307215', '30.679053');
INSERT INTO `provinces` VALUES ('420504', '湖北省', '宜昌市', '420500', '点军', '420504', '111.268163', '30.692322');
INSERT INTO `provinces` VALUES ('420505', '湖北省', '宜昌市', '420500', '猇亭', '420505', '111.427642', '30.530744');
INSERT INTO `provinces` VALUES ('420506', '湖北省', '宜昌市', '420500', '夷陵', '420506', '111.326747', '30.770199');
INSERT INTO `provinces` VALUES ('420525', '湖北省', '宜昌市', '420500', '远安', '420525', '111.64331', '31.059626');
INSERT INTO `provinces` VALUES ('420526', '湖北省', '宜昌市', '420500', '兴山', '420526', '110.754499', '31.34795');
INSERT INTO `provinces` VALUES ('420527', '湖北省', '宜昌市', '420500', '秭归', '420527', '110.976785', '30.823908');
INSERT INTO `provinces` VALUES ('420528', '湖北省', '宜昌市', '420500', '长阳', '420528', '111.198475', '30.466534');
INSERT INTO `provinces` VALUES ('420529', '湖北省', '宜昌市', '420500', '五峰', '420529', '110.674938', '30.199252');
INSERT INTO `provinces` VALUES ('420581', '湖北省', '宜昌市', '420500', '宜都', '420581', '111.454367', '30.387234');
INSERT INTO `provinces` VALUES ('420582', '湖北省', '宜昌市', '420500', '当阳', '420582', '111.793419', '30.824492');
INSERT INTO `provinces` VALUES ('420583', '湖北省', '宜昌市', '420500', '枝江', '420583', '111.751799', '30.425364');
INSERT INTO `provinces` VALUES ('420600', '湖北省', '襄阳市', '420600', '襄阳', '420600', '112.144146', '32.042426');
INSERT INTO `provinces` VALUES ('420602', '湖北省', '襄阳市', '420600', '襄城区', '420602', '112.150327', '32.015088');
INSERT INTO `provinces` VALUES ('420606', '湖北省', '襄阳市', '420600', '樊城', '420606', '112.13957', '32.058589');
INSERT INTO `provinces` VALUES ('420607', '湖北省', '襄阳市', '420600', '襄州', '420607', '112.197378', '32.085517');
INSERT INTO `provinces` VALUES ('420624', '湖北省', '襄阳市', '420600', '南漳', '420624', '111.844424', '31.77692');
INSERT INTO `provinces` VALUES ('420625', '湖北省', '襄阳市', '420600', '谷城', '420625', '111.640147', '32.262676');
INSERT INTO `provinces` VALUES ('420626', '湖北省', '襄阳市', '420600', '保康', '420626', '111.262235', '31.873507');
INSERT INTO `provinces` VALUES ('420682', '湖北省', '襄阳市', '420600', '老河口', '420682', '111.675732', '32.385438');
INSERT INTO `provinces` VALUES ('420683', '湖北省', '襄阳市', '420600', '枣阳', '420683', '112.765268', '32.123083');
INSERT INTO `provinces` VALUES ('420684', '湖北省', '襄阳市', '420600', '宜城', '420684', '112.261441', '31.709203');
INSERT INTO `provinces` VALUES ('420700', '湖北省', '鄂州市', '420700', '鄂州', '420700', '114.890593', '30.396536');
INSERT INTO `provinces` VALUES ('420702', '湖北省', '鄂州市', '420700', '梁子湖', '420702', '114.681967', '30.098191');
INSERT INTO `provinces` VALUES ('420703', '湖北省', '鄂州市', '420700', '华容区', '420703', '114.74148', '30.534468');
INSERT INTO `provinces` VALUES ('420704', '湖北省', '鄂州市', '420700', '鄂城', '420704', '114.890012', '30.39669');
INSERT INTO `provinces` VALUES ('420800', '湖北省', '荆门市', '420800', '荆门', '420800', '112.204251', '31.03542');
INSERT INTO `provinces` VALUES ('420802', '湖北省', '荆门市', '420800', '东宝', '420802', '112.204804', '31.033461');
INSERT INTO `provinces` VALUES ('420804', '湖北省', '荆门市', '420800', '掇刀', '420804', '112.198413', '30.980798');
INSERT INTO `provinces` VALUES ('420822', '湖北省', '荆门市', '420800', '沙洋', '420822', '112.595218', '30.70359');
INSERT INTO `provinces` VALUES ('420881', '湖北省', '荆门市', '420800', '钟祥', '420881', '112.587267', '31.165573');
INSERT INTO `provinces` VALUES ('420882', '湖北省', '荆门市', '420800', '京山', '420882', '113.114595', '31.022458');
INSERT INTO `provinces` VALUES ('420900', '湖北省', '孝感市', '420900', '孝感', '420900', '113.926655', '30.926423');
INSERT INTO `provinces` VALUES ('420902', '湖北省', '孝感市', '420900', '孝南', '420902', '113.925849', '30.925966');
INSERT INTO `provinces` VALUES ('420921', '湖北省', '孝感市', '420900', '孝昌', '420921', '113.988964', '31.251618');
INSERT INTO `provinces` VALUES ('420922', '湖北省', '孝感市', '420900', '大悟', '420922', '114.126249', '31.565483');
INSERT INTO `provinces` VALUES ('420923', '湖北省', '孝感市', '420900', '云梦', '420923', '113.750616', '31.021691');
INSERT INTO `provinces` VALUES ('420981', '湖北省', '孝感市', '420900', '应城', '420981', '113.573842', '30.939038');
INSERT INTO `provinces` VALUES ('420982', '湖北省', '孝感市', '420900', '安陆', '420982', '113.690401', '31.26174');
INSERT INTO `provinces` VALUES ('420984', '湖北省', '孝感市', '420900', '汉川', '420984', '113.835301', '30.652165');
INSERT INTO `provinces` VALUES ('421000', '湖北省', '荆州市', '421000', '荆州', '421000', '112.23813', '30.326857');
INSERT INTO `provinces` VALUES ('421002', '湖北省', '荆州市', '421000', '沙市', '421002', '112.257433', '30.315895');
INSERT INTO `provinces` VALUES ('421003', '湖北省', '荆州市', '421000', '荆州区', '421003', '113.114595', '31.022458');
INSERT INTO `provinces` VALUES ('421022', '湖北省', '荆州市', '421000', '公安', '421022', '112.230179', '30.059065');
INSERT INTO `provinces` VALUES ('421023', '湖北省', '荆州市', '421000', '监利', '421023', '112.904344', '29.820079');
INSERT INTO `provinces` VALUES ('421024', '湖北省', '荆州市', '421000', '江陵', '421024', '112.41735', '30.033919');
INSERT INTO `provinces` VALUES ('421081', '湖北省', '荆州市', '421000', '石首', '421081', '112.40887', '29.716437');
INSERT INTO `provinces` VALUES ('421083', '湖北省', '荆州市', '421000', '洪湖', '421083', '113.470304', '29.81297');
INSERT INTO `provinces` VALUES ('421087', '湖北省', '荆州市', '421000', '松滋', '421087', '111.77818', '30.176037');
INSERT INTO `provinces` VALUES ('421100', '湖北省', '黄冈市', '421100', '黄冈', '421100', '114.879365', '30.447711');
INSERT INTO `provinces` VALUES ('421102', '湖北省', '黄冈市', '421100', '黄州', '421102', '114.878934', '30.447435');
INSERT INTO `provinces` VALUES ('421121', '湖北省', '黄冈市', '421100', '团风', '421121', '114.872029', '30.63569');
INSERT INTO `provinces` VALUES ('421122', '湖北省', '黄冈市', '421100', '红安', '421122', '114.615095', '31.284777');
INSERT INTO `provinces` VALUES ('421123', '湖北省', '黄冈市', '421100', '罗田', '421123', '115.398984', '30.781679');
INSERT INTO `provinces` VALUES ('421124', '湖北省', '黄冈市', '421100', '英山', '421124', '115.67753', '30.735794');
INSERT INTO `provinces` VALUES ('421125', '湖北省', '黄冈市', '421100', '浠水', '421125', '115.26344', '30.454837');
INSERT INTO `provinces` VALUES ('421126', '湖北省', '黄冈市', '421100', '蕲春', '421126', '115.433964', '30.234927');
INSERT INTO `provinces` VALUES ('421127', '湖北省', '黄冈市', '421100', '黄梅', '421127', '115.942548', '30.075113');
INSERT INTO `provinces` VALUES ('421181', '湖北省', '黄冈市', '421100', '麻城', '421181', '115.02541', '31.177906');
INSERT INTO `provinces` VALUES ('421182', '湖北省', '黄冈市', '421100', '武穴', '421182', '115.56242', '29.849342');
INSERT INTO `provinces` VALUES ('421200', '湖北省', '咸宁市', '421200', '咸宁', '421200', '114.328963', '29.832798');
INSERT INTO `provinces` VALUES ('421202', '湖北省', '咸宁市', '421200', '咸安', '421202', '114.333894', '29.824716');
INSERT INTO `provinces` VALUES ('421221', '湖北省', '咸宁市', '421200', '嘉鱼', '421221', '113.921547', '29.973363');
INSERT INTO `provinces` VALUES ('421222', '湖北省', '咸宁市', '421200', '通城', '421222', '113.814131', '29.246076');
INSERT INTO `provinces` VALUES ('421223', '湖北省', '咸宁市', '421200', '崇阳', '421223', '114.049958', '29.54101');
INSERT INTO `provinces` VALUES ('421224', '湖北省', '咸宁市', '421200', '通山', '421224', '114.493163', '29.604455');
INSERT INTO `provinces` VALUES ('421281', '湖北省', '咸宁市', '421200', '赤壁', '421281', '113.88366', '29.716879');
INSERT INTO `provinces` VALUES ('421300', '湖北省', '随州市', '421300', '随州', '421300', '113.37377', '31.717497');
INSERT INTO `provinces` VALUES ('421303', '湖北省', '随州市', '421300', '曾都', '421303', '113.374519', '31.717521');
INSERT INTO `provinces` VALUES ('421321', '湖北省', '随州市', '421300', '随县', '421321', '113.301384', '31.854246');
INSERT INTO `provinces` VALUES ('421381', '湖北省', '随州市', '421300', '广水', '421381', '113.826601', '31.617731');
INSERT INTO `provinces` VALUES ('422800', '湖北省', '恩施土家族苗族自治州', '422800', '恩施', '422800', '109.48699', '30.283114');
INSERT INTO `provinces` VALUES ('422801', '湖北省', '恩施土家族苗族自治州', '422800', '恩施市', '422801', '109.48699', '30.283114');
INSERT INTO `provinces` VALUES ('422802', '湖北省', '恩施土家族苗族自治州', '422800', '利川', '422802', '108.943491', '30.294247');
INSERT INTO `provinces` VALUES ('422822', '湖北省', '恩施土家族苗族自治州', '422800', '建始', '422822', '109.723822', '30.601632');
INSERT INTO `provinces` VALUES ('422823', '湖北省', '恩施土家族苗族自治州', '422800', '巴东', '422823', '110.336665', '31.041403');
INSERT INTO `provinces` VALUES ('422825', '湖北省', '恩施土家族苗族自治州', '422800', '宣恩', '422825', '109.482819', '29.98867');
INSERT INTO `provinces` VALUES ('422826', '湖北省', '恩施土家族苗族自治州', '422800', '咸丰', '422826', '109.15041', '29.678967');
INSERT INTO `provinces` VALUES ('422827', '湖北省', '恩施土家族苗族自治州', '422800', '来凤', '422827', '109.408328', '29.506945');
INSERT INTO `provinces` VALUES ('422828', '湖北省', '恩施土家族苗族自治州', '422800', '鹤峰', '422828', '110.033699', '29.887298');
INSERT INTO `provinces` VALUES ('429004', '湖北省', '仙桃市', '429004', '仙桃', '429004', '113.453974', '30.364953');
INSERT INTO `provinces` VALUES ('429005', '湖北省', '潜江市', '429005', '潜江', '429005', '112.896866', '30.421215');
INSERT INTO `provinces` VALUES ('429006', '湖北省', '天门市', '429006', '天门', '429006', '113.165862', '30.653061');
INSERT INTO `provinces` VALUES ('429021', '湖北省', '神农架林区', '429021', '神农架', '429021', '110.671525', '31.744449');
INSERT INTO `provinces` VALUES ('430100', '湖南省', '长沙市', '430100', '长沙', '430100', '112.982279', '28.19409');
INSERT INTO `provinces` VALUES ('430102', '湖南省', '长沙市', '430100', '芙蓉', '430102', '112.988094', '28.193106');
INSERT INTO `provinces` VALUES ('430103', '湖南省', '长沙市', '430100', '天心', '430103', '112.97307', '28.192375');
INSERT INTO `provinces` VALUES ('430104', '湖南省', '长沙市', '430100', '岳麓', '430104', '112.911591', '28.213044');
INSERT INTO `provinces` VALUES ('430105', '湖南省', '长沙市', '430100', '开福', '430105', '112.985525', '28.201336');
INSERT INTO `provinces` VALUES ('430111', '湖南省', '长沙市', '430100', '雨花区', '430111', '113.016337', '28.109937');
INSERT INTO `provinces` VALUES ('430112', '湖南省', '长沙市', '430100', '望城', '430112', '112.819549', '28.347458');
INSERT INTO `provinces` VALUES ('430121', '湖南省', '长沙市', '430100', '长沙县', '430121', '113.080098', '28.237888');
INSERT INTO `provinces` VALUES ('430181', '湖南省', '长沙市', '430100', '浏阳', '430181', '113.633301', '28.141112');
INSERT INTO `provinces` VALUES ('430182', '湖南省', '长沙市', '430100', '宁乡', '430182', '112.553182', '28.253928');
INSERT INTO `provinces` VALUES ('430200', '湖南省', '株洲市', '430200', '株洲', '430200', '113.151737', '27.835806');
INSERT INTO `provinces` VALUES ('430202', '湖南省', '株洲市', '430200', '荷塘', '430202', '113.162548', '27.833036');
INSERT INTO `provinces` VALUES ('430203', '湖南省', '株洲市', '430200', '芦淞', '430203', '113.155169', '27.827246');
INSERT INTO `provinces` VALUES ('430204', '湖南省', '株洲市', '430200', '石峰', '430204', '113.11295', '27.871945');
INSERT INTO `provinces` VALUES ('430211', '湖南省', '株洲市', '430200', '天元', '430211', '113.136252', '27.826909');
INSERT INTO `provinces` VALUES ('430212', '湖南省', '株洲市', '430200', '渌口', '430212', '113.150427', '27.70432');
INSERT INTO `provinces` VALUES ('430223', '湖南省', '株洲市', '430200', '攸县', '430223', '113.345774', '27.000071');
INSERT INTO `provinces` VALUES ('430224', '湖南省', '株洲市', '430200', '茶陵', '430224', '113.546509', '26.789534');
INSERT INTO `provinces` VALUES ('430225', '湖南省', '株洲市', '430200', '炎陵', '430225', '113.776884', '26.489459');
INSERT INTO `provinces` VALUES ('430281', '湖南省', '株洲市', '430200', '醴陵', '430281', '113.507157', '27.657873');
INSERT INTO `provinces` VALUES ('430300', '湖南省', '湘潭市', '430300', '湘潭', '430300', '112.944052', '27.82973');
INSERT INTO `provinces` VALUES ('430302', '湖南省', '湘潭市', '430300', '雨湖', '430302', '112.907427', '27.86077');
INSERT INTO `provinces` VALUES ('430304', '湖南省', '湘潭市', '430300', '岳塘', '430304', '112.927707', '27.828854');
INSERT INTO `provinces` VALUES ('430321', '湖南省', '湘潭市', '430300', '湘潭县', '430321', '112.957505', '27.784983');
INSERT INTO `provinces` VALUES ('430381', '湖南省', '湘潭市', '430300', '湘乡', '430381', '112.525217', '27.734918');
INSERT INTO `provinces` VALUES ('430382', '湖南省', '湘潭市', '430300', '韶山', '430382', '112.52848', '27.922682');
INSERT INTO `provinces` VALUES ('430400', '湖南省', '衡阳市', '430400', '衡阳', '430400', '112.607693', '26.900358');
INSERT INTO `provinces` VALUES ('430405', '湖南省', '衡阳市', '430400', '珠晖', '430405', '112.626324', '26.891063');
INSERT INTO `provinces` VALUES ('430406', '湖南省', '衡阳市', '430400', '雁峰', '430406', '112.612241', '26.893694');
INSERT INTO `provinces` VALUES ('430407', '湖南省', '衡阳市', '430400', '石鼓', '430407', '112.607635', '26.903908');
INSERT INTO `provinces` VALUES ('430408', '湖南省', '衡阳市', '430400', '蒸湘', '430408', '112.570608', '26.89087');
INSERT INTO `provinces` VALUES ('430412', '湖南省', '衡阳市', '430400', '南岳', '430412', '112.734147', '27.240536');
INSERT INTO `provinces` VALUES ('430421', '湖南省', '衡阳市', '430400', '衡阳县', '430421', '112.379643', '26.962388');
INSERT INTO `provinces` VALUES ('430422', '湖南省', '衡阳市', '430400', '衡南', '430422', '112.677459', '26.739973');
INSERT INTO `provinces` VALUES ('430423', '湖南省', '衡阳市', '430400', '衡山', '430423', '112.86971', '27.234808');
INSERT INTO `provinces` VALUES ('430424', '湖南省', '衡阳市', '430400', '衡东', '430424', '112.950412', '27.083531');
INSERT INTO `provinces` VALUES ('430426', '湖南省', '衡阳市', '430400', '祁东', '430426', '112.111192', '26.787109');
INSERT INTO `provinces` VALUES ('430481', '湖南省', '衡阳市', '430400', '耒阳', '430481', '112.847215', '26.414162');
INSERT INTO `provinces` VALUES ('430482', '湖南省', '衡阳市', '430400', '常宁', '430482', '112.396821', '26.406773');
INSERT INTO `provinces` VALUES ('430500', '湖南省', '邵阳市', '430500', '邵阳', '430500', '111.46923', '27.237842');
INSERT INTO `provinces` VALUES ('430502', '湖南省', '邵阳市', '430500', '双清', '430502', '111.479756', '27.240001');
INSERT INTO `provinces` VALUES ('430503', '湖南省', '邵阳市', '430500', '大祥', '430503', '111.462968', '27.233593');
INSERT INTO `provinces` VALUES ('430511', '湖南省', '邵阳市', '430500', '北塔', '430511', '111.452315', '27.245688');
INSERT INTO `provinces` VALUES ('430521', '湖南省', '邵阳市', '430500', '邵东', '430521', '111.743168', '27.257273');
INSERT INTO `provinces` VALUES ('430522', '湖南省', '邵阳市', '430500', '新邵', '430522', '111.459762', '27.311429');
INSERT INTO `provinces` VALUES ('430523', '湖南省', '邵阳市', '430500', '邵阳县', '430523', '111.2757', '26.989713');
INSERT INTO `provinces` VALUES ('430524', '湖南省', '邵阳市', '430500', '隆回', '430524', '111.038785', '27.116002');
INSERT INTO `provinces` VALUES ('430525', '湖南省', '邵阳市', '430500', '洞口', '430525', '110.579212', '27.062286');
INSERT INTO `provinces` VALUES ('430527', '湖南省', '邵阳市', '430500', '绥宁', '430527', '110.155075', '26.580622');
INSERT INTO `provinces` VALUES ('430528', '湖南省', '邵阳市', '430500', '新宁', '430528', '110.859115', '26.438912');
INSERT INTO `provinces` VALUES ('430529', '湖南省', '邵阳市', '430500', '城步', '430529', '110.313226', '26.363575');
INSERT INTO `provinces` VALUES ('430581', '湖南省', '邵阳市', '430500', '武冈', '430581', '110.636804', '26.732086');
INSERT INTO `provinces` VALUES ('430600', '湖南省', '岳阳市', '430600', '岳阳', '430600', '113.132855', '29.37029');
INSERT INTO `provinces` VALUES ('430602', '湖南省', '岳阳市', '430600', '岳阳楼区', '430602', '113.120751', '29.366784');
INSERT INTO `provinces` VALUES ('430603', '湖南省', '岳阳市', '430600', '云溪', '430603', '113.27387', '29.473395');
INSERT INTO `provinces` VALUES ('430611', '湖南省', '岳阳市', '430600', '君山', '430611', '113.004082', '29.438062');
INSERT INTO `provinces` VALUES ('430621', '湖南省', '岳阳市', '430600', '岳阳县', '430621', '113.12254', '29.150269');
INSERT INTO `provinces` VALUES ('430623', '湖南省', '岳阳市', '430600', '华容', '430623', '112.559369', '29.524107');
INSERT INTO `provinces` VALUES ('430624', '湖南省', '岳阳市', '430600', '湘阴', '430624', '112.889748', '28.677498');
INSERT INTO `provinces` VALUES ('430626', '湖南省', '岳阳市', '430600', '平江', '430626', '113.593751', '28.701523');
INSERT INTO `provinces` VALUES ('430681', '湖南省', '岳阳市', '430600', '汨罗', '430681', '113.079419', '28.803149');
INSERT INTO `provinces` VALUES ('430682', '湖南省', '岳阳市', '430600', '临湘', '430682', '113.450809', '29.471594');
INSERT INTO `provinces` VALUES ('430700', '湖南省', '常德市', '430700', '常德', '430700', '111.691347', '29.040225');
INSERT INTO `provinces` VALUES ('430702', '湖南省', '常德市', '430700', '武陵', '430702', '111.690718', '29.040477');
INSERT INTO `provinces` VALUES ('430703', '湖南省', '常德市', '430700', '鼎城', '430703', '111.685327', '29.014426');
INSERT INTO `provinces` VALUES ('430721', '湖南省', '常德市', '430700', '安乡', '430721', '112.172289', '29.414483');
INSERT INTO `provinces` VALUES ('430722', '湖南省', '常德市', '430700', '汉寿', '430722', '111.968506', '28.907319');
INSERT INTO `provinces` VALUES ('430723', '湖南省', '常德市', '430700', '澧县', '430723', '111.761682', '29.64264');
INSERT INTO `provinces` VALUES ('430724', '湖南省', '常德市', '430700', '临澧', '430724', '111.645602', '29.443217');
INSERT INTO `provinces` VALUES ('430725', '湖南省', '常德市', '430700', '桃源', '430725', '111.484503', '28.902734');
INSERT INTO `provinces` VALUES ('430726', '湖南省', '常德市', '430700', '石门', '430726', '111.379087', '29.584703');
INSERT INTO `provinces` VALUES ('430781', '湖南省', '常德市', '430700', '津市', '430781', '111.879609', '29.630867');
INSERT INTO `provinces` VALUES ('430800', '湖南省', '张家界市', '430800', '张家界', '430800', '110.479921', '29.127401');
INSERT INTO `provinces` VALUES ('430802', '湖南省', '张家界市', '430800', '永定', '430802', '110.484559', '29.125961');
INSERT INTO `provinces` VALUES ('430811', '湖南省', '张家界市', '430800', '武陵源', '430811', '110.54758', '29.347827');
INSERT INTO `provinces` VALUES ('430821', '湖南省', '张家界市', '430800', '慈利', '430821', '111.132702', '29.423876');
INSERT INTO `provinces` VALUES ('430822', '湖南省', '张家界市', '430800', '桑植', '430822', '110.164039', '29.399939');
INSERT INTO `provinces` VALUES ('430900', '湖南省', '益阳市', '430900', '益阳', '430900', '112.355042', '28.570066');
INSERT INTO `provinces` VALUES ('430902', '湖南省', '益阳市', '430900', '资阳区', '430902', '112.33084', '28.592771');
INSERT INTO `provinces` VALUES ('430903', '湖南省', '益阳市', '430900', '赫山', '430903', '112.360946', '28.568327');
INSERT INTO `provinces` VALUES ('430921', '湖南省', '益阳市', '430900', '南县', '430921', '112.410399', '29.372181');
INSERT INTO `provinces` VALUES ('430922', '湖南省', '益阳市', '430900', '桃江', '430922', '112.139732', '28.520993');
INSERT INTO `provinces` VALUES ('430923', '湖南省', '益阳市', '430900', '安化', '430923', '111.221824', '28.377421');
INSERT INTO `provinces` VALUES ('430981', '湖南省', '益阳市', '430900', '沅江', '430981', '112.361088', '28.839713');
INSERT INTO `provinces` VALUES ('431000', '湖南省', '郴州市', '431000', '郴州', '431000', '113.032067', '25.793589');
INSERT INTO `provinces` VALUES ('431002', '湖南省', '郴州市', '431000', '北湖', '431002', '113.032208', '25.792628');
INSERT INTO `provinces` VALUES ('431003', '湖南省', '郴州市', '431000', '苏仙', '431003', '113.038698', '25.793157');
INSERT INTO `provinces` VALUES ('431021', '湖南省', '郴州市', '431000', '桂阳', '431021', '112.734466', '25.737447');
INSERT INTO `provinces` VALUES ('431022', '湖南省', '郴州市', '431000', '宜章', '431022', '112.947884', '25.394345');
INSERT INTO `provinces` VALUES ('431023', '湖南省', '郴州市', '431000', '永兴', '431023', '113.114819', '26.129392');
INSERT INTO `provinces` VALUES ('431024', '湖南省', '郴州市', '431000', '嘉禾', '431024', '112.370618', '25.587309');
INSERT INTO `provinces` VALUES ('431025', '湖南省', '郴州市', '431000', '临武', '431025', '112.564589', '25.279119');
INSERT INTO `provinces` VALUES ('431026', '湖南省', '郴州市', '431000', '汝城', '431026', '113.685686', '25.553759');
INSERT INTO `provinces` VALUES ('431027', '湖南省', '郴州市', '431000', '桂东', '431027', '113.945879', '26.073917');
INSERT INTO `provinces` VALUES ('431028', '湖南省', '郴州市', '431000', '安仁', '431028', '113.27217', '26.708625');
INSERT INTO `provinces` VALUES ('431081', '湖南省', '郴州市', '431000', '资兴', '431081', '113.23682', '25.974152');
INSERT INTO `provinces` VALUES ('431100', '湖南省', '永州市', '431100', '永州', '431100', '111.608019', '26.434516');
INSERT INTO `provinces` VALUES ('431102', '湖南省', '永州市', '431100', '零陵', '431102', '111.626348', '26.223347');
INSERT INTO `provinces` VALUES ('431103', '湖南省', '永州市', '431100', '冷水滩', '431103', '111.607156', '26.434364');
INSERT INTO `provinces` VALUES ('431121', '湖南省', '永州市', '431100', '祁阳', '431121', '111.85734', '26.585929');
INSERT INTO `provinces` VALUES ('431122', '湖南省', '永州市', '431100', '东安', '431122', '111.313035', '26.397278');
INSERT INTO `provinces` VALUES ('431123', '湖南省', '永州市', '431100', '双牌', '431123', '111.662146', '25.959397');
INSERT INTO `provinces` VALUES ('431124', '湖南省', '永州市', '431100', '道县', '431124', '111.591614', '25.518444');
INSERT INTO `provinces` VALUES ('431125', '湖南省', '永州市', '431100', '江永', '431125', '111.346803', '25.268154');
INSERT INTO `provinces` VALUES ('431126', '湖南省', '永州市', '431100', '宁远', '431126', '111.944529', '25.584112');
INSERT INTO `provinces` VALUES ('431127', '湖南省', '永州市', '431100', '蓝山', '431127', '112.194195', '25.375255');
INSERT INTO `provinces` VALUES ('431128', '湖南省', '永州市', '431100', '新田', '431128', '112.220341', '25.906927');
INSERT INTO `provinces` VALUES ('431129', '湖南省', '永州市', '431100', '江华', '431129', '111.577276', '25.182596');
INSERT INTO `provinces` VALUES ('431200', '湖南省', '怀化市', '431200', '怀化', '431200', '109.97824', '27.550082');
INSERT INTO `provinces` VALUES ('431202', '湖南省', '怀化市', '431200', '鹤城', '431202', '109.982242', '27.548474');
INSERT INTO `provinces` VALUES ('431221', '湖南省', '怀化市', '431200', '中方', '431221', '109.948061', '27.43736');
INSERT INTO `provinces` VALUES ('431222', '湖南省', '怀化市', '431200', '沅陵', '431222', '110.399161', '28.455554');
INSERT INTO `provinces` VALUES ('431223', '湖南省', '怀化市', '431200', '辰溪', '431223', '110.196953', '28.005474');
INSERT INTO `provinces` VALUES ('431224', '湖南省', '怀化市', '431200', '溆浦', '431224', '110.593373', '27.903802');
INSERT INTO `provinces` VALUES ('431225', '湖南省', '怀化市', '431200', '会同', '431225', '109.720785', '26.870789');
INSERT INTO `provinces` VALUES ('431226', '湖南省', '怀化市', '431200', '麻阳', '431226', '109.802807', '27.865991');
INSERT INTO `provinces` VALUES ('431227', '湖南省', '怀化市', '431200', '新晃', '431227', '109.174443', '27.359897');
INSERT INTO `provinces` VALUES ('431228', '湖南省', '怀化市', '431200', '芷江', '431228', '109.687777', '27.437996');
INSERT INTO `provinces` VALUES ('431229', '湖南省', '怀化市', '431200', '靖州', '431229', '109.691159', '26.573511');
INSERT INTO `provinces` VALUES ('431230', '湖南省', '怀化市', '431200', '通道', '431230', '109.783359', '26.158349');
INSERT INTO `provinces` VALUES ('431281', '湖南省', '怀化市', '431200', '洪江', '431281', '109.831765', '27.201876');
INSERT INTO `provinces` VALUES ('431300', '湖南省', '娄底市', '431300', '娄底', '431300', '112.008497', '27.728136');
INSERT INTO `provinces` VALUES ('431302', '湖南省', '娄底市', '431300', '娄星', '431302', '112.008486', '27.726643');
INSERT INTO `provinces` VALUES ('431321', '湖南省', '娄底市', '431300', '双峰', '431321', '112.198245', '27.459126');
INSERT INTO `provinces` VALUES ('431322', '湖南省', '娄底市', '431300', '新化', '431322', '111.306747', '27.737456');
INSERT INTO `provinces` VALUES ('431381', '湖南省', '娄底市', '431300', '冷水江', '431381', '111.434674', '27.685759');
INSERT INTO `provinces` VALUES ('431382', '湖南省', '娄底市', '431300', '涟源', '431382', '111.670847', '27.692301');
INSERT INTO `provinces` VALUES ('433100', '湖南省', '湘西土家族苗族自治州', '433100', '湘西', '433100', '109.739735', '28.314296');
INSERT INTO `provinces` VALUES ('433101', '湖南省', '湘西土家族苗族自治州', '433100', '吉首', '433101', '109.738273', '28.314827');
INSERT INTO `provinces` VALUES ('433122', '湖南省', '湘西土家族苗族自治州', '433100', '泸溪', '433122', '110.214428', '28.214516');
INSERT INTO `provinces` VALUES ('433123', '湖南省', '湘西土家族苗族自治州', '433100', '凤凰', '433123', '109.599191', '27.948308');
INSERT INTO `provinces` VALUES ('433124', '湖南省', '湘西土家族苗族自治州', '433100', '花垣', '433124', '109.479063', '28.581352');
INSERT INTO `provinces` VALUES ('433125', '湖南省', '湘西土家族苗族自治州', '433100', '保靖', '433125', '109.651445', '28.709605');
INSERT INTO `provinces` VALUES ('433126', '湖南省', '湘西土家族苗族自治州', '433100', '古丈', '433126', '109.949592', '28.616973');
INSERT INTO `provinces` VALUES ('433127', '湖南省', '湘西土家族苗族自治州', '433100', '永顺', '433127', '109.853292', '28.998068');
INSERT INTO `provinces` VALUES ('433130', '湖南省', '湘西土家族苗族自治州', '433100', '龙山', '433130', '109.441189', '29.453438');
INSERT INTO `provinces` VALUES ('440100', '广东省', '广州市', '440100', '广州', '440100', '113.280637', '23.125178');
INSERT INTO `provinces` VALUES ('440103', '广东省', '广州市', '440100', '荔湾', '440103', '113.243038', '23.124943');
INSERT INTO `provinces` VALUES ('440104', '广东省', '广州市', '440100', '越秀', '440104', '113.280714', '23.125624');
INSERT INTO `provinces` VALUES ('440105', '广东省', '广州市', '440100', '海珠', '440105', '113.262008', '23.103131');
INSERT INTO `provinces` VALUES ('440106', '广东省', '广州市', '440100', '天河', '440106', '113.335367', '23.13559');
INSERT INTO `provinces` VALUES ('440111', '广东省', '广州市', '440100', '白云', '440111', '113.262831', '23.162281');
INSERT INTO `provinces` VALUES ('440112', '广东省', '广州市', '440100', '黄埔', '440112', '113.450761', '23.103239');
INSERT INTO `provinces` VALUES ('440113', '广东省', '广州市', '440100', '番禺', '440113', '113.364619', '22.938582');
INSERT INTO `provinces` VALUES ('440114', '广东省', '广州市', '440100', '花都', '440114', '113.211184', '23.39205');
INSERT INTO `provinces` VALUES ('440115', '广东省', '广州市', '440100', '南沙区', '440115', '113.53738', '22.794531');
INSERT INTO `provinces` VALUES ('440117', '广东省', '广州市', '440100', '从化', '440117', '113.587386', '23.545283');
INSERT INTO `provinces` VALUES ('440118', '广东省', '广州市', '440100', '增城', '440118', '113.829579', '23.290497');
INSERT INTO `provinces` VALUES ('440200', '广东省', '韶关市', '440200', '韶关', '440200', '113.591544', '24.801322');
INSERT INTO `provinces` VALUES ('440203', '广东省', '韶关市', '440200', '武江', '440203', '113.588289', '24.80016');
INSERT INTO `provinces` VALUES ('440204', '广东省', '韶关市', '440200', '浈江', '440204', '113.599224', '24.803977');
INSERT INTO `provinces` VALUES ('440205', '广东省', '韶关市', '440200', '曲江', '440205', '113.605582', '24.680195');
INSERT INTO `provinces` VALUES ('440222', '广东省', '韶关市', '440200', '始兴', '440222', '114.067205', '24.948364');
INSERT INTO `provinces` VALUES ('440224', '广东省', '韶关市', '440200', '仁化', '440224', '113.748627', '25.088226');
INSERT INTO `provinces` VALUES ('440229', '广东省', '韶关市', '440200', '翁源', '440229', '114.131289', '24.353887');
INSERT INTO `provinces` VALUES ('440232', '广东省', '韶关市', '440200', '乳源', '440232', '113.278417', '24.776109');
INSERT INTO `provinces` VALUES ('440233', '广东省', '韶关市', '440200', '新丰', '440233', '114.207034', '24.055412');
INSERT INTO `provinces` VALUES ('440281', '广东省', '韶关市', '440200', '乐昌', '440281', '113.352413', '25.128445');
INSERT INTO `provinces` VALUES ('440282', '广东省', '韶关市', '440200', '南雄', '440282', '114.311231', '25.115328');
INSERT INTO `provinces` VALUES ('440300', '广东省', '深圳市', '440300', '深圳', '440300', '114.085947', '22.547');
INSERT INTO `provinces` VALUES ('440303', '广东省', '深圳市', '440300', '罗湖', '440303', '114.123885', '22.555341');
INSERT INTO `provinces` VALUES ('440304', '广东省', '深圳市', '440300', '福田', '440304', '114.05096', '22.541009');
INSERT INTO `provinces` VALUES ('440305', '广东省', '深圳市', '440300', '南山', '440305', '113.92943', '22.531221');
INSERT INTO `provinces` VALUES ('440306', '广东省', '深圳市', '440300', '宝安', '440306', '113.828671', '22.754741');
INSERT INTO `provinces` VALUES ('440307', '广东省', '深圳市', '440300', '龙岗', '440307', '114.251372', '22.721511');
INSERT INTO `provinces` VALUES ('440308', '广东省', '深圳市', '440300', '盐田', '440308', '114.235366', '22.555069');
INSERT INTO `provinces` VALUES ('440309', '广东省', '深圳市', '440300', '龙华', '440309', '114.04048', '22.758663');
INSERT INTO `provinces` VALUES ('440310', '广东省', '深圳市', '440300', '坪山', '440310', '114.34415', '22.716233');
INSERT INTO `provinces` VALUES ('440311', '广东省', '深圳市', '440300', '光明', '440311', '113.94256', '22.754466');
INSERT INTO `provinces` VALUES ('440400', '广东省', '珠海市', '440400', '珠海', '440400', '113.553986', '22.224979');
INSERT INTO `provinces` VALUES ('440402', '广东省', '珠海市', '440400', '香洲', '440402', '113.55027', '22.271249');
INSERT INTO `provinces` VALUES ('440403', '广东省', '珠海市', '440400', '斗门', '440403', '113.297739', '22.209117');
INSERT INTO `provinces` VALUES ('440404', '广东省', '珠海市', '440400', '金湾', '440404', '113.345071', '22.139122');
INSERT INTO `provinces` VALUES ('440500', '广东省', '汕头市', '440500', '汕头', '440500', '116.708463', '23.37102');
INSERT INTO `provinces` VALUES ('440507', '广东省', '汕头市', '440500', '龙湖', '440507', '116.732015', '23.373754');
INSERT INTO `provinces` VALUES ('440511', '广东省', '汕头市', '440500', '金平区', '440511', '116.703583', '23.367071');
INSERT INTO `provinces` VALUES ('440512', '广东省', '汕头市', '440500', '濠江', '440512', '116.729528', '23.279345');
INSERT INTO `provinces` VALUES ('440513', '广东省', '汕头市', '440500', '潮阳', '440513', '116.602602', '23.262336');
INSERT INTO `provinces` VALUES ('440514', '广东省', '汕头市', '440500', '潮南', '440514', '116.423607', '23.249798');
INSERT INTO `provinces` VALUES ('440515', '广东省', '汕头市', '440500', '澄海', '440515', '116.76336', '23.46844');
INSERT INTO `provinces` VALUES ('440523', '广东省', '汕头市', '440500', '南澳', '440523', '117.027105', '23.419562');
INSERT INTO `provinces` VALUES ('440600', '广东省', '佛山市', '440600', '佛山', '440600', '113.122717', '23.028762');
INSERT INTO `provinces` VALUES ('440604', '广东省', '佛山市', '440600', '禅城', '440604', '113.112414', '23.019643');
INSERT INTO `provinces` VALUES ('440605', '广东省', '佛山市', '440600', '南海区', '440605', '113.145577', '23.031562');
INSERT INTO `provinces` VALUES ('440606', '广东省', '佛山市', '440600', '顺德', '440606', '113.281826', '22.75851');
INSERT INTO `provinces` VALUES ('440607', '广东省', '佛山市', '440600', '三水', '440607', '112.899414', '23.16504');
INSERT INTO `provinces` VALUES ('440608', '广东省', '佛山市', '440600', '高明', '440608', '112.882123', '22.893855');
INSERT INTO `provinces` VALUES ('440700', '广东省', '江门市', '440700', '江门', '440700', '113.094942', '22.590431');
INSERT INTO `provinces` VALUES ('440703', '广东省', '江门市', '440700', '蓬江', '440703', '113.07859', '22.59677');
INSERT INTO `provinces` VALUES ('440704', '广东省', '江门市', '440700', '江海', '440704', '113.120601', '22.572211');
INSERT INTO `provinces` VALUES ('440705', '广东省', '江门市', '440700', '新会', '440705', '113.038584', '22.520247');
INSERT INTO `provinces` VALUES ('440781', '广东省', '江门市', '440700', '台山', '440781', '112.793414', '22.250713');
INSERT INTO `provinces` VALUES ('440783', '广东省', '江门市', '440700', '开平', '440783', '112.692262', '22.366286');
INSERT INTO `provinces` VALUES ('440784', '广东省', '江门市', '440700', '鹤山', '440784', '112.961795', '22.768104');
INSERT INTO `provinces` VALUES ('440785', '广东省', '江门市', '440700', '恩平', '440785', '112.314051', '22.182956');
INSERT INTO `provinces` VALUES ('440800', '广东省', '湛江市', '440800', '湛江', '440800', '110.364977', '21.274898');
INSERT INTO `provinces` VALUES ('440802', '广东省', '湛江市', '440800', '赤坎', '440802', '110.361634', '21.273365');
INSERT INTO `provinces` VALUES ('440803', '广东省', '湛江市', '440800', '霞山', '440803', '110.406382', '21.194229');
INSERT INTO `provinces` VALUES ('440804', '广东省', '湛江市', '440800', '坡头', '440804', '110.455632', '21.24441');
INSERT INTO `provinces` VALUES ('440811', '广东省', '湛江市', '440800', '麻章', '440811', '110.329167', '21.265997');
INSERT INTO `provinces` VALUES ('440823', '广东省', '湛江市', '440800', '遂溪', '440823', '110.255321', '21.376915');
INSERT INTO `provinces` VALUES ('440825', '广东省', '湛江市', '440800', '徐闻', '440825', '110.175718', '20.326083');
INSERT INTO `provinces` VALUES ('440881', '广东省', '湛江市', '440800', '廉江', '440881', '110.284961', '21.611281');
INSERT INTO `provinces` VALUES ('440882', '广东省', '湛江市', '440800', '雷州', '440882', '110.088275', '20.908523');
INSERT INTO `provinces` VALUES ('440883', '广东省', '湛江市', '440800', '吴川', '440883', '110.780508', '21.428453');
INSERT INTO `provinces` VALUES ('440900', '广东省', '茂名市', '440900', '茂名', '440900', '110.919229', '21.659751');
INSERT INTO `provinces` VALUES ('440902', '广东省', '茂名市', '440900', '茂南', '440902', '110.920542', '21.660425');
INSERT INTO `provinces` VALUES ('440904', '广东省', '茂名市', '440900', '电白', '440904', '111.007264', '21.507219');
INSERT INTO `provinces` VALUES ('440981', '广东省', '茂名市', '440900', '高州', '440981', '110.853251', '21.915153');
INSERT INTO `provinces` VALUES ('440982', '广东省', '茂名市', '440900', '化州', '440982', '110.63839', '21.654953');
INSERT INTO `provinces` VALUES ('440983', '广东省', '茂名市', '440900', '信宜', '440983', '110.941656', '22.352681');
INSERT INTO `provinces` VALUES ('441200', '广东省', '肇庆市', '441200', '肇庆', '441200', '112.472529', '23.051546');
INSERT INTO `provinces` VALUES ('441202', '广东省', '肇庆市', '441200', '端州', '441202', '112.472329', '23.052662');
INSERT INTO `provinces` VALUES ('441203', '广东省', '肇庆市', '441200', '鼎湖', '441203', '112.565249', '23.155822');
INSERT INTO `provinces` VALUES ('441204', '广东省', '肇庆市', '441200', '高要', '441204', '112.460846', '23.027694');
INSERT INTO `provinces` VALUES ('441223', '广东省', '肇庆市', '441200', '广宁', '441223', '112.440419', '23.631486');
INSERT INTO `provinces` VALUES ('441224', '广东省', '肇庆市', '441200', '怀集', '441224', '112.182466', '23.913072');
INSERT INTO `provinces` VALUES ('441225', '广东省', '肇庆市', '441200', '封开', '441225', '111.502973', '23.434731');
INSERT INTO `provinces` VALUES ('441226', '广东省', '肇庆市', '441200', '德庆', '441226', '111.78156', '23.141711');
INSERT INTO `provinces` VALUES ('441284', '广东省', '肇庆市', '441200', '四会', '441284', '112.695028', '23.340324');
INSERT INTO `provinces` VALUES ('441300', '广东省', '惠州市', '441300', '惠州', '441300', '114.412599', '23.079404');
INSERT INTO `provinces` VALUES ('441302', '广东省', '惠州市', '441300', '惠城', '441302', '114.413978', '23.079883');
INSERT INTO `provinces` VALUES ('441303', '广东省', '惠州市', '441300', '惠阳', '441303', '114.469444', '22.78851');
INSERT INTO `provinces` VALUES ('441322', '广东省', '惠州市', '441300', '博罗', '441322', '114.284254', '23.167575');
INSERT INTO `provinces` VALUES ('441323', '广东省', '惠州市', '441300', '惠东', '441323', '114.723092', '22.983036');
INSERT INTO `provinces` VALUES ('441324', '广东省', '惠州市', '441300', '龙门', '441324', '114.259986', '23.723894');
INSERT INTO `provinces` VALUES ('441400', '广东省', '梅州市', '441400', '梅州', '441400', '116.117582', '24.299112');
INSERT INTO `provinces` VALUES ('441402', '广东省', '梅州市', '441400', '梅江', '441402', '116.12116', '24.302593');
INSERT INTO `provinces` VALUES ('441403', '广东省', '梅州市', '441400', '梅县', '441403', '116.083482', '24.267825');
INSERT INTO `provinces` VALUES ('441422', '广东省', '梅州市', '441400', '大埔', '441422', '116.69552', '24.351587');
INSERT INTO `provinces` VALUES ('441423', '广东省', '梅州市', '441400', '丰顺', '441423', '116.184419', '23.752771');
INSERT INTO `provinces` VALUES ('441424', '广东省', '梅州市', '441400', '五华', '441424', '115.775004', '23.925424');
INSERT INTO `provinces` VALUES ('441426', '广东省', '梅州市', '441400', '平远', '441426', '115.891729', '24.569651');
INSERT INTO `provinces` VALUES ('441427', '广东省', '梅州市', '441400', '蕉岭', '441427', '116.170531', '24.653313');
INSERT INTO `provinces` VALUES ('441481', '广东省', '梅州市', '441400', '兴宁', '441481', '115.731648', '24.138077');
INSERT INTO `provinces` VALUES ('441500', '广东省', '汕尾市', '441500', '汕尾', '441500', '115.364238', '22.774485');
INSERT INTO `provinces` VALUES ('441502', '广东省', '汕尾市', '441500', '城区', '441502', '115.364238', '22.774485');
INSERT INTO `provinces` VALUES ('441521', '广东省', '汕尾市', '441500', '海丰', '441521', '115.337324', '22.971042');
INSERT INTO `provinces` VALUES ('441523', '广东省', '汕尾市', '441500', '陆河', '441523', '115.657565', '23.302682');
INSERT INTO `provinces` VALUES ('441581', '广东省', '汕尾市', '441500', '陆丰', '441581', '115.644203', '22.946104');
INSERT INTO `provinces` VALUES ('441600', '广东省', '河源市', '441600', '河源', '441600', '114.697802', '23.746266');
INSERT INTO `provinces` VALUES ('441602', '广东省', '河源市', '441600', '源城', '441602', '114.696828', '23.746255');
INSERT INTO `provinces` VALUES ('441621', '广东省', '河源市', '441600', '紫金', '441621', '115.184383', '23.633744');
INSERT INTO `provinces` VALUES ('441622', '广东省', '河源市', '441600', '龙川', '441622', '115.256415', '24.101174');
INSERT INTO `provinces` VALUES ('441623', '广东省', '河源市', '441600', '连平', '441623', '114.495952', '24.364227');
INSERT INTO `provinces` VALUES ('441624', '广东省', '河源市', '441600', '和平', '441624', '114.941473', '24.44318');
INSERT INTO `provinces` VALUES ('441625', '广东省', '河源市', '441600', '东源', '441625', '114.742711', '23.789093');
INSERT INTO `provinces` VALUES ('441700', '广东省', '阳江市', '441700', '阳江', '441700', '111.975107', '21.859222');
INSERT INTO `provinces` VALUES ('441702', '广东省', '阳江市', '441700', '江城区', '441702', '111.968909', '21.859182');
INSERT INTO `provinces` VALUES ('441704', '广东省', '阳江市', '441700', '阳东', '441704', '112.011267', '21.864728');
INSERT INTO `provinces` VALUES ('441721', '广东省', '阳江市', '441700', '阳西', '441721', '111.617556', '21.75367');
INSERT INTO `provinces` VALUES ('441781', '广东省', '阳江市', '441700', '阳春', '441781', '111.7905', '22.169598');
INSERT INTO `provinces` VALUES ('441800', '广东省', '清远市', '441800', '清远', '441800', '113.051227', '23.685022');
INSERT INTO `provinces` VALUES ('441802', '广东省', '清远市', '441800', '清城', '441802', '113.048698', '23.688976');
INSERT INTO `provinces` VALUES ('441803', '广东省', '清远市', '441800', '清新', '441803', '113.015203', '23.736949');
INSERT INTO `provinces` VALUES ('441821', '广东省', '清远市', '441800', '佛冈', '441821', '113.534094', '23.866739');
INSERT INTO `provinces` VALUES ('441823', '广东省', '清远市', '441800', '阳山', '441823', '112.634019', '24.470286');
INSERT INTO `provinces` VALUES ('441825', '广东省', '清远市', '441800', '连山', '441825', '112.086555', '24.567271');
INSERT INTO `provinces` VALUES ('441826', '广东省', '清远市', '441800', '连南', '441826', '112.290808', '24.719097');
INSERT INTO `provinces` VALUES ('441881', '广东省', '清远市', '441800', '英德', '441881', '113.405404', '24.18612');
INSERT INTO `provinces` VALUES ('441882', '广东省', '清远市', '441800', '连州', '441882', '112.379271', '24.783966');
INSERT INTO `provinces` VALUES ('441900', '广东省', '东莞市', '441900', '东莞', '441900', '113.746262', '23.046237');
INSERT INTO `provinces` VALUES ('442000', '广东省', '中山市', '442000', '中山', '442000', '113.382391', '22.521113');
INSERT INTO `provinces` VALUES ('445100', '广东省', '潮州市', '445100', '潮州', '445100', '116.632301', '23.661701');
INSERT INTO `provinces` VALUES ('445102', '广东省', '潮州市', '445100', '湘桥', '445102', '116.63365', '23.664675');
INSERT INTO `provinces` VALUES ('445103', '广东省', '潮州市', '445100', '潮安', '445103', '116.67931', '23.461012');
INSERT INTO `provinces` VALUES ('445122', '广东省', '潮州市', '445100', '饶平', '445122', '117.00205', '23.668171');
INSERT INTO `provinces` VALUES ('445200', '广东省', '揭阳市', '445200', '揭阳', '445200', '116.355733', '23.543778');
INSERT INTO `provinces` VALUES ('445202', '广东省', '揭阳市', '445200', '榕城', '445202', '116.357045', '23.535524');
INSERT INTO `provinces` VALUES ('445203', '广东省', '揭阳市', '445200', '揭东', '445203', '116.412947', '23.569887');
INSERT INTO `provinces` VALUES ('445222', '广东省', '揭阳市', '445200', '揭西', '445222', '115.838708', '23.4273');
INSERT INTO `provinces` VALUES ('445224', '广东省', '揭阳市', '445200', '惠来', '445224', '116.295832', '23.029834');
INSERT INTO `provinces` VALUES ('445281', '广东省', '揭阳市', '445200', '普宁', '445281', '116.165082', '23.29788');
INSERT INTO `provinces` VALUES ('445300', '广东省', '云浮市', '445300', '云浮', '445300', '112.044439', '22.929801');
INSERT INTO `provinces` VALUES ('445302', '广东省', '云浮市', '445300', '云城', '445302', '112.04471', '22.930827');
INSERT INTO `provinces` VALUES ('445303', '广东省', '云浮市', '445300', '云安', '445303', '112.005609', '23.073152');
INSERT INTO `provinces` VALUES ('445321', '广东省', '云浮市', '445300', '新兴', '445321', '112.23083', '22.703204');
INSERT INTO `provinces` VALUES ('445322', '广东省', '云浮市', '445300', '郁南', '445322', '111.535921', '23.237709');
INSERT INTO `provinces` VALUES ('445381', '广东省', '云浮市', '445300', '罗定', '445381', '111.578201', '22.765415');
INSERT INTO `provinces` VALUES ('450100', '广西壮族自治区', '南宁市', '450100', '南宁', '450100', '108.320004', '22.82402');
INSERT INTO `provinces` VALUES ('450102', '广西壮族自治区', '南宁市', '450100', '兴宁区', '450102', '108.320189', '22.819511');
INSERT INTO `provinces` VALUES ('450103', '广西壮族自治区', '南宁市', '450100', '青秀', '450103', '108.346113', '22.816614');
INSERT INTO `provinces` VALUES ('450105', '广西壮族自治区', '南宁市', '450100', '江南区', '450105', '108.310478', '22.799593');
INSERT INTO `provinces` VALUES ('450107', '广西壮族自治区', '南宁市', '450100', '西乡塘', '450107', '108.306903', '22.832779');
INSERT INTO `provinces` VALUES ('450108', '广西壮族自治区', '南宁市', '450100', '良庆', '450108', '108.322102', '22.75909');
INSERT INTO `provinces` VALUES ('450109', '广西壮族自治区', '南宁市', '450100', '邕宁', '450109', '108.484251', '22.756598');
INSERT INTO `provinces` VALUES ('450110', '广西壮族自治区', '南宁市', '450100', '武鸣', '450110', '108.280717', '23.157163');
INSERT INTO `provinces` VALUES ('450123', '广西壮族自治区', '南宁市', '450100', '隆安', '450123', '107.688661', '23.174763');
INSERT INTO `provinces` VALUES ('450124', '广西壮族自治区', '南宁市', '450100', '马山', '450124', '108.172903', '23.711758');
INSERT INTO `provinces` VALUES ('450125', '广西壮族自治区', '南宁市', '450100', '上林', '450125', '108.603937', '23.431769');
INSERT INTO `provinces` VALUES ('450126', '广西壮族自治区', '南宁市', '450100', '宾阳', '450126', '108.816735', '23.216884');
INSERT INTO `provinces` VALUES ('450127', '广西壮族自治区', '南宁市', '450100', '横县', '450127', '109.270987', '22.68743');
INSERT INTO `provinces` VALUES ('450200', '广西壮族自治区', '柳州市', '450200', '柳州', '450200', '109.411703', '24.314617');
INSERT INTO `provinces` VALUES ('450202', '广西壮族自治区', '柳州市', '450200', '城中区', '450202', '109.411749', '24.312324');
INSERT INTO `provinces` VALUES ('450203', '广西壮族自治区', '柳州市', '450200', '鱼峰', '450203', '109.415364', '24.303848');
INSERT INTO `provinces` VALUES ('450204', '广西壮族自治区', '柳州市', '450200', '柳南', '450204', '109.395936', '24.287013');
INSERT INTO `provinces` VALUES ('450205', '广西壮族自治区', '柳州市', '450200', '柳北', '450205', '109.406577', '24.359145');
INSERT INTO `provinces` VALUES ('450206', '广西壮族自治区', '柳州市', '450200', '柳江', '450206', '109.334503', '24.257512');
INSERT INTO `provinces` VALUES ('450222', '广西壮族自治区', '柳州市', '450200', '柳城', '450222', '109.245812', '24.655121');
INSERT INTO `provinces` VALUES ('450223', '广西壮族自治区', '柳州市', '450200', '鹿寨', '450223', '109.740805', '24.483405');
INSERT INTO `provinces` VALUES ('450224', '广西壮族自治区', '柳州市', '450200', '融安', '450224', '109.403621', '25.214703');
INSERT INTO `provinces` VALUES ('450225', '广西壮族自治区', '柳州市', '450200', '融水', '450225', '109.252744', '25.068812');
INSERT INTO `provinces` VALUES ('450226', '广西壮族自治区', '柳州市', '450200', '三江', '450226', '109.614846', '25.78553');
INSERT INTO `provinces` VALUES ('450300', '广西壮族自治区', '桂林市', '450300', '桂林', '450300', '110.299121', '25.274215');
INSERT INTO `provinces` VALUES ('450302', '广西壮族自治区', '桂林市', '450300', '秀峰', '450302', '110.292445', '25.278544');
INSERT INTO `provinces` VALUES ('450303', '广西壮族自治区', '桂林市', '450300', '叠彩', '450303', '110.300783', '25.301334');
INSERT INTO `provinces` VALUES ('450304', '广西壮族自治区', '桂林市', '450300', '象山区', '450304', '110.284882', '25.261986');
INSERT INTO `provinces` VALUES ('450305', '广西壮族自治区', '桂林市', '450300', '七星', '450305', '110.317577', '25.254339');
INSERT INTO `provinces` VALUES ('450311', '广西壮族自治区', '桂林市', '450300', '雁山', '450311', '110.305667', '25.077646');
INSERT INTO `provinces` VALUES ('450312', '广西壮族自治区', '桂林市', '450300', '临桂', '450312', '110.205487', '25.246257');
INSERT INTO `provinces` VALUES ('450321', '广西壮族自治区', '桂林市', '450300', '阳朔', '450321', '110.494699', '24.77534');
INSERT INTO `provinces` VALUES ('450323', '广西壮族自治区', '桂林市', '450300', '灵川', '450323', '110.325712', '25.408541');
INSERT INTO `provinces` VALUES ('450324', '广西壮族自治区', '桂林市', '450300', '全州', '450324', '111.072989', '25.929897');
INSERT INTO `provinces` VALUES ('450325', '广西壮族自治区', '桂林市', '450300', '兴安', '450325', '110.670783', '25.609554');
INSERT INTO `provinces` VALUES ('450326', '广西壮族自治区', '桂林市', '450300', '永福', '450326', '109.989208', '24.986692');
INSERT INTO `provinces` VALUES ('450327', '广西壮族自治区', '桂林市', '450300', '灌阳', '450327', '111.160248', '25.489098');
INSERT INTO `provinces` VALUES ('450328', '广西壮族自治区', '桂林市', '450300', '龙胜', '450328', '110.009423', '25.796428');
INSERT INTO `provinces` VALUES ('450329', '广西壮族自治区', '桂林市', '450300', '资源', '450329', '110.642587', '26.0342');
INSERT INTO `provinces` VALUES ('450330', '广西壮族自治区', '桂林市', '450300', '平乐', '450330', '110.642821', '24.632216');
INSERT INTO `provinces` VALUES ('450332', '广西壮族自治区', '桂林市', '450300', '恭城', '450332', '110.82952', '24.833612');
INSERT INTO `provinces` VALUES ('450381', '广西壮族自治区', '桂林市', '450300', '荔浦', '450381', '110.400149', '24.497786');
INSERT INTO `provinces` VALUES ('450400', '广西壮族自治区', '梧州市', '450400', '梧州', '450400', '111.297604', '23.474803');
INSERT INTO `provinces` VALUES ('450403', '广西壮族自治区', '梧州市', '450400', '万秀', '450403', '111.315817', '23.471318');
INSERT INTO `provinces` VALUES ('450405', '广西壮族自治区', '梧州市', '450400', '长洲', '450405', '111.275678', '23.4777');
INSERT INTO `provinces` VALUES ('450406', '广西壮族自治区', '梧州市', '450400', '龙圩', '450406', '111.246035', '23.40996');
INSERT INTO `provinces` VALUES ('450421', '广西壮族自治区', '梧州市', '450400', '苍梧', '450421', '111.544008', '23.845097');
INSERT INTO `provinces` VALUES ('450422', '广西壮族自治区', '梧州市', '450400', '藤县', '450422', '110.931826', '23.373963');
INSERT INTO `provinces` VALUES ('450423', '广西壮族自治区', '梧州市', '450400', '蒙山', '450423', '110.5226', '24.199829');
INSERT INTO `provinces` VALUES ('450481', '广西壮族自治区', '梧州市', '450400', '岑溪', '450481', '110.998114', '22.918406');
INSERT INTO `provinces` VALUES ('450500', '广西壮族自治区', '北海市', '450500', '北海', '450500', '109.119254', '21.473343');
INSERT INTO `provinces` VALUES ('450502', '广西壮族自治区', '北海市', '450500', '海城区', '450502', '109.107529', '21.468443');
INSERT INTO `provinces` VALUES ('450503', '广西壮族自治区', '北海市', '450500', '银海', '450503', '109.118707', '21.444909');
INSERT INTO `provinces` VALUES ('450512', '广西壮族自治区', '北海市', '450500', '铁山港', '450512', '109.450573', '21.5928');
INSERT INTO `provinces` VALUES ('450521', '广西壮族自治区', '北海市', '450500', '合浦', '450521', '109.200695', '21.663554');
INSERT INTO `provinces` VALUES ('450600', '广西壮族自治区', '防城港市', '450600', '防城港', '450600', '108.345478', '21.614631');
INSERT INTO `provinces` VALUES ('450602', '广西壮族自治区', '防城港市', '450600', '港口区', '450602', '108.346281', '21.614406');
INSERT INTO `provinces` VALUES ('450603', '广西壮族自治区', '防城港市', '450600', '防城', '450603', '108.358426', '21.764758');
INSERT INTO `provinces` VALUES ('450621', '广西壮族自治区', '防城港市', '450600', '上思', '450621', '107.982139', '22.151423');
INSERT INTO `provinces` VALUES ('450681', '广西壮族自治区', '防城港市', '450600', '东兴', '450681', '107.97017', '21.541172');
INSERT INTO `provinces` VALUES ('450700', '广西壮族自治区', '钦州市', '450700', '钦州', '450700', '108.624175', '21.967127');
INSERT INTO `provinces` VALUES ('450702', '广西壮族自治区', '钦州市', '450700', '钦南', '450702', '108.626629', '21.966808');
INSERT INTO `provinces` VALUES ('450703', '广西壮族自治区', '钦州市', '450700', '钦北', '450703', '108.44911', '22.132761');
INSERT INTO `provinces` VALUES ('450721', '广西壮族自治区', '钦州市', '450700', '灵山', '450721', '109.293468', '22.418041');
INSERT INTO `provinces` VALUES ('450722', '广西壮族自治区', '钦州市', '450700', '浦北', '450722', '109.556341', '22.268335');
INSERT INTO `provinces` VALUES ('450800', '广西壮族自治区', '贵港市', '450800', '贵港', '450800', '109.602146', '23.0936');
INSERT INTO `provinces` VALUES ('450802', '广西壮族自治区', '贵港市', '450800', '港北', '450802', '109.59481', '23.107677');
INSERT INTO `provinces` VALUES ('450803', '广西壮族自治区', '贵港市', '450800', '港南', '450803', '109.604665', '23.067516');
INSERT INTO `provinces` VALUES ('450804', '广西壮族自治区', '贵港市', '450800', '覃塘', '450804', '109.415697', '23.132815');
INSERT INTO `provinces` VALUES ('450821', '广西壮族自治区', '贵港市', '450800', '平南', '450821', '110.397485', '23.544546');
INSERT INTO `provinces` VALUES ('450881', '广西壮族自治区', '贵港市', '450800', '桂平', '450881', '110.074668', '23.382473');
INSERT INTO `provinces` VALUES ('450900', '广西壮族自治区', '玉林市', '450900', '玉林', '450900', '110.154393', '22.63136');
INSERT INTO `provinces` VALUES ('450902', '广西壮族自治区', '玉林市', '450900', '玉州', '450902', '110.154912', '22.632132');
INSERT INTO `provinces` VALUES ('450903', '广西壮族自治区', '玉林市', '450900', '福绵', '450903', '110.054155', '22.58163');
INSERT INTO `provinces` VALUES ('450921', '广西壮族自治区', '玉林市', '450900', '容县', '450921', '110.552467', '22.856435');
INSERT INTO `provinces` VALUES ('450922', '广西壮族自治区', '玉林市', '450900', '陆川', '450922', '110.264842', '22.321054');
INSERT INTO `provinces` VALUES ('450923', '广西壮族自治区', '玉林市', '450900', '博白', '450923', '109.980004', '22.271285');
INSERT INTO `provinces` VALUES ('450924', '广西壮族自治区', '玉林市', '450900', '兴业', '450924', '109.877768', '22.74187');
INSERT INTO `provinces` VALUES ('450981', '广西壮族自治区', '玉林市', '450900', '北流', '450981', '110.348052', '22.701648');
INSERT INTO `provinces` VALUES ('451000', '广西壮族自治区', '百色市', '451000', '百色', '451000', '106.616285', '23.897742');
INSERT INTO `provinces` VALUES ('451002', '广西壮族自治区', '百色市', '451000', '右江', '451002', '106.615727', '23.897675');
INSERT INTO `provinces` VALUES ('451021', '广西壮族自治区', '百色市', '451000', '田阳', '451021', '106.904315', '23.736079');
INSERT INTO `provinces` VALUES ('451022', '广西壮族自治区', '百色市', '451000', '田东', '451022', '107.12426', '23.600444');
INSERT INTO `provinces` VALUES ('451023', '广西壮族自治区', '百色市', '451000', '平果', '451023', '107.580403', '23.320479');
INSERT INTO `provinces` VALUES ('451024', '广西壮族自治区', '百色市', '451000', '德保', '451024', '106.618164', '23.321464');
INSERT INTO `provinces` VALUES ('451026', '广西壮族自治区', '百色市', '451000', '那坡', '451026', '105.833553', '23.400785');
INSERT INTO `provinces` VALUES ('451027', '广西壮族自治区', '百色市', '451000', '凌云', '451027', '106.56487', '24.345643');
INSERT INTO `provinces` VALUES ('451028', '广西壮族自治区', '百色市', '451000', '乐业', '451028', '106.559638', '24.782204');
INSERT INTO `provinces` VALUES ('451029', '广西壮族自治区', '百色市', '451000', '田林', '451029', '106.235047', '24.290262');
INSERT INTO `provinces` VALUES ('451030', '广西壮族自治区', '百色市', '451000', '西林', '451030', '105.095025', '24.492041');
INSERT INTO `provinces` VALUES ('451031', '广西壮族自治区', '百色市', '451000', '隆林', '451031', '105.342363', '24.774318');
INSERT INTO `provinces` VALUES ('451081', '广西壮族自治区', '百色市', '451000', '靖西', '451081', '106.417549', '23.134766');
INSERT INTO `provinces` VALUES ('451100', '广西壮族自治区', '贺州市', '451100', '贺州', '451100', '111.552056', '24.414141');
INSERT INTO `provinces` VALUES ('451102', '广西壮族自治区', '贺州市', '451100', '八步', '451102', '111.551991', '24.412446');
INSERT INTO `provinces` VALUES ('451103', '广西壮族自治区', '贺州市', '451100', '平桂', '451103', '111.524014', '24.417148');
INSERT INTO `provinces` VALUES ('451121', '广西壮族自治区', '贺州市', '451100', '昭平', '451121', '110.810865', '24.172958');
INSERT INTO `provinces` VALUES ('451122', '广西壮族自治区', '贺州市', '451100', '钟山', '451122', '111.303629', '24.528566');
INSERT INTO `provinces` VALUES ('451123', '广西壮族自治区', '贺州市', '451100', '富川', '451123', '111.277228', '24.81896');
INSERT INTO `provinces` VALUES ('451200', '广西壮族自治区', '河池市', '451200', '河池', '451200', '108.062105', '24.695899');
INSERT INTO `provinces` VALUES ('451202', '广西壮族自治区', '河池市', '451200', '金城江', '451202', '108.062131', '24.695625');
INSERT INTO `provinces` VALUES ('451203', '广西壮族自治区', '河池市', '451200', '宜州', '451203', '108.653965', '24.492193');
INSERT INTO `provinces` VALUES ('451221', '广西壮族自治区', '河池市', '451200', '南丹', '451221', '107.546605', '24.983192');
INSERT INTO `provinces` VALUES ('451222', '广西壮族自治区', '河池市', '451200', '天峨', '451222', '107.174939', '24.985964');
INSERT INTO `provinces` VALUES ('451223', '广西壮族自治区', '河池市', '451200', '凤山', '451223', '107.044592', '24.544561');
INSERT INTO `provinces` VALUES ('451224', '广西壮族自治区', '河池市', '451200', '东兰', '451224', '107.373696', '24.509367');
INSERT INTO `provinces` VALUES ('451225', '广西壮族自治区', '河池市', '451200', '罗城', '451225', '108.902453', '24.779327');
INSERT INTO `provinces` VALUES ('451226', '广西壮族自治区', '河池市', '451200', '环江', '451226', '108.258669', '24.827628');
INSERT INTO `provinces` VALUES ('451227', '广西壮族自治区', '河池市', '451200', '巴马', '451227', '107.253126', '24.139538');
INSERT INTO `provinces` VALUES ('451228', '广西壮族自治区', '河池市', '451200', '都安', '451228', '108.102761', '23.934964');
INSERT INTO `provinces` VALUES ('451229', '广西壮族自治区', '河池市', '451200', '大化', '451229', '107.9945', '23.739596');
INSERT INTO `provinces` VALUES ('451300', '广西壮族自治区', '来宾市', '451300', '来宾', '451300', '109.229772', '23.733766');
INSERT INTO `provinces` VALUES ('451302', '广西壮族自治区', '来宾市', '451300', '兴宾', '451302', '109.230541', '23.732926');
INSERT INTO `provinces` VALUES ('451321', '广西壮族自治区', '来宾市', '451300', '忻城', '451321', '108.667361', '24.064779');
INSERT INTO `provinces` VALUES ('451322', '广西壮族自治区', '来宾市', '451300', '象州', '451322', '109.684555', '23.959824');
INSERT INTO `provinces` VALUES ('451323', '广西壮族自治区', '来宾市', '451300', '武宣', '451323', '109.66287', '23.604162');
INSERT INTO `provinces` VALUES ('451324', '广西壮族自治区', '来宾市', '451300', '金秀', '451324', '110.188556', '24.134941');
INSERT INTO `provinces` VALUES ('451381', '广西壮族自治区', '来宾市', '451300', '合山', '451381', '108.88858', '23.81311');
INSERT INTO `provinces` VALUES ('451400', '广西壮族自治区', '崇左市', '451400', '崇左', '451400', '107.353926', '22.404108');
INSERT INTO `provinces` VALUES ('451402', '广西壮族自治区', '崇左市', '451400', '江州', '451402', '107.354443', '22.40469');
INSERT INTO `provinces` VALUES ('451421', '广西壮族自治区', '崇左市', '451400', '扶绥', '451421', '107.911533', '22.635821');
INSERT INTO `provinces` VALUES ('451422', '广西壮族自治区', '崇左市', '451400', '宁明', '451422', '107.067616', '22.131353');
INSERT INTO `provinces` VALUES ('451423', '广西壮族自治区', '崇左市', '451400', '龙州', '451423', '106.857502', '22.343716');
INSERT INTO `provinces` VALUES ('451424', '广西壮族自治区', '崇左市', '451400', '大新', '451424', '107.200803', '22.833369');
INSERT INTO `provinces` VALUES ('451425', '广西壮族自治区', '崇左市', '451400', '天等', '451425', '107.142441', '23.082484');
INSERT INTO `provinces` VALUES ('451481', '广西壮族自治区', '崇左市', '451400', '凭祥', '451481', '106.759038', '22.108882');
INSERT INTO `provinces` VALUES ('460100', '海南省', '海口市', '460100', '海口', '460100', '110.33119', '20.031971');
INSERT INTO `provinces` VALUES ('460105', '海南省', '海口市', '460100', '秀英', '460105', '110.282393', '20.008145');
INSERT INTO `provinces` VALUES ('460106', '海南省', '海口市', '460100', '龙华区', '460106', '110.330373', '20.031026');
INSERT INTO `provinces` VALUES ('460107', '海南省', '海口市', '460100', '琼山', '460107', '110.354722', '20.001051');
INSERT INTO `provinces` VALUES ('460108', '海南省', '海口市', '460100', '美兰', '460108', '110.356566', '20.03074');
INSERT INTO `provinces` VALUES ('460200', '海南省', '三亚市', '460200', '三亚', '460200', '109.508268', '18.247872');
INSERT INTO `provinces` VALUES ('460202', '海南省', '三亚市', '460200', '海棠区', '460202', '109.760778', '18.407516');
INSERT INTO `provinces` VALUES ('460203', '海南省', '三亚市', '460200', '吉阳区', '460203', '109.512081', '18.247436');
INSERT INTO `provinces` VALUES ('460204', '海南省', '三亚市', '460200', '天涯区', '460204', '109.506357', '18.24734');
INSERT INTO `provinces` VALUES ('460205', '海南省', '三亚市', '460200', '崖州区', '460205', '109.174306', '18.352192');
INSERT INTO `provinces` VALUES ('460300', '海南省', '三沙市', '460300', '三沙', '460300', '112.34882', '16.831039');
INSERT INTO `provinces` VALUES ('460321', '海南省', '三沙市', '460300', '西沙群岛', '460321', '111.792944', '16.204546');
INSERT INTO `provinces` VALUES ('460322', '海南省', '三沙市', '460300', '南沙群岛', '460322', '116.749998', '11.471888');
INSERT INTO `provinces` VALUES ('460323', '海南省', '三沙市', '460300', '中沙群岛', '460323', '117.740071', '15.112856');
INSERT INTO `provinces` VALUES ('460400', '海南省', '儋州市', '460400', '儋州', '460400', '109.576782', '19.517486');
INSERT INTO `provinces` VALUES ('469001', '海南省', '五指山市', '469001', '五指山', '469001', '109.516662', '18.776921');
INSERT INTO `provinces` VALUES ('469002', '海南省', '琼海市', '469002', '琼海', '469002', '110.466785', '19.246011');
INSERT INTO `provinces` VALUES ('469005', '海南省', '文昌市', '469005', '文昌', '469005', '110.753975', '19.612986');
INSERT INTO `provinces` VALUES ('469006', '海南省', '万宁市', '469006', '万宁', '469006', '110.388793', '18.796216');
INSERT INTO `provinces` VALUES ('469007', '海南省', '东方市', '469007', '东方', '469007', '108.653789', '19.10198');
INSERT INTO `provinces` VALUES ('469021', '海南省', '定安县', '469021', '定安', '469021', '110.349235', '19.684966');
INSERT INTO `provinces` VALUES ('469022', '海南省', '屯昌县', '469022', '屯昌', '469022', '110.102773', '19.362916');
INSERT INTO `provinces` VALUES ('469023', '海南省', '澄迈县', '469023', '澄迈', '469023', '110.007147', '19.737095');
INSERT INTO `provinces` VALUES ('469024', '海南省', '临高县', '469024', '临高', '469024', '109.687697', '19.908293');
INSERT INTO `provinces` VALUES ('469025', '海南省', '白沙黎族自治县', '469025', '白沙', '469025', '109.452606', '19.224584');
INSERT INTO `provinces` VALUES ('469026', '海南省', '昌江黎族自治县', '469026', '昌江', '469026', '109.053351', '19.260968');
INSERT INTO `provinces` VALUES ('469027', '海南省', '乐东黎族自治县', '469027', '乐东', '469027', '109.175444', '18.74758');
INSERT INTO `provinces` VALUES ('469028', '海南省', '陵水黎族自治县', '469028', '陵水', '469028', '110.037218', '18.505006');
INSERT INTO `provinces` VALUES ('469029', '海南省', '保亭黎族苗族自治县', '469029', '保亭', '469029', '109.70245', '18.636371');
INSERT INTO `provinces` VALUES ('469030', '海南省', '琼中黎族苗族自治县', '469030', '琼中', '469030', '109.839996', '19.03557');
INSERT INTO `provinces` VALUES ('500100', '重庆市', '重庆市', '500100', '重庆', '500100', '108.170255', '29.291965');
INSERT INTO `provinces` VALUES ('500101', '重庆市', '重庆市', '500100', '万州', '500101', '108.380246', '30.807807');
INSERT INTO `provinces` VALUES ('500102', '重庆市', '重庆市', '500100', '涪陵', '500102', '107.394905', '29.703652');
INSERT INTO `provinces` VALUES ('500103', '重庆市', '重庆市', '500100', '渝中', '500103', '106.56288', '29.556742');
INSERT INTO `provinces` VALUES ('500104', '重庆市', '重庆市', '500100', '大渡口', '500104', '106.48613', '29.481002');
INSERT INTO `provinces` VALUES ('500105', '重庆市', '重庆市', '500100', '江北', '500105', '106.532844', '29.575352');
INSERT INTO `provinces` VALUES ('500106', '重庆市', '重庆市', '500100', '沙坪坝', '500106', '106.4542', '29.541224');
INSERT INTO `provinces` VALUES ('500107', '重庆市', '重庆市', '500100', '九龙坡', '500107', '106.480989', '29.523492');
INSERT INTO `provinces` VALUES ('500108', '重庆市', '重庆市', '500100', '南岸', '500108', '106.560813', '29.523992');
INSERT INTO `provinces` VALUES ('500109', '重庆市', '重庆市', '500100', '北碚', '500109', '106.437868', '29.82543');
INSERT INTO `provinces` VALUES ('500110', '重庆市', '重庆市', '500100', '綦江', '500110', '106.651417', '29.028091');
INSERT INTO `provinces` VALUES ('500111', '重庆市', '重庆市', '500100', '大足', '500111', '105.715319', '29.700498');
INSERT INTO `provinces` VALUES ('500112', '重庆市', '重庆市', '500100', '渝北', '500112', '106.512851', '29.601451');
INSERT INTO `provinces` VALUES ('500113', '重庆市', '重庆市', '500100', '巴南', '500113', '106.519423', '29.381919');
INSERT INTO `provinces` VALUES ('500114', '重庆市', '重庆市', '500100', '黔江', '500114', '108.782577', '29.527548');
INSERT INTO `provinces` VALUES ('500115', '重庆市', '重庆市', '500100', '长寿', '500115', '107.074854', '29.833671');
INSERT INTO `provinces` VALUES ('500116', '重庆市', '重庆市', '500100', '江津', '500116', '106.253156', '29.283387');
INSERT INTO `provinces` VALUES ('500117', '重庆市', '重庆市', '500100', '合川', '500117', '106.265554', '29.990993');
INSERT INTO `provinces` VALUES ('500118', '重庆市', '重庆市', '500100', '永川', '500118', '105.894714', '29.348748');
INSERT INTO `provinces` VALUES ('500119', '重庆市', '重庆市', '500100', '南川', '500119', '107.098153', '29.156646');
INSERT INTO `provinces` VALUES ('500120', '重庆市', '重庆市', '500100', '璧山', '500120', '106.231126', '29.593581');
INSERT INTO `provinces` VALUES ('500151', '重庆市', '重庆市', '500100', '铜梁', '500151', '106.054948', '29.839944');
INSERT INTO `provinces` VALUES ('500152', '重庆市', '重庆市', '500100', '潼南', '500152', '105.841818', '30.189554');
INSERT INTO `provinces` VALUES ('500153', '重庆市', '重庆市', '500100', '荣昌', '500153', '105.594061', '29.403627');
INSERT INTO `provinces` VALUES ('500154', '重庆市', '重庆市', '500100', '开州', '500154', '108.413317', '31.167735');
INSERT INTO `provinces` VALUES ('500155', '重庆市', '重庆市', '500100', '梁平', '500155', '107.800034', '30.672168');
INSERT INTO `provinces` VALUES ('500156', '重庆市', '重庆市', '500100', '武隆', '500156', '107.75655', '29.32376');
INSERT INTO `provinces` VALUES ('500229', '重庆市', '重庆市', '500200', '城口', '500229', '108.6649', '31.946293');
INSERT INTO `provinces` VALUES ('500230', '重庆市', '重庆市', '500200', '丰都', '500230', '107.73248', '29.866424');
INSERT INTO `provinces` VALUES ('500231', '重庆市', '重庆市', '500200', '垫江', '500231', '107.348692', '30.330012');
INSERT INTO `provinces` VALUES ('500233', '重庆市', '重庆市', '500200', '忠县', '500233', '108.037518', '30.291537');
INSERT INTO `provinces` VALUES ('500235', '重庆市', '重庆市', '500200', '云阳', '500235', '108.697698', '30.930529');
INSERT INTO `provinces` VALUES ('500236', '重庆市', '重庆市', '500200', '奉节', '500236', '109.465774', '31.019967');
INSERT INTO `provinces` VALUES ('500237', '重庆市', '重庆市', '500200', '巫山', '500237', '109.878928', '31.074843');
INSERT INTO `provinces` VALUES ('500238', '重庆市', '重庆市', '500200', '巫溪', '500238', '109.628912', '31.3966');
INSERT INTO `provinces` VALUES ('500240', '重庆市', '重庆市', '500200', '石柱', '500240', '108.112448', '29.99853');
INSERT INTO `provinces` VALUES ('500241', '重庆市', '重庆市', '500200', '秀山', '500241', '108.996043', '28.444772');
INSERT INTO `provinces` VALUES ('500242', '重庆市', '重庆市', '500200', '酉阳', '500242', '108.767201', '28.839828');
INSERT INTO `provinces` VALUES ('500243', '重庆市', '重庆市', '500200', '彭水', '500243', '108.166551', '29.293856');
INSERT INTO `provinces` VALUES ('510100', '四川省', '成都市', '510100', '成都', '510100', '104.065735', '30.659462');
INSERT INTO `provinces` VALUES ('510104', '四川省', '成都市', '510100', '锦江', '510104', '104.080989', '30.657689');
INSERT INTO `provinces` VALUES ('510105', '四川省', '成都市', '510100', '青羊', '510105', '104.055731', '30.667648');
INSERT INTO `provinces` VALUES ('510106', '四川省', '成都市', '510100', '金牛', '510106', '104.043487', '30.692058');
INSERT INTO `provinces` VALUES ('510107', '四川省', '成都市', '510100', '武侯', '510107', '104.05167', '30.630862');
INSERT INTO `provinces` VALUES ('510108', '四川省', '成都市', '510100', '成华', '510108', '104.103077', '30.660275');
INSERT INTO `provinces` VALUES ('510112', '四川省', '成都市', '510100', '龙泉驿', '510112', '104.269181', '30.56065');
INSERT INTO `provinces` VALUES ('510113', '四川省', '成都市', '510100', '青白江', '510113', '104.25494', '30.883438');
INSERT INTO `provinces` VALUES ('510114', '四川省', '成都市', '510100', '新都', '510114', '104.16022', '30.824223');
INSERT INTO `provinces` VALUES ('510115', '四川省', '成都市', '510100', '温江', '510115', '103.836776', '30.697996');
INSERT INTO `provinces` VALUES ('510116', '四川省', '成都市', '510100', '双流', '510116', '103.922706', '30.573243');
INSERT INTO `provinces` VALUES ('510117', '四川省', '成都市', '510100', '郫都', '510117', '103.887842', '30.808752');
INSERT INTO `provinces` VALUES ('510121', '四川省', '成都市', '510100', '金堂', '510121', '104.415604', '30.858417');
INSERT INTO `provinces` VALUES ('510129', '四川省', '成都市', '510100', '大邑', '510129', '103.522397', '30.586602');
INSERT INTO `provinces` VALUES ('510131', '四川省', '成都市', '510100', '蒲江', '510131', '103.511541', '30.194359');
INSERT INTO `provinces` VALUES ('510132', '四川省', '成都市', '510100', '新津', '510132', '103.812449', '30.414284');
INSERT INTO `provinces` VALUES ('510181', '四川省', '成都市', '510100', '都江堰', '510181', '103.627898', '30.99114');
INSERT INTO `provinces` VALUES ('510182', '四川省', '成都市', '510100', '彭州', '510182', '103.941173', '30.985161');
INSERT INTO `provinces` VALUES ('510183', '四川省', '成都市', '510100', '邛崃', '510183', '103.46143', '30.413271');
INSERT INTO `provinces` VALUES ('510184', '四川省', '成都市', '510100', '崇州', '510184', '103.671049', '30.631478');
INSERT INTO `provinces` VALUES ('510185', '四川省', '成都市', '510100', '简阳', '510185', '104.550339', '30.390666');
INSERT INTO `provinces` VALUES ('510300', '四川省', '自贡市', '510300', '自贡', '510300', '104.773447', '29.352765');
INSERT INTO `provinces` VALUES ('510302', '四川省', '自贡市', '510300', '自流井', '510302', '104.778188', '29.343231');
INSERT INTO `provinces` VALUES ('510303', '四川省', '自贡市', '510300', '贡井', '510303', '104.714372', '29.345675');
INSERT INTO `provinces` VALUES ('510304', '四川省', '自贡市', '510300', '大安区', '510304', '104.783229', '29.367136');
INSERT INTO `provinces` VALUES ('510311', '四川省', '自贡市', '510300', '沿滩', '510311', '104.876417', '29.272521');
INSERT INTO `provinces` VALUES ('510321', '四川省', '自贡市', '510300', '荣县', '510321', '104.423932', '29.454851');
INSERT INTO `provinces` VALUES ('510322', '四川省', '自贡市', '510300', '富顺', '510322', '104.984256', '29.181282');
INSERT INTO `provinces` VALUES ('510400', '四川省', '攀枝花市', '510400', '攀枝花', '510400', '101.716007', '26.580446');
INSERT INTO `provinces` VALUES ('510402', '四川省', '攀枝花市', '510400', '东区', '510402', '101.715134', '26.580887');
INSERT INTO `provinces` VALUES ('510403', '四川省', '攀枝花市', '510400', '西区', '510403', '101.637969', '26.596776');
INSERT INTO `provinces` VALUES ('510411', '四川省', '攀枝花市', '510400', '仁和', '510411', '101.737916', '26.497185');
INSERT INTO `provinces` VALUES ('510421', '四川省', '攀枝花市', '510400', '米易', '510421', '102.109877', '26.887474');
INSERT INTO `provinces` VALUES ('510422', '四川省', '攀枝花市', '510400', '盐边', '510422', '101.851848', '26.677619');
INSERT INTO `provinces` VALUES ('510500', '四川省', '泸州市', '510500', '泸州', '510500', '105.443348', '28.889138');
INSERT INTO `provinces` VALUES ('510502', '四川省', '泸州市', '510500', '江阳', '510502', '105.445131', '28.882889');
INSERT INTO `provinces` VALUES ('510503', '四川省', '泸州市', '510500', '纳溪', '510503', '105.37721', '28.77631');
INSERT INTO `provinces` VALUES ('510504', '四川省', '泸州市', '510500', '龙马潭', '510504', '105.435228', '28.897572');
INSERT INTO `provinces` VALUES ('510521', '四川省', '泸州市', '510500', '泸县', '510521', '105.376335', '29.151288');
INSERT INTO `provinces` VALUES ('510522', '四川省', '泸州市', '510500', '合江', '510522', '105.834098', '28.810325');
INSERT INTO `provinces` VALUES ('510524', '四川省', '泸州市', '510500', '叙永', '510524', '105.437775', '28.167919');
INSERT INTO `provinces` VALUES ('510525', '四川省', '泸州市', '510500', '古蔺', '510525', '105.813359', '28.03948');
INSERT INTO `provinces` VALUES ('510600', '四川省', '德阳市', '510600', '德阳', '510600', '104.398651', '31.127991');
INSERT INTO `provinces` VALUES ('510603', '四川省', '德阳市', '510600', '旌阳', '510603', '104.389648', '31.130428');
INSERT INTO `provinces` VALUES ('510604', '四川省', '德阳市', '510600', '罗江', '510604', '104.507126', '31.303281');
INSERT INTO `provinces` VALUES ('510623', '四川省', '德阳市', '510600', '中江', '510623', '104.677831', '31.03681');
INSERT INTO `provinces` VALUES ('510681', '四川省', '德阳市', '510600', '广汉', '510681', '104.281903', '30.97715');
INSERT INTO `provinces` VALUES ('510682', '四川省', '德阳市', '510600', '什邡', '510682', '104.173653', '31.126881');
INSERT INTO `provinces` VALUES ('510683', '四川省', '德阳市', '510600', '绵竹', '510683', '104.200162', '31.343084');
INSERT INTO `provinces` VALUES ('510700', '四川省', '绵阳市', '510700', '绵阳', '510700', '104.741722', '31.46402');
INSERT INTO `provinces` VALUES ('510703', '四川省', '绵阳市', '510700', '涪城', '510703', '104.740971', '31.463557');
INSERT INTO `provinces` VALUES ('510704', '四川省', '绵阳市', '510700', '游仙', '510704', '104.770006', '31.484772');
INSERT INTO `provinces` VALUES ('510705', '四川省', '绵阳市', '510700', '安州', '510705', '104.560341', '31.53894');
INSERT INTO `provinces` VALUES ('510722', '四川省', '绵阳市', '510700', '三台', '510722', '105.090316', '31.090909');
INSERT INTO `provinces` VALUES ('510723', '四川省', '绵阳市', '510700', '盐亭', '510723', '105.391991', '31.22318');
INSERT INTO `provinces` VALUES ('510725', '四川省', '绵阳市', '510700', '梓潼', '510725', '105.16353', '31.635225');
INSERT INTO `provinces` VALUES ('510726', '四川省', '绵阳市', '510700', '北川', '510726', '104.468069', '31.615863');
INSERT INTO `provinces` VALUES ('510727', '四川省', '绵阳市', '510700', '平武', '510727', '104.530555', '32.407588');
INSERT INTO `provinces` VALUES ('510781', '四川省', '绵阳市', '510700', '江油', '510781', '104.744431', '31.776386');
INSERT INTO `provinces` VALUES ('510800', '四川省', '广元市', '510800', '广元', '510800', '105.829757', '32.433668');
INSERT INTO `provinces` VALUES ('510802', '四川省', '广元市', '510800', '利州', '510802', '105.826194', '32.432276');
INSERT INTO `provinces` VALUES ('510811', '四川省', '广元市', '510800', '昭化', '510811', '105.964121', '32.322788');
INSERT INTO `provinces` VALUES ('510812', '四川省', '广元市', '510800', '朝天', '510812', '105.88917', '32.642632');
INSERT INTO `provinces` VALUES ('510821', '四川省', '广元市', '510800', '旺苍', '510821', '106.290426', '32.22833');
INSERT INTO `provinces` VALUES ('510822', '四川省', '广元市', '510800', '青川', '510822', '105.238847', '32.585655');
INSERT INTO `provinces` VALUES ('510823', '四川省', '广元市', '510800', '剑阁', '510823', '105.527035', '32.286517');
INSERT INTO `provinces` VALUES ('510824', '四川省', '广元市', '510800', '苍溪', '510824', '105.939706', '31.732251');
INSERT INTO `provinces` VALUES ('510900', '四川省', '遂宁市', '510900', '遂宁', '510900', '105.571331', '30.513311');
INSERT INTO `provinces` VALUES ('510903', '四川省', '遂宁市', '510900', '船山', '510903', '105.582215', '30.502647');
INSERT INTO `provinces` VALUES ('510904', '四川省', '遂宁市', '510900', '安居', '510904', '105.459383', '30.346121');
INSERT INTO `provinces` VALUES ('510921', '四川省', '遂宁市', '510900', '蓬溪', '510921', '105.713699', '30.774883');
INSERT INTO `provinces` VALUES ('510922', '四川省', '遂宁市', '510900', '射洪', '510922', '105.381849', '30.868752');
INSERT INTO `provinces` VALUES ('510923', '四川省', '遂宁市', '510900', '大英', '510923', '105.252187', '30.581571');
INSERT INTO `provinces` VALUES ('511000', '四川省', '内江市', '511000', '内江', '511000', '105.066138', '29.58708');
INSERT INTO `provinces` VALUES ('511002', '四川省', '内江市', '511000', '市中区', '511002', '105.065467', '29.585265');
INSERT INTO `provinces` VALUES ('511011', '四川省', '内江市', '511000', '东兴区', '511011', '105.067203', '29.600107');
INSERT INTO `provinces` VALUES ('511024', '四川省', '内江市', '511000', '威远', '511024', '104.668327', '29.52686');
INSERT INTO `provinces` VALUES ('511025', '四川省', '内江市', '511000', '资中', '511025', '104.852463', '29.775295');
INSERT INTO `provinces` VALUES ('511083', '四川省', '内江市', '511000', '隆昌', '511083', '105.288074', '29.338162');
INSERT INTO `provinces` VALUES ('511100', '四川省', '乐山市', '511100', '乐山', '511100', '103.761263', '29.582024');
INSERT INTO `provinces` VALUES ('511102', '四川省', '乐山市', '511100', '市中区', '511102', '103.75539', '29.588327');
INSERT INTO `provinces` VALUES ('511111', '四川省', '乐山市', '511100', '沙湾区', '511111', '103.549961', '29.416536');
INSERT INTO `provinces` VALUES ('511112', '四川省', '乐山市', '511100', '五通桥', '511112', '103.816837', '29.406186');
INSERT INTO `provinces` VALUES ('511113', '四川省', '乐山市', '511100', '金口河', '511113', '103.077831', '29.24602');
INSERT INTO `provinces` VALUES ('511123', '四川省', '乐山市', '511100', '犍为', '511123', '103.944266', '29.209782');
INSERT INTO `provinces` VALUES ('511124', '四川省', '乐山市', '511100', '井研', '511124', '104.06885', '29.651645');
INSERT INTO `provinces` VALUES ('511126', '四川省', '乐山市', '511100', '夹江', '511126', '103.578862', '29.741019');
INSERT INTO `provinces` VALUES ('511129', '四川省', '乐山市', '511100', '沐川', '511129', '103.90211', '28.956338');
INSERT INTO `provinces` VALUES ('511132', '四川省', '乐山市', '511100', '峨边', '511132', '103.262148', '29.230271');
INSERT INTO `provinces` VALUES ('511133', '四川省', '乐山市', '511100', '马边', '511133', '103.546851', '28.838933');
INSERT INTO `provinces` VALUES ('511181', '四川省', '乐山市', '511100', '峨眉山', '511181', '103.492488', '29.597478');
INSERT INTO `provinces` VALUES ('511300', '四川省', '南充市', '511300', '南充', '511300', '106.082974', '30.795281');
INSERT INTO `provinces` VALUES ('511302', '四川省', '南充市', '511300', '顺庆', '511302', '106.084091', '30.795572');
INSERT INTO `provinces` VALUES ('511303', '四川省', '南充市', '511300', '高坪', '511303', '106.108996', '30.781809');
INSERT INTO `provinces` VALUES ('511304', '四川省', '南充市', '511300', '嘉陵', '511304', '106.067027', '30.762976');
INSERT INTO `provinces` VALUES ('511321', '四川省', '南充市', '511300', '南部', '511321', '106.061138', '31.349407');
INSERT INTO `provinces` VALUES ('511322', '四川省', '南充市', '511300', '营山', '511322', '106.564893', '31.075907');
INSERT INTO `provinces` VALUES ('511323', '四川省', '南充市', '511300', '蓬安', '511323', '106.413488', '31.027978');
INSERT INTO `provinces` VALUES ('511324', '四川省', '南充市', '511300', '仪陇', '511324', '106.297083', '31.271261');
INSERT INTO `provinces` VALUES ('511325', '四川省', '南充市', '511300', '西充', '511325', '105.893021', '30.994616');
INSERT INTO `provinces` VALUES ('511381', '四川省', '南充市', '511300', '阆中', '511381', '105.975266', '31.580466');
INSERT INTO `provinces` VALUES ('511400', '四川省', '眉山市', '511400', '眉山', '511400', '103.831788', '30.048318');
INSERT INTO `provinces` VALUES ('511402', '四川省', '眉山市', '511400', '东坡', '511402', '103.831553', '30.048128');
INSERT INTO `provinces` VALUES ('511403', '四川省', '眉山市', '511400', '彭山', '511403', '103.8701', '30.192298');
INSERT INTO `provinces` VALUES ('511421', '四川省', '眉山市', '511400', '仁寿', '511421', '104.147646', '29.996721');
INSERT INTO `provinces` VALUES ('511423', '四川省', '眉山市', '511400', '洪雅', '511423', '103.375006', '29.904867');
INSERT INTO `provinces` VALUES ('511424', '四川省', '眉山市', '511400', '丹棱', '511424', '103.518333', '30.012751');
INSERT INTO `provinces` VALUES ('511425', '四川省', '眉山市', '511400', '青神', '511425', '103.846131', '29.831469');
INSERT INTO `provinces` VALUES ('511500', '四川省', '宜宾市', '511500', '宜宾', '511500', '104.630825', '28.760189');
INSERT INTO `provinces` VALUES ('511502', '四川省', '宜宾市', '511500', '翠屏', '511502', '104.630231', '28.760179');
INSERT INTO `provinces` VALUES ('511503', '四川省', '宜宾市', '511500', '南溪', '511503', '104.981133', '28.839806');
INSERT INTO `provinces` VALUES ('511504', '四川省', '宜宾市', '511500', '叙州', '511504', '104.53944', '28.69625');
INSERT INTO `provinces` VALUES ('511523', '四川省', '宜宾市', '511500', '江安', '511523', '105.068697', '28.728102');
INSERT INTO `provinces` VALUES ('511524', '四川省', '宜宾市', '511500', '长宁', '511524', '104.921116', '28.577271');
INSERT INTO `provinces` VALUES ('511525', '四川省', '宜宾市', '511500', '高县', '511525', '104.519187', '28.435676');
INSERT INTO `provinces` VALUES ('511526', '四川省', '宜宾市', '511500', '珙县', '511526', '104.712268', '28.449041');
INSERT INTO `provinces` VALUES ('511527', '四川省', '宜宾市', '511500', '筠连', '511527', '104.507848', '28.162017');
INSERT INTO `provinces` VALUES ('511528', '四川省', '宜宾市', '511500', '兴文', '511528', '105.236549', '28.302988');
INSERT INTO `provinces` VALUES ('511529', '四川省', '宜宾市', '511500', '屏山', '511529', '104.162617', '28.64237');
INSERT INTO `provinces` VALUES ('511600', '四川省', '广安市', '511600', '广安', '511600', '106.633369', '30.456398');
INSERT INTO `provinces` VALUES ('511602', '四川省', '广安市', '511600', '广安区', '511602', '106.64853', '30.47977');
INSERT INTO `provinces` VALUES ('511603', '四川省', '广安市', '511600', '前锋', '511603', '106.893277', '30.4963');
INSERT INTO `provinces` VALUES ('511621', '四川省', '广安市', '511600', '岳池', '511621', '106.444451', '30.533538');
INSERT INTO `provinces` VALUES ('511622', '四川省', '广安市', '511600', '武胜', '511622', '106.292473', '30.344291');
INSERT INTO `provinces` VALUES ('511623', '四川省', '广安市', '511600', '邻水', '511623', '106.934968', '30.334323');
INSERT INTO `provinces` VALUES ('511681', '四川省', '广安市', '511600', '华蓥', '511681', '106.777882', '30.380574');
INSERT INTO `provinces` VALUES ('511700', '四川省', '达州市', '511700', '达州', '511700', '107.502262', '31.209484');
INSERT INTO `provinces` VALUES ('511702', '四川省', '达州市', '511700', '通川', '511702', '107.501062', '31.213522');
INSERT INTO `provinces` VALUES ('511703', '四川省', '达州市', '511700', '达川', '511703', '107.507926', '31.199062');
INSERT INTO `provinces` VALUES ('511722', '四川省', '达州市', '511700', '宣汉', '511722', '107.722254', '31.355025');
INSERT INTO `provinces` VALUES ('511723', '四川省', '达州市', '511700', '开江', '511723', '107.864135', '31.085537');
INSERT INTO `provinces` VALUES ('511724', '四川省', '达州市', '511700', '大竹', '511724', '107.20742', '30.736289');
INSERT INTO `provinces` VALUES ('511725', '四川省', '达州市', '511700', '渠县', '511725', '106.970746', '30.836348');
INSERT INTO `provinces` VALUES ('511781', '四川省', '达州市', '511700', '万源', '511781', '108.037548', '32.06777');
INSERT INTO `provinces` VALUES ('511800', '四川省', '雅安市', '511800', '雅安', '511800', '103.001033', '29.987722');
INSERT INTO `provinces` VALUES ('511802', '四川省', '雅安市', '511800', '雨城', '511802', '103.003398', '29.981831');
INSERT INTO `provinces` VALUES ('511803', '四川省', '雅安市', '511800', '名山', '511803', '103.112214', '30.084718');
INSERT INTO `provinces` VALUES ('511822', '四川省', '雅安市', '511800', '荥经', '511822', '102.844674', '29.795529');
INSERT INTO `provinces` VALUES ('511823', '四川省', '雅安市', '511800', '汉源', '511823', '102.677145', '29.349915');
INSERT INTO `provinces` VALUES ('511824', '四川省', '雅安市', '511800', '石棉', '511824', '102.35962', '29.234063');
INSERT INTO `provinces` VALUES ('511825', '四川省', '雅安市', '511800', '天全', '511825', '102.763462', '30.059955');
INSERT INTO `provinces` VALUES ('511826', '四川省', '雅安市', '511800', '芦山', '511826', '102.924016', '30.152907');
INSERT INTO `provinces` VALUES ('511827', '四川省', '雅安市', '511800', '宝兴', '511827', '102.813377', '30.369026');
INSERT INTO `provinces` VALUES ('511900', '四川省', '巴中市', '511900', '巴中', '511900', '106.753669', '31.858809');
INSERT INTO `provinces` VALUES ('511902', '四川省', '巴中市', '511900', '巴州', '511902', '106.753671', '31.858366');
INSERT INTO `provinces` VALUES ('511903', '四川省', '巴中市', '511900', '恩阳', '511903', '106.486515', '31.816336');
INSERT INTO `provinces` VALUES ('511921', '四川省', '巴中市', '511900', '通江', '511921', '107.247621', '31.91212');
INSERT INTO `provinces` VALUES ('511922', '四川省', '巴中市', '511900', '南江', '511922', '106.843418', '32.353164');
INSERT INTO `provinces` VALUES ('511923', '四川省', '巴中市', '511900', '平昌', '511923', '107.101937', '31.562814');
INSERT INTO `provinces` VALUES ('512000', '四川省', '资阳市', '512000', '资阳', '512000', '104.641917', '30.122211');
INSERT INTO `provinces` VALUES ('512002', '四川省', '资阳市', '512000', '雁江', '512002', '104.642338', '30.121686');
INSERT INTO `provinces` VALUES ('512021', '四川省', '资阳市', '512000', '安岳', '512021', '105.336764', '30.099206');
INSERT INTO `provinces` VALUES ('512022', '四川省', '资阳市', '512000', '乐至', '512022', '105.031142', '30.275619');
INSERT INTO `provinces` VALUES ('513200', '四川省', '阿坝藏族羌族自治州', '513200', '阿坝', '513200', '102.221374', '31.899792');
INSERT INTO `provinces` VALUES ('513201', '四川省', '阿坝藏族羌族自治州', '513200', '马尔康', '513201', '102.221187', '31.899761');
INSERT INTO `provinces` VALUES ('513221', '四川省', '阿坝藏族羌族自治州', '513200', '汶川', '513221', '103.580675', '31.47463');
INSERT INTO `provinces` VALUES ('513222', '四川省', '阿坝藏族羌族自治州', '513200', '理县', '513222', '103.165486', '31.436764');
INSERT INTO `provinces` VALUES ('513223', '四川省', '阿坝藏族羌族自治州', '513200', '茂县', '513223', '103.850684', '31.680407');
INSERT INTO `provinces` VALUES ('513224', '四川省', '阿坝藏族羌族自治州', '513200', '松潘', '513224', '103.599177', '32.63838');
INSERT INTO `provinces` VALUES ('513225', '四川省', '阿坝藏族羌族自治州', '513200', '九寨沟', '513225', '104.236344', '33.262097');
INSERT INTO `provinces` VALUES ('513226', '四川省', '阿坝藏族羌族自治州', '513200', '金川', '513226', '102.064647', '31.476356');
INSERT INTO `provinces` VALUES ('513227', '四川省', '阿坝藏族羌族自治州', '513200', '小金', '513227', '102.363193', '30.999016');
INSERT INTO `provinces` VALUES ('513228', '四川省', '阿坝藏族羌族自治州', '513200', '黑水', '513228', '102.990805', '32.061721');
INSERT INTO `provinces` VALUES ('513230', '四川省', '阿坝藏族羌族自治州', '513200', '壤塘', '513230', '100.979136', '32.264887');
INSERT INTO `provinces` VALUES ('513231', '四川省', '阿坝藏族羌族自治州', '513200', '阿坝县', '513231', '101.71361', '32.908221');
INSERT INTO `provinces` VALUES ('513232', '四川省', '阿坝藏族羌族自治州', '513200', '若尔盖', '513232', '102.963726', '33.575934');
INSERT INTO `provinces` VALUES ('513233', '四川省', '阿坝藏族羌族自治州', '513200', '红原', '513233', '102.544906', '32.793902');
INSERT INTO `provinces` VALUES ('513300', '四川省', '甘孜藏族自治州', '513300', '甘孜', '513300', '101.963815', '30.050663');
INSERT INTO `provinces` VALUES ('513301', '四川省', '甘孜藏族自治州', '513300', '康定', '513301', '101.964057', '30.050738');
INSERT INTO `provinces` VALUES ('513322', '四川省', '甘孜藏族自治州', '513300', '泸定', '513322', '102.233225', '29.912482');
INSERT INTO `provinces` VALUES ('513323', '四川省', '甘孜藏族自治州', '513300', '丹巴', '513323', '101.886125', '30.877083');
INSERT INTO `provinces` VALUES ('513324', '四川省', '甘孜藏族自治州', '513300', '九龙', '513324', '101.506942', '29.001975');
INSERT INTO `provinces` VALUES ('513325', '四川省', '甘孜藏族自治州', '513300', '雅江', '513325', '101.015735', '30.03225');
INSERT INTO `provinces` VALUES ('513326', '四川省', '甘孜藏族自治州', '513300', '道孚', '513326', '101.123327', '30.978767');
INSERT INTO `provinces` VALUES ('513327', '四川省', '甘孜藏族自治州', '513300', '炉霍', '513327', '100.679495', '31.392674');
INSERT INTO `provinces` VALUES ('513328', '四川省', '甘孜藏族自治州', '513300', '甘孜县', '513328', '99.99921', '31.62896');
INSERT INTO `provinces` VALUES ('513329', '四川省', '甘孜藏族自治州', '513300', '新龙', '513329', '100.312094', '30.93896');
INSERT INTO `provinces` VALUES ('513330', '四川省', '甘孜藏族自治州', '513300', '德格', '513330', '98.57999', '31.806729');
INSERT INTO `provinces` VALUES ('513331', '四川省', '甘孜藏族自治州', '513300', '白玉', '513331', '98.824343', '31.208805');
INSERT INTO `provinces` VALUES ('513332', '四川省', '甘孜藏族自治州', '513300', '石渠', '513332', '98.100887', '32.975302');
INSERT INTO `provinces` VALUES ('513333', '四川省', '甘孜藏族自治州', '513300', '色达', '513333', '100.331657', '32.268777');
INSERT INTO `provinces` VALUES ('513334', '四川省', '甘孜藏族自治州', '513300', '理塘', '513334', '100.269862', '29.991807');
INSERT INTO `provinces` VALUES ('513335', '四川省', '甘孜藏族自治州', '513300', '巴塘', '513335', '99.109037', '30.005723');
INSERT INTO `provinces` VALUES ('513336', '四川省', '甘孜藏族自治州', '513300', '乡城', '513336', '99.799943', '28.930855');
INSERT INTO `provinces` VALUES ('513337', '四川省', '甘孜藏族自治州', '513300', '稻城', '513337', '100.296689', '29.037544');
INSERT INTO `provinces` VALUES ('513338', '四川省', '甘孜藏族自治州', '513300', '得荣', '513338', '99.288036', '28.71134');
INSERT INTO `provinces` VALUES ('513400', '四川省', '凉山彝族自治州', '513400', '凉山', '513400', '102.258746', '27.886762');
INSERT INTO `provinces` VALUES ('513401', '四川省', '凉山彝族自治州', '513400', '西昌', '513401', '102.258758', '27.885786');
INSERT INTO `provinces` VALUES ('513422', '四川省', '凉山彝族自治州', '513400', '木里', '513422', '101.280184', '27.926859');
INSERT INTO `provinces` VALUES ('513423', '四川省', '凉山彝族自治州', '513400', '盐源', '513423', '101.508909', '27.423415');
INSERT INTO `provinces` VALUES ('513424', '四川省', '凉山彝族自治州', '513400', '德昌', '513424', '102.178845', '27.403827');
INSERT INTO `provinces` VALUES ('513425', '四川省', '凉山彝族自治州', '513400', '会理', '513425', '102.249548', '26.658702');
INSERT INTO `provinces` VALUES ('513426', '四川省', '凉山彝族自治州', '513400', '会东', '513426', '102.578985', '26.630713');
INSERT INTO `provinces` VALUES ('513427', '四川省', '凉山彝族自治州', '513400', '宁南', '513427', '102.757374', '27.065205');
INSERT INTO `provinces` VALUES ('513428', '四川省', '凉山彝族自治州', '513400', '普格', '513428', '102.541082', '27.376828');
INSERT INTO `provinces` VALUES ('513429', '四川省', '凉山彝族自治州', '513400', '布拖', '513429', '102.808801', '27.709062');
INSERT INTO `provinces` VALUES ('513430', '四川省', '凉山彝族自治州', '513400', '金阳', '513430', '103.248704', '27.695916');
INSERT INTO `provinces` VALUES ('513431', '四川省', '凉山彝族自治州', '513400', '昭觉', '513431', '102.843991', '28.010554');
INSERT INTO `provinces` VALUES ('513432', '四川省', '凉山彝族自治州', '513400', '喜德', '513432', '102.412342', '28.305486');
INSERT INTO `provinces` VALUES ('513433', '四川省', '凉山彝族自治州', '513400', '冕宁', '513433', '102.170046', '28.550844');
INSERT INTO `provinces` VALUES ('513434', '四川省', '凉山彝族自治州', '513400', '越西', '513434', '102.508875', '28.639632');
INSERT INTO `provinces` VALUES ('513435', '四川省', '凉山彝族自治州', '513400', '甘洛', '513435', '102.775924', '28.977094');
INSERT INTO `provinces` VALUES ('513436', '四川省', '凉山彝族自治州', '513400', '美姑', '513436', '103.132007', '28.327946');
INSERT INTO `provinces` VALUES ('513437', '四川省', '凉山彝族自治州', '513400', '雷波', '513437', '103.571584', '28.262946');
INSERT INTO `provinces` VALUES ('520100', '贵州省', '贵阳市', '520100', '贵阳', '520100', '106.713478', '26.578343');
INSERT INTO `provinces` VALUES ('520102', '贵州省', '贵阳市', '520100', '南明', '520102', '106.715963', '26.573743');
INSERT INTO `provinces` VALUES ('520103', '贵州省', '贵阳市', '520100', '云岩', '520103', '106.713397', '26.58301');
INSERT INTO `provinces` VALUES ('520111', '贵州省', '贵阳市', '520100', '花溪', '520111', '106.670791', '26.410464');
INSERT INTO `provinces` VALUES ('520112', '贵州省', '贵阳市', '520100', '乌当', '520112', '106.762123', '26.630928');
INSERT INTO `provinces` VALUES ('520113', '贵州省', '贵阳市', '520100', '白云区', '520113', '106.633037', '26.676849');
INSERT INTO `provinces` VALUES ('520115', '贵州省', '贵阳市', '520100', '观山湖', '520115', '106.626323', '26.646358');
INSERT INTO `provinces` VALUES ('520121', '贵州省', '贵阳市', '520100', '开阳', '520121', '106.969438', '27.056793');
INSERT INTO `provinces` VALUES ('520122', '贵州省', '贵阳市', '520100', '息烽', '520122', '106.737693', '27.092665');
INSERT INTO `provinces` VALUES ('520123', '贵州省', '贵阳市', '520100', '修文', '520123', '106.599218', '26.840672');
INSERT INTO `provinces` VALUES ('520181', '贵州省', '贵阳市', '520100', '清镇', '520181', '106.470278', '26.551289');
INSERT INTO `provinces` VALUES ('520200', '贵州省', '六盘水市', '520200', '六盘水', '520200', '104.846743', '26.584643');
INSERT INTO `provinces` VALUES ('520201', '贵州省', '六盘水市', '520200', '钟山区', '520201', '104.846244', '26.584805');
INSERT INTO `provinces` VALUES ('520203', '贵州省', '六盘水市', '520200', '六枝', '520203', '105.474235', '26.210662');
INSERT INTO `provinces` VALUES ('520221', '贵州省', '六盘水市', '520200', '水城', '520221', '104.95685', '26.540478');
INSERT INTO `provinces` VALUES ('520281', '贵州省', '六盘水市', '520200', '盘州', '520281', '104.468367', '25.706966');
INSERT INTO `provinces` VALUES ('520300', '贵州省', '遵义市', '520300', '遵义', '520300', '106.937265', '27.706626');
INSERT INTO `provinces` VALUES ('520302', '贵州省', '遵义市', '520300', '红花岗', '520302', '106.943784', '27.694395');
INSERT INTO `provinces` VALUES ('520303', '贵州省', '遵义市', '520300', '汇川', '520303', '106.937265', '27.706626');
INSERT INTO `provinces` VALUES ('520304', '贵州省', '遵义市', '520300', '播州', '520304', '106.831668', '27.535288');
INSERT INTO `provinces` VALUES ('520322', '贵州省', '遵义市', '520300', '桐梓', '520322', '106.826591', '28.131559');
INSERT INTO `provinces` VALUES ('520323', '贵州省', '遵义市', '520300', '绥阳', '520323', '107.191024', '27.951342');
INSERT INTO `provinces` VALUES ('520324', '贵州省', '遵义市', '520300', '正安', '520324', '107.441872', '28.550337');
INSERT INTO `provinces` VALUES ('520325', '贵州省', '遵义市', '520300', '道真', '520325', '107.605342', '28.880088');
INSERT INTO `provinces` VALUES ('520326', '贵州省', '遵义市', '520300', '务川', '520326', '107.887857', '28.521567');
INSERT INTO `provinces` VALUES ('520327', '贵州省', '遵义市', '520300', '凤冈', '520327', '107.722021', '27.960858');
INSERT INTO `provinces` VALUES ('520328', '贵州省', '遵义市', '520300', '湄潭', '520328', '107.485723', '27.765839');
INSERT INTO `provinces` VALUES ('520329', '贵州省', '遵义市', '520300', '余庆', '520329', '107.892566', '27.221552');
INSERT INTO `provinces` VALUES ('520330', '贵州省', '遵义市', '520300', '习水', '520330', '106.200954', '28.327826');
INSERT INTO `provinces` VALUES ('520381', '贵州省', '遵义市', '520300', '赤水', '520381', '105.698116', '28.587057');
INSERT INTO `provinces` VALUES ('520382', '贵州省', '遵义市', '520300', '仁怀', '520382', '106.412476', '27.803377');
INSERT INTO `provinces` VALUES ('520400', '贵州省', '安顺市', '520400', '安顺', '520400', '105.932188', '26.245544');
INSERT INTO `provinces` VALUES ('520402', '贵州省', '安顺市', '520400', '西秀', '520402', '105.946169', '26.248323');
INSERT INTO `provinces` VALUES ('520403', '贵州省', '安顺市', '520400', '平坝', '520403', '106.259942', '26.40608');
INSERT INTO `provinces` VALUES ('520422', '贵州省', '安顺市', '520400', '普定', '520422', '105.745609', '26.305794');
INSERT INTO `provinces` VALUES ('520423', '贵州省', '安顺市', '520400', '镇宁', '520423', '105.768656', '26.056096');
INSERT INTO `provinces` VALUES ('520424', '贵州省', '安顺市', '520400', '关岭', '520424', '105.618454', '25.944248');
INSERT INTO `provinces` VALUES ('520425', '贵州省', '安顺市', '520400', '紫云', '520425', '106.084515', '25.751567');
INSERT INTO `provinces` VALUES ('520500', '贵州省', '毕节市', '520500', '毕节', '520500', '105.28501', '27.301693');
INSERT INTO `provinces` VALUES ('520502', '贵州省', '毕节市', '520500', '七星关', '520502', '105.284852', '27.302085');
INSERT INTO `provinces` VALUES ('520521', '贵州省', '毕节市', '520500', '大方', '520521', '105.609254', '27.143521');
INSERT INTO `provinces` VALUES ('520522', '贵州省', '毕节市', '520500', '黔西', '520522', '106.038299', '27.024923');
INSERT INTO `provinces` VALUES ('520523', '贵州省', '毕节市', '520500', '金沙', '520523', '106.222103', '27.459693');
INSERT INTO `provinces` VALUES ('520524', '贵州省', '毕节市', '520500', '织金', '520524', '105.768997', '26.668497');
INSERT INTO `provinces` VALUES ('520525', '贵州省', '毕节市', '520500', '纳雍', '520525', '105.375322', '26.769875');
INSERT INTO `provinces` VALUES ('520526', '贵州省', '毕节市', '520500', '威宁', '520526', '104.286523', '26.859099');
INSERT INTO `provinces` VALUES ('520527', '贵州省', '毕节市', '520500', '赫章', '520527', '104.726438', '27.119243');
INSERT INTO `provinces` VALUES ('520600', '贵州省', '铜仁市', '520600', '铜仁', '520600', '109.191555', '27.718346');
INSERT INTO `provinces` VALUES ('520602', '贵州省', '铜仁市', '520600', '碧江', '520602', '109.192117', '27.718745');
INSERT INTO `provinces` VALUES ('520603', '贵州省', '铜仁市', '520600', '万山', '520603', '109.21199', '27.51903');
INSERT INTO `provinces` VALUES ('520621', '贵州省', '铜仁市', '520600', '江口', '520621', '108.848427', '27.691904');
INSERT INTO `provinces` VALUES ('520622', '贵州省', '铜仁市', '520600', '玉屏', '520622', '108.917882', '27.238024');
INSERT INTO `provinces` VALUES ('520623', '贵州省', '铜仁市', '520600', '石阡', '520623', '108.229854', '27.519386');
INSERT INTO `provinces` VALUES ('520624', '贵州省', '铜仁市', '520600', '思南', '520624', '108.255827', '27.941331');
INSERT INTO `provinces` VALUES ('520625', '贵州省', '铜仁市', '520600', '印江', '520625', '108.405517', '27.997976');
INSERT INTO `provinces` VALUES ('520626', '贵州省', '铜仁市', '520600', '德江', '520626', '108.117317', '28.26094');
INSERT INTO `provinces` VALUES ('520627', '贵州省', '铜仁市', '520600', '沿河', '520627', '108.495746', '28.560487');
INSERT INTO `provinces` VALUES ('520628', '贵州省', '铜仁市', '520600', '松桃', '520628', '109.202627', '28.165419');
INSERT INTO `provinces` VALUES ('522300', '贵州省', '黔西南布依族苗族自治州', '522300', '黔西南', '522300', '104.897971', '25.08812');
INSERT INTO `provinces` VALUES ('522301', '贵州省', '黔西南布依族苗族自治州', '522300', '兴义', '522301', '104.897982', '25.088599');
INSERT INTO `provinces` VALUES ('522302', '贵州省', '黔西南布依族苗族自治州', '522300', '兴仁', '522302', '105.192778', '25.431378');
INSERT INTO `provinces` VALUES ('522323', '贵州省', '黔西南布依族苗族自治州', '522300', '普安', '522323', '104.955347', '25.786404');
INSERT INTO `provinces` VALUES ('522324', '贵州省', '黔西南布依族苗族自治州', '522300', '晴隆', '522324', '105.218773', '25.832881');
INSERT INTO `provinces` VALUES ('522325', '贵州省', '黔西南布依族苗族自治州', '522300', '贞丰', '522325', '105.650133', '25.385752');
INSERT INTO `provinces` VALUES ('522326', '贵州省', '黔西南布依族苗族自治州', '522300', '望谟', '522326', '106.091563', '25.166667');
INSERT INTO `provinces` VALUES ('522327', '贵州省', '黔西南布依族苗族自治州', '522300', '册亨', '522327', '105.81241', '24.983338');
INSERT INTO `provinces` VALUES ('522328', '贵州省', '黔西南布依族苗族自治州', '522300', '安龙', '522328', '105.471498', '25.108959');
INSERT INTO `provinces` VALUES ('522600', '贵州省', '黔东南苗族侗族自治州', '522600', '黔东南', '522600', '107.977488', '26.583352');
INSERT INTO `provinces` VALUES ('522601', '贵州省', '黔东南苗族侗族自治州', '522600', '凯里', '522601', '107.977541', '26.582964');
INSERT INTO `provinces` VALUES ('522622', '贵州省', '黔东南苗族侗族自治州', '522600', '黄平', '522622', '107.901337', '26.896973');
INSERT INTO `provinces` VALUES ('522623', '贵州省', '黔东南苗族侗族自治州', '522600', '施秉', '522623', '108.12678', '27.034657');
INSERT INTO `provinces` VALUES ('522624', '贵州省', '黔东南苗族侗族自治州', '522600', '三穗', '522624', '108.681121', '26.959884');
INSERT INTO `provinces` VALUES ('522625', '贵州省', '黔东南苗族侗族自治州', '522600', '镇远', '522625', '108.423656', '27.050233');
INSERT INTO `provinces` VALUES ('522626', '贵州省', '黔东南苗族侗族自治州', '522600', '岑巩', '522626', '108.816459', '27.173244');
INSERT INTO `provinces` VALUES ('522627', '贵州省', '黔东南苗族侗族自治州', '522600', '天柱', '522627', '109.212798', '26.909684');
INSERT INTO `provinces` VALUES ('522628', '贵州省', '黔东南苗族侗族自治州', '522600', '锦屏', '522628', '109.20252', '26.680625');
INSERT INTO `provinces` VALUES ('522629', '贵州省', '黔东南苗族侗族自治州', '522600', '剑河', '522629', '108.440499', '26.727349');
INSERT INTO `provinces` VALUES ('522630', '贵州省', '黔东南苗族侗族自治州', '522600', '台江', '522630', '108.314637', '26.669138');
INSERT INTO `provinces` VALUES ('522631', '贵州省', '黔东南苗族侗族自治州', '522600', '黎平', '522631', '109.136504', '26.230636');
INSERT INTO `provinces` VALUES ('522632', '贵州省', '黔东南苗族侗族自治州', '522600', '榕江', '522632', '108.521026', '25.931085');
INSERT INTO `provinces` VALUES ('522633', '贵州省', '黔东南苗族侗族自治州', '522600', '从江', '522633', '108.912648', '25.747058');
INSERT INTO `provinces` VALUES ('522634', '贵州省', '黔东南苗族侗族自治州', '522600', '雷山', '522634', '108.079613', '26.381027');
INSERT INTO `provinces` VALUES ('522635', '贵州省', '黔东南苗族侗族自治州', '522600', '麻江', '522635', '107.593172', '26.494803');
INSERT INTO `provinces` VALUES ('522636', '贵州省', '黔东南苗族侗族自治州', '522600', '丹寨', '522636', '107.794808', '26.199497');
INSERT INTO `provinces` VALUES ('522700', '贵州省', '黔南布依族苗族自治州', '522700', '黔南', '522700', '107.517156', '26.258219');
INSERT INTO `provinces` VALUES ('522701', '贵州省', '黔南布依族苗族自治州', '522700', '都匀', '522701', '107.517021', '26.258205');
INSERT INTO `provinces` VALUES ('522702', '贵州省', '黔南布依族苗族自治州', '522700', '福泉', '522702', '107.513508', '26.702508');
INSERT INTO `provinces` VALUES ('522722', '贵州省', '黔南布依族苗族自治州', '522700', '荔波', '522722', '107.8838', '25.412239');
INSERT INTO `provinces` VALUES ('522723', '贵州省', '黔南布依族苗族自治州', '522700', '贵定', '522723', '107.233588', '26.580807');
INSERT INTO `provinces` VALUES ('522725', '贵州省', '黔南布依族苗族自治州', '522700', '瓮安', '522725', '107.478417', '27.066339');
INSERT INTO `provinces` VALUES ('522726', '贵州省', '黔南布依族苗族自治州', '522700', '独山', '522726', '107.542757', '25.826283');
INSERT INTO `provinces` VALUES ('522727', '贵州省', '黔南布依族苗族自治州', '522700', '平塘', '522727', '107.32405', '25.831803');
INSERT INTO `provinces` VALUES ('522728', '贵州省', '黔南布依族苗族自治州', '522700', '罗甸', '522728', '106.750006', '25.429894');
INSERT INTO `provinces` VALUES ('522729', '贵州省', '黔南布依族苗族自治州', '522700', '长顺', '522729', '106.447376', '26.022116');
INSERT INTO `provinces` VALUES ('522730', '贵州省', '黔南布依族苗族自治州', '522700', '龙里', '522730', '106.977733', '26.448809');
INSERT INTO `provinces` VALUES ('522731', '贵州省', '黔南布依族苗族自治州', '522700', '惠水', '522731', '106.657848', '26.128637');
INSERT INTO `provinces` VALUES ('522732', '贵州省', '黔南布依族苗族自治州', '522700', '三都', '522732', '107.87747', '25.985183');
INSERT INTO `provinces` VALUES ('530100', '云南省', '昆明市', '530100', '昆明', '530100', '102.712251', '25.040609');
INSERT INTO `provinces` VALUES ('530102', '云南省', '昆明市', '530100', '五华区', '530102', '102.704412', '25.042165');
INSERT INTO `provinces` VALUES ('530103', '云南省', '昆明市', '530100', '盘龙', '530103', '102.729044', '25.070239');
INSERT INTO `provinces` VALUES ('530111', '云南省', '昆明市', '530100', '官渡', '530111', '102.723437', '25.021211');
INSERT INTO `provinces` VALUES ('530112', '云南省', '昆明市', '530100', '西山', '530112', '102.705904', '25.02436');
INSERT INTO `provinces` VALUES ('530113', '云南省', '昆明市', '530100', '东川', '530113', '103.182', '26.08349');
INSERT INTO `provinces` VALUES ('530114', '云南省', '昆明市', '530100', '呈贡', '530114', '102.801382', '24.889275');
INSERT INTO `provinces` VALUES ('530115', '云南省', '昆明市', '530100', '晋宁', '530115', '102.594987', '24.666944');
INSERT INTO `provinces` VALUES ('530124', '云南省', '昆明市', '530100', '富民', '530124', '102.497888', '25.219667');
INSERT INTO `provinces` VALUES ('530125', '云南省', '昆明市', '530100', '宜良', '530125', '103.145989', '24.918215');
INSERT INTO `provinces` VALUES ('530126', '云南省', '昆明市', '530100', '石林', '530126', '103.271962', '24.754545');
INSERT INTO `provinces` VALUES ('530127', '云南省', '昆明市', '530100', '嵩明', '530127', '103.038777', '25.335087');
INSERT INTO `provinces` VALUES ('530128', '云南省', '昆明市', '530100', '禄劝', '530128', '102.46905', '25.556533');
INSERT INTO `provinces` VALUES ('530129', '云南省', '昆明市', '530100', '寻甸', '530129', '103.257588', '25.559474');
INSERT INTO `provinces` VALUES ('530181', '云南省', '昆明市', '530100', '安宁', '530181', '102.485544', '24.921785');
INSERT INTO `provinces` VALUES ('530300', '云南省', '曲靖市', '530300', '曲靖', '530300', '103.797851', '25.501557');
INSERT INTO `provinces` VALUES ('530302', '云南省', '曲靖市', '530300', '麒麟', '530302', '103.798054', '25.501269');
INSERT INTO `provinces` VALUES ('530303', '云南省', '曲靖市', '530300', '沾益', '530303', '103.819262', '25.600878');
INSERT INTO `provinces` VALUES ('530304', '云南省', '曲靖市', '530300', '马龙', '530304', '103.578755', '25.429451');
INSERT INTO `provinces` VALUES ('530322', '云南省', '曲靖市', '530300', '陆良', '530322', '103.655233', '25.022878');
INSERT INTO `provinces` VALUES ('530323', '云南省', '曲靖市', '530300', '师宗', '530323', '103.993808', '24.825681');
INSERT INTO `provinces` VALUES ('530324', '云南省', '曲靖市', '530300', '罗平', '530324', '104.309263', '24.885708');
INSERT INTO `provinces` VALUES ('530325', '云南省', '曲靖市', '530300', '富源', '530325', '104.25692', '25.67064');
INSERT INTO `provinces` VALUES ('530326', '云南省', '曲靖市', '530300', '会泽', '530326', '103.300041', '26.412861');
INSERT INTO `provinces` VALUES ('530381', '云南省', '曲靖市', '530300', '宣威', '530381', '104.09554', '26.227777');
INSERT INTO `provinces` VALUES ('530400', '云南省', '玉溪市', '530400', '玉溪', '530400', '102.543907', '24.350461');
INSERT INTO `provinces` VALUES ('530402', '云南省', '玉溪市', '530400', '红塔', '530402', '102.543468', '24.350753');
INSERT INTO `provinces` VALUES ('530403', '云南省', '玉溪市', '530400', '江川', '530403', '102.749839', '24.291006');
INSERT INTO `provinces` VALUES ('530422', '云南省', '玉溪市', '530400', '澄江', '530422', '102.916652', '24.669679');
INSERT INTO `provinces` VALUES ('530423', '云南省', '玉溪市', '530400', '通海', '530423', '102.760039', '24.112205');
INSERT INTO `provinces` VALUES ('530424', '云南省', '玉溪市', '530400', '华宁', '530424', '102.928982', '24.189807');
INSERT INTO `provinces` VALUES ('530425', '云南省', '玉溪市', '530400', '易门', '530425', '102.16211', '24.669598');
INSERT INTO `provinces` VALUES ('530426', '云南省', '玉溪市', '530400', '峨山', '530426', '102.404358', '24.173256');
INSERT INTO `provinces` VALUES ('530427', '云南省', '玉溪市', '530400', '新平', '530427', '101.990903', '24.0664');
INSERT INTO `provinces` VALUES ('530428', '云南省', '玉溪市', '530400', '元江', '530428', '101.999658', '23.597618');
INSERT INTO `provinces` VALUES ('530500', '云南省', '保山市', '530500', '保山', '530500', '99.167133', '25.111802');
INSERT INTO `provinces` VALUES ('530502', '云南省', '保山市', '530500', '隆阳', '530502', '99.165825', '25.112144');
INSERT INTO `provinces` VALUES ('530521', '云南省', '保山市', '530500', '施甸', '530521', '99.183758', '24.730847');
INSERT INTO `provinces` VALUES ('530523', '云南省', '保山市', '530500', '龙陵', '530523', '98.693567', '24.591912');
INSERT INTO `provinces` VALUES ('530524', '云南省', '保山市', '530500', '昌宁', '530524', '99.612344', '24.823662');
INSERT INTO `provinces` VALUES ('530581', '云南省', '保山市', '530500', '腾冲', '530581', '98.497292', '25.01757');
INSERT INTO `provinces` VALUES ('530600', '云南省', '昭通市', '530600', '昭通', '530600', '103.717216', '27.336999');
INSERT INTO `provinces` VALUES ('530602', '云南省', '昭通市', '530600', '昭阳', '530602', '103.717267', '27.336636');
INSERT INTO `provinces` VALUES ('530621', '云南省', '昭通市', '530600', '鲁甸', '530621', '103.549333', '27.191637');
INSERT INTO `provinces` VALUES ('530622', '云南省', '昭通市', '530600', '巧家', '530622', '102.929284', '26.9117');
INSERT INTO `provinces` VALUES ('530623', '云南省', '昭通市', '530600', '盐津', '530623', '104.23506', '28.106923');
INSERT INTO `provinces` VALUES ('530624', '云南省', '昭通市', '530600', '大关', '530624', '103.891608', '27.747114');
INSERT INTO `provinces` VALUES ('530625', '云南省', '昭通市', '530600', '永善', '530625', '103.63732', '28.231526');
INSERT INTO `provinces` VALUES ('530626', '云南省', '昭通市', '530600', '绥江', '530626', '103.961095', '28.599953');
INSERT INTO `provinces` VALUES ('530627', '云南省', '昭通市', '530600', '镇雄', '530627', '104.873055', '27.436267');
INSERT INTO `provinces` VALUES ('530628', '云南省', '昭通市', '530600', '彝良', '530628', '104.048492', '27.627425');
INSERT INTO `provinces` VALUES ('530629', '云南省', '昭通市', '530600', '威信', '530629', '105.04869', '27.843381');
INSERT INTO `provinces` VALUES ('530681', '云南省', '昭通市', '530600', '水富', '530681', '104.415376', '28.629688');
INSERT INTO `provinces` VALUES ('530700', '云南省', '丽江市', '530700', '丽江', '530700', '100.233026', '26.872108');
INSERT INTO `provinces` VALUES ('530702', '云南省', '丽江市', '530700', '古城区', '530702', '100.234412', '26.872229');
INSERT INTO `provinces` VALUES ('530721', '云南省', '丽江市', '530700', '玉龙', '530721', '100.238312', '26.830593');
INSERT INTO `provinces` VALUES ('530722', '云南省', '丽江市', '530700', '永胜', '530722', '100.750901', '26.685623');
INSERT INTO `provinces` VALUES ('530723', '云南省', '丽江市', '530700', '华坪', '530723', '101.267796', '26.628834');
INSERT INTO `provinces` VALUES ('530724', '云南省', '丽江市', '530700', '宁蒗', '530724', '100.852427', '27.281109');
INSERT INTO `provinces` VALUES ('530800', '云南省', '普洱市', '530800', '普洱', '530800', '100.972344', '22.777321');
INSERT INTO `provinces` VALUES ('530802', '云南省', '普洱市', '530800', '思茅', '530802', '100.973227', '22.776595');
INSERT INTO `provinces` VALUES ('530821', '云南省', '普洱市', '530800', '宁洱', '530821', '101.04524', '23.062507');
INSERT INTO `provinces` VALUES ('530822', '云南省', '普洱市', '530800', '墨江', '530822', '101.687606', '23.428165');
INSERT INTO `provinces` VALUES ('530823', '云南省', '普洱市', '530800', '景东', '530823', '100.840011', '24.448523');
INSERT INTO `provinces` VALUES ('530824', '云南省', '普洱市', '530800', '景谷', '530824', '100.701425', '23.500278');
INSERT INTO `provinces` VALUES ('530825', '云南省', '普洱市', '530800', '镇沅', '530825', '101.108512', '24.005712');
INSERT INTO `provinces` VALUES ('530826', '云南省', '普洱市', '530800', '江城', '530826', '101.859144', '22.58336');
INSERT INTO `provinces` VALUES ('530827', '云南省', '普洱市', '530800', '孟连', '530827', '99.585406', '22.325924');
INSERT INTO `provinces` VALUES ('530828', '云南省', '普洱市', '530800', '澜沧', '530828', '99.931201', '22.553083');
INSERT INTO `provinces` VALUES ('530829', '云南省', '普洱市', '530800', '西盟', '530829', '99.594372', '22.644423');
INSERT INTO `provinces` VALUES ('530900', '云南省', '临沧市', '530900', '临沧', '530900', '100.08697', '23.886567');
INSERT INTO `provinces` VALUES ('530902', '云南省', '临沧市', '530900', '临翔', '530902', '100.086486', '23.886562');
INSERT INTO `provinces` VALUES ('530921', '云南省', '临沧市', '530900', '凤庆', '530921', '99.91871', '24.592738');
INSERT INTO `provinces` VALUES ('530922', '云南省', '临沧市', '530900', '云县', '530922', '100.125637', '24.439026');
INSERT INTO `provinces` VALUES ('530923', '云南省', '临沧市', '530900', '永德', '530923', '99.253679', '24.028159');
INSERT INTO `provinces` VALUES ('530924', '云南省', '临沧市', '530900', '镇康', '530924', '98.82743', '23.761415');
INSERT INTO `provinces` VALUES ('530925', '云南省', '临沧市', '530900', '双江', '530925', '99.824419', '23.477476');
INSERT INTO `provinces` VALUES ('530926', '云南省', '临沧市', '530900', '耿马', '530926', '99.402495', '23.534579');
INSERT INTO `provinces` VALUES ('530927', '云南省', '临沧市', '530900', '沧源', '530927', '99.2474', '23.146887');
INSERT INTO `provinces` VALUES ('532300', '云南省', '楚雄彝族自治州', '532300', '楚雄', '532300', '101.546046', '25.041988');
INSERT INTO `provinces` VALUES ('532301', '云南省', '楚雄彝族自治州', '532300', '楚雄市', '532301', '101.546046', '25.041988');
INSERT INTO `provinces` VALUES ('532322', '云南省', '楚雄彝族自治州', '532300', '双柏', '532322', '101.63824', '24.685094');
INSERT INTO `provinces` VALUES ('532323', '云南省', '楚雄彝族自治州', '532300', '牟定', '532323', '101.543044', '25.312111');
INSERT INTO `provinces` VALUES ('532324', '云南省', '楚雄彝族自治州', '532300', '南华', '532324', '101.274991', '25.192408');
INSERT INTO `provinces` VALUES ('532325', '云南省', '楚雄彝族自治州', '532300', '姚安', '532325', '101.238399', '25.505403');
INSERT INTO `provinces` VALUES ('532326', '云南省', '楚雄彝族自治州', '532300', '大姚', '532326', '101.323602', '25.722348');
INSERT INTO `provinces` VALUES ('532327', '云南省', '楚雄彝族自治州', '532300', '永仁', '532327', '101.671175', '26.056316');
INSERT INTO `provinces` VALUES ('532328', '云南省', '楚雄彝族自治州', '532300', '元谋', '532328', '101.870837', '25.703313');
INSERT INTO `provinces` VALUES ('532329', '云南省', '楚雄彝族自治州', '532300', '武定', '532329', '102.406785', '25.5301');
INSERT INTO `provinces` VALUES ('532331', '云南省', '楚雄彝族自治州', '532300', '禄丰', '532331', '102.075694', '25.14327');
INSERT INTO `provinces` VALUES ('532500', '云南省', '红河哈尼族彝族自治州', '532500', '红河', '532500', '103.384182', '23.366775');
INSERT INTO `provinces` VALUES ('532501', '云南省', '红河哈尼族彝族自治州', '532500', '个旧', '532501', '103.154752', '23.360383');
INSERT INTO `provinces` VALUES ('532502', '云南省', '红河哈尼族彝族自治州', '532500', '开远', '532502', '103.258679', '23.713832');
INSERT INTO `provinces` VALUES ('532503', '云南省', '红河哈尼族彝族自治州', '532500', '蒙自', '532503', '103.385005', '23.366843');
INSERT INTO `provinces` VALUES ('532504', '云南省', '红河哈尼族彝族自治州', '532500', '弥勒', '532504', '103.436988', '24.40837');
INSERT INTO `provinces` VALUES ('532523', '云南省', '红河哈尼族彝族自治州', '532500', '屏边', '532523', '103.687229', '22.987013');
INSERT INTO `provinces` VALUES ('532524', '云南省', '红河哈尼族彝族自治州', '532500', '建水', '532524', '102.820493', '23.618387');
INSERT INTO `provinces` VALUES ('532525', '云南省', '红河哈尼族彝族自治州', '532500', '石屏', '532525', '102.484469', '23.712569');
INSERT INTO `provinces` VALUES ('532527', '云南省', '红河哈尼族彝族自治州', '532500', '泸西', '532527', '103.759622', '24.532368');
INSERT INTO `provinces` VALUES ('532528', '云南省', '红河哈尼族彝族自治州', '532500', '元阳', '532528', '102.837056', '23.219773');
INSERT INTO `provinces` VALUES ('532529', '云南省', '红河哈尼族彝族自治州', '532500', '红河县', '532529', '102.42755', '23.374489');
INSERT INTO `provinces` VALUES ('532530', '云南省', '红河哈尼族彝族自治州', '532500', '金平', '532530', '103.228359', '22.779982');
INSERT INTO `provinces` VALUES ('532531', '云南省', '红河哈尼族彝族自治州', '532500', '绿春', '532531', '102.39286', '22.99352');
INSERT INTO `provinces` VALUES ('532532', '云南省', '红河哈尼族彝族自治州', '532500', '河口', '532532', '103.961593', '22.507563');
INSERT INTO `provinces` VALUES ('532600', '云南省', '文山壮族苗族自治州', '532600', '文山', '532600', '104.24401', '23.36951');
INSERT INTO `provinces` VALUES ('532601', '云南省', '文山壮族苗族自治州', '532600', '文山市', '532601', '104.24401', '23.36951');
INSERT INTO `provinces` VALUES ('532622', '云南省', '文山壮族苗族自治州', '532600', '砚山', '532622', '104.343989', '23.612301');
INSERT INTO `provinces` VALUES ('532623', '云南省', '文山壮族苗族自治州', '532600', '西畴', '532623', '104.675711', '23.437439');
INSERT INTO `provinces` VALUES ('532624', '云南省', '文山壮族苗族自治州', '532600', '麻栗坡', '532624', '104.701899', '23.124202');
INSERT INTO `provinces` VALUES ('532625', '云南省', '文山壮族苗族自治州', '532600', '马关', '532625', '104.398619', '23.011723');
INSERT INTO `provinces` VALUES ('532626', '云南省', '文山壮族苗族自治州', '532600', '丘北', '532626', '104.194366', '24.040982');
INSERT INTO `provinces` VALUES ('532627', '云南省', '文山壮族苗族自治州', '532600', '广南', '532627', '105.056684', '24.050272');
INSERT INTO `provinces` VALUES ('532628', '云南省', '文山壮族苗族自治州', '532600', '富宁', '532628', '105.62856', '23.626494');
INSERT INTO `provinces` VALUES ('532800', '云南省', '西双版纳傣族自治州', '532800', '西双版纳', '532800', '100.797941', '22.001724');
INSERT INTO `provinces` VALUES ('532801', '云南省', '西双版纳傣族自治州', '532800', '景洪', '532801', '100.797947', '22.002087');
INSERT INTO `provinces` VALUES ('532822', '云南省', '西双版纳傣族自治州', '532800', '勐海', '532822', '100.448288', '21.955866');
INSERT INTO `provinces` VALUES ('532823', '云南省', '西双版纳傣族自治州', '532800', '勐腊', '532823', '101.567051', '21.479449');
INSERT INTO `provinces` VALUES ('532900', '云南省', '大理白族自治州', '532900', '大理', '532900', '100.225668', '25.589449');
INSERT INTO `provinces` VALUES ('532901', '云南省', '大理白族自治州', '532900', '大理市', '532901', '100.225668', '25.589449');
INSERT INTO `provinces` VALUES ('532922', '云南省', '大理白族自治州', '532900', '漾濞', '532922', '99.95797', '25.669543');
INSERT INTO `provinces` VALUES ('532923', '云南省', '大理白族自治州', '532900', '祥云', '532923', '100.554025', '25.477072');
INSERT INTO `provinces` VALUES ('532924', '云南省', '大理白族自治州', '532900', '宾川', '532924', '100.578957', '25.825904');
INSERT INTO `provinces` VALUES ('532925', '云南省', '大理白族自治州', '532900', '弥渡', '532925', '100.490669', '25.342594');
INSERT INTO `provinces` VALUES ('532926', '云南省', '大理白族自治州', '532900', '南涧', '532926', '100.518683', '25.041279');
INSERT INTO `provinces` VALUES ('532927', '云南省', '大理白族自治州', '532900', '巍山', '532927', '100.30793', '25.230909');
INSERT INTO `provinces` VALUES ('532928', '云南省', '大理白族自治州', '532900', '永平', '532928', '99.533536', '25.461281');
INSERT INTO `provinces` VALUES ('532929', '云南省', '大理白族自治州', '532900', '云龙', '532929', '99.369402', '25.884955');
INSERT INTO `provinces` VALUES ('532930', '云南省', '大理白族自治州', '532900', '洱源', '532930', '99.951708', '26.111184');
INSERT INTO `provinces` VALUES ('532931', '云南省', '大理白族自治州', '532900', '剑川', '532931', '99.905887', '26.530066');
INSERT INTO `provinces` VALUES ('532932', '云南省', '大理白族自治州', '532900', '鹤庆', '532932', '100.173375', '26.55839');
INSERT INTO `provinces` VALUES ('533100', '云南省', '德宏傣族景颇族自治州', '533100', '德宏', '533100', '98.578363', '24.436694');
INSERT INTO `provinces` VALUES ('533102', '云南省', '德宏傣族景颇族自治州', '533100', '瑞丽', '533102', '97.855883', '24.010734');
INSERT INTO `provinces` VALUES ('533103', '云南省', '德宏傣族景颇族自治州', '533100', '芒市', '533103', '98.577608', '24.436699');
INSERT INTO `provinces` VALUES ('533122', '云南省', '德宏傣族景颇族自治州', '533100', '梁河', '533122', '98.298196', '24.80742');
INSERT INTO `provinces` VALUES ('533123', '云南省', '德宏傣族景颇族自治州', '533100', '盈江', '533123', '97.93393', '24.709541');
INSERT INTO `provinces` VALUES ('533124', '云南省', '德宏傣族景颇族自治州', '533100', '陇川', '533124', '97.794441', '24.184065');
INSERT INTO `provinces` VALUES ('533300', '云南省', '怒江傈僳族自治州', '533300', '怒江', '533300', '98.854304', '25.850949');
INSERT INTO `provinces` VALUES ('533301', '云南省', '怒江傈僳族自治州', '533300', '泸水', '533301', '98.854063', '25.851142');
INSERT INTO `provinces` VALUES ('533323', '云南省', '怒江傈僳族自治州', '533300', '福贡', '533323', '98.867413', '26.902738');
INSERT INTO `provinces` VALUES ('533324', '云南省', '怒江傈僳族自治州', '533300', '贡山', '533324', '98.666141', '27.738054');
INSERT INTO `provinces` VALUES ('533325', '云南省', '怒江傈僳族自治州', '533300', '兰坪', '533325', '99.421378', '26.453839');
INSERT INTO `provinces` VALUES ('533400', '云南省', '迪庆藏族自治州', '533400', '迪庆', '533400', '99.706463', '27.826853');
INSERT INTO `provinces` VALUES ('533401', '云南省', '迪庆藏族自治州', '533400', '香格里拉', '533401', '99.708667', '27.825804');
INSERT INTO `provinces` VALUES ('533422', '云南省', '迪庆藏族自治州', '533400', '德钦', '533422', '98.91506', '28.483272');
INSERT INTO `provinces` VALUES ('533423', '云南省', '迪庆藏族自治州', '533400', '维西', '533423', '99.286355', '27.180948');
INSERT INTO `provinces` VALUES ('540100', '西藏自治区', '拉萨市', '540100', '拉萨', '540100', '91.132212', '29.660361');
INSERT INTO `provinces` VALUES ('540102', '西藏自治区', '拉萨市', '540100', '城关区', '540102', '91.132911', '29.659472');
INSERT INTO `provinces` VALUES ('540103', '西藏自治区', '拉萨市', '540100', '堆龙德庆', '540103', '91.002823', '29.647347');
INSERT INTO `provinces` VALUES ('540104', '西藏自治区', '拉萨市', '540100', '达孜', '540104', '91.350976', '29.670314');
INSERT INTO `provinces` VALUES ('540121', '西藏自治区', '拉萨市', '540100', '林周', '540121', '91.261842', '29.895754');
INSERT INTO `provinces` VALUES ('540122', '西藏自治区', '拉萨市', '540100', '当雄', '540122', '91.103551', '30.474819');
INSERT INTO `provinces` VALUES ('540123', '西藏自治区', '拉萨市', '540100', '尼木', '540123', '90.165545', '29.431346');
INSERT INTO `provinces` VALUES ('540124', '西藏自治区', '拉萨市', '540100', '曲水', '540124', '90.738051', '29.349895');
INSERT INTO `provinces` VALUES ('540127', '西藏自治区', '拉萨市', '540100', '墨竹工卡', '540127', '91.731158', '29.834657');
INSERT INTO `provinces` VALUES ('540200', '西藏自治区', '日喀则市', '540200', '日喀则', '540200', '88.885148', '29.267519');
INSERT INTO `provinces` VALUES ('540202', '西藏自治区', '日喀则市', '540200', '桑珠孜', '540202', '88.88667', '29.267003');
INSERT INTO `provinces` VALUES ('540221', '西藏自治区', '日喀则市', '540200', '南木林', '540221', '89.099434', '29.680459');
INSERT INTO `provinces` VALUES ('540222', '西藏自治区', '日喀则市', '540200', '江孜', '540222', '89.605044', '28.908845');
INSERT INTO `provinces` VALUES ('540223', '西藏自治区', '日喀则市', '540200', '定日', '540223', '87.123887', '28.656667');
INSERT INTO `provinces` VALUES ('540224', '西藏自治区', '日喀则市', '540200', '萨迦', '540224', '88.023007', '28.901077');
INSERT INTO `provinces` VALUES ('540225', '西藏自治区', '日喀则市', '540200', '拉孜', '540225', '87.63743', '29.085136');
INSERT INTO `provinces` VALUES ('540226', '西藏自治区', '日喀则市', '540200', '昂仁', '540226', '87.23578', '29.294758');
INSERT INTO `provinces` VALUES ('540227', '西藏自治区', '日喀则市', '540200', '谢通门', '540227', '88.260517', '29.431597');
INSERT INTO `provinces` VALUES ('540228', '西藏自治区', '日喀则市', '540200', '白朗', '540228', '89.263618', '29.106627');
INSERT INTO `provinces` VALUES ('540229', '西藏自治区', '日喀则市', '540200', '仁布', '540229', '89.843207', '29.230299');
INSERT INTO `provinces` VALUES ('540230', '西藏自治区', '日喀则市', '540200', '康马', '540230', '89.683406', '28.554719');
INSERT INTO `provinces` VALUES ('540231', '西藏自治区', '日喀则市', '540200', '定结', '540231', '87.767723', '28.36409');
INSERT INTO `provinces` VALUES ('540232', '西藏自治区', '日喀则市', '540200', '仲巴', '540232', '84.032826', '29.768336');
INSERT INTO `provinces` VALUES ('540233', '西藏自治区', '日喀则市', '540200', '亚东', '540233', '88.906806', '27.482772');
INSERT INTO `provinces` VALUES ('540234', '西藏自治区', '日喀则市', '540200', '吉隆', '540234', '85.298349', '28.852416');
INSERT INTO `provinces` VALUES ('540235', '西藏自治区', '日喀则市', '540200', '聂拉木', '540235', '85.981953', '28.15595');
INSERT INTO `provinces` VALUES ('540236', '西藏自治区', '日喀则市', '540200', '萨嘎', '540236', '85.234622', '29.328194');
INSERT INTO `provinces` VALUES ('540237', '西藏自治区', '日喀则市', '540200', '岗巴', '540237', '88.518903', '28.274371');
INSERT INTO `provinces` VALUES ('540300', '西藏自治区', '昌都市', '540300', '昌都', '540300', '97.178452', '31.136875');
INSERT INTO `provinces` VALUES ('540302', '西藏自治区', '昌都市', '540300', '卡若', '540302', '97.178255', '31.137035');
INSERT INTO `provinces` VALUES ('540321', '西藏自治区', '昌都市', '540300', '江达', '540321', '98.218351', '31.499534');
INSERT INTO `provinces` VALUES ('540322', '西藏自治区', '昌都市', '540300', '贡觉', '540322', '98.271191', '30.859206');
INSERT INTO `provinces` VALUES ('540323', '西藏自治区', '昌都市', '540300', '类乌齐', '540323', '96.601259', '31.213048');
INSERT INTO `provinces` VALUES ('540324', '西藏自治区', '昌都市', '540300', '丁青', '540324', '95.597748', '31.410681');
INSERT INTO `provinces` VALUES ('540325', '西藏自治区', '昌都市', '540300', '察雅', '540325', '97.565701', '30.653038');
INSERT INTO `provinces` VALUES ('540326', '西藏自治区', '昌都市', '540300', '八宿', '540326', '96.917893', '30.053408');
INSERT INTO `provinces` VALUES ('540327', '西藏自治区', '昌都市', '540300', '左贡', '540327', '97.840532', '29.671335');
INSERT INTO `provinces` VALUES ('540328', '西藏自治区', '昌都市', '540300', '芒康', '540328', '98.596444', '29.686615');
INSERT INTO `provinces` VALUES ('540329', '西藏自治区', '昌都市', '540300', '洛隆', '540329', '95.823418', '30.741947');
INSERT INTO `provinces` VALUES ('540330', '西藏自治区', '昌都市', '540300', '边坝', '540330', '94.707504', '30.933849');
INSERT INTO `provinces` VALUES ('540400', '西藏自治区', '林芝市', '540400', '林芝', '540400', '94.362348', '29.654693');
INSERT INTO `provinces` VALUES ('540402', '西藏自治区', '林芝市', '540400', '巴宜', '540402', '94.360987', '29.653732');
INSERT INTO `provinces` VALUES ('540421', '西藏自治区', '林芝市', '540400', '工布江达', '540421', '93.246515', '29.88447');
INSERT INTO `provinces` VALUES ('540422', '西藏自治区', '林芝市', '540400', '米林', '540422', '94.213679', '29.213811');
INSERT INTO `provinces` VALUES ('540423', '西藏自治区', '林芝市', '540400', '墨脱', '540423', '95.332245', '29.32573');
INSERT INTO `provinces` VALUES ('540424', '西藏自治区', '林芝市', '540400', '波密', '540424', '95.768151', '29.858771');
INSERT INTO `provinces` VALUES ('540425', '西藏自治区', '林芝市', '540400', '察隅', '540425', '97.465002', '28.660244');
INSERT INTO `provinces` VALUES ('540426', '西藏自治区', '林芝市', '540400', '朗县', '540426', '93.073429', '29.0446');
INSERT INTO `provinces` VALUES ('540500', '西藏自治区', '山南市', '540500', '山南', '540500', '91.766529', '29.236023');
INSERT INTO `provinces` VALUES ('540502', '西藏自治区', '山南市', '540500', '乃东', '540502', '91.76525', '29.236106');
INSERT INTO `provinces` VALUES ('540521', '西藏自治区', '山南市', '540500', '扎囊', '540521', '91.338', '29.246476');
INSERT INTO `provinces` VALUES ('540522', '西藏自治区', '山南市', '540500', '贡嘎', '540522', '90.985271', '29.289078');
INSERT INTO `provinces` VALUES ('540523', '西藏自治区', '山南市', '540500', '桑日', '540523', '92.015732', '29.259774');
INSERT INTO `provinces` VALUES ('540524', '西藏自治区', '山南市', '540500', '琼结', '540524', '91.683753', '29.025242');
INSERT INTO `provinces` VALUES ('540525', '西藏自治区', '山南市', '540500', '曲松', '540525', '92.201066', '29.063656');
INSERT INTO `provinces` VALUES ('540526', '西藏自治区', '山南市', '540500', '措美', '540526', '91.432347', '28.437353');
INSERT INTO `provinces` VALUES ('540527', '西藏自治区', '山南市', '540500', '洛扎', '540527', '90.858243', '28.385765');
INSERT INTO `provinces` VALUES ('540528', '西藏自治区', '山南市', '540500', '加查', '540528', '92.591043', '29.140921');
INSERT INTO `provinces` VALUES ('540529', '西藏自治区', '山南市', '540500', '隆子', '540529', '92.463309', '28.408548');
INSERT INTO `provinces` VALUES ('540530', '西藏自治区', '山南市', '540500', '错那', '540530', '91.960132', '27.991707');
INSERT INTO `provinces` VALUES ('540531', '西藏自治区', '山南市', '540500', '浪卡子', '540531', '90.398747', '28.96836');
INSERT INTO `provinces` VALUES ('540600', '西藏自治区', '那曲市', '540600', '那曲', '540600', '92.060214', '31.476004');
INSERT INTO `provinces` VALUES ('540602', '西藏自治区', '那曲市', '540600', '色尼', '540602', '92.060214', '31.476004');
INSERT INTO `provinces` VALUES ('540621', '西藏自治区', '那曲市', '540600', '嘉黎', '540621', '93.232907', '30.640846');
INSERT INTO `provinces` VALUES ('540622', '西藏自治区', '那曲市', '540600', '比如', '540622', '93.68044', '31.479917');
INSERT INTO `provinces` VALUES ('540623', '西藏自治区', '那曲市', '540600', '聂荣', '540623', '92.303659', '32.107855');
INSERT INTO `provinces` VALUES ('540624', '西藏自治区', '那曲市', '540600', '安多', '540624', '91.681879', '32.260299');
INSERT INTO `provinces` VALUES ('540625', '西藏自治区', '那曲市', '540600', '申扎', '540625', '88.709777', '30.929056');
INSERT INTO `provinces` VALUES ('540626', '西藏自治区', '那曲市', '540600', '索县', '540626', '93.784964', '31.886173');
INSERT INTO `provinces` VALUES ('540627', '西藏自治区', '那曲市', '540600', '班戈', '540627', '90.011822', '31.394578');
INSERT INTO `provinces` VALUES ('540628', '西藏自治区', '那曲市', '540600', '巴青', '540628', '94.054049', '31.918691');
INSERT INTO `provinces` VALUES ('540629', '西藏自治区', '那曲市', '540600', '尼玛', '540629', '87.236646', '31.784979');
INSERT INTO `provinces` VALUES ('540630', '西藏自治区', '那曲市', '540600', '双湖', '540630', '88.838578', '33.18698');
INSERT INTO `provinces` VALUES ('542500', '西藏自治区', '阿里地区', '542500', '阿里地区', '542500', '80.105498', '32.503187');
INSERT INTO `provinces` VALUES ('542521', '西藏自治区', '阿里地区', '542500', '普兰', '542521', '81.177588', '30.291896');
INSERT INTO `provinces` VALUES ('542522', '西藏自治区', '阿里地区', '542500', '札达', '542522', '79.803191', '31.478587');
INSERT INTO `provinces` VALUES ('542523', '西藏自治区', '阿里地区', '542500', '噶尔', '542523', '80.105005', '32.503373');
INSERT INTO `provinces` VALUES ('542524', '西藏自治区', '阿里地区', '542500', '日土', '542524', '79.731937', '33.382454');
INSERT INTO `provinces` VALUES ('542525', '西藏自治区', '阿里地区', '542500', '革吉', '542525', '81.142896', '32.389192');
INSERT INTO `provinces` VALUES ('542526', '西藏自治区', '阿里地区', '542500', '改则', '542526', '84.062384', '32.302076');
INSERT INTO `provinces` VALUES ('542527', '西藏自治区', '阿里地区', '542500', '措勤', '542527', '85.159254', '31.016774');
INSERT INTO `provinces` VALUES ('610100', '陕西省', '西安市', '610100', '西安', '610100', '108.948024', '34.263161');
INSERT INTO `provinces` VALUES ('610102', '陕西省', '西安市', '610100', '新城区', '610102', '108.959903', '34.26927');
INSERT INTO `provinces` VALUES ('610103', '陕西省', '西安市', '610100', '碑林', '610103', '108.946994', '34.251061');
INSERT INTO `provinces` VALUES ('610104', '陕西省', '西安市', '610100', '莲湖', '610104', '108.933194', '34.2656');
INSERT INTO `provinces` VALUES ('610111', '陕西省', '西安市', '610100', '灞桥', '610111', '109.067261', '34.267453');
INSERT INTO `provinces` VALUES ('610112', '陕西省', '西安市', '610100', '未央', '610112', '108.946022', '34.30823');
INSERT INTO `provinces` VALUES ('610113', '陕西省', '西安市', '610100', '雁塔', '610113', '108.926593', '34.213389');
INSERT INTO `provinces` VALUES ('610114', '陕西省', '西安市', '610100', '阎良', '610114', '109.22802', '34.662141');
INSERT INTO `provinces` VALUES ('610115', '陕西省', '西安市', '610100', '临潼', '610115', '109.213986', '34.372065');
INSERT INTO `provinces` VALUES ('610116', '陕西省', '西安市', '610100', '长安', '610116', '108.941579', '34.157097');
INSERT INTO `provinces` VALUES ('610117', '陕西省', '西安市', '610100', '高陵', '610117', '109.088896', '34.535065');
INSERT INTO `provinces` VALUES ('610118', '陕西省', '西安市', '610100', '鄠邑', '610118', '108.607385', '34.108668');
INSERT INTO `provinces` VALUES ('610122', '陕西省', '西安市', '610100', '蓝田', '610122', '109.317634', '34.156189');
INSERT INTO `provinces` VALUES ('610124', '陕西省', '西安市', '610100', '周至', '610124', '108.216465', '34.161532');
INSERT INTO `provinces` VALUES ('610200', '陕西省', '铜川市', '610200', '铜川', '610200', '108.979608', '34.916582');
INSERT INTO `provinces` VALUES ('610202', '陕西省', '铜川市', '610200', '王益', '610202', '109.075862', '35.069098');
INSERT INTO `provinces` VALUES ('610203', '陕西省', '铜川市', '610200', '印台', '610203', '109.100814', '35.111927');
INSERT INTO `provinces` VALUES ('610204', '陕西省', '铜川市', '610200', '耀州', '610204', '108.962538', '34.910206');
INSERT INTO `provinces` VALUES ('610222', '陕西省', '铜川市', '610200', '宜君', '610222', '109.118278', '35.398766');
INSERT INTO `provinces` VALUES ('610300', '陕西省', '宝鸡市', '610300', '宝鸡', '610300', '107.14487', '34.369315');
INSERT INTO `provinces` VALUES ('610302', '陕西省', '宝鸡市', '610300', '渭滨', '610302', '107.144467', '34.371008');
INSERT INTO `provinces` VALUES ('610303', '陕西省', '宝鸡市', '610300', '金台', '610303', '107.149943', '34.375192');
INSERT INTO `provinces` VALUES ('610304', '陕西省', '宝鸡市', '610300', '陈仓', '610304', '107.383645', '34.352747');
INSERT INTO `provinces` VALUES ('610322', '陕西省', '宝鸡市', '610300', '凤翔', '610322', '107.400577', '34.521668');
INSERT INTO `provinces` VALUES ('610323', '陕西省', '宝鸡市', '610300', '岐山', '610323', '107.624464', '34.44296');
INSERT INTO `provinces` VALUES ('610324', '陕西省', '宝鸡市', '610300', '扶风', '610324', '107.891419', '34.375497');
INSERT INTO `provinces` VALUES ('610326', '陕西省', '宝鸡市', '610300', '眉县', '610326', '107.752371', '34.272137');
INSERT INTO `provinces` VALUES ('610327', '陕西省', '宝鸡市', '610300', '陇县', '610327', '106.857066', '34.893262');
INSERT INTO `provinces` VALUES ('610328', '陕西省', '宝鸡市', '610300', '千阳', '610328', '107.132987', '34.642584');
INSERT INTO `provinces` VALUES ('610329', '陕西省', '宝鸡市', '610300', '麟游', '610329', '107.796608', '34.677714');
INSERT INTO `provinces` VALUES ('610330', '陕西省', '宝鸡市', '610300', '凤县', '610330', '106.525212', '33.912464');
INSERT INTO `provinces` VALUES ('610331', '陕西省', '宝鸡市', '610300', '太白', '610331', '107.316533', '34.059215');
INSERT INTO `provinces` VALUES ('610400', '陕西省', '咸阳市', '610400', '咸阳', '610400', '108.705117', '34.333439');
INSERT INTO `provinces` VALUES ('610402', '陕西省', '咸阳市', '610400', '秦都', '610402', '108.698636', '34.329801');
INSERT INTO `provinces` VALUES ('610403', '陕西省', '咸阳市', '610400', '杨陵', '610403', '108.086348', '34.27135');
INSERT INTO `provinces` VALUES ('610404', '陕西省', '咸阳市', '610400', '渭城', '610404', '108.730957', '34.336847');
INSERT INTO `provinces` VALUES ('610422', '陕西省', '咸阳市', '610400', '三原', '610422', '108.943481', '34.613996');
INSERT INTO `provinces` VALUES ('610423', '陕西省', '咸阳市', '610400', '泾阳', '610423', '108.83784', '34.528493');
INSERT INTO `provinces` VALUES ('610424', '陕西省', '咸阳市', '610400', '乾县', '610424', '108.247406', '34.527261');
INSERT INTO `provinces` VALUES ('610425', '陕西省', '咸阳市', '610400', '礼泉', '610425', '108.428317', '34.482583');
INSERT INTO `provinces` VALUES ('610426', '陕西省', '咸阳市', '610400', '永寿', '610426', '108.143129', '34.692619');
INSERT INTO `provinces` VALUES ('610428', '陕西省', '咸阳市', '610400', '长武', '610428', '107.795835', '35.206122');
INSERT INTO `provinces` VALUES ('610429', '陕西省', '咸阳市', '610400', '旬邑', '610429', '108.337231', '35.112234');
INSERT INTO `provinces` VALUES ('610430', '陕西省', '咸阳市', '610400', '淳化', '610430', '108.581173', '34.79797');
INSERT INTO `provinces` VALUES ('610431', '陕西省', '咸阳市', '610400', '武功', '610431', '108.212857', '34.259732');
INSERT INTO `provinces` VALUES ('610481', '陕西省', '咸阳市', '610400', '兴平', '610481', '108.488493', '34.297134');
INSERT INTO `provinces` VALUES ('610482', '陕西省', '咸阳市', '610400', '彬州', '610482', '108.08457', '35.049611');
INSERT INTO `provinces` VALUES ('610500', '陕西省', '渭南市', '610500', '渭南', '610500', '109.502882', '34.499381');
INSERT INTO `provinces` VALUES ('610502', '陕西省', '渭南市', '610500', '临渭', '610502', '109.503299', '34.501271');
INSERT INTO `provinces` VALUES ('610503', '陕西省', '渭南市', '610500', '华州', '610503', '109.76141', '34.511958');
INSERT INTO `provinces` VALUES ('610522', '陕西省', '渭南市', '610500', '潼关', '610522', '110.24726', '34.544515');
INSERT INTO `provinces` VALUES ('610523', '陕西省', '渭南市', '610500', '大荔', '610523', '109.943123', '34.795011');
INSERT INTO `provinces` VALUES ('610524', '陕西省', '渭南市', '610500', '合阳', '610524', '110.147979', '35.237098');
INSERT INTO `provinces` VALUES ('610525', '陕西省', '渭南市', '610500', '澄城', '610525', '109.937609', '35.184');
INSERT INTO `provinces` VALUES ('610526', '陕西省', '渭南市', '610500', '蒲城', '610526', '109.589653', '34.956034');
INSERT INTO `provinces` VALUES ('610527', '陕西省', '渭南市', '610500', '白水', '610527', '109.594309', '35.177291');
INSERT INTO `provinces` VALUES ('610528', '陕西省', '渭南市', '610500', '富平', '610528', '109.187174', '34.746679');
INSERT INTO `provinces` VALUES ('610581', '陕西省', '渭南市', '610500', '韩城', '610581', '110.452391', '35.475238');
INSERT INTO `provinces` VALUES ('610582', '陕西省', '渭南市', '610500', '华阴', '610582', '110.08952', '34.565359');
INSERT INTO `provinces` VALUES ('610600', '陕西省', '延安市', '610600', '延安', '610600', '109.49081', '36.596537');
INSERT INTO `provinces` VALUES ('610602', '陕西省', '延安市', '610600', '宝塔', '610602', '109.49069', '36.596291');
INSERT INTO `provinces` VALUES ('610603', '陕西省', '延安市', '610600', '安塞', '610603', '109.325341', '36.86441');
INSERT INTO `provinces` VALUES ('610621', '陕西省', '延安市', '610600', '延长', '610621', '110.012961', '36.578306');
INSERT INTO `provinces` VALUES ('610622', '陕西省', '延安市', '610600', '延川', '610622', '110.190314', '36.882066');
INSERT INTO `provinces` VALUES ('610623', '陕西省', '延安市', '610600', '子长', '610623', '109.675968', '37.14207');
INSERT INTO `provinces` VALUES ('610625', '陕西省', '延安市', '610600', '志丹', '610625', '108.768898', '36.823031');
INSERT INTO `provinces` VALUES ('610626', '陕西省', '延安市', '610600', '吴起', '610626', '108.176976', '36.924852');
INSERT INTO `provinces` VALUES ('610627', '陕西省', '延安市', '610600', '甘泉', '610627', '109.34961', '36.277729');
INSERT INTO `provinces` VALUES ('610628', '陕西省', '延安市', '610600', '富县', '610628', '109.384136', '35.996495');
INSERT INTO `provinces` VALUES ('610629', '陕西省', '延安市', '610600', '洛川', '610629', '109.435712', '35.762133');
INSERT INTO `provinces` VALUES ('610630', '陕西省', '延安市', '610600', '宜川', '610630', '110.175537', '36.050391');
INSERT INTO `provinces` VALUES ('610631', '陕西省', '延安市', '610600', '黄龙', '610631', '109.83502', '35.583276');
INSERT INTO `provinces` VALUES ('610632', '陕西省', '延安市', '610600', '黄陵', '610632', '109.262469', '35.580165');
INSERT INTO `provinces` VALUES ('610700', '陕西省', '汉中市', '610700', '汉中', '610700', '107.028621', '33.077668');
INSERT INTO `provinces` VALUES ('610702', '陕西省', '汉中市', '610700', '汉台', '610702', '107.028233', '33.077674');
INSERT INTO `provinces` VALUES ('610703', '陕西省', '汉中市', '610700', '南郑', '610703', '106.942393', '33.003341');
INSERT INTO `provinces` VALUES ('610722', '陕西省', '汉中市', '610700', '城固', '610722', '107.329887', '33.153098');
INSERT INTO `provinces` VALUES ('610723', '陕西省', '汉中市', '610700', '洋县', '610723', '107.549962', '33.223283');
INSERT INTO `provinces` VALUES ('610724', '陕西省', '汉中市', '610700', '西乡', '610724', '107.765858', '32.987961');
INSERT INTO `provinces` VALUES ('610725', '陕西省', '汉中市', '610700', '勉县', '610725', '106.680175', '33.155618');
INSERT INTO `provinces` VALUES ('610726', '陕西省', '汉中市', '610700', '宁强', '610726', '106.25739', '32.830806');
INSERT INTO `provinces` VALUES ('610727', '陕西省', '汉中市', '610700', '略阳', '610727', '106.153899', '33.329638');
INSERT INTO `provinces` VALUES ('610728', '陕西省', '汉中市', '610700', '镇巴', '610728', '107.89531', '32.535854');
INSERT INTO `provinces` VALUES ('610729', '陕西省', '汉中市', '610700', '留坝', '610729', '106.924377', '33.61334');
INSERT INTO `provinces` VALUES ('610730', '陕西省', '汉中市', '610700', '佛坪', '610730', '107.988582', '33.520745');
INSERT INTO `provinces` VALUES ('610800', '陕西省', '榆林市', '610800', '榆林', '610800', '109.741193', '38.290162');
INSERT INTO `provinces` VALUES ('610802', '陕西省', '榆林市', '610800', '榆阳', '610802', '109.74791', '38.299267');
INSERT INTO `provinces` VALUES ('610803', '陕西省', '榆林市', '610800', '横山', '610803', '109.292596', '37.964048');
INSERT INTO `provinces` VALUES ('610822', '陕西省', '榆林市', '610800', '府谷', '610822', '111.069645', '39.029243');
INSERT INTO `provinces` VALUES ('610824', '陕西省', '榆林市', '610800', '靖边', '610824', '108.80567', '37.596084');
INSERT INTO `provinces` VALUES ('610825', '陕西省', '榆林市', '610800', '定边', '610825', '107.601284', '37.59523');
INSERT INTO `provinces` VALUES ('610826', '陕西省', '榆林市', '610800', '绥德', '610826', '110.265377', '37.507701');
INSERT INTO `provinces` VALUES ('610827', '陕西省', '榆林市', '610800', '米脂', '610827', '110.178683', '37.759081');
INSERT INTO `provinces` VALUES ('610828', '陕西省', '榆林市', '610800', '佳县', '610828', '110.493367', '38.021597');
INSERT INTO `provinces` VALUES ('610829', '陕西省', '榆林市', '610800', '吴堡', '610829', '110.739315', '37.451925');
INSERT INTO `provinces` VALUES ('610830', '陕西省', '榆林市', '610800', '清涧', '610830', '110.12146', '37.087702');
INSERT INTO `provinces` VALUES ('610831', '陕西省', '榆林市', '610800', '子洲', '610831', '110.03457', '37.611573');
INSERT INTO `provinces` VALUES ('610881', '陕西省', '榆林市', '610800', '神木', '610881', '110.497005', '38.835641');
INSERT INTO `provinces` VALUES ('610900', '陕西省', '安康市', '610900', '安康', '610900', '109.029273', '32.6903');
INSERT INTO `provinces` VALUES ('610902', '陕西省', '安康市', '610900', '汉滨', '610902', '109.029098', '32.690817');
INSERT INTO `provinces` VALUES ('610921', '陕西省', '安康市', '610900', '汉阴', '610921', '108.510946', '32.891121');
INSERT INTO `provinces` VALUES ('610922', '陕西省', '安康市', '610900', '石泉', '610922', '108.250512', '33.038512');
INSERT INTO `provinces` VALUES ('610923', '陕西省', '安康市', '610900', '宁陕', '610923', '108.313714', '33.312184');
INSERT INTO `provinces` VALUES ('610924', '陕西省', '安康市', '610900', '紫阳', '610924', '108.537788', '32.520176');
INSERT INTO `provinces` VALUES ('610925', '陕西省', '安康市', '610900', '岚皋', '610925', '108.900663', '32.31069');
INSERT INTO `provinces` VALUES ('610926', '陕西省', '安康市', '610900', '平利', '610926', '109.361865', '32.387933');
INSERT INTO `provinces` VALUES ('610927', '陕西省', '安康市', '610900', '镇坪', '610927', '109.526437', '31.883395');
INSERT INTO `provinces` VALUES ('610928', '陕西省', '安康市', '610900', '旬阳', '610928', '109.368149', '32.833567');
INSERT INTO `provinces` VALUES ('610929', '陕西省', '安康市', '610900', '白河', '610929', '110.114186', '32.809484');
INSERT INTO `provinces` VALUES ('611000', '陕西省', '商洛市', '611000', '商洛', '611000', '109.939776', '33.868319');
INSERT INTO `provinces` VALUES ('611002', '陕西省', '商洛市', '611000', '商州', '611002', '109.937685', '33.869208');
INSERT INTO `provinces` VALUES ('611021', '陕西省', '商洛市', '611000', '洛南', '611021', '110.145716', '34.088502');
INSERT INTO `provinces` VALUES ('611022', '陕西省', '商洛市', '611000', '丹凤', '611022', '110.33191', '33.694711');
INSERT INTO `provinces` VALUES ('611023', '陕西省', '商洛市', '611000', '商南', '611023', '110.885437', '33.526367');
INSERT INTO `provinces` VALUES ('611024', '陕西省', '商洛市', '611000', '山阳', '611024', '109.880435', '33.530411');
INSERT INTO `provinces` VALUES ('611025', '陕西省', '商洛市', '611000', '镇安', '611025', '109.151075', '33.423981');
INSERT INTO `provinces` VALUES ('611026', '陕西省', '商洛市', '611000', '柞水', '611026', '109.111249', '33.682773');
INSERT INTO `provinces` VALUES ('620100', '甘肃省', '兰州市', '620100', '兰州', '620100', '103.823557', '36.058039');
INSERT INTO `provinces` VALUES ('620102', '甘肃省', '兰州市', '620100', '城关', '620102', '103.841032', '36.049115');
INSERT INTO `provinces` VALUES ('620103', '甘肃省', '兰州市', '620100', '七里河', '620103', '103.784326', '36.06673');
INSERT INTO `provinces` VALUES ('620104', '甘肃省', '兰州市', '620100', '西固', '620104', '103.622331', '36.100369');
INSERT INTO `provinces` VALUES ('620105', '甘肃省', '兰州市', '620100', '安宁区', '620105', '103.724038', '36.10329');
INSERT INTO `provinces` VALUES ('620111', '甘肃省', '兰州市', '620100', '红古', '620111', '102.861814', '36.344177');
INSERT INTO `provinces` VALUES ('620121', '甘肃省', '兰州市', '620100', '永登', '620121', '103.262203', '36.734428');
INSERT INTO `provinces` VALUES ('620122', '甘肃省', '兰州市', '620100', '皋兰', '620122', '103.94933', '36.331254');
INSERT INTO `provinces` VALUES ('620123', '甘肃省', '兰州市', '620100', '榆中', '620123', '104.114975', '35.84443');
INSERT INTO `provinces` VALUES ('620200', '甘肃省', '嘉峪关市', '620200', '嘉峪关', '620200', '98.277304', '39.786529');
INSERT INTO `provinces` VALUES ('620300', '甘肃省', '金昌市', '620300', '金昌', '620300', '102.187888', '38.514238');
INSERT INTO `provinces` VALUES ('620302', '甘肃省', '金昌市', '620300', '金川区', '620302', '102.187683', '38.513793');
INSERT INTO `provinces` VALUES ('620321', '甘肃省', '金昌市', '620300', '永昌', '620321', '101.971957', '38.247354');
INSERT INTO `provinces` VALUES ('620400', '甘肃省', '白银市', '620400', '白银', '620400', '104.173606', '36.54568');
INSERT INTO `provinces` VALUES ('620402', '甘肃省', '白银市', '620400', '白银区', '620402', '104.155413', '36.541464');
INSERT INTO `provinces` VALUES ('620403', '甘肃省', '白银市', '620400', '平川', '620403', '104.819207', '36.72921');
INSERT INTO `provinces` VALUES ('620421', '甘肃省', '白银市', '620400', '靖远', '620421', '104.686972', '36.561424');
INSERT INTO `provinces` VALUES ('620422', '甘肃省', '白银市', '620400', '会宁', '620422', '105.054337', '35.692486');
INSERT INTO `provinces` VALUES ('620423', '甘肃省', '白银市', '620400', '景泰', '620423', '104.066394', '37.193519');
INSERT INTO `provinces` VALUES ('620500', '甘肃省', '天水市', '620500', '天水', '620500', '105.724998', '34.578529');
INSERT INTO `provinces` VALUES ('620502', '甘肃省', '天水市', '620500', '秦州', '620502', '105.724477', '34.578645');
INSERT INTO `provinces` VALUES ('620503', '甘肃省', '天水市', '620500', '麦积', '620503', '105.897631', '34.563504');
INSERT INTO `provinces` VALUES ('620521', '甘肃省', '天水市', '620500', '清水', '620521', '106.139878', '34.75287');
INSERT INTO `provinces` VALUES ('620522', '甘肃省', '天水市', '620500', '秦安', '620522', '105.6733', '34.862354');
INSERT INTO `provinces` VALUES ('620523', '甘肃省', '天水市', '620500', '甘谷', '620523', '105.332347', '34.747327');
INSERT INTO `provinces` VALUES ('620524', '甘肃省', '天水市', '620500', '武山', '620524', '104.891696', '34.721955');
INSERT INTO `provinces` VALUES ('620525', '甘肃省', '天水市', '620500', '张家川', '620525', '106.212416', '34.993237');
INSERT INTO `provinces` VALUES ('620600', '甘肃省', '武威市', '620600', '武威', '620600', '102.634697', '37.929996');
INSERT INTO `provinces` VALUES ('620602', '甘肃省', '武威市', '620600', '凉州', '620602', '102.634492', '37.93025');
INSERT INTO `provinces` VALUES ('620621', '甘肃省', '武威市', '620600', '民勤', '620621', '103.090654', '38.624621');
INSERT INTO `provinces` VALUES ('620622', '甘肃省', '武威市', '620600', '古浪', '620622', '102.898047', '37.470571');
INSERT INTO `provinces` VALUES ('620623', '甘肃省', '武威市', '620600', '天祝', '620623', '103.142034', '36.971678');
INSERT INTO `provinces` VALUES ('620700', '甘肃省', '张掖市', '620700', '张掖', '620700', '100.455472', '38.932897');
INSERT INTO `provinces` VALUES ('620702', '甘肃省', '张掖市', '620700', '甘州', '620702', '100.454862', '38.931774');
INSERT INTO `provinces` VALUES ('620721', '甘肃省', '张掖市', '620700', '肃南', '620721', '99.617086', '38.837269');
INSERT INTO `provinces` VALUES ('620722', '甘肃省', '张掖市', '620700', '民乐', '620722', '100.816623', '38.434454');
INSERT INTO `provinces` VALUES ('620723', '甘肃省', '张掖市', '620700', '临泽', '620723', '100.166333', '39.152151');
INSERT INTO `provinces` VALUES ('620724', '甘肃省', '张掖市', '620700', '高台', '620724', '99.81665', '39.376308');
INSERT INTO `provinces` VALUES ('620725', '甘肃省', '张掖市', '620700', '山丹', '620725', '101.088442', '38.784839');
INSERT INTO `provinces` VALUES ('620800', '甘肃省', '平凉市', '620800', '平凉', '620800', '106.684691', '35.54279');
INSERT INTO `provinces` VALUES ('620802', '甘肃省', '平凉市', '620800', '崆峒', '620802', '106.684223', '35.54173');
INSERT INTO `provinces` VALUES ('620821', '甘肃省', '平凉市', '620800', '泾川', '620821', '107.365218', '35.335283');
INSERT INTO `provinces` VALUES ('620822', '甘肃省', '平凉市', '620800', '灵台', '620822', '107.620587', '35.064009');
INSERT INTO `provinces` VALUES ('620823', '甘肃省', '平凉市', '620800', '崇信', '620823', '107.031253', '35.304533');
INSERT INTO `provinces` VALUES ('620825', '甘肃省', '平凉市', '620800', '庄浪', '620825', '106.041979', '35.203428');
INSERT INTO `provinces` VALUES ('620826', '甘肃省', '平凉市', '620800', '静宁', '620826', '105.733489', '35.525243');
INSERT INTO `provinces` VALUES ('620881', '甘肃省', '平凉市', '620800', '华亭', '620881', '106.649308', '35.215342');
INSERT INTO `provinces` VALUES ('620900', '甘肃省', '酒泉市', '620900', '酒泉', '620900', '98.510795', '39.744023');
INSERT INTO `provinces` VALUES ('620902', '甘肃省', '酒泉市', '620900', '肃州', '620902', '98.511155', '39.743858');
INSERT INTO `provinces` VALUES ('620921', '甘肃省', '酒泉市', '620900', '金塔', '620921', '98.902959', '39.983036');
INSERT INTO `provinces` VALUES ('620922', '甘肃省', '酒泉市', '620900', '瓜州', '620922', '95.780591', '40.516525');
INSERT INTO `provinces` VALUES ('620923', '甘肃省', '酒泉市', '620900', '肃北', '620923', '94.87728', '39.51224');
INSERT INTO `provinces` VALUES ('620924', '甘肃省', '酒泉市', '620900', '阿克塞', '620924', '94.337642', '39.631642');
INSERT INTO `provinces` VALUES ('620981', '甘肃省', '酒泉市', '620900', '玉门', '620981', '97.037206', '40.28682');
INSERT INTO `provinces` VALUES ('620982', '甘肃省', '酒泉市', '620900', '敦煌', '620982', '94.664279', '40.141119');
INSERT INTO `provinces` VALUES ('621000', '甘肃省', '庆阳市', '621000', '庆阳', '621000', '107.638372', '35.734218');
INSERT INTO `provinces` VALUES ('621002', '甘肃省', '庆阳市', '621000', '西峰', '621002', '107.638824', '35.733713');
INSERT INTO `provinces` VALUES ('621021', '甘肃省', '庆阳市', '621000', '庆城', '621021', '107.885664', '36.013504');
INSERT INTO `provinces` VALUES ('621022', '甘肃省', '庆阳市', '621000', '环县', '621022', '107.308754', '36.569322');
INSERT INTO `provinces` VALUES ('621023', '甘肃省', '庆阳市', '621000', '华池', '621023', '107.986288', '36.457304');
INSERT INTO `provinces` VALUES ('621024', '甘肃省', '庆阳市', '621000', '合水', '621024', '108.019865', '35.819005');
INSERT INTO `provinces` VALUES ('621025', '甘肃省', '庆阳市', '621000', '正宁', '621025', '108.361068', '35.490642');
INSERT INTO `provinces` VALUES ('621026', '甘肃省', '庆阳市', '621000', '宁县', '621026', '107.921182', '35.50201');
INSERT INTO `provinces` VALUES ('621027', '甘肃省', '庆阳市', '621000', '镇原', '621027', '107.195706', '35.677806');
INSERT INTO `provinces` VALUES ('621100', '甘肃省', '定西市', '621100', '定西', '621100', '104.626294', '35.579578');
INSERT INTO `provinces` VALUES ('621102', '甘肃省', '定西市', '621100', '安定', '621102', '104.62577', '35.579764');
INSERT INTO `provinces` VALUES ('621121', '甘肃省', '定西市', '621100', '通渭', '621121', '105.250102', '35.208922');
INSERT INTO `provinces` VALUES ('621122', '甘肃省', '定西市', '621100', '陇西', '621122', '104.637554', '35.003409');
INSERT INTO `provinces` VALUES ('621123', '甘肃省', '定西市', '621100', '渭源', '621123', '104.211742', '35.133023');
INSERT INTO `provinces` VALUES ('621124', '甘肃省', '定西市', '621100', '临洮', '621124', '103.862186', '35.376233');
INSERT INTO `provinces` VALUES ('621125', '甘肃省', '定西市', '621100', '漳县', '621125', '104.466756', '34.848642');
INSERT INTO `provinces` VALUES ('621126', '甘肃省', '定西市', '621100', '岷县', '621126', '104.039882', '34.439105');
INSERT INTO `provinces` VALUES ('621200', '甘肃省', '陇南市', '621200', '陇南', '621200', '104.929379', '33.388598');
INSERT INTO `provinces` VALUES ('621202', '甘肃省', '陇南市', '621200', '武都', '621202', '104.929866', '33.388155');
INSERT INTO `provinces` VALUES ('621221', '甘肃省', '陇南市', '621200', '成县', '621221', '105.734434', '33.739863');
INSERT INTO `provinces` VALUES ('621222', '甘肃省', '陇南市', '621200', '文县', '621222', '104.682448', '32.942171');
INSERT INTO `provinces` VALUES ('621223', '甘肃省', '陇南市', '621200', '宕昌', '621223', '104.394475', '34.042655');
INSERT INTO `provinces` VALUES ('621224', '甘肃省', '陇南市', '621200', '康县', '621224', '105.609534', '33.328266');
INSERT INTO `provinces` VALUES ('621225', '甘肃省', '陇南市', '621200', '西和', '621225', '105.299737', '34.013718');
INSERT INTO `provinces` VALUES ('621226', '甘肃省', '陇南市', '621200', '礼县', '621226', '105.181616', '34.189387');
INSERT INTO `provinces` VALUES ('621227', '甘肃省', '陇南市', '621200', '徽县', '621227', '106.085632', '33.767785');
INSERT INTO `provinces` VALUES ('621228', '甘肃省', '陇南市', '621200', '两当', '621228', '106.306959', '33.910729');
INSERT INTO `provinces` VALUES ('622900', '甘肃省', '临夏回族自治州', '622900', '临夏', '622900', '103.211634', '35.59941');
INSERT INTO `provinces` VALUES ('622901', '甘肃省', '临夏回族自治州', '622900', '临夏市', '622901', '103.211634', '35.59941');
INSERT INTO `provinces` VALUES ('622921', '甘肃省', '临夏回族自治州', '622900', '临夏县', '622921', '103.24955', '35.609899');
INSERT INTO `provinces` VALUES ('622922', '甘肃省', '临夏回族自治州', '622900', '康乐', '622922', '103.709852', '35.371906');
INSERT INTO `provinces` VALUES ('622923', '甘肃省', '临夏回族自治州', '622900', '永靖', '622923', '103.319871', '35.938933');
INSERT INTO `provinces` VALUES ('622924', '甘肃省', '临夏回族自治州', '622900', '广河', '622924', '103.576188', '35.481688');
INSERT INTO `provinces` VALUES ('622925', '甘肃省', '临夏回族自治州', '622900', '和政', '622925', '103.350357', '35.425971');
INSERT INTO `provinces` VALUES ('622926', '甘肃省', '临夏回族自治州', '622900', '东乡', '622926', '103.389568', '35.66383');
INSERT INTO `provinces` VALUES ('622927', '甘肃省', '临夏回族自治州', '622900', '积石山', '622927', '102.877473', '35.712906');
INSERT INTO `provinces` VALUES ('623000', '甘肃省', '甘南藏族自治州', '623000', '甘南', '623000', '102.911008', '34.986354');
INSERT INTO `provinces` VALUES ('623001', '甘肃省', '甘南藏族自治州', '623000', '合作', '623001', '102.91149', '34.985973');
INSERT INTO `provinces` VALUES ('623021', '甘肃省', '甘南藏族自治州', '623000', '临潭', '623021', '103.353054', '34.69164');
INSERT INTO `provinces` VALUES ('623022', '甘肃省', '甘南藏族自治州', '623000', '卓尼', '623022', '103.508508', '34.588165');
INSERT INTO `provinces` VALUES ('623023', '甘肃省', '甘南藏族自治州', '623000', '舟曲', '623023', '104.370271', '33.782964');
INSERT INTO `provinces` VALUES ('623024', '甘肃省', '甘南藏族自治州', '623000', '迭部', '623024', '103.221009', '34.055348');
INSERT INTO `provinces` VALUES ('623025', '甘肃省', '甘南藏族自治州', '623000', '玛曲', '623025', '102.075767', '33.998068');
INSERT INTO `provinces` VALUES ('623026', '甘肃省', '甘南藏族自治州', '623000', '碌曲', '623026', '102.488495', '34.589591');
INSERT INTO `provinces` VALUES ('623027', '甘肃省', '甘南藏族自治州', '623000', '夏河', '623027', '102.520743', '35.200853');
INSERT INTO `provinces` VALUES ('630100', '青海省', '西宁市', '630100', '西宁', '630100', '101.778916', '36.623178');
INSERT INTO `provinces` VALUES ('630102', '青海省', '西宁市', '630100', '城东区', '630102', '101.796095', '36.616043');
INSERT INTO `provinces` VALUES ('630103', '青海省', '西宁市', '630100', '城中区', '630103', '101.784554', '36.621181');
INSERT INTO `provinces` VALUES ('630104', '青海省', '西宁市', '630100', '城西区', '630104', '101.763649', '36.628323');
INSERT INTO `provinces` VALUES ('630105', '青海省', '西宁市', '630100', '城北区', '630105', '101.761297', '36.648448');
INSERT INTO `provinces` VALUES ('630121', '青海省', '西宁市', '630100', '大通', '630121', '101.684183', '36.931343');
INSERT INTO `provinces` VALUES ('630122', '青海省', '西宁市', '630100', '湟中', '630122', '101.569475', '36.500419');
INSERT INTO `provinces` VALUES ('630123', '青海省', '西宁市', '630100', '湟源', '630123', '101.263435', '36.684818');
INSERT INTO `provinces` VALUES ('630200', '青海省', '海东市', '630200', '海东', '630200', '102.10327', '36.502916');
INSERT INTO `provinces` VALUES ('630202', '青海省', '海东市', '630200', '乐都', '630202', '102.402431', '36.480291');
INSERT INTO `provinces` VALUES ('630203', '青海省', '海东市', '630200', '平安', '630203', '102.104295', '36.502714');
INSERT INTO `provinces` VALUES ('630222', '青海省', '海东市', '630200', '民和', '630222', '102.804209', '36.329451');
INSERT INTO `provinces` VALUES ('630223', '青海省', '海东市', '630200', '互助', '630223', '101.956734', '36.83994');
INSERT INTO `provinces` VALUES ('630224', '青海省', '海东市', '630200', '化隆', '630224', '102.262329', '36.098322');
INSERT INTO `provinces` VALUES ('630225', '青海省', '海东市', '630200', '循化', '630225', '102.486534', '35.847247');
INSERT INTO `provinces` VALUES ('632200', '青海省', '海北藏族自治州', '632200', '海北', '632200', '100.901059', '36.959435');
INSERT INTO `provinces` VALUES ('632221', '青海省', '海北藏族自治州', '632200', '门源', '632221', '101.618461', '37.376627');
INSERT INTO `provinces` VALUES ('632222', '青海省', '海北藏族自治州', '632200', '祁连', '632222', '100.249778', '38.175409');
INSERT INTO `provinces` VALUES ('632223', '青海省', '海北藏族自治州', '632200', '海晏', '632223', '100.90049', '36.959542');
INSERT INTO `provinces` VALUES ('632224', '青海省', '海北藏族自治州', '632200', '刚察', '632224', '100.138417', '37.326263');
INSERT INTO `provinces` VALUES ('632300', '青海省', '黄南藏族自治州', '632300', '黄南', '632300', '102.019988', '35.517744');
INSERT INTO `provinces` VALUES ('632321', '青海省', '黄南藏族自治州', '632300', '同仁', '632321', '102.017604', '35.516337');
INSERT INTO `provinces` VALUES ('632322', '青海省', '黄南藏族自治州', '632300', '尖扎', '632322', '102.031953', '35.938205');
INSERT INTO `provinces` VALUES ('632323', '青海省', '黄南藏族自治州', '632300', '泽库', '632323', '101.469343', '35.036842');
INSERT INTO `provinces` VALUES ('632324', '青海省', '黄南藏族自治州', '632300', '河南', '632324', '101.611877', '34.734522');
INSERT INTO `provinces` VALUES ('632500', '青海省', '海南藏族自治州', '632500', '海南', '632500', '100.619542', '36.280353');
INSERT INTO `provinces` VALUES ('632521', '青海省', '海南藏族自治州', '632500', '共和', '632521', '100.619597', '36.280286');
INSERT INTO `provinces` VALUES ('632522', '青海省', '海南藏族自治州', '632500', '同德', '632522', '100.579465', '35.254492');
INSERT INTO `provinces` VALUES ('632523', '青海省', '海南藏族自治州', '632500', '贵德', '632523', '101.431856', '36.040456');
INSERT INTO `provinces` VALUES ('632524', '青海省', '海南藏族自治州', '632500', '兴海', '632524', '99.986963', '35.58909');
INSERT INTO `provinces` VALUES ('632525', '青海省', '海南藏族自治州', '632500', '贵南', '632525', '100.74792', '35.587085');
INSERT INTO `provinces` VALUES ('632600', '青海省', '果洛藏族自治州', '632600', '果洛', '632600', '100.242143', '34.4736');
INSERT INTO `provinces` VALUES ('632621', '青海省', '果洛藏族自治州', '632600', '玛沁', '632621', '100.243531', '34.473386');
INSERT INTO `provinces` VALUES ('632622', '青海省', '果洛藏族自治州', '632600', '班玛', '632622', '100.737955', '32.931589');
INSERT INTO `provinces` VALUES ('632623', '青海省', '果洛藏族自治州', '632600', '甘德', '632623', '99.902589', '33.966987');
INSERT INTO `provinces` VALUES ('632624', '青海省', '果洛藏族自治州', '632600', '达日', '632624', '99.651715', '33.753259');
INSERT INTO `provinces` VALUES ('632625', '青海省', '果洛藏族自治州', '632600', '久治', '632625', '101.484884', '33.430217');
INSERT INTO `provinces` VALUES ('632626', '青海省', '果洛藏族自治州', '632600', '玛多', '632626', '98.211343', '34.91528');
INSERT INTO `provinces` VALUES ('632700', '青海省', '玉树藏族自治州', '632700', '玉树', '632700', '97.008522', '33.004049');
INSERT INTO `provinces` VALUES ('632701', '青海省', '玉树藏族自治州', '632700', '玉树市', '632701', '97.008522', '33.004049');
INSERT INTO `provinces` VALUES ('632722', '青海省', '玉树藏族自治州', '632700', '杂多', '632722', '95.293423', '32.891886');
INSERT INTO `provinces` VALUES ('632723', '青海省', '玉树藏族自治州', '632700', '称多', '632723', '97.110893', '33.367884');
INSERT INTO `provinces` VALUES ('632724', '青海省', '玉树藏族自治州', '632700', '治多', '632724', '95.616843', '33.852322');
INSERT INTO `provinces` VALUES ('632725', '青海省', '玉树藏族自治州', '632700', '囊谦', '632725', '96.479797', '32.203206');
INSERT INTO `provinces` VALUES ('632726', '青海省', '玉树藏族自治州', '632700', '曲麻莱', '632726', '95.800674', '34.12654');
INSERT INTO `provinces` VALUES ('632800', '青海省', '海西蒙古族藏族自治州', '632800', '海西', '632800', '95.357233', '37.853631');
INSERT INTO `provinces` VALUES ('632801', '青海省', '海西蒙古族藏族自治州', '632800', '格尔木', '632801', '94.905777', '36.401541');
INSERT INTO `provinces` VALUES ('632802', '青海省', '海西蒙古族藏族自治州', '632800', '德令哈', '632802', '97.370143', '37.374555');
INSERT INTO `provinces` VALUES ('632803', '青海省', '海西蒙古族藏族自治州', '632800', '茫崖', '632803', '90.51', '38.15');
INSERT INTO `provinces` VALUES ('632821', '青海省', '海西蒙古族藏族自治州', '632800', '乌兰', '632821', '98.479852', '36.930389');
INSERT INTO `provinces` VALUES ('632822', '青海省', '海西蒙古族藏族自治州', '632800', '都兰', '632822', '98.089161', '36.298553');
INSERT INTO `provinces` VALUES ('632823', '青海省', '海西蒙古族藏族自治州', '632800', '天峻', '632823', '99.02078', '37.29906');
INSERT INTO `provinces` VALUES ('640100', '宁夏回族自治区', '银川市', '640100', '银川', '640100', '106.278179', '38.46637');
INSERT INTO `provinces` VALUES ('640104', '宁夏回族自治区', '银川市', '640100', '兴庆', '640104', '106.278393', '38.46747');
INSERT INTO `provinces` VALUES ('640105', '宁夏回族自治区', '银川市', '640100', '西夏', '640105', '106.132116', '38.492424');
INSERT INTO `provinces` VALUES ('640106', '宁夏回族自治区', '银川市', '640100', '金凤', '640106', '106.228486', '38.477353');
INSERT INTO `provinces` VALUES ('640121', '宁夏回族自治区', '银川市', '640100', '永宁', '640121', '106.253781', '38.28043');
INSERT INTO `provinces` VALUES ('640122', '宁夏回族自治区', '银川市', '640100', '贺兰', '640122', '106.345904', '38.554563');
INSERT INTO `provinces` VALUES ('640181', '宁夏回族自治区', '银川市', '640100', '灵武', '640181', '106.334701', '38.094058');
INSERT INTO `provinces` VALUES ('640200', '宁夏回族自治区', '石嘴山市', '640200', '石嘴山', '640200', '106.376173', '39.01333');
INSERT INTO `provinces` VALUES ('640202', '宁夏回族自治区', '石嘴山市', '640200', '大武口', '640202', '106.376651', '39.014158');
INSERT INTO `provinces` VALUES ('640205', '宁夏回族自治区', '石嘴山市', '640200', '惠农', '640205', '106.775513', '39.230094');
INSERT INTO `provinces` VALUES ('640221', '宁夏回族自治区', '石嘴山市', '640200', '平罗', '640221', '106.54489', '38.90674');
INSERT INTO `provinces` VALUES ('640300', '宁夏回族自治区', '吴忠市', '640300', '吴忠', '640300', '106.199409', '37.986165');
INSERT INTO `provinces` VALUES ('640302', '宁夏回族自治区', '吴忠市', '640300', '利通', '640302', '106.199419', '37.985967');
INSERT INTO `provinces` VALUES ('640303', '宁夏回族自治区', '吴忠市', '640300', '红寺堡', '640303', '106.067315', '37.421616');
INSERT INTO `provinces` VALUES ('640323', '宁夏回族自治区', '吴忠市', '640300', '盐池', '640323', '107.40541', '37.784222');
INSERT INTO `provinces` VALUES ('640324', '宁夏回族自治区', '吴忠市', '640300', '同心', '640324', '105.914764', '36.9829');
INSERT INTO `provinces` VALUES ('640381', '宁夏回族自治区', '吴忠市', '640300', '青铜峡', '640381', '106.075395', '38.021509');
INSERT INTO `provinces` VALUES ('640400', '宁夏回族自治区', '固原市', '640400', '固原', '640400', '106.285241', '36.004561');
INSERT INTO `provinces` VALUES ('640402', '宁夏回族自治区', '固原市', '640400', '原州', '640402', '106.28477', '36.005337');
INSERT INTO `provinces` VALUES ('640422', '宁夏回族自治区', '固原市', '640400', '西吉', '640422', '105.731801', '35.965384');
INSERT INTO `provinces` VALUES ('640423', '宁夏回族自治区', '固原市', '640400', '隆德', '640423', '106.12344', '35.618234');
INSERT INTO `provinces` VALUES ('640424', '宁夏回族自治区', '固原市', '640400', '泾源', '640424', '106.338674', '35.49344');
INSERT INTO `provinces` VALUES ('640425', '宁夏回族自治区', '固原市', '640400', '彭阳', '640425', '106.641512', '35.849975');
INSERT INTO `provinces` VALUES ('640500', '宁夏回族自治区', '中卫市', '640500', '中卫', '640500', '105.189568', '37.514951');
INSERT INTO `provinces` VALUES ('640502', '宁夏回族自治区', '中卫市', '640500', '沙坡头', '640502', '105.190536', '37.514564');
INSERT INTO `provinces` VALUES ('640521', '宁夏回族自治区', '中卫市', '640500', '中宁', '640521', '105.675784', '37.489736');
INSERT INTO `provinces` VALUES ('640522', '宁夏回族自治区', '中卫市', '640500', '海原', '640522', '105.647323', '36.562007');
INSERT INTO `provinces` VALUES ('650100', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '乌鲁木齐', '650100', '87.617733', '43.792818');
INSERT INTO `provinces` VALUES ('650102', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '天山', '650102', '87.620116', '43.796428');
INSERT INTO `provinces` VALUES ('650103', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '沙依巴克', '650103', '87.596639', '43.788872');
INSERT INTO `provinces` VALUES ('650104', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '新市区', '650104', '87.560653', '43.870882');
INSERT INTO `provinces` VALUES ('650105', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '水磨沟', '650105', '87.613093', '43.816747');
INSERT INTO `provinces` VALUES ('650106', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '头屯河', '650106', '87.425823', '43.876053');
INSERT INTO `provinces` VALUES ('650107', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '达坂城', '650107', '88.30994', '43.36181');
INSERT INTO `provinces` VALUES ('650109', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '米东', '650109', '87.691801', '43.960982');
INSERT INTO `provinces` VALUES ('650121', '新疆维吾尔自治区', '乌鲁木齐市', '650100', '乌鲁木齐县', '650121', '87.505603', '43.982546');
INSERT INTO `provinces` VALUES ('650200', '新疆维吾尔自治区', '克拉玛依市', '650200', '克拉玛依', '650200', '84.873946', '45.595886');
INSERT INTO `provinces` VALUES ('650202', '新疆维吾尔自治区', '克拉玛依市', '650200', '独山子', '650202', '84.882267', '44.327207');
INSERT INTO `provinces` VALUES ('650203', '新疆维吾尔自治区', '克拉玛依市', '650200', '克拉玛依区', '650203', '84.866222', '45.596624');
INSERT INTO `provinces` VALUES ('650204', '新疆维吾尔自治区', '克拉玛依市', '650200', '白碱滩', '650204', '85.129882', '45.689021');
INSERT INTO `provinces` VALUES ('650205', '新疆维吾尔自治区', '克拉玛依市', '650200', '乌尔禾', '650205', '85.697767', '46.08776');
INSERT INTO `provinces` VALUES ('650400', '新疆维吾尔自治区', '吐鲁番市', '650400', '吐鲁番', '650400', '89.184078', '42.947613');
INSERT INTO `provinces` VALUES ('650402', '新疆维吾尔自治区', '吐鲁番市', '650400', '高昌', '650402', '89.182324', '42.947627');
INSERT INTO `provinces` VALUES ('650421', '新疆维吾尔自治区', '吐鲁番市', '650400', '鄯善', '650421', '90.212692', '42.865503');
INSERT INTO `provinces` VALUES ('650422', '新疆维吾尔自治区', '吐鲁番市', '650400', '托克逊', '650422', '88.655771', '42.793536');
INSERT INTO `provinces` VALUES ('650500', '新疆维吾尔自治区', '哈密市', '650500', '哈密', '650500', '93.51316', '42.833248');
INSERT INTO `provinces` VALUES ('650502', '新疆维吾尔自治区', '哈密市', '650500', '伊州', '650502', '93.509174', '42.833888');
INSERT INTO `provinces` VALUES ('650521', '新疆维吾尔自治区', '哈密市', '650500', '巴里坤', '650521', '93.021795', '43.599032');
INSERT INTO `provinces` VALUES ('650522', '新疆维吾尔自治区', '哈密市', '650500', '伊吾', '650522', '94.692773', '43.252012');
INSERT INTO `provinces` VALUES ('652300', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '昌吉', '652300', '87.304012', '44.014577');
INSERT INTO `provinces` VALUES ('652301', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '昌吉市', '652301', '87.304012', '44.014577');
INSERT INTO `provinces` VALUES ('652302', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '阜康', '652302', '87.98384', '44.152153');
INSERT INTO `provinces` VALUES ('652323', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '呼图壁', '652323', '86.888613', '44.189342');
INSERT INTO `provinces` VALUES ('652324', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '玛纳斯', '652324', '86.217687', '44.305625');
INSERT INTO `provinces` VALUES ('652325', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '奇台', '652325', '89.591437', '44.021996');
INSERT INTO `provinces` VALUES ('652327', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '吉木萨尔', '652327', '89.181288', '43.997162');
INSERT INTO `provinces` VALUES ('652328', '新疆维吾尔自治区', '昌吉回族自治州', '652300', '木垒', '652328', '90.282833', '43.832442');
INSERT INTO `provinces` VALUES ('652700', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '652700', '博尔塔拉', '652700', '82.074778', '44.903258');
INSERT INTO `provinces` VALUES ('652701', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '652700', '博乐', '652701', '82.072237', '44.903087');
INSERT INTO `provinces` VALUES ('652702', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '652700', '阿拉山口', '652702', '82.569389', '45.16777');
INSERT INTO `provinces` VALUES ('652722', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '652700', '精河', '652722', '82.892938', '44.605645');
INSERT INTO `provinces` VALUES ('652723', '新疆维吾尔自治区', '博尔塔拉蒙古自治州', '652700', '温泉', '652723', '81.03099', '44.973751');
INSERT INTO `provinces` VALUES ('652800', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '巴音郭楞', '652800', '86.150969', '41.768552');
INSERT INTO `provinces` VALUES ('652801', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '库尔勒', '652801', '86.145948', '41.763122');
INSERT INTO `provinces` VALUES ('652822', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '轮台', '652822', '84.248542', '41.781266');
INSERT INTO `provinces` VALUES ('652823', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '尉犁', '652823', '86.263412', '41.337428');
INSERT INTO `provinces` VALUES ('652824', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '若羌', '652824', '88.168807', '39.023807');
INSERT INTO `provinces` VALUES ('652825', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '且末', '652825', '85.532629', '38.138562');
INSERT INTO `provinces` VALUES ('652826', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '焉耆', '652826', '86.5698', '42.064349');
INSERT INTO `provinces` VALUES ('652827', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '和静', '652827', '86.391067', '42.31716');
INSERT INTO `provinces` VALUES ('652828', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '和硕', '652828', '86.864947', '42.268863');
INSERT INTO `provinces` VALUES ('652829', '新疆维吾尔自治区', '巴音郭楞蒙古自治州', '652800', '博湖', '652829', '86.631576', '41.980166');
INSERT INTO `provinces` VALUES ('652900', '新疆维吾尔自治区', '阿克苏地区', '652900', '阿克苏', '652900', '80.265068', '41.170712');
INSERT INTO `provinces` VALUES ('652901', '新疆维吾尔自治区', '阿克苏地区', '652900', '阿克苏市', '652901', '80.265068', '41.170712');
INSERT INTO `provinces` VALUES ('652922', '新疆维吾尔自治区', '阿克苏地区', '652900', '温宿', '652922', '80.243273', '41.272995');
INSERT INTO `provinces` VALUES ('652923', '新疆维吾尔自治区', '阿克苏地区', '652900', '库车', '652923', '82.96304', '41.717141');
INSERT INTO `provinces` VALUES ('652924', '新疆维吾尔自治区', '阿克苏地区', '652900', '沙雅', '652924', '82.78077', '41.226268');
INSERT INTO `provinces` VALUES ('652925', '新疆维吾尔自治区', '阿克苏地区', '652900', '新和', '652925', '82.610828', '41.551176');
INSERT INTO `provinces` VALUES ('652926', '新疆维吾尔自治区', '阿克苏地区', '652900', '拜城', '652926', '81.869881', '41.796101');
INSERT INTO `provinces` VALUES ('652927', '新疆维吾尔自治区', '阿克苏地区', '652900', '乌什', '652927', '79.230805', '41.21587');
INSERT INTO `provinces` VALUES ('652928', '新疆维吾尔自治区', '阿克苏地区', '652900', '阿瓦提', '652928', '80.378426', '40.638422');
INSERT INTO `provinces` VALUES ('652929', '新疆维吾尔自治区', '阿克苏地区', '652900', '柯坪', '652929', '79.04785', '40.50624');
INSERT INTO `provinces` VALUES ('653000', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '653000', '克孜勒苏', '653000', '76.176796', '39.713966');
INSERT INTO `provinces` VALUES ('653001', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '653000', '阿图什', '653001', '76.173939', '39.712898');
INSERT INTO `provinces` VALUES ('653022', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '653000', '阿克陶', '653022', '75.945159', '39.147079');
INSERT INTO `provinces` VALUES ('653023', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '653000', '阿合奇', '653023', '78.450164', '40.937567');
INSERT INTO `provinces` VALUES ('653024', '新疆维吾尔自治区', '克孜勒苏柯尔克孜自治州', '653000', '乌恰', '653024', '75.25969', '39.716633');
INSERT INTO `provinces` VALUES ('653100', '新疆维吾尔自治区', '喀什地区', '653100', '喀什', '653100', '75.989138', '39.467664');
INSERT INTO `provinces` VALUES ('653101', '新疆维吾尔自治区', '喀什地区', '653100', '喀什市', '653101', '75.989138', '39.467664');
INSERT INTO `provinces` VALUES ('653121', '新疆维吾尔自治区', '喀什地区', '653100', '疏附', '653121', '75.863075', '39.378306');
INSERT INTO `provinces` VALUES ('653122', '新疆维吾尔自治区', '喀什地区', '653100', '疏勒', '653122', '76.053653', '39.399461');
INSERT INTO `provinces` VALUES ('653123', '新疆维吾尔自治区', '喀什地区', '653100', '英吉沙', '653123', '76.174292', '38.929839');
INSERT INTO `provinces` VALUES ('653124', '新疆维吾尔自治区', '喀什地区', '653100', '泽普', '653124', '77.273593', '38.191217');
INSERT INTO `provinces` VALUES ('653125', '新疆维吾尔自治区', '喀什地区', '653100', '莎车', '653125', '77.248884', '38.414499');
INSERT INTO `provinces` VALUES ('653126', '新疆维吾尔自治区', '喀什地区', '653100', '叶城', '653126', '77.420353', '37.884679');
INSERT INTO `provinces` VALUES ('653127', '新疆维吾尔自治区', '喀什地区', '653100', '麦盖提', '653127', '77.651538', '38.903384');
INSERT INTO `provinces` VALUES ('653128', '新疆维吾尔自治区', '喀什地区', '653100', '岳普湖', '653128', '76.7724', '39.235248');
INSERT INTO `provinces` VALUES ('653129', '新疆维吾尔自治区', '喀什地区', '653100', '伽师', '653129', '76.741982', '39.494325');
INSERT INTO `provinces` VALUES ('653130', '新疆维吾尔自治区', '喀什地区', '653100', '巴楚', '653130', '78.55041', '39.783479');
INSERT INTO `provinces` VALUES ('653131', '新疆维吾尔自治区', '喀什地区', '653100', '塔什库尔干', '653131', '75.228068', '37.775437');
INSERT INTO `provinces` VALUES ('653200', '新疆维吾尔自治区', '和田地区', '653200', '和田', '653200', '79.927542', '37.108944');
INSERT INTO `provinces` VALUES ('653201', '新疆维吾尔自治区', '和田地区', '653200', '和田市', '653201', '79.927542', '37.108944');
INSERT INTO `provinces` VALUES ('653221', '新疆维吾尔自治区', '和田地区', '653200', '和田县', '653221', '79.920212', '37.118335');
INSERT INTO `provinces` VALUES ('653222', '新疆维吾尔自治区', '和田地区', '653200', '墨玉', '653222', '79.736629', '37.271511');
INSERT INTO `provinces` VALUES ('653223', '新疆维吾尔自治区', '和田地区', '653200', '皮山', '653223', '78.282301', '37.616332');
INSERT INTO `provinces` VALUES ('653224', '新疆维吾尔自治区', '和田地区', '653200', '洛浦', '653224', '80.184038', '37.074377');
INSERT INTO `provinces` VALUES ('653225', '新疆维吾尔自治区', '和田地区', '653200', '策勒', '653225', '80.803572', '37.001672');
INSERT INTO `provinces` VALUES ('653226', '新疆维吾尔自治区', '和田地区', '653200', '于田', '653226', '81.667845', '36.854628');
INSERT INTO `provinces` VALUES ('653227', '新疆维吾尔自治区', '和田地区', '653200', '民丰', '653227', '82.692354', '37.064909');
INSERT INTO `provinces` VALUES ('654000', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '伊犁', '654000', '81.317946', '43.92186');
INSERT INTO `provinces` VALUES ('654002', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '伊宁', '654002', '81.316343', '43.922209');
INSERT INTO `provinces` VALUES ('654003', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '奎屯', '654003', '84.901602', '44.423445');
INSERT INTO `provinces` VALUES ('654004', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '霍尔果斯', '654004', '80.420759', '44.201669');
INSERT INTO `provinces` VALUES ('654021', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '伊宁县', '654021', '81.524671', '43.977876');
INSERT INTO `provinces` VALUES ('654022', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '察布查尔', '654022', '81.150874', '43.838883');
INSERT INTO `provinces` VALUES ('654023', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '霍城', '654023', '80.872508', '44.049912');
INSERT INTO `provinces` VALUES ('654024', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '巩留', '654024', '82.227044', '43.481618');
INSERT INTO `provinces` VALUES ('654025', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '新源', '654025', '83.258493', '43.434249');
INSERT INTO `provinces` VALUES ('654026', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '昭苏', '654026', '81.126029', '43.157765');
INSERT INTO `provinces` VALUES ('654027', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '特克斯', '654027', '81.840058', '43.214861');
INSERT INTO `provinces` VALUES ('654028', '新疆维吾尔自治区', '伊犁哈萨克自治州', '654000', '尼勒克', '654028', '82.504119', '43.789737');
INSERT INTO `provinces` VALUES ('654200', '新疆维吾尔自治区', '塔城地区', '654200', '塔城', '654200', '82.983988', '46.746281');
INSERT INTO `provinces` VALUES ('654201', '新疆维吾尔自治区', '塔城地区', '654200', '塔城市', '654201', '82.983988', '46.746281');
INSERT INTO `provinces` VALUES ('654202', '新疆维吾尔自治区', '塔城地区', '654200', '乌苏', '654202', '84.677624', '44.430115');
INSERT INTO `provinces` VALUES ('654221', '新疆维吾尔自治区', '塔城地区', '654200', '额敏', '654221', '83.622118', '46.522555');
INSERT INTO `provinces` VALUES ('654223', '新疆维吾尔自治区', '塔城地区', '654200', '沙湾', '654223', '85.622508', '44.329544');
INSERT INTO `provinces` VALUES ('654224', '新疆维吾尔自治区', '塔城地区', '654200', '托里', '654224', '83.60469', '45.935863');
INSERT INTO `provinces` VALUES ('654225', '新疆维吾尔自治区', '塔城地区', '654200', '裕民', '654225', '82.982157', '46.202781');
INSERT INTO `provinces` VALUES ('654226', '新疆维吾尔自治区', '塔城地区', '654200', '和布克赛尔', '654226', '85.733551', '46.793001');
INSERT INTO `provinces` VALUES ('654300', '新疆维吾尔自治区', '阿勒泰地区', '654300', '阿勒泰', '654300', '88.138743', '47.848911');
INSERT INTO `provinces` VALUES ('654301', '新疆维吾尔自治区', '阿勒泰地区', '654300', '阿勒泰市', '654301', '88.138743', '47.848911');
INSERT INTO `provinces` VALUES ('654321', '新疆维吾尔自治区', '阿勒泰地区', '654300', '布尔津', '654321', '86.86186', '47.70453');
INSERT INTO `provinces` VALUES ('654322', '新疆维吾尔自治区', '阿勒泰地区', '654300', '富蕴', '654322', '89.524993', '46.993106');
INSERT INTO `provinces` VALUES ('654323', '新疆维吾尔自治区', '阿勒泰地区', '654300', '福海', '654323', '87.494569', '47.113128');
INSERT INTO `provinces` VALUES ('654324', '新疆维吾尔自治区', '阿勒泰地区', '654300', '哈巴河', '654324', '86.418964', '48.059284');
INSERT INTO `provinces` VALUES ('654325', '新疆维吾尔自治区', '阿勒泰地区', '654300', '青河', '654325', '90.381561', '46.672446');
INSERT INTO `provinces` VALUES ('654326', '新疆维吾尔自治区', '阿勒泰地区', '654300', '吉木乃', '654326', '85.876064', '47.434633');
INSERT INTO `provinces` VALUES ('659001', '新疆维吾尔自治区', '石河子市', '659001', '石河子', '659001', '86.041075', '44.305886');
INSERT INTO `provinces` VALUES ('659002', '新疆维吾尔自治区', '阿拉尔市', '659002', '阿拉尔', '659002', '81.285884', '40.541914');
INSERT INTO `provinces` VALUES ('659003', '新疆维吾尔自治区', '图木舒克市', '659003', '图木舒克', '659003', '79.077978', '39.867316');
INSERT INTO `provinces` VALUES ('659004', '新疆维吾尔自治区', '五家渠市', '659004', '五家渠', '659004', '87.526884', '44.167401');
INSERT INTO `provinces` VALUES ('659005', '新疆维吾尔自治区', '北屯市', '659005', '北屯', '659005', '87.824932', '47.353177');
INSERT INTO `provinces` VALUES ('659006', '新疆维吾尔自治区', '铁门关市', '659006', '铁门关', '659006', '85.501218', '41.827251');
INSERT INTO `provinces` VALUES ('659007', '新疆维吾尔自治区', '双河市', '659007', '双河', '659007', '82.353656', '44.840524');
INSERT INTO `provinces` VALUES ('659008', '新疆维吾尔自治区', '可克达拉市', '659008', '可克达拉', '659008', '80.63579', '43.6832');
INSERT INTO `provinces` VALUES ('659009', '新疆维吾尔自治区', '昆玉市', '659009', '昆玉', '659009', '79.301389', '37.227712');
INSERT INTO `provinces` VALUES ('810100', '香港', '香港', '810000', '香港', '810100', '114.18355', '22.283159');
INSERT INTO `provinces` VALUES ('810101', '香港', '香港', '810000', '中西区', '810101', '114.159491', '22.291343');
INSERT INTO `provinces` VALUES ('810102', '香港', '香港', '810000', '东区', '810102', '114.171533', '22.281155');
INSERT INTO `provinces` VALUES ('810103', '香港', '香港', '810000', '九龙城区', '810103', '114.198554', '22.325723');
INSERT INTO `provinces` VALUES ('810104', '香港', '香港', '810000', '观塘区', '810104', '114.237431', '22.316803');
INSERT INTO `provinces` VALUES ('810105', '香港', '香港', '810000', '南区', '810105', '114.171533', '22.281155');
INSERT INTO `provinces` VALUES ('810106', '香港', '香港', '810000', '深水埗区', '810106', '114.175565', '22.334815');
INSERT INTO `provinces` VALUES ('810107', '香港', '香港', '810000', '湾仔区', '810107', '114.18355', '22.283159');
INSERT INTO `provinces` VALUES ('810108', '香港', '香港', '810000', '黄大仙区', '810108', '114.205553', '22.344517');
INSERT INTO `provinces` VALUES ('810109', '香港', '香港', '810000', '油尖旺区', '810109', '114.178545', '22.306584');
INSERT INTO `provinces` VALUES ('810110', '香港', '香港', '810000', '离岛区', '810110', '113.951547', '22.286066');
INSERT INTO `provinces` VALUES ('810111', '香港', '香港', '810000', '葵青区', '810111', '114.143474', '22.366619');
INSERT INTO `provinces` VALUES ('810111', '香港', '香港', '810000', '新界', '810111', '114.143474', '22.366619');
INSERT INTO `provinces` VALUES ('810112', '香港', '香港', '810000', '北区', '810112', '114.171533', '22.281155');
INSERT INTO `provinces` VALUES ('810113', '香港', '香港', '810000', '西贡区', '810113', '114.283525', '22.385077');
INSERT INTO `provinces` VALUES ('810114', '香港', '香港', '810000', '沙田区', '810114', '114.198551', '22.388522');
INSERT INTO `provinces` VALUES ('810115', '香港', '香港', '810000', '屯门区', '810115', '113.987456', '22.393585');
INSERT INTO `provinces` VALUES ('810116', '香港', '香港', '810000', '大埔区', '810116', '114.175564', '22.453814');
INSERT INTO `provinces` VALUES ('810117', '香港', '香港', '810000', '荃湾区', '810117', '114.126441', '22.378244');
INSERT INTO `provinces` VALUES ('810118', '香港', '香港', '810000', '元朗区', '810118', '114.03851', '22.448565');
INSERT INTO `provinces` VALUES ('820001', '澳门', '澳门', '820000', '花王堂区', '820001', '113.255858', '23.156437');
INSERT INTO `provinces` VALUES ('820002', '澳门', '澳门', '820000', '望德堂区', '820002', '112.60078', '22.386348');
INSERT INTO `provinces` VALUES ('820003', '澳门', '澳门', '820000', '风顺堂区', '820003', '113.081447', '28.818976');
INSERT INTO `provinces` VALUES ('820004', '澳门', '澳门', '820000', '圣方济各堂区', '820004', '113.575549', '22.128861');
INSERT INTO `provinces` VALUES ('820005', '澳门', '澳门', '820000', '嘉模堂区', '820005', '113.575521', '22.162438');
INSERT INTO `provinces` VALUES ('820006', '澳门', '澳门', '820000', '大堂区', '820006', '113.96756', '22.586268');
INSERT INTO `provinces` VALUES ('820007', '澳门', '澳门', '820000', '路氹填海区', '820007', '113.582715', '22.15065');
INSERT INTO `provinces` VALUES ('820008', '澳门', '澳门', '820000', '花地玛堂区', '820008', '113.554922', '22.210752');
INSERT INTO `provinces` VALUES ('820010', '澳门', '澳门', '820000', '澳门', '820010', '113.547925', '22.183116');
INSERT INTO `provinces` VALUES ('710113', '台湾省', '台北市', '710100', '台北', '710113', '121.58192', '25.033883');
INSERT INTO `provinces` VALUES ('710101', '台湾省', '台北市', '710100', '北投区', '710101', '121.528202', '25.151364');
INSERT INTO `provinces` VALUES ('710102', '台湾省', '台北市', '710100', '松山区', '710102', '121.587441', '25.05328');
INSERT INTO `provinces` VALUES ('710103', '台湾省', '台北市', '710100', '大同区', '710103', '121.523646', '25.067076');
INSERT INTO `provinces` VALUES ('710104', '台湾省', '台北市', '710100', '文山区', '710104', '121.584264', '24.991822');
INSERT INTO `provinces` VALUES ('710105', '台湾省', '台北市', '710100', '信义区', '710105', '121.58192', '25.033883');
INSERT INTO `provinces` VALUES ('710106', '台湾省', '台北市', '710100', '内湖区', '710106', '121.602615', '25.086827');
INSERT INTO `provinces` VALUES ('710107', '台湾省', '台北市', '710100', '中正区', '710107', '121.530288', '25.035499');
INSERT INTO `provinces` VALUES ('710108', '台湾省', '台北市', '710100', '万华区', '710108', '121.507747', '25.032336');
INSERT INTO `provinces` VALUES ('710109', '台湾省', '台北市', '710100', '中山区', '710109', '121.548484', '25.073115');
INSERT INTO `provinces` VALUES ('710110', '台湾省', '台北市', '710100', '士林区', '710110', '121.561289', '25.128905');
INSERT INTO `provinces` VALUES ('710111', '台湾省', '台北市', '710100', '南港区', '710111', '121.619964', '25.038967');
INSERT INTO `provinces` VALUES ('710112', '台湾省', '台北市', '710100', '大安区', '710112', '121.553725', '25.030151');
INSERT INTO `provinces` VALUES ('710239', '台湾省', '高雄市', '710200', '高雄', '710239', '120.331362', '22.626967');
INSERT INTO `provinces` VALUES ('710201', '台湾省', '高雄市', '710200', '小港区', '710201', '120.364759', '22.552059');
INSERT INTO `provinces` VALUES ('710202', '台湾省', '高雄市', '710200', '左营区', '710202', '120.306203', '22.686261');
INSERT INTO `provinces` VALUES ('710203', '台湾省', '高雄市', '710200', '大寮区', '710203', '120.421671', '22.596121');
INSERT INTO `provinces` VALUES ('710204', '台湾省', '高雄市', '710200', '那玛夏区', '710204', '120.731332', '23.26676');
INSERT INTO `provinces` VALUES ('710205', '台湾省', '高雄市', '710200', '旗津区', '710205', '120.30063', '22.58727');
INSERT INTO `provinces` VALUES ('710206', '台湾省', '高雄市', '710200', '弥陀区', '710206', '120.249448', '22.783733');
INSERT INTO `provinces` VALUES ('710207', '台湾省', '高雄市', '710200', '燕巢区', '710207', '120.381333', '22.791258');
INSERT INTO `provinces` VALUES ('710208', '台湾省', '高雄市', '710200', '大树区', '710208', '120.435943', '22.714243');
INSERT INTO `provinces` VALUES ('710209', '台湾省', '高雄市', '710200', '阿莲区', '710209', '120.331611', '22.87362');
INSERT INTO `provinces` VALUES ('710210', '台湾省', '高雄市', '710200', '楠梓区', '710210', '120.310694', '22.723707');
INSERT INTO `provinces` VALUES ('710211', '台湾省', '高雄市', '710200', '鸟松区', '710211', '120.383266', '22.66612');
INSERT INTO `provinces` VALUES ('710212', '台湾省', '高雄市', '710200', '苓雅区', '710212', '120.331362', '22.626967');
INSERT INTO `provinces` VALUES ('710213', '台湾省', '高雄市', '710200', '桥头区', '710213', '120.31109', '22.755648');
INSERT INTO `provinces` VALUES ('710214', '台湾省', '高雄市', '710200', '梓官区', '710214', '120.26984', '22.751575');
INSERT INTO `provinces` VALUES ('710215', '台湾省', '高雄市', '710200', '美浓区', '710215', '120.552716', '22.897697');
INSERT INTO `provinces` VALUES ('710216', '台湾省', '高雄市', '710200', '仁武区', '710216', '120.37112', '22.704829');
INSERT INTO `provinces` VALUES ('710217', '台湾省', '高雄市', '710200', '凤山区', '710217', '120.365972', '22.617563');
INSERT INTO `provinces` VALUES ('710218', '台湾省', '高雄市', '710200', '甲仙区', '710218', '120.633499', '23.119921');
INSERT INTO `provinces` VALUES ('710219', '台湾省', '高雄市', '710200', '茄萣区', '710219', '120.208093', '22.885284');
INSERT INTO `provinces` VALUES ('710220', '台湾省', '高雄市', '710200', '大社区', '710220', '120.381336', '22.743456');
INSERT INTO `provinces` VALUES ('710221', '台湾省', '高雄市', '710200', '前镇区', '710221', '120.329508', '22.590217');
INSERT INTO `provinces` VALUES ('710222', '台湾省', '高雄市', '710200', '茂林区', '710222', '120.762511', '22.923321');
INSERT INTO `provinces` VALUES ('710223', '台湾省', '高雄市', '710200', '湖内区', '710223', '120.236406', '22.896987');
INSERT INTO `provinces` VALUES ('710224', '台湾省', '高雄市', '710200', '六龟区', '710224', '120.667975', '23.011849');
INSERT INTO `provinces` VALUES ('710225', '台湾省', '高雄市', '710200', '林园区', '710225', '120.407533', '22.51234');
INSERT INTO `provinces` VALUES ('710226', '台湾省', '高雄市', '710200', '内门区', '710226', '120.482375', '22.960318');
INSERT INTO `provinces` VALUES ('710227', '台湾省', '高雄市', '710200', '鼓山区', '710227', '120.284618', '22.653372');
INSERT INTO `provinces` VALUES ('710228', '台湾省', '高雄市', '710200', '杉林区', '710228', '120.5501', '22.974629');
INSERT INTO `provinces` VALUES ('710229', '台湾省', '高雄市', '710200', '三民区', '710229', '120.328559', '22.653234');
INSERT INTO `provinces` VALUES ('710230', '台湾省', '高雄市', '710200', '前金区', '710230', '120.305125', '22.630093');
INSERT INTO `provinces` VALUES ('710231', '台湾省', '高雄市', '710200', '冈山区', '710231', '120.30842', '22.808304');
INSERT INTO `provinces` VALUES ('710232', '台湾省', '高雄市', '710200', '田寮区', '710232', '120.406518', '22.867428');
INSERT INTO `provinces` VALUES ('710233', '台湾省', '高雄市', '710200', '桃源区', '710233', '120.861739', '23.228083');
INSERT INTO `provinces` VALUES ('710234', '台湾省', '高雄市', '710200', '盐埕区', '710234', '120.294756', '22.627494');
INSERT INTO `provinces` VALUES ('710235', '台湾省', '高雄市', '710200', '旗山区', '710235', '120.485925', '22.86864');
INSERT INTO `provinces` VALUES ('710236', '台湾省', '高雄市', '710200', '永安区', '710236', '120.23821', '22.826048');
INSERT INTO `provinces` VALUES ('710237', '台湾省', '高雄市', '710200', '路竹区', '710237', '120.27648', '22.860653');
INSERT INTO `provinces` VALUES ('710238', '台湾省', '高雄市', '710200', '新兴区', '710238', '120.317219', '22.633001');
INSERT INTO `provinces` VALUES ('710330', '台湾省', '新北市', '710300', '新北市', '710330', '121.657578', '24.950386');
INSERT INTO `provinces` VALUES ('710301', '台湾省', '新北市', '710300', '八里区', '710301', '121.417284', '25.144473');
INSERT INTO `provinces` VALUES ('710302', '台湾省', '新北市', '710300', '三峡区', '710302', '121.426873', '24.885592');
INSERT INTO `provinces` VALUES ('710303', '台湾省', '新北市', '710300', '新庄区', '710303', '121.447424', '25.039606');
INSERT INTO `provinces` VALUES ('710304', '台湾省', '新北市', '710300', '坪林区', '710304', '121.73452', '24.914253');
INSERT INTO `provinces` VALUES ('710305', '台湾省', '新北市', '710300', '莺歌区', '710305', '121.357196', '24.960083');
INSERT INTO `provinces` VALUES ('710306', '台湾省', '新北市', '710300', '汐止区', '710306', '121.665039', '25.076492');
INSERT INTO `provinces` VALUES ('710307', '台湾省', '新北市', '710300', '深坑区', '710307', '121.630407', '25.000524');
INSERT INTO `provinces` VALUES ('710308', '台湾省', '新北市', '710300', '芦洲区', '710308', '121.481831', '25.092601');
INSERT INTO `provinces` VALUES ('710309', '台湾省', '新北市', '710300', '三芝区', '710309', '121.526224', '25.234578');
INSERT INTO `provinces` VALUES ('710310', '台湾省', '新北市', '710300', '三重区', '710310', '121.497688', '25.066087');
INSERT INTO `provinces` VALUES ('710311', '台湾省', '新北市', '710300', '平溪区', '710311', '121.768245', '25.029332');
INSERT INTO `provinces` VALUES ('710312', '台湾省', '新北市', '710300', '中和区', '710312', '121.504694', '24.993925');
INSERT INTO `provinces` VALUES ('710313', '台湾省', '新北市', '710300', '永和区', '710313', '121.531024', '25.012315');
INSERT INTO `provinces` VALUES ('710314', '台湾省', '新北市', '710300', '泰山区', '710314', '121.426899', '25.05912');
INSERT INTO `provinces` VALUES ('710315', '台湾省', '新北市', '710300', '土城区', '710315', '121.456335', '24.967905');
INSERT INTO `provinces` VALUES ('710316', '台湾省', '新北市', '710300', '石碇区', '710316', '121.657578', '24.950386');
INSERT INTO `provinces` VALUES ('710317', '台湾省', '新北市', '710300', '五股区', '710317', '121.443832', '25.099888');
INSERT INTO `provinces` VALUES ('710318', '台湾省', '新北市', '710300', '林口区', '710318', '121.362837', '25.10372');
INSERT INTO `provinces` VALUES ('710319', '台湾省', '新北市', '710300', '双溪区', '710319', '121.843245', '25.000177');
INSERT INTO `provinces` VALUES ('710320', '台湾省', '新北市', '710300', '树林区', '710320', '121.435139', '24.993998');
INSERT INTO `provinces` VALUES ('710321', '台湾省', '新北市', '710300', '板桥区', '710321', '121.468077', '25.015015');
INSERT INTO `provinces` VALUES ('710322', '台湾省', '新北市', '710300', '新店区', '710322', '121.542083', '24.933627');
INSERT INTO `provinces` VALUES ('710323', '台湾省', '新北市', '710300', '乌来区', '710323', '121.551963', '24.791543');
INSERT INTO `provinces` VALUES ('710324', '台湾省', '新北市', '710300', '贡寮区', '710324', '121.92822', '25.028165');
INSERT INTO `provinces` VALUES ('710325', '台湾省', '新北市', '710300', '金山区', '710325', '121.615567', '25.220154');
INSERT INTO `provinces` VALUES ('710326', '台湾省', '新北市', '710300', '万里区', '710326', '121.654224', '25.178894');
INSERT INTO `provinces` VALUES ('710327', '台湾省', '新北市', '710300', '淡水区', '710327', '121.451326', '25.173467');
INSERT INTO `provinces` VALUES ('710328', '台湾省', '新北市', '710300', '瑞芳区', '710328', '121.833422', '25.101398');
INSERT INTO `provinces` VALUES ('710329', '台湾省', '新北市', '710300', '石门区', '710329', '121.579855', '25.268226');
INSERT INTO `provinces` VALUES ('710430', '台湾省', '台中市', '710400', '台中市', '710430', '120.783669', '24.118159');
INSERT INTO `provinces` VALUES ('710401', '台湾省', '台中市', '710400', '东区', '710401', '120.657424', '24.166601');
INSERT INTO `provinces` VALUES ('710402', '台湾省', '台中市', '710400', '新社区', '710402', '120.841661', '24.180949');
INSERT INTO `provinces` VALUES ('710403', '台湾省', '台中市', '710400', '中区', '710403', '120.690908', '24.144849');
INSERT INTO `provinces` VALUES ('710404', '台湾省', '台中市', '710400', '南屯区', '710404', '120.628213', '24.144757');
INSERT INTO `provinces` VALUES ('710405', '台湾省', '台中市', '710400', '神冈区', '710405', '120.683613', '24.268826');
INSERT INTO `provinces` VALUES ('710406', '台湾省', '台中市', '710400', '沙鹿区', '710406', '120.594054', '24.237638');
INSERT INTO `provinces` VALUES ('710407', '台湾省', '台中市', '710400', '丰原区', '710407', '120.747914', '24.253371');
INSERT INTO `provinces` VALUES ('710408', '台湾省', '台中市', '710400', '大里区', '710408', '120.702884', '24.09916');
INSERT INTO `provinces` VALUES ('710409', '台湾省', '台中市', '710400', '龙井区', '710409', '120.534472', '24.208766');
INSERT INTO `provinces` VALUES ('710410', '台湾省', '台中市', '710400', '西区', '710410', '120.666249', '24.145901');
INSERT INTO `provinces` VALUES ('710411', '台湾省', '台中市', '710400', '南区', '710411', '120.664476', '24.12011');
INSERT INTO `provinces` VALUES ('710412', '台湾省', '台中市', '710400', '西屯区', '710412', '120.644162', '24.168136');
INSERT INTO `provinces` VALUES ('710413', '台湾省', '台中市', '710400', '太平区', '710413', '120.783669', '24.118159');
INSERT INTO `provinces` VALUES ('710414', '台湾省', '台中市', '710400', '北屯区', '710414', '120.746611', '24.187303');
INSERT INTO `provinces` VALUES ('710415', '台湾省', '台中市', '710400', '大雅区', '710415', '120.651379', '24.230141');
INSERT INTO `provinces` VALUES ('710416', '台湾省', '台中市', '710400', '石冈区', '710416', '120.800765', '24.268057');
INSERT INTO `provinces` VALUES ('710417', '台湾省', '台中市', '710400', '北区', '710417', '120.683334', '24.158062');
INSERT INTO `provinces` VALUES ('710418', '台湾省', '台中市', '710400', '大甲区', '710418', '120.646549', '24.380562');
INSERT INTO `provinces` VALUES ('710419', '台湾省', '台中市', '710400', '梧栖区', '710419', '120.541944', '24.257932');
INSERT INTO `provinces` VALUES ('710420', '台湾省', '台中市', '710400', '东势区', '710420', '120.850365', '24.252833');
INSERT INTO `provinces` VALUES ('710421', '台湾省', '台中市', '710400', '和平区', '710421', '121.150732', '24.279557');
INSERT INTO `provinces` VALUES ('710422', '台湾省', '台中市', '710400', '雾峰区', '710422', '120.73052', '24.046742');
INSERT INTO `provinces` VALUES ('710423', '台湾省', '台中市', '710400', '乌日区', '710423', '120.639524', '24.087109');
INSERT INTO `provinces` VALUES ('710424', '台湾省', '台中市', '710400', '后里区', '710424', '120.724925', '24.313043');
INSERT INTO `provinces` VALUES ('710425', '台湾省', '台中市', '710400', '潭子区', '710425', '120.715498', '24.213134');
INSERT INTO `provinces` VALUES ('710426', '台湾省', '台中市', '710400', '大肚区', '710426', '120.564565', '24.147825');
INSERT INTO `provinces` VALUES ('710427', '台湾省', '台中市', '710400', '外埔区', '710427', '120.675313', '24.338632');
INSERT INTO `provinces` VALUES ('710428', '台湾省', '台中市', '710400', '清水区', '710428', '120.591795', '24.294739');
INSERT INTO `provinces` VALUES ('710429', '台湾省', '台中市', '710400', '大安区', '710429', '120.604445', '24.368001');
INSERT INTO `provinces` VALUES ('710538', '台湾省', '台南市', '710500', '台南市', '710538', '120.174853', '22.992805');
INSERT INTO `provinces` VALUES ('710501', '台湾省', '台南市', '710500', '安定区', '710501', '120.24023', '23.103685');
INSERT INTO `provinces` VALUES ('710502', '台湾省', '台南市', '710500', '大内区', '710502', '120.409309', '23.148373');
INSERT INTO `provinces` VALUES ('710503', '台湾省', '台南市', '710500', '东山区', '710503', '120.454533', '23.282019');
INSERT INTO `provinces` VALUES ('710504', '台湾省', '台南市', '710500', '下营区', '710504', '120.275323', '23.234567');
INSERT INTO `provinces` VALUES ('710505', '台湾省', '台南市', '710500', '山上区', '710505', '120.36322', '23.10693');
INSERT INTO `provinces` VALUES ('710506', '台湾省', '台南市', '710500', '永康区', '710506', '120.264729', '23.030909');
INSERT INTO `provinces` VALUES ('710507', '台湾省', '台南市', '710500', '新营区', '710507', '120.30593', '23.304946');
INSERT INTO `provinces` VALUES ('710508', '台湾省', '台南市', '710500', '白河区', '710508', '120.468302', '23.354986');
INSERT INTO `provinces` VALUES ('710509', '台湾省', '台南市', '710500', '盐水区', '710509', '120.258846', '23.301725');
INSERT INTO `provinces` VALUES ('710510', '台湾省', '台南市', '710500', '归仁区', '710510', '120.30355', '22.949996');
INSERT INTO `provinces` VALUES ('710511', '台湾省', '台南市', '710500', '龙崎区', '710511', '120.375517', '22.967239');
INSERT INTO `provinces` VALUES ('710512', '台湾省', '台南市', '710500', '关庙区', '710512', '120.344208', '22.959234');
INSERT INTO `provinces` VALUES ('710513', '台湾省', '台南市', '710500', '仁德区', '710513', '120.253476', '22.944975');
INSERT INTO `provinces` VALUES ('710514', '台湾省', '台南市', '710500', '学甲区', '710514', '120.194747', '23.255635');
INSERT INTO `provinces` VALUES ('710515', '台湾省', '台南市', '710500', '善化区', '710515', '120.309286', '23.143669');
INSERT INTO `provinces` VALUES ('710516', '台湾省', '台南市', '710500', '新市区', '710516', '120.302867', '23.086587');
INSERT INTO `provinces` VALUES ('710517', '台湾省', '台南市', '710500', '佳里区', '710517', '120.189046', '23.170496');
INSERT INTO `provinces` VALUES ('710518', '台湾省', '台南市', '710500', '新化区', '710518', '120.321468', '23.041307');
INSERT INTO `provinces` VALUES ('710519', '台湾省', '台南市', '710500', '西港区', '710519', '120.210839', '23.129141');
INSERT INTO `provinces` VALUES ('710520', '台湾省', '台南市', '710500', '麻豆区', '710520', '120.251825', '23.186152');
INSERT INTO `provinces` VALUES ('710521', '台湾省', '台南市', '710500', '安南区', '710521', '120.16324', '23.052477');
INSERT INTO `provinces` VALUES ('710522', '台湾省', '台南市', '710500', '后壁区', '710522', '120.359095', '23.365806');
INSERT INTO `provinces` VALUES ('710523', '台湾省', '台南市', '710500', '柳营区', '710523', '120.365496', '23.272545');
INSERT INTO `provinces` VALUES ('710524', '台湾省', '台南市', '710500', '玉井区', '710524', '120.470655', '23.127399');
INSERT INTO `provinces` VALUES ('710525', '台湾省', '台南市', '710500', '官田区', '710525', '120.358564', '23.194617');
INSERT INTO `provinces` VALUES ('710526', '台湾省', '台南市', '710500', '东区', '710526', '120.229576', '22.980513');
INSERT INTO `provinces` VALUES ('710527', '台湾省', '台南市', '710500', '六甲区', '710527', '120.390496', '23.230882');
INSERT INTO `provinces` VALUES ('710528', '台湾省', '台南市', '710500', '中西区', '710528', '120.204344', '22.998376');
INSERT INTO `provinces` VALUES ('710529', '台湾省', '台南市', '710500', '北区', '710529', '120.20161', '23.010416');
INSERT INTO `provinces` VALUES ('710530', '台湾省', '台南市', '710500', '楠西区', '710530', '120.527304', '23.182256');
INSERT INTO `provinces` VALUES ('710531', '台湾省', '台南市', '710500', '南化区', '710531', '120.554553', '23.118778');
INSERT INTO `provinces` VALUES ('710532', '台湾省', '台南市', '710500', '左镇区', '710532', '120.422898', '23.029553');
INSERT INTO `provinces` VALUES ('710533', '台湾省', '台南市', '710500', '南区', '710533', '120.182611', '22.950854');
INSERT INTO `provinces` VALUES ('710534', '台湾省', '台南市', '710500', '安平区', '710534', '120.174853', '22.992805');
INSERT INTO `provinces` VALUES ('710535', '台湾省', '台南市', '710500', '北门区', '710535', '120.137851', '23.281533');
INSERT INTO `provinces` VALUES ('710536', '台湾省', '台南市', '710500', '七股区', '710536', '120.112161', '23.127327');
INSERT INTO `provinces` VALUES ('710537', '台湾省', '台南市', '710500', '将军区', '710537', '120.138981', '23.211838');
INSERT INTO `provinces` VALUES ('710616', '台湾省', '桃园市', '710600', '桃园市', '710616', '121.310187', '25.00395');
INSERT INTO `provinces` VALUES ('710601', '台湾省', '桃园市', '710600', '平镇市', '710601', '121.224483', '24.924608');
INSERT INTO `provinces` VALUES ('710602', '台湾省', '桃园市', '710600', '杨梅市', '710602', '121.139656', '24.921654');
INSERT INTO `provinces` VALUES ('710603', '台湾省', '桃园市', '710600', '八德市', '710603', '121.294936', '24.931784');
INSERT INTO `provinces` VALUES ('710604', '台湾省', '桃园市', '710600', '桃园区', '710604', '121.310187', '25.00395');
INSERT INTO `provinces` VALUES ('710605', '台湾省', '桃园市', '710600', '龟山乡', '710605', '121.367533', '25.027568');
INSERT INTO `provinces` VALUES ('710606', '台湾省', '桃园市', '710600', '复兴乡', '710606', '121.385989', '24.733054');
INSERT INTO `provinces` VALUES ('710607', '台湾省', '桃园市', '710600', '芦竹乡', '710607', '121.293615', '25.064067');
INSERT INTO `provinces` VALUES ('710608', '台湾省', '桃园市', '710600', '观音乡', '710608', '121.12711', '25.02934');
INSERT INTO `provinces` VALUES ('710609', '台湾省', '桃园市', '710600', '龙潭乡', '710609', '121.222337', '24.854035');
INSERT INTO `provinces` VALUES ('710610', '台湾省', '桃园市', '710600', '大溪镇', '710610', '121.29671', '24.884428');
INSERT INTO `provinces` VALUES ('710611', '台湾省', '桃园市', '710600', '大园乡', '710611', '121.222376', '25.067386');
INSERT INTO `provinces` VALUES ('710612', '台湾省', '桃园市', '710600', '新屋乡', '710612', '121.079076', '24.976043');
INSERT INTO `provinces` VALUES ('710613', '台湾省', '桃园市', '710600', '中坜市', '710613', '121.225309', '24.983287');
INSERT INTO `provinces` VALUES ('719001', '台湾省', '基隆市', '719001', '基隆', '719001', '121.737837', '25.124845');
INSERT INTO `provinces` VALUES ('719002', '台湾省', '新竹市', '719002', '新竹市', '719002', '120.954654', '24.792061');
INSERT INTO `provinces` VALUES ('719003', '台湾省', '嘉义市', '719003', '嘉义市', '719003', '120.423154', '23.465162');
INSERT INTO `provinces` VALUES ('719004', '台湾省', '新竹县', '719004', '新竹县', '719004', '121.089426', '24.747591');
INSERT INTO `provinces` VALUES ('719005', '台湾省', '宜兰县', '719005', '宜兰县', '719005', '121.73622', '24.685998');
INSERT INTO `provinces` VALUES ('719006', '台湾省', '苗栗县', '719006', '苗栗县', '719006', '120.855912', '24.520003');
INSERT INTO `provinces` VALUES ('719007', '台湾省', '彰化县', '719007', '彰化县', '719007', '120.503706', '23.964674');
INSERT INTO `provinces` VALUES ('719008', '台湾省', '云林县', '719008', '云林县', '719008', '120.374997', '23.693011');
INSERT INTO `provinces` VALUES ('719009', '台湾省', '南投县', '719009', '南投县', '719009', '120.84461', '23.868844');
INSERT INTO `provinces` VALUES ('719010', '台湾省', '嘉义县', '719010', '嘉义县', '719010', '120.423154', '23.465162');
INSERT INTO `provinces` VALUES ('719011', '台湾省', '屏东县', '719011', '屏东县', '719011', '120.601536', '22.500688');
INSERT INTO `provinces` VALUES ('719012', '台湾省', '台东县', '719012', '台东县', '719012', '121.123852', '22.790653');
INSERT INTO `provinces` VALUES ('719013', '台湾省', '花莲县', '719013', '花莲县', '719013', '121.443563', '23.698851');
INSERT INTO `provinces` VALUES ('719014', '台湾省', '澎湖县', '719014', '澎湖县', '719014', '119.547255', '23.497811');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名',
  `description` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '字典描述',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1518589992044154883 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'switch', '开关', 1, '', '2022-03-05 16:22:32', '', '2022-03-05 16:22:34', 0);
INSERT INTO `sys_dict` VALUES (2, 'permissionType', '权限类型', 1, '', '2022-03-06 12:02:55', '', '2022-03-06 12:02:58', 0);
INSERT INTO `sys_dict` VALUES (3, 'yesOrNo', '是否', 2, '', '2022-03-05 16:22:32', '', '2022-03-05 16:22:34', 0);
INSERT INTO `sys_dict` VALUES (1510286107382763521, 'memberType', '会员类型', 999, 'money', '2022-04-03 00:00:42', 'money', '2022-04-03 00:00:42', 0);
INSERT INTO `sys_dict` VALUES (1510980534468206594, 'goodsStatus', '商品状态', 999, 'money', '2022-04-04 22:00:07', 'money', '2022-04-04 22:00:07', 0);
INSERT INTO `sys_dict` VALUES (1518589992044154882, 'orderStatus', '订单状态', 999, 'money', '2022-04-25 21:57:23', 'money', '2022-04-25 21:57:23', 0);

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail`  (
  `id` bigint NOT NULL,
  `dict` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典名',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典值',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail` VALUES (1, 'switch', '开', 'true', 1, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (2, 'switch', '关', 'false', 2, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (3, 'permissionType', '目录', 'DIR', 1, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (4, 'permissionType', '菜单', 'MENU', 2, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (5, 'permissionType', '按钮', 'BUTTON', 3, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (6, 'yesOrNo', '是', 'true', 1, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (7, 'yesOrNo', '否', 'false', 2, '', '2022-03-30 22:13:11', '', '2022-03-30 22:13:17', 0);
INSERT INTO `sys_dict_detail` VALUES (1510286263708667905, 'memberType', '普通会员', 'MEMBER', 1, 'money', '2022-04-03 00:01:20', 'money', '2022-04-03 00:01:20', 0);
INSERT INTO `sys_dict_detail` VALUES (1510454293784694785, 'memberType', '白金会员', 'BJ_VIP', 2, 'money', '2022-04-03 11:09:01', 'money', '2022-04-03 11:09:01', 0);
INSERT INTO `sys_dict_detail` VALUES (1510579145426341890, 'memberType', '内部账号', 'INNER', 999, 'money', '2022-04-03 19:25:08', 'money', '2022-04-03 19:25:08', 0);
INSERT INTO `sys_dict_detail` VALUES (1510980662277038082, 'goodsStatus', '在售', 'SALE', 1, 'money', '2022-04-04 22:00:37', 'money', '2022-04-04 22:00:37', 0);
INSERT INTO `sys_dict_detail` VALUES (1510980713917308929, 'goodsStatus', '售罄', 'SOLD_OUT', 2, 'money', '2022-04-04 22:00:50', 'money', '2022-04-04 22:01:09', 0);
INSERT INTO `sys_dict_detail` VALUES (1510980771505102850, 'goodsStatus', '下架', 'UN_SHELVE', 999, 'money', '2022-04-04 22:01:03', 'money', '2022-04-04 22:01:03', 0);
INSERT INTO `sys_dict_detail` VALUES (1518590072792895490, 'orderStatus', '已确认', 'CONFIRMED', 1, 'money', '2022-04-25 21:57:42', 'money', '2022-04-28 23:14:08', 0);
INSERT INTO `sys_dict_detail` VALUES (1518590115520270338, 'orderStatus', '已支付', 'PAID', 2, 'money', '2022-04-25 21:57:52', 'money', '2022-04-25 21:57:52', 0);
INSERT INTO `sys_dict_detail` VALUES (1518590169668734977, 'orderStatus', '已完成', 'DONE', 3, 'money', '2022-04-25 21:58:05', 'money', '2022-04-25 21:58:05', 0);
INSERT INTO `sys_dict_detail` VALUES (1518590220025548802, 'orderStatus', '退单', 'RETURN', 4, 'money', '2022-04-25 21:58:17', 'money', '2022-04-25 21:58:17', 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint UNSIGNED NOT NULL,
  `permission_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `permission_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源类型',
  `parent_id` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '父编码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `permission` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `router_path` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `iframe` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否外链菜单',
  `hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `component_name` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件名称',
  `component_path` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `sub_count` int NOT NULL DEFAULT 0 COMMENT '子节点数',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1501921151197130754, '系统管理', 'DIR', 0, 'system', '', 'system', 0, 0, '', '', 5, 1, 'admin', '2022-03-10 22:01:21', 'admin', '2022-03-10 23:06:45', 0);
INSERT INTO `sys_permission` VALUES (1502278787507806210, '用户管理', 'MENU', 1501921151197130754, 'peoples', 'user:list', 'user', 0, 0, 'User', 'system/user/index', 3, 1, 'admin', '2022-03-11 21:42:29', 'admin', '2022-03-11 21:42:29', 0);
INSERT INTO `sys_permission` VALUES (1502863016289398785, '角色管理', 'MENU', 1501921151197130754, 'people', 'role:list', 'role', 0, 0, 'Role', 'system/role/index', 2, 2, 'admin', '2022-03-13 12:24:00', 'admin', '2022-03-13 12:24:00', 0);
INSERT INTO `sys_permission` VALUES (1502863270971731970, '权限管理', 'MENU', 1501921151197130754, 'permission', 'permission:list', 'permission', 0, 0, 'Permission', 'system/permission/index', 3, 3, 'admin', '2022-03-13 12:25:00', 'admin', '2022-03-13 12:25:00', 0);
INSERT INTO `sys_permission` VALUES (1503736683986800642, '新增用户', 'BUTTON', 1502278787507806210, '', 'user:add', '', 0, 0, '', '', 0, 1, 'admin', '2022-03-15 22:15:38', 'admin', '2022-03-15 22:15:38', 0);
INSERT INTO `sys_permission` VALUES (1503738104236822529, '修改用户', 'BUTTON', 1502278787507806210, '', 'user:edit', '', 0, 0, '', '', 0, 2, 'admin', '2022-03-15 22:21:17', 'admin', '2022-03-15 22:21:17', 0);
INSERT INTO `sys_permission` VALUES (1503738191579009025, '删除用户', 'BUTTON', 1502278787507806210, '', 'user:del', '', 0, 0, '', '', 0, 3, 'admin', '2022-03-15 22:21:38', 'admin', '2022-03-15 22:21:38', 0);
INSERT INTO `sys_permission` VALUES (1503753702563991553, '新增角色', 'BUTTON', 1502863016289398785, '', 'role:add', '', 0, 0, '', '', 0, 1, 'admin', '2022-03-15 23:23:16', 'admin', '2022-03-15 23:23:16', 0);
INSERT INTO `sys_permission` VALUES (1503753930130149377, '修改角色', 'BUTTON', 1502863016289398785, '', 'role:edit', '', 0, 0, '', '', 0, 2, 'admin', '2022-03-15 23:24:10', 'admin', '2022-03-15 23:24:10', 0);
INSERT INTO `sys_permission` VALUES (1503754013445804034, '删除角色', 'BUTTON', 1502863016289398785, '', 'role:del', '', 0, 0, '', '', 0, 3, 'admin', '2022-03-15 23:24:30', 'admin', '2022-03-15 23:24:30', 0);
INSERT INTO `sys_permission` VALUES (1503754297878335489, '新增权限', 'BUTTON', 1502863270971731970, '', 'permission:add', '', 0, 0, '', '', 0, 1, 'admin', '2022-03-15 23:25:38', 'admin', '2022-03-15 23:25:38', 0);
INSERT INTO `sys_permission` VALUES (1503754393558798337, '修改权限', 'BUTTON', 1502863270971731970, '', 'permission:edit', '', 0, 0, '', '', 0, 2, 'admin', '2022-03-15 23:26:00', 'admin', '2022-03-15 23:26:00', 0);
INSERT INTO `sys_permission` VALUES (1503754468678782978, '删除权限', 'BUTTON', 1502863270971731970, '', 'permission:del', '', 0, 0, '', '', 0, 3, 'admin', '2022-03-15 23:26:18', 'admin', '2022-03-15 23:26:18', 0);
INSERT INTO `sys_permission` VALUES (1507371326556450818, '字典管理', 'MENU', 1501921151197130754, 'dictionary', 'dict:list', 'dict', 0, 0, 'Dict', 'system/dict/index', 3, 4, 'money', '2022-03-25 22:58:25', 'money', '2022-03-25 22:58:25', 0);
INSERT INTO `sys_permission` VALUES (1507371669973479425, '新增字典', 'BUTTON', 1507371326556450818, '', 'dict:add', '', 0, 0, '', '', 0, 1, 'money', '2022-03-25 22:59:46', 'money', '2022-03-25 22:59:46', 0);
INSERT INTO `sys_permission` VALUES (1507371725170520065, '修改字典', 'BUTTON', 1507371326556450818, '', 'dict:edit', '', 0, 0, '', '', 0, 2, 'money', '2022-03-25 23:00:00', 'money', '2022-03-25 23:00:00', 0);
INSERT INTO `sys_permission` VALUES (1507371776840151041, '删除字典', 'BUTTON', 1507371326556450818, '', 'dict:del', '', 0, 0, '', '', 0, 3, 'money', '2022-03-25 23:00:12', 'money', '2022-03-25 23:00:12', 0);
INSERT INTO `sys_permission` VALUES (1507555956060450818, '租户管理', 'MENU', 1501921151197130754, 'tenant', 'tenant:list', 'tenant', 0, 0, 'Tenant', 'system/tenant/index', 3, 5, 'money', '2022-03-26 11:12:04', 'money', '2022-03-26 11:12:04', 0);
INSERT INTO `sys_permission` VALUES (1507556070254571522, '新增租户', 'BUTTON', 1507555956060450818, '', 'tenant:add', '', 0, 0, '', '', 0, 1, 'money', '2022-03-26 11:12:31', 'money', '2022-03-26 11:12:31', 0);
INSERT INTO `sys_permission` VALUES (1507556151250776065, '修改租户', 'BUTTON', 1507555956060450818, '', 'tenant:edit', '', 0, 0, '', '', 0, 2, 'money', '2022-03-26 11:12:50', 'money', '2022-03-26 11:12:50', 0);
INSERT INTO `sys_permission` VALUES (1507556213058039809, '删除租户', 'BUTTON', 1507555956060450818, '', 'tenant:del', '', 0, 0, '', '', 0, 3, 'money', '2022-03-26 11:13:05', 'money', '2022-03-26 11:13:05', 0);
INSERT INTO `sys_permission` VALUES (1510284497327763458, '会员管理', 'DIR', 0, 'user', '', 'ums', 0, 0, '', '', 1, 2, 'money', '2022-04-02 23:54:19', 'money', '2022-04-02 23:54:19', 0);
INSERT INTO `sys_permission` VALUES (1510284659295006721, '会员', 'MENU', 1510284497327763458, 'member', 'member:list', 'member', 0, 0, 'Member', 'ums/member/index', 3, 1, 'money', '2022-04-02 23:54:57', 'money', '2022-04-02 23:54:57', 0);
INSERT INTO `sys_permission` VALUES (1510284728941424641, '新增会员', 'BUTTON', 1510284659295006721, '', 'member:add', '', 0, 0, '', '', 0, 1, 'money', '2022-04-02 23:55:14', 'money', '2022-04-02 23:55:14', 0);
INSERT INTO `sys_permission` VALUES (1510284794515173377, '修改会员', 'BUTTON', 1510284659295006721, '', 'member:edit', '', 0, 0, '', '', 0, 2, 'money', '2022-04-02 23:55:29', 'money', '2022-04-02 23:55:29', 0);
INSERT INTO `sys_permission` VALUES (1510284849565413378, '删除会员', 'BUTTON', 1510284659295006721, '', 'member:del', '', 0, 0, '', '', 0, 3, 'money', '2022-04-02 23:55:43', 'money', '2022-04-02 23:55:43', 0);
INSERT INTO `sys_permission` VALUES (1510835866430345218, '商品管理', 'DIR', 0, '商品管理', '', 'gms', 0, 0, '', '', 2, 3, 'money', '2022-04-04 12:25:15', 'money', '2022-04-04 12:25:15', 0);
INSERT INTO `sys_permission` VALUES (1510836010190114818, '商品', 'MENU', 1510835866430345218, '商品', 'goods:list', 'goods', 0, 0, 'Goods', 'gms/goods/index', 3, 1, 'money', '2022-04-04 12:25:49', 'money', '2022-04-04 12:25:49', 0);
INSERT INTO `sys_permission` VALUES (1510836150221148161, '品牌', 'MENU', 1510835866430345218, '品牌', 'brand:list', 'brand', 0, 0, 'Brand', 'gms/brand/index', 2, 2, 'money', '2022-04-04 12:26:23', 'money', '2022-04-04 12:26:23', 0);
INSERT INTO `sys_permission` VALUES (1510836224443551745, '新增品牌', 'BUTTON', 1510836150221148161, '', 'brand:add', '', 0, 0, '', '', 0, 1, 'money', '2022-04-04 12:26:41', 'money', '2022-04-04 12:26:41', 0);
INSERT INTO `sys_permission` VALUES (1510836302361137153, '修改品牌', 'BUTTON', 1510836150221148161, '', 'brand:edit', '', 0, 0, '', '', 0, 2, 'money', '2022-04-04 12:26:59', 'money', '2022-04-04 12:26:59', 0);
INSERT INTO `sys_permission` VALUES (1510836419776483330, '删除品牌', 'BUTTON', 1510836150221148161, '', 'brand:del', '', 0, 0, '', '', 0, 3, 'money', '2022-04-04 12:27:27', 'money', '2022-04-04 12:27:27', 0);
INSERT INTO `sys_permission` VALUES (1510836492539269122, '新增商品', 'BUTTON', 1510836010190114818, '', 'goods:add', '', 0, 0, '', '', 0, 1, 'money', '2022-04-04 12:27:44', 'money', '2022-04-04 12:27:44', 0);
INSERT INTO `sys_permission` VALUES (1510836558440173570, '修改商品', 'BUTTON', 1510836010190114818, '', 'goods:edit', '', 0, 0, '', '', 0, 2, 'money', '2022-04-04 12:28:00', 'money', '2022-04-04 12:28:00', 0);
INSERT INTO `sys_permission` VALUES (1510836623946813442, '删除商品', 'BUTTON', 1510836010190114818, '', 'goods:del', '', 0, 0, '', '', 0, 3, 'money', '2022-04-04 12:28:16', 'money', '2022-04-04 12:28:16', 0);
INSERT INTO `sys_permission` VALUES (1512985896561979393, '订单管理', 'DIR', 0, '订单管理', '', 'oms', 0, 0, '', '', 1, 4, 'money', '2022-04-10 10:48:42', 'money', '2022-04-10 10:48:42', 0);
INSERT INTO `sys_permission` VALUES (1512986102288396290, '订单', 'MENU', 1512985896561979393, '订单', 'order:list', 'order', 0, 0, 'Order', 'oms/order/index', 1, 1, 'money', '2022-04-10 10:49:31', 'money', '2022-04-10 10:49:31', 0);
INSERT INTO `sys_permission` VALUES (1513876757680254977, '收银台', 'MENU', 1513879156050391041, '收银台', 'pos:cashier', 'pos', 0, 0, 'Pos', 'pos/index', 0, 1, 'money', '2022-04-12 21:48:40', 'money', '2022-04-12 21:48:40', 0);
INSERT INTO `sys_permission` VALUES (1513879156050391041, '日常', 'DIR', 0, '日历', '', 'pos', 0, 0, '', '', 0, 1, 'money', '2022-04-12 21:58:12', 'money', '2022-04-12 21:58:12', 0);
INSERT INTO `sys_permission` VALUES (1519695307665907713, '修改订单', 'BUTTON', 1512986102288396290, '', 'order:edit', '', 0, 0, '', '', 0, 1, 'money', '2022-04-28 23:09:31', 'money', '2022-04-28 23:09:31', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint UNSIGNED NOT NULL,
  `role_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `level` int NOT NULL COMMENT '角色级别',
  `description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `count` bigint NOT NULL DEFAULT 0 COMMENT '角色人数',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可用状态：0-禁用；1-启用',
  `sort` int NOT NULL DEFAULT 999 COMMENT '排序',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'SUPER_ADMIN', '超级管理员', 0, '拥有全部权限的人', 1, 1, 999, '', '2021-09-07 22:49:27', 'admin', '2022-03-06 11:40:47', 0);
INSERT INTO `sys_role` VALUES (1502845638751055873, 'ADMIN', '管理员', 1, '管理员', 1, 1, 999, 'admin', '2022-03-13 11:14:56', 'admin', '2022-03-13 11:14:56', 0);
INSERT INTO `sys_role` VALUES (1520010818140319745, 'GUEST', '访客', 99, '访客，只能查和收银', 1, 1, 999, 'money', '2022-04-29 20:03:14', 'money', '2022-04-29 20:03:14', 0);

-- ----------------------------
-- Table structure for sys_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission_relation`;
CREATE TABLE `sys_role_permission_relation`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` bigint UNSIGNED NOT NULL COMMENT '资源权限id',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色id',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1519695457490640922 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色资源权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission_relation
-- ----------------------------
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640898, 1513876757680254977, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640899, 1501921151197130754, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640900, 1510284728941424641, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640901, 1510835866430345218, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640902, 1502278787507806210, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640903, 1519695307665907713, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640904, 1512986102288396290, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640905, 1510284849565413378, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640906, 1503738104236822529, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640907, 1510284497327763458, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640908, 1510836302361137153, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640909, 1510836010190114818, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640910, 1510836558440173570, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640911, 1510836419776483330, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640912, 1510836150221148161, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640913, 1510284794515173377, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640914, 1503736683986800642, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640915, 1510284659295006721, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640916, 1513879156050391041, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640917, 1510836623946813442, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640918, 1503738191579009025, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640919, 1512985896561979393, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640920, 1510836492539269122, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1519695457490640921, 1510836224443551745, 1502845638751055873, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806849, 1513876757680254977, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806850, 1501921151197130754, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806851, 1510835866430345218, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806852, 1502278787507806210, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806853, 1512986102288396290, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806854, 1510284497327763458, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806855, 1502863016289398785, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806856, 1510836010190114818, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806857, 1507555956060450818, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806858, 1510836150221148161, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806859, 1510284659295006721, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806860, 1513879156050391041, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806861, 1507371326556450818, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806862, 1512985896561979393, 1520010818140319745, 0);
INSERT INTO `sys_role_permission_relation` VALUES (1520011114681806863, 1502863270971731970, 1520010818140319745, 0);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`  (
  `id` bigint NOT NULL,
  `tenant_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户code',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'https://wpimg.wallstcn.com/69a1c46c-eb1c-4b46-8bd4-e9e686ef5251.png' COMMENT 'logo',
  `ico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ico',
  `domain` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '域名',
  `tenant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '租户名称',
  `tenant_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '租户描述',
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort` int NOT NULL DEFAULT 99,
  `tenant_id` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO `sys_tenant` VALUES (0, 'M', 'https://wpimg.wallstcn.com/69a1c46c-eb1c-4b46-8bd4-e9e686ef5251.png', '', 'www.money.com', '麦尼Money', '主租户', '', '2022-04-04 22:59:11', 'money', '2022-04-04 22:59:12', 99, 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif' COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '可用状态：0-禁用；1-启用',
  `init_login` tinyint(1) NOT NULL DEFAULT 1 COMMENT '初次登录：0-不是；1-是',
  `last_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'money', '$2a$10$W6oaOSARIA3DsZy1DkdfUuqI3L7a885Ci7AYvpQK.9NGbeVhcZihi', 'money', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '18120800000', 'money@qq.com', '俺是一个超级管理员！', 1, 1, '2022-04-29 20:01:08', 99, '', '2022-03-03 23:12:57', 'money', '2022-04-29 20:04:42', 0);
INSERT INTO `sys_user` VALUES (1502254138862391297, 'admin', '$2a$10$630Mdca6BcyUJpKC2LNT7eT93.k9pmpcQoes4qm/j2o.pnb725zE6', 'admin', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '18120800001', 'admin@qq.com', '', 1, 1, '2022-04-28 23:16:43', 99, 'admin', '2022-03-11 20:04:32', 'money', '2022-04-29 20:04:38', 0);
INSERT INTO `sys_user` VALUES (1520010585540997121, 'guest', '$2a$10$jae4qaVgpTA6r1A1Po9m4uvxpJ9SLtW5e5PYinYnIOQviUTqDnOuW', 'guest', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '18120800002', 'guest@qq.com', '访客，只能查和收银', 1, 1, '2022-04-29 20:02:18', 99, 'money', '2022-04-29 20:02:19', 'money', '2022-04-29 20:04:34', 0);

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation`  (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色id',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
INSERT INTO `sys_user_role_relation` VALUES (1520011155446247425, 1520010585540997121, 1520010818140319745, 0);
INSERT INTO `sys_user_role_relation` VALUES (1520011172416401409, 1502254138862391297, 1502845638751055873, 0);
INSERT INTO `sys_user_role_relation` VALUES (1520011187968880642, 1, 1, 0);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint NOT NULL,
  `code` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '卡号',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员名称',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员类型',
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系电话',
  `province` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '地区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `coupon` decimal(15, 2) NOT NULL DEFAULT 0.00 COMMENT '抵用券',
  `consume_amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '总消费金额',
  `consume_coupon` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '消费抵用券',
  `consume_times` int NOT NULL DEFAULT 0 COMMENT '消费次数',
  `cancel_times` int NOT NULL DEFAULT 0 COMMENT '取消次数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `sort` int NOT NULL DEFAULT 99,
  `create_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ums_member
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
