/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1 MySQL
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : ruoyi-vue-pro

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 01/09/2023 00:24:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member_address
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收件地址编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '手机号',
  `area_id` bigint NOT NULL COMMENT '地区编码',
  `detail_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件详细地址',
  `default_status` bit(1) NOT NULL COMMENT '是否默认',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户收件地址';

-- ----------------------------
-- Records of member_address
-- ----------------------------
BEGIN;
INSERT INTO `member_address` (`id`, `user_id`, `name`, `mobile`, `area_id`, `detail_address`, `default_status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, 247, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', b'1', '1', '2022-08-01 22:46:35', '247', '2023-06-26 19:47:46', b'0', 1), (22, 247, '芋头', '15601691300', 610632, '12332131', b'0', '1', '2022-08-01 22:46:35', '247', '2023-06-25 14:09:06', b'1', 1), (23, 247, '测试', '15601691300', 120103, '13232312', b'0', '247', '2023-06-26 19:47:40', '247', '2023-06-26 19:47:46', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_experience_record
-- ----------------------------
DROP TABLE IF EXISTS `member_experience_record`;
CREATE TABLE `member_experience_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户编号',
  `biz_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '业务编号',
  `biz_type` tinyint NOT NULL DEFAULT 0 COMMENT '业务类型',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `experience` int NOT NULL DEFAULT 0 COMMENT '经验',
  `total_experience` int NOT NULL DEFAULT 0 COMMENT '变更后的经验',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE COMMENT '会员经验记录-用户编号',
  INDEX `idx_user_biz_type`(`user_id` ASC, `biz_type` ASC) USING BTREE COMMENT '会员经验记录-用户业务类型'
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员经验记录';

-- ----------------------------
-- Records of member_experience_record
-- ----------------------------
BEGIN;
INSERT INTO `member_experience_record` (`id`, `user_id`, `biz_id`, `biz_type`, `title`, `description`, `experience`, `total_experience`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 247, '0', 0, '管理员调整', '管理员调整获得100经验', 100, 100, '1', '2023-08-22 21:52:44', '1', '2023-08-22 21:52:44', b'0', 1), (2, 247, '0', 0, '管理员调整', '管理员调整获得100经验', -50, 100, '1', '2023-08-22 21:52:44', '1', '2023-08-22 21:52:44', b'0', 1), (3, 247, '78', 2, '下单奖励', '下单获得 27 经验', 27, 127, NULL, '2023-08-30 18:46:52', NULL, '2023-08-30 18:46:52', b'0', 1), (4, 247, 'null', 3, '退单扣除', '退单获得 -6 经验', -6, 121, NULL, '2023-08-31 19:56:21', NULL, '2023-08-31 19:56:21', b'0', 1), (5, 247, '80', 2, '下单奖励', '下单获得 699906 经验', 699906, 700027, NULL, '2023-08-31 23:43:29', NULL, '2023-08-31 23:43:29', b'0', 1), (6, 247, '81', 2, '下单奖励', '下单获得 2799606 经验', 2799606, 3499633, NULL, '2023-08-31 23:46:17', NULL, '2023-08-31 23:46:17', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_group
-- ----------------------------
DROP TABLE IF EXISTS `member_group`;
CREATE TABLE `member_group`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户分组';

-- ----------------------------
-- Records of member_group
-- ----------------------------
BEGIN;
INSERT INTO `member_group` (`id`, `name`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '哈哈哈', 0, '你猜', '1', '2023-08-22 21:58:13', '1', '2023-08-22 21:58:13', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_level
-- ----------------------------
DROP TABLE IF EXISTS `member_level`;
CREATE TABLE `member_level`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '等级名称',
  `level` int NOT NULL DEFAULT 0 COMMENT '等级',
  `experience` int NOT NULL DEFAULT 0 COMMENT '升级经验',
  `discount_percent` tinyint NOT NULL DEFAULT 100 COMMENT '享受折扣',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '等级图标',
  `background_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '等级背景图',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级';

-- ----------------------------
-- Records of member_level
-- ----------------------------
BEGIN;
INSERT INTO `member_level` (`id`, `name`, `level`, `experience`, `discount_percent`, `icon`, `background_url`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '青铜', 1, 100, 80, 'http://127.0.0.1:48080/admin-api/infra/file/4/get/59a1d52ebd38cc843fb5fafc30bce85f15d6ac22c8227dc3fe775d064f71ca6e.png', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/179e45b487daad722fa8bccf382fa35a80caa0a6e6633ca4da961bfbefd9d68a.jpg', 0, '1', '2023-08-22 21:45:03', '1', '2023-08-22 21:45:12', b'0', 1), (2, '白银', 2, 500, 75, 'http://127.0.0.1:48080/admin-api/infra/file/4/get/439a9e188bc2342d79803b2ff1a4872a98a9545a108013f9c0550b7fc604f3d2.png', '', 0, '1', '2023-08-28 20:36:55', '1', '2023-08-28 20:36:55', b'0', 1), (3, '黄金', 3, 50000, 55, '', '', 0, '1', '2023-08-28 20:37:05', '1', '2023-08-28 20:37:05', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_level_record
-- ----------------------------
DROP TABLE IF EXISTS `member_level_record`;
CREATE TABLE `member_level_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户编号',
  `level_id` bigint NOT NULL DEFAULT 0 COMMENT '等级编号',
  `level` int NOT NULL DEFAULT 0 COMMENT '会员等级',
  `discount_percent` tinyint NOT NULL DEFAULT 100 COMMENT '享受折扣',
  `experience` int NOT NULL DEFAULT 0 COMMENT '升级经验',
  `user_experience` int NOT NULL DEFAULT 0 COMMENT '会员此时的经验',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE COMMENT '会员等级记录-用户编号'
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级记录';

-- ----------------------------
-- Records of member_level_record
-- ----------------------------
BEGIN;
INSERT INTO `member_level_record` (`id`, `user_id`, `level_id`, `level`, `discount_percent`, `experience`, `user_experience`, `remark`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 247, 1, 1, 80, 100, 100, '321321312', '管理员调整为：青铜', '1', '2023-08-22 21:52:44', '1', '2023-08-22 21:52:44', b'0', 1), (2, 247, 1, 1, 80, 100, 121, '', '', NULL, '2023-08-31 19:56:21', NULL, '2023-08-31 19:56:21', b'0', 1), (3, 247, 3, 3, 55, 50000, 700027, '', '', NULL, '2023-08-31 23:43:29', NULL, '2023-08-31 23:43:29', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_point_config
-- ----------------------------
DROP TABLE IF EXISTS `member_point_config`;
CREATE TABLE `member_point_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `trade_deduct_enable` bit(1) NOT NULL COMMENT '是否开启积分抵扣',
  `trade_deduct_unit_price` int NOT NULL COMMENT '积分抵扣(单位：分)',
  `trade_deduct_max_price` int NULL DEFAULT NULL COMMENT '积分抵扣最大值',
  `trade_give_point` bigint NULL DEFAULT NULL COMMENT '1 元赠送多少分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员积分配置表';

-- ----------------------------
-- Records of member_point_config
-- ----------------------------
BEGIN;
INSERT INTO `member_point_config` (`id`, `trade_deduct_enable`, `trade_deduct_unit_price`, `trade_deduct_max_price`, `trade_give_point`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, b'1', 100, 2, 3, '1', '2023-08-20 09:54:42', '1', '2023-08-20 09:54:42', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_point_record
-- ----------------------------
DROP TABLE IF EXISTS `member_point_record`;
CREATE TABLE `member_point_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `biz_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务编码',
  `biz_type` tinyint NOT NULL COMMENT '业务类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '积分标题',
  `description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '积分描述',
  `point` int NOT NULL COMMENT '积分',
  `total_point` int NOT NULL COMMENT '变动后的积分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_userId`(`user_id` ASC) USING BTREE,
  INDEX `index_title`(`title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户积分记录';

-- ----------------------------
-- Records of member_point_record
-- ----------------------------
BEGIN;
INSERT INTO `member_point_record` (`id`, `user_id`, `biz_id`, `biz_type`, `title`, `description`, `point`, `total_point`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 247, '1', 1, '12', NULL, 33, 12, '', '2023-07-02 14:50:23', '', '2023-08-20 11:03:01', b'0', 1), (2, 247, '12', 1, '123', NULL, 22, 130, '', '2023-07-02 14:50:23', '', '2023-08-20 11:03:00', b'0', 1), (3, 247, '12', 1, '12', NULL, -12, 12, '', '2023-07-02 14:50:55', '', '2023-08-21 14:19:29', b'0', 1), (4, 247, '78', 10, '订单消费', '下单获得 81 积分', 81, 91, NULL, '2023-08-30 18:46:52', NULL, '2023-08-30 18:46:52', b'0', 1), (5, 247, 'null', 11, '订单取消', '退单获得 -18 积分', -18, 73, NULL, '2023-08-31 19:56:21', NULL, '2023-08-31 19:56:21', b'0', 1), (6, 247, '80', 10, '订单消费', '下单获得 2099718 积分', 2099718, 2099791, NULL, '2023-08-31 23:43:29', NULL, '2023-08-31 23:43:29', b'0', 1), (7, 247, '81', 10, '订单消费', '下单获得 8398818 积分', 8398818, 10498609, NULL, '2023-08-31 23:46:17', NULL, '2023-08-31 23:46:17', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_sign_in_config
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_in_config`;
CREATE TABLE `member_sign_in_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `day` int NOT NULL COMMENT '第几天',
  `point` int NOT NULL COMMENT '奖励积分',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '签到规则';

-- ----------------------------
-- Records of member_sign_in_config
-- ----------------------------
BEGIN;
INSERT INTO `member_sign_in_config` (`id`, `day`, `point`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, 10, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0), (2, 2, 20, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0), (3, 7, 1001, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0), (4, 6, 12121, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0), (5, 2, 12, 0, '', '2023-08-20 01:38:56', '', '2023-08-20 01:38:56', b'0', 0), (6, 1, 10, 0, '1', '2023-08-20 19:20:42', '1', '2023-08-20 19:20:56', b'0', 1), (7, 7, 22, 0, '1', '2023-08-20 19:20:48', '1', '2023-08-20 19:20:48', b'0', 1), (8, 2, 3, 0, '1', '2023-08-21 20:22:44', '1', '2023-08-21 20:22:44', b'0', 1), (9, 3, 4, 0, '1', '2023-08-21 20:22:48', '1', '2023-08-21 20:22:48', b'0', 1), (10, 4, 5, 0, '1', '2023-08-21 20:22:51', '1', '2023-08-21 20:22:51', b'0', 1), (11, 5, 6, 0, '1', '2023-08-21 20:22:56', '1', '2023-08-21 20:22:56', b'0', 1), (12, 6, 7, 0, '1', '2023-08-21 20:22:59', '1', '2023-08-21 20:22:59', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_sign_in_record
-- ----------------------------
DROP TABLE IF EXISTS `member_sign_in_record`;
CREATE TABLE `member_sign_in_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '签到自增id',
  `user_id` int NULL DEFAULT NULL COMMENT '签到用户',
  `day` int NULL DEFAULT NULL COMMENT '第几天签到',
  `point` int NULL DEFAULT NULL COMMENT '签到的分数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '签到时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '变更时间',
  `tenant_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户id',
  `deleted` int NULL DEFAULT 0 COMMENT '是否删除',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '签到记录';

-- ----------------------------
-- Records of member_sign_in_record
-- ----------------------------
BEGIN;
INSERT INTO `member_sign_in_record` (`id`, `user_id`, `day`, `point`, `create_time`, `update_time`, `tenant_id`, `deleted`, `creator`, `updater`) VALUES (1, 247, 1, 123, '2023-06-10 12:58:18', '2023-08-20 11:29:47', '1', 1, '1', '1'), (2, 247, 12, 12, '2023-06-10 19:56:39', '2023-08-20 11:29:48', '1', 1, '1', '1'), (3, 247, 12, 1212, '2023-06-10 20:01:17', '2023-08-20 11:29:49', '1', 1, '1', '1'), (4, 247, 12, 1212, '2023-06-10 20:01:27', '2023-08-20 11:29:50', '1', 0, '1', '1');
COMMIT;

-- ----------------------------
-- Table structure for member_tag
-- ----------------------------
DROP TABLE IF EXISTS `member_tag`;
CREATE TABLE `member_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员标签';

-- ----------------------------
-- Records of member_tag
-- ----------------------------
BEGIN;
INSERT INTO `member_tag` (`id`, `name`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '绿色', '1', '2023-08-20 09:21:12', '1', '2023-08-20 09:21:12', b'0', 1), (2, '黄色', '1', '2023-08-20 09:21:27', '1', '2023-08-20 09:21:27', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for member_user
-- ----------------------------
DROP TABLE IF EXISTS `member_user`;
CREATE TABLE `member_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint NOT NULL COMMENT '状态',
  `register_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注册 IP',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '真实名字',
  `sex` tinyint NULL DEFAULT 0 COMMENT '用户性别',
  `area_id` bigint NULL DEFAULT NULL COMMENT '所在地',
  `birthday` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员备注',
  `point` int NOT NULL DEFAULT 0 COMMENT '积分',
  `tag_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户标签编号列表，以逗号分隔',
  `level_id` bigint NULL DEFAULT NULL COMMENT '等级编号',
  `experience` int NOT NULL DEFAULT 0 COMMENT '经验',
  `group_id` bigint NULL DEFAULT NULL COMMENT '用户分组编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile` ASC) USING BTREE COMMENT '手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员用户';

-- ----------------------------
-- Records of member_user
-- ----------------------------
BEGIN;
INSERT INTO `member_user` (`id`, `mobile`, `password`, `status`, `register_ip`, `login_ip`, `login_date`, `nickname`, `avatar`, `name`, `sex`, `area_id`, `birthday`, `mark`, `point`, `tag_ids`, `level_id`, `experience`, `group_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (247, '15601691300', '$2a$04$O7Hadcvwp0ywQVQD5CSKqusyWmJqRZ7iqSRORte2YtFCO847LhTPe', 0, '127.0.0.1', '127.0.0.1', '2023-08-30 17:31:18', '21土豆', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/fee19466c40aecd32d42e67caed40ef68283cc3bdbdb39f73ec2906ef333f4a1.png', '啦啦啦', 1, 130102, '2023-08-28 00:00:00', '备注3213123', 10498609, '1,2', 0, 3499633, 1, NULL, '2022-05-29 11:23:08', NULL, '2023-08-31 23:46:17', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_brand
-- ----------------------------
DROP TABLE IF EXISTS `product_brand`;
CREATE TABLE `product_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品牌图片',
  `sort` int NULL DEFAULT 0 COMMENT '品牌排序',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `status` tinyint NOT NULL COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品品牌';

-- ----------------------------
-- Records of product_brand
-- ----------------------------
BEGIN;
INSERT INTO `product_brand` (`id`, `name`, `pic_url`, `sort`, `description`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '苹果', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/047b5ef63a1b72ff5bfff423e4973c6a4821c8bf56dac6b0aa5972f50c2645d4.png', 1, '是上市', 0, '1', '2022-07-30 22:12:18', '1', '2023-08-31 14:26:05', b'0', 1), (2, '华为', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/6a14445c06448a4133b74d5e67bbe32dfc4d0022cbef44e3d0669407bf18db15.png', 0, '遥遥领先', 0, '1', '2023-08-31 14:26:00', '1', '2023-08-31 14:26:00', b'0', 1), (3, '索尼', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/f5b7a536306cd1180a42a2211a8212dc23de6b949d30c30d036caa063042f928.png', 2, '', 0, '1', '2023-08-31 14:39:58', '1', '2023-08-31 14:39:58', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `parent_id` bigint NOT NULL COMMENT '父分类编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '移动端分类图',
  `big_pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'PC 端分类图',
  `sort` int NULL DEFAULT 0 COMMENT '分类排序',
  `status` tinyint NOT NULL COMMENT '开启状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类';

-- ----------------------------
-- Records of product_category
-- ----------------------------
BEGIN;
INSERT INTO `product_category` (`id`, `parent_id`, `name`, `pic_url`, `big_pic_url`, `sort`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (15, 0, '手机', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/65cb27c9f354e6e563a1cebb1d7062cbe8b5526f8c86bd09fa0e53746a1c85ab.png', '', 100, 0, '1', '2023-04-25 16:57:05', '1', '2023-08-31 14:32:22', b'0', 1), (16, 15, '时尚女装', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/aa8d5c44ac0390ab398bae0dc8883575e3cb57594f9ed00248febe8e3d7484d1.png', '', 200, 0, '1', '2023-04-25 17:09:00', '1', '2023-08-31 06:27:16', b'1', 1), (17, 15, '精品男装', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/b0c166c0846fa2280b4a02431e2ac2e2363f2d2a6b608598f34b067a5ccf1245.png', '', 100, 0, '1', '2023-04-25 17:09:33', '1', '2023-08-31 06:27:15', b'1', 1), (18, 15, '箱包', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/8682928caa2a5a49b380ac93059adc435099873cdf646084f31cea79d5c27f40.png', '', 80, 0, '1', '2023-04-25 17:09:51', '1', '2023-08-31 06:27:13', b'1', 1), (19, 15, '5G 手机', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/17629978110cec6505f5ef03c6713130960a9c5cbdc3485d67492b1f16e6b01d.png', '', 0, 0, '1', '2023-04-25 17:10:15', '1', '2023-08-31 14:34:25', b'0', 1), (20, 15, '配饰', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/51bf43fcad0b947f5fa377356fb7034b47223fdbcec241d50e6e60a9be498730.jpg', '', 0, 0, '1', '2023-04-25 17:10:56', '1', '2023-08-31 06:27:07', b'1', 1), (21, 15, '美妆工具', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c3cd6735cf157c218bc32ece312fd90cb2130c437dc9ec61d4030681d6ba4efb.png', '', 0, 0, '1', '2023-04-25 17:11:15', '1', '2023-08-31 06:27:05', b'1', 1), (22, 0, '网络盒子', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/74656bb8bc988c0419e0dbc613eda24a03956b950452b3565527301a5782db3a.png', '', 50, 0, '1', '2023-04-25 17:12:13', '1', '2023-08-31 06:26:57', b'1', 1), (23, 22, '尿裤湿巾', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/20162f22d8f6b427f0d6f1678c9fbb7bf0c1b70768bdc86101bee8b5e13bec5a.jpeg', '', 0, 0, '1', '2023-04-25 17:12:42', '1', '2023-08-31 06:26:55', b'1', 1), (24, 15, '宠物主粮', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/383729ba05711c400f9e44db11a63603af0fdbc99e58cd7b40e9296ca4e0510e.jpg', '', 0, 0, '1', '2023-04-25 17:13:09', '1', '2023-08-31 06:27:03', b'1', 1), (25, 0, '家电电器', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c8a34dc2688fd4d2c95b5f49888865db1c88fd3bde153e3f7f0bcd4ff9971c96.png', '', 50, 0, '1', '2023-04-25 17:13:43', '1', '2023-08-31 06:27:01', b'1', 1), (26, 25, '封口/封杯机', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/1c0c208cfcf871c146006d97f95ae4fcd14d8a2deb3eabe3696367af61cb5e69.png', '', 60, 0, '1', '2023-04-25 17:14:39', '1', '2023-08-31 06:26:49', b'1', 1), (27, 25, '空调', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/d578e1e60b2dc3efe70643d25a8b2150dabfecd658fdb2fafcdb786d525f66d1.png', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/34ed55f822ad25ab445e6b396dcd61a7d119882ef19f85f0e24742911d896959.jpeg', 60, 0, '1', '2023-04-25 17:15:12', '1', '2023-08-31 06:26:47', b'1', 1), (28, 15, '手机配件', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/b0831f96fded1c75abeb0b6b6751f21c13bd4fb4a5bc2931b90ee29325a2de7a.png', '', 2, 0, '1', '2023-08-31 14:33:30', '1', '2023-08-31 14:33:30', b'0', 1), (29, 15, '游戏手机', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/f481921e5dbe5b4ddcb4f55097b377ca186614367b5cc680f135fbd71157cd38.png', '', 1, 0, '1', '2023-08-31 14:35:03', '1', '2023-08-31 14:35:03', b'0', 1), (30, 0, '电脑', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/c713c24d8b1af8f2c97135bf045ea5b7c2c2e57fa3ee25c7709a2f5d89e2381f.png', '', 200, 0, '1', '2023-08-31 15:01:32', '1', '2023-08-31 15:01:39', b'0', 1), (31, 30, '台式机', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/d510f947a2382bf56082caffc9294b9f028a033aab4cffe0b92028922263e69d.png', '', 1, 0, '1', '2023-08-31 15:02:22', '1', '2023-08-31 15:02:22', b'0', 1), (32, 30, '笔记本', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/94a0aae4566000d31730d1ba244cdacafcf6c73a6a0c1b4ffb254a2f3e707862.png', '', 2, 0, '1', '2023-08-31 15:05:27', '1', '2023-08-31 15:05:27', b'0', 1), (33, 30, '游戏本', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/11ce6f2153950c66fd3d2e8c78d75f4a0b0fb5b49993099a6d1eb7f29cadda67.png', '', 3, 0, '1', '2023-08-31 15:06:31', '1', '2023-08-31 07:06:39', b'1', 1), (34, 30, '游戏本', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/11ce6f2153950c66fd3d2e8c78d75f4a0b0fb5b49993099a6d1eb7f29cadda67.png', '', 3, 0, '1', '2023-08-31 15:06:31', '1', '2023-08-31 15:06:31', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_comment
-- ----------------------------
DROP TABLE IF EXISTS `product_comment`;
CREATE TABLE `product_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论编号，主键自增',
  `user_id` bigint NULL DEFAULT NULL COMMENT '评价人的用户编号，关联 MemberUserDO 的 id 编号',
  `user_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价人名称',
  `user_avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评价人头像',
  `anonymous` bit(1) NULL DEFAULT NULL COMMENT '是否匿名',
  `order_id` bigint NULL DEFAULT NULL COMMENT '交易订单编号，关联 TradeOrderDO 的 id 编号',
  `order_item_id` bigint NULL DEFAULT NULL COMMENT '交易订单项编号，关联 TradeOrderItemDO 的 id 编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品 SPU 编号，关联 ProductSpuDO 的 id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品 SKU 编号，关联 ProductSkuDO 的 id 编号',
  `sku_pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `sku_properties` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性数组，JSON 格式 [{propertId: , valueId: }, {propertId: , valueId: }]',
  `visible` bit(1) NULL DEFAULT NULL COMMENT '是否可见，true:显示false:隐藏',
  `scores` tinyint NULL DEFAULT NULL COMMENT '评分星级1-5分',
  `description_scores` tinyint NULL DEFAULT NULL COMMENT '描述星级 1-5 星',
  `benefit_scores` tinyint NULL DEFAULT NULL COMMENT '服务星级 1-5 星',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `pic_urls` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论图片地址数组',
  `reply_status` bit(1) NULL DEFAULT NULL COMMENT '商家是否回复',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '回复管理员编号，关联 AdminUserDO 的 id 编号',
  `reply_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '商家回复时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品评论';

-- ----------------------------
-- Records of product_comment
-- ----------------------------
BEGIN;
INSERT INTO `product_comment` (`id`, `user_id`, `user_nickname`, `user_avatar`, `anonymous`, `order_id`, `order_item_id`, `spu_id`, `spu_name`, `sku_id`, `sku_pic_url`, `sku_properties`, `visible`, `scores`, `description_scores`, `benefit_scores`, `content`, `pic_urls`, `reply_status`, `reply_user_id`, `reply_content`, `reply_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 633, NULL, NULL, '', NULL, b'1', 4, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-06-27 15:57:00', '', '2023-06-27 15:59:26', b'0', 1), (2, NULL, NULL, NULL, NULL, NULL, NULL, 633, NULL, NULL, '', NULL, b'1', 1, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '', '2023-06-27 15:57:00', '', '2023-06-27 15:59:26', b'0', 1), (3, 247, '', '', b'0', 70, 50, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', NULL, NULL, 4, 5, '31321', '[]', NULL, NULL, NULL, NULL, '247', '2023-08-13 21:34:48', '247', '2023-08-26 13:01:24', b'0', 1), (4, 247, '', '', b'0', 71, 51, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', NULL, NULL, 4, 3, '3213123', '[]', NULL, NULL, NULL, NULL, '247', '2023-08-13 21:35:32', '247', '2023-08-26 13:01:24', b'0', 1), (5, 247, '', '', b'0', 72, 52, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', NULL, NULL, 2, 3, '3123211', '[]', NULL, NULL, NULL, NULL, '247', '2023-08-13 21:41:40', '247', '2023-08-26 13:01:24', b'0', 1), (6, 247, '', '', b'0', 73, 53, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', b'0', NULL, 4, 4, '13231', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/fee19466c40aecd32d42e67caed40ef68283cc3bdbdb39f73ec2906ef333f4a1.png\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/1fab984924d56504a980c15e2fe3f10c5b19a8939c3577c5736c6600e2dacc08.jpg\"]', b'1', 1, '土豆', '2023-08-26 11:07:19', '247', '2023-08-13 22:01:36', '247', '2023-08-26 13:01:24', b'0', 1), (7, 0, '你猜', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/26859f993e24556a8ae474362461417cbc5261723093d9e57d6c87e6eae0d277.png', b'0', 0, 0, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 2, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[{\"propertyId\": 1, \"propertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', b'1', 1, 2, 1, '哈哈哈哈', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/7831ca02a9d7aa7cbec78e67bd0f0847808d7912f1f8f3b4118a60c1bf9cba2b.jpg\"]', b'0', NULL, NULL, NULL, '1', '2023-08-26 11:17:12', '1', '2023-08-26 13:01:24', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_favorite
-- ----------------------------
DROP TABLE IF EXISTS `product_favorite`;
CREATE TABLE `product_favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '商品收藏表';

-- ----------------------------
-- Records of product_favorite
-- ----------------------------
BEGIN;
INSERT INTO `product_favorite` (`id`, `user_id`, `spu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, 247, 610632, '1', '2022-08-01 22:46:35', '1', '2023-06-25 04:26:02', b'1', 1), (22, 247, 633, '247', '2023-06-09 20:01:11', '247', '2023-06-09 12:01:17', b'1', 1), (23, 247, 633, '247', '2023-06-11 22:20:27', '247', '2023-06-11 14:20:28', b'1', 1), (24, 247, 633, '247', '2023-06-11 22:20:46', '247', '2023-06-15 11:37:12', b'1', 1), (25, 247, 633, '247', '2023-06-15 19:37:13', '247', '2023-08-19 08:53:26', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`(32) ASC) USING BTREE COMMENT '规格名称索引'
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性项';

-- ----------------------------
-- Records of product_property
-- ----------------------------
BEGIN;
INSERT INTO `product_property` (`id`, `name`, `status`, `remark`, `create_time`, `update_time`, `creator`, `updater`, `tenant_id`, `deleted`) VALUES (1, '颜色', 0, '嘿嘿嘿', '2022-09-20 10:25:53', '2022-12-12 23:21:21', '1', '1', 1, b'0'), (2, '尺寸', 0, '123', '2022-09-20 15:11:04', '2022-12-12 23:19:48', '1', '1', 1, b'0'), (3, '版本', 0, NULL, '2023-04-26 12:31:30', '2023-04-26 12:31:39', '1', '1', 1, b'0'), (4, '123', NULL, '', '2023-05-06 22:32:54', '2023-08-31 07:29:00', '1', '1', 1, b'1'), (5, '哈哈', NULL, '', '2023-05-24 09:19:30', '2023-08-31 07:28:45', '1', '1', 1, b'1'), (6, '土豆', NULL, '', '2023-05-24 19:58:33', '2023-08-31 07:28:29', '1', '1', 1, b'1'), (7, 'hhh', NULL, '', '2023-05-24 20:13:09', '2023-08-31 07:28:16', '1', '1', 1, b'1'), (8, '呵呵', NULL, '2', '2023-05-24 20:14:44', '2023-08-31 07:28:53', '1', '1', 1, b'1');
COMMIT;

-- ----------------------------
-- Table structure for product_property_value
-- ----------------------------
DROP TABLE IF EXISTS `product_property_value`;
CREATE TABLE `product_property_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `property_id` bigint NULL DEFAULT NULL COMMENT '属性项的编号',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性值';

-- ----------------------------
-- Records of product_property_value
-- ----------------------------
BEGIN;
INSERT INTO `product_property_value` (`id`, `property_id`, `name`, `status`, `remark`, `create_time`, `update_time`, `creator`, `updater`, `tenant_id`, `deleted`) VALUES (1, 1, '红色', 0, '啊啊啊', '2022-09-20 10:26:10', '2022-09-20 10:26:10', '1', '1', 1, b'0'), (2, 1, '绿色', 0, NULL, '2022-09-20 15:10:52', '2022-09-20 15:10:52', '1', '1', 1, b'0'), (3, 2, '12*12', 0, NULL, '2022-09-20 15:11:23', '2022-09-20 15:11:23', '1', '1', 1, b'0'), (4, 2, '13*13', 0, 'xx', '2022-09-20 15:11:30', '2022-12-12 23:39:40', '1', '1', 1, b'0'), (5, 1, '黑色', 0, NULL, '2023-04-26 12:32:01', '2023-04-26 12:32:06', NULL, NULL, 1, b'0'), (6, 1, '蓝色', 0, NULL, '2023-04-26 12:32:20', '2023-04-26 12:32:20', NULL, NULL, 1, b'0'), (7, 1, '白色', 0, NULL, '2023-04-26 12:32:33', '2023-04-26 12:32:35', NULL, NULL, 1, b'0'), (8, 3, 'CH510', 0, NULL, '2023-04-26 12:32:52', '2023-04-27 16:04:38', NULL, NULL, 1, b'0'), (9, 5, '颜色', NULL, NULL, '2023-05-24 09:19:39', '2023-08-31 07:28:35', '1', '1', 1, b'1'), (10, 5, '绿色', NULL, NULL, '2023-05-24 09:19:43', '2023-08-31 07:28:33', '1', '1', 1, b'1'), (11, 6, '蔬菜', NULL, NULL, '2023-05-24 19:58:43', '2023-08-31 07:28:23', '1', '1', 1, b'1'), (12, 6, '绿豆', NULL, NULL, '2023-05-24 19:58:45', '2023-08-31 07:28:21', '1', '1', 1, b'1'), (13, 6, '111', NULL, NULL, '2023-05-24 20:00:06', '2023-08-31 07:28:20', '1', '1', 1, b'1'), (14, 7, '呵呵呵', NULL, NULL, '2023-05-24 20:13:13', '2023-08-31 07:28:12', '1', '1', 1, b'1'), (15, 7, '嘿嘿', NULL, NULL, '2023-05-24 20:13:16', '2023-08-31 07:28:10', '1', '1', 1, b'1'), (16, 8, '哈哈', NULL, NULL, '2023-05-24 20:14:48', '2023-08-31 07:28:49', '1', '1', 1, b'1'), (17, 8, '呵呵', NULL, NULL, '2023-05-24 20:14:50', '2023-08-31 07:28:48', '1', '1', 1, b'1'), (18, 1, '雅丹黑', NULL, NULL, '2023-08-31 14:50:58', '2023-08-31 14:50:58', '1', '1', 1, b'0'), (19, 1, '雅川青', NULL, NULL, '2023-08-31 14:51:14', '2023-08-31 14:51:14', '1', '1', 1, b'0'), (20, 1, '白沙银', NULL, NULL, '2023-08-31 14:51:28', '2023-08-31 14:51:28', '1', '1', 1, b'0'), (21, 1, '南糯紫', NULL, NULL, '2023-08-31 14:51:38', '2023-08-31 14:51:38', '1', '1', 1, b'0');
COMMIT;

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `spu_id` bigint NOT NULL COMMENT 'spu编号',
  `properties` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性数组，JSON 格式 [{propertId: , valueId: }, {propertId: , valueId: }]',
  `price` int NOT NULL DEFAULT -1 COMMENT '商品价格，单位：分',
  `market_price` int NULL DEFAULT NULL COMMENT '市场价，单位：分',
  `cost_price` int NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'SKU 的条形码',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片地址',
  `stock` int NULL DEFAULT NULL COMMENT '库存',
  `weight` double NULL DEFAULT NULL COMMENT '商品重量，单位：kg 千克',
  `volume` double NULL DEFAULT NULL COMMENT '商品体积，单位：m^3 平米',
  `sub_commission_first_price` int NULL DEFAULT NULL COMMENT '一级分销的佣金，单位：分',
  `sub_commission_second_price` int NULL DEFAULT NULL COMMENT '二级分销的佣金，单位：分',
  `sales_count` int NULL DEFAULT NULL COMMENT '商品销量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` double(64, 0) NULL DEFAULT NULL COMMENT '更新人',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品sku';

-- ----------------------------
-- Records of product_sku
-- ----------------------------
BEGIN;
INSERT INTO `product_sku` (`id`, `spu_id`, `properties`, `price`, `market_price`, `cost_price`, `bar_code`, `pic_url`, `stock`, `weight`, `volume`, `sub_commission_first_price`, `sub_commission_second_price`, `sales_count`, `create_time`, `update_time`, `creator`, `updater`, `deleted`, `tenant_id`) VALUES (1, 633, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":5,\"valueName\":\"黑色\"},{\"propertyId\":3,\"propertyName\":\"版本\",\"valueId\":8,\"valueName\":\"CH510\"}]', 6, 34900, 0, NULL, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 62, NULL, NULL, 0, 0, 17, '2023-04-26 12:37:28', '2023-08-31 15:46:15', NULL, 1, b'0', 1), (2, 633, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":6,\"valueName\":\"蓝色\"},{\"propertyId\":3,\"propertyName\":\"版本\",\"valueId\":8,\"valueName\":\"CH510\"}]', 5, 34900, 0, NULL, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 97, NULL, NULL, 0, 0, 5, '2023-04-26 12:37:28', '2023-08-31 14:42:34', NULL, 1, b'0', 1), (3, 633, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":7,\"valueName\":\"白色\"},{\"propertyId\":3,\"propertyName\":\"版本\",\"valueId\":8,\"valueName\":\"CH510\"}]', 4, 34900, 0, NULL, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 205, NULL, NULL, 0, 0, 100, '2023-04-26 12:37:28', '2023-08-31 14:42:34', NULL, 1, b'0', 1), (10, 101, '[{\"propertyId\": 1, \"proertyName\": \"颜色\", \"valueId\": 5, \"valueName\": \"黑色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 3, 34900, -1, NULL, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 10, NULL, NULL, NULL, NULL, 17, '2023-04-26 12:37:28', '2023-08-31 06:19:05', NULL, NULL, b'1', 1), (11, 101, '[{\"propertyId\": 1, \"proertyName\": \"颜色\", \"valueId\": 6, \"valueName\": \"蓝色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 2, 34900, -1, NULL, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 94, NULL, NULL, NULL, NULL, 5, '2023-04-26 12:37:28', '2023-08-31 06:19:05', NULL, NULL, b'1', 1), (12, 101, '[{\"propertyId\": 1, \"proertyName\": \"颜色\", \"valueId\": 7, \"valueName\": \"白色\"}, {\"propertyId\": 3, \"propertyName\": \"版本\", \"valueId\": 8, \"valueName\": \"CH510\"}]', 1, 34900, -1, NULL, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 200, NULL, NULL, NULL, NULL, 100, '2023-04-26 12:37:28', '2023-08-31 06:19:05', NULL, NULL, b'1', 1), (13, 109, '[{\"propertyId\": 0, \"propertyName\": \"默认\", \"valueId\": 0, \"valueName\": \"默认\"}]', 100, 200, 300, 'aoteman', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/4a6abcedf41e718bfed8bab975fdc0b7f23bff4c21b7993f008e52e81d4869a5.png', 0, 0, 0, 0, 0, NULL, '2023-06-05 23:30:18', '2023-08-31 06:19:07', '1', 1, b'1', 1), (14, 634, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":18,\"valueName\":\"雅丹黑\"}]', 699900, 699900, 699900, '2601010452841', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/49009b73d392657c85bed2e82e22b09720e7c68466b8565c8b2f6c00e03b705e.jpg', 102, 0, 0, 0, 0, NULL, '2023-08-31 20:30:27', '2023-08-31 15:46:15', '1', 1, b'0', 1), (15, 634, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":19,\"valueName\":\"雅川青\"}]', 699900, 699900, 699900, '2601010452842', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/3661b4ca3b922d31bef4440a7d68f9112b8f529ba160b3278bb0b5158384abf6.jpg', 201, 0, 0, 0, 0, NULL, '2023-08-31 20:30:27', '2023-08-31 15:46:15', '1', 1, b'0', 1), (16, 634, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":20,\"valueName\":\"白沙银\"}]', 699900, 699900, 699900, '2601010452847', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/44c8288cd79d2e7df3a80244e519e5fd98c43c9264335f0cbe2fda2445198e45.jpg', 301, 0, 0, 0, 0, NULL, '2023-08-31 20:30:27', '2023-08-31 15:46:15', '1', 1, b'0', 1), (17, 634, '[{\"propertyId\":1,\"propertyName\":\"颜色\",\"valueId\":21,\"valueName\":\"南糯紫\"}]', 699900, 699900, 699900, '2601010452844', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/23c7564ad843c326296c17c16dd1d2749a421ae81c416fe9e94fb1d310c02ed5.jpg', 401, 0, 0, 0, 0, NULL, '2023-08-31 20:30:27', '2023-08-31 15:46:15', '1', 1, b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for product_spu
-- ----------------------------
DROP TABLE IF EXISTS `product_spu`;
CREATE TABLE `product_spu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品 SPU 编号，自增',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `keyword` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品简介',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品详情',
  `bar_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '条形码',
  `category_id` bigint NOT NULL COMMENT '商品分类编号',
  `brand_id` int NULL DEFAULT NULL COMMENT '商品品牌编号',
  `pic_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品封面图',
  `slider_pic_urls` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '商品轮播图地址\n 数组，以逗号分隔\n 最多上传15张',
  `video_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品视频',
  `unit` tinyint NOT NULL COMMENT '单位',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序字段',
  `status` tinyint NOT NULL COMMENT '商品状态: 0 上架（开启） 1 下架（禁用）-1 回收',
  `spec_type` bit(1) NULL DEFAULT NULL COMMENT '规格类型：0 单规格 1 多规格',
  `price` int NOT NULL DEFAULT -1 COMMENT '商品价格，单位使用：分',
  `market_price` int NULL DEFAULT NULL COMMENT '市场价，单位使用：分',
  `cost_price` int NOT NULL DEFAULT -1 COMMENT '成本价，单位： 分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '库存',
  `delivery_template_id` bigint NOT NULL COMMENT '物流配置模板编号',
  `recommend_hot` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否热卖推荐: 0 默认 1 热卖',
  `recommend_benefit` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否优惠推荐: 0 默认 1 优选',
  `recommend_best` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否精品推荐: 0 默认 1 精品',
  `recommend_new` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否新品推荐: 0 默认 1 新品',
  `recommend_good` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否优品推荐',
  `give_integral` int NOT NULL DEFAULT 0 COMMENT '赠送积分',
  `give_coupon_template_ids` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '赠送的优惠劵编号的数组',
  `sub_commission_type` bit(1) NULL DEFAULT NULL COMMENT '分销类型',
  `activity_orders` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '活动显示排序0=默认, 1=秒杀，2=砍价，3=拼团',
  `sales_count` int NULL DEFAULT 0 COMMENT '商品销量',
  `virtual_sales_count` int NULL DEFAULT 0 COMMENT '虚拟销量',
  `browse_count` int NULL DEFAULT 0 COMMENT '商品点击量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '更新人',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 634 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品spu';

-- ----------------------------
-- Records of product_spu
-- ----------------------------
BEGIN;
INSERT INTO `product_spu` (`id`, `name`, `keyword`, `introduction`, `description`, `bar_code`, `category_id`, `brand_id`, `pic_url`, `slider_pic_urls`, `video_url`, `unit`, `sort`, `status`, `spec_type`, `price`, `market_price`, `cost_price`, `stock`, `delivery_template_id`, `recommend_hot`, `recommend_benefit`, `recommend_best`, `recommend_new`, `recommend_good`, `give_integral`, `give_coupon_template_ids`, `sub_commission_type`, `activity_orders`, `sales_count`, `virtual_sales_count`, `browse_count`, `create_time`, `update_time`, `creator`, `updater`, `deleted`, `tenant_id`) VALUES (1, '【潮】Nike Air Jordan aj1 low GS耐克板鞋女子秋季低帮休闲防滑运动耐磨篮球鞋 DC0774-105', NULL, NULL, NULL, NULL, 20, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/mid_1ee126538975da13beb3496d90eaad90.jpg', '', NULL, 1, 0, -1, NULL, 100, NULL, -1, 10, 0, b'0', b'0', b'0', b'0', b'0', 0, '', NULL, '', 10, 20, 0, '2023-04-26 07:01:29', '2023-08-31 06:19:01', NULL, '1', b'1', 1), (2, '诺米家居 矿石博览馆系列藤条香氛无火香薰精油卧室助眠除臭', NULL, NULL, NULL, NULL, 19, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/20211113/big_3bb9729b7b748b2f297df7bacac2f236.png', '', NULL, 1, 0, -1, NULL, 4500, NULL, -1, 20, 0, b'1', b'0', b'0', b'0', b'0', 0, '', NULL, '[3,1,2]', 10, 20, 0, '2023-04-26 07:01:29', '2023-08-31 06:19:03', NULL, '1', b'1', 1), (101, '索尼（SONY）WH-CH510 无线立体声耳机', '耳机', '我是快乐的简介', '<p><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/099f261f18576902c4a18209d062a3fd.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/debdb191a4d1bc1bda8a989dbd7afd23.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/ee1618b3334641c707cadbb9e14a5bae.jpg\"><img style=\"max-width:100%;height:auto;float:left;display:block\" src=\"https://demo26.crmeb.net/uploads/attach/2021/12/20211210/1251259c8968cdce993e47dd121b50a7.jpg\"></p>', NULL, 19, NULL, 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[\"https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg\",\"https://demo26.crmeb.net/uploads/attach/2021/11/15/7f46e98ece1920e1a4082dfc72bcd72a.jpg\",\"https://demo26.crmeb.net/uploads/attach/2021/11/15/bfb275263d02ab081b8670a752f2823f.jpg\",\"https://demo26.crmeb.net/uploads/attach/2021/11/15/e499a4dc489cda7b8d472cb3a3b348b7.jpg\",\"https://demo26.crmeb.net/uploads/attach/2021/11/15/06fa150a47163e973bb4806a380afaab.jpg\"]', NULL, 1, 0, -1, b'1', 29900, 34900, -1, 273, 0, b'0', b'0', b'0', b'0', b'1', 0, '', NULL, '[3,1,2]', 30, 40, 0, '2023-04-26 12:29:19', '2023-08-31 06:19:05', NULL, '1', b'1', 1), (109, '单个 sku 商品', '哈哈哈哈', '111', '<p>123321</p>', 'aoteman', 27, 1, 'http://127.0.0.1:48080/admin-api/infra/file/4/get/93332ead43f162c65f909214971afaa11f44d1739877bceb5102688ac8ad933e.jpg', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/93332ead43f162c65f909214971afaa11f44d1739877bceb5102688ac8ad933e.jpg\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/a9f677c21d96b364f52aa85017aff793ab056ba973eb9e356b27b676ded4c621.jpg\"]', NULL, 1, 0, -1, b'0', 100, 200, 300, 10, 1, b'0', b'0', b'0', b'0', b'1', 0, '', b'0', '[3,1,2]', 0, 0, 0, '2023-06-05 23:30:18', '2023-08-31 06:19:07', '1', '1', b'1', 1), (633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', '耳机', '我是快乐的简介', '<p><img src=\"https://static.iocoder.cn/mall/099f261f18576902c4a18209d062a3fd.jpg\" alt=\"\" data-href=\"\" style=\"height: auto;\"/><img src=\"https://static.iocoder.cn/mall/ee1618b3334641c707cadbb9e14a5bae.jpg\" alt=\"\" data-href=\"\" style=\"height: auto;\"/><img src=\"https://static.iocoder.cn/mall/1251259c8968cdce993e47dd121b50a7.jpg\" alt=\"\" data-href=\"\" style=\"height: auto;\"/></p>', NULL, 28, 3, 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', '[\"https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg\",\"https://static.iocoder.cn/mall/7f46e98ece1920e1a4082dfc72bcd72a.jpg\",\"https://static.iocoder.cn/mall/bfb275263d02ab081b8670a752f2823f.jpg\",\"https://static.iocoder.cn/mall/e499a4dc489cda7b8d472cb3a3b348b7.jpg\",\"https://static.iocoder.cn/mall/06fa150a47163e973bb4806a380afaab.jpg\"]', NULL, 1, 0, 1, b'1', 4, 34900, 0, 364, 1, b'0', b'0', b'0', b'0', b'0', 0, '', b'0', '[2,1,3]', 30, 40, 0, '2023-04-26 12:29:19', '2023-08-31 15:46:15', NULL, '1', b'0', 1), (634, 'HUAWEI Mate 60 Pro', '遥遥领先', '卫星通话，超可靠玄武架构，全焦段超清影像', '<p><img src=\"http://127.0.0.1:48080/admin-api/infra/file/4/get/df93943f5e726738db48abbe18161411c2bf808200309096a679369d36731e81.jpg\" alt=\"image\" data-href=\"http://127.0.0.1:48080/admin-api/infra/file/4/get/df93943f5e726738db48abbe18161411c2bf808200309096a679369d36731e81.jpg\" style=\"\"/><img src=\"http://127.0.0.1:48080/admin-api/infra/file/4/get/0cad15172eb96f681496ebba49ea75ecb7ade8f377f2a812b4d60f7315083713.jpg\" alt=\"image\" data-href=\"http://127.0.0.1:48080/admin-api/infra/file/4/get/0cad15172eb96f681496ebba49ea75ecb7ade8f377f2a812b4d60f7315083713.jpg\" style=\"\"/></p>', '', 19, 1, 'http://127.0.0.1:48080/admin-api/infra/file/4/get/49009b73d392657c85bed2e82e22b09720e7c68466b8565c8b2f6c00e03b705e.jpg', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/3661b4ca3b922d31bef4440a7d68f9112b8f529ba160b3278bb0b5158384abf6.jpg\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/44c8288cd79d2e7df3a80244e519e5fd98c43c9264335f0cbe2fda2445198e45.jpg\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/23c7564ad843c326296c17c16dd1d2749a421ae81c416fe9e94fb1d310c02ed5.jpg\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/02a82a7b16987dc14c38378532a3a5b0fb34a3320fc020f1e83a5090f35193c8.jpg\"]', NULL, 1, 0, 1, b'1', 699900, 699900, 699900, 1005, 1, b'0', b'0', b'0', b'0', b'0', 0, '', b'0', '', 0, 0, 0, '2023-08-31 20:30:27', '2023-08-31 15:46:15', '1', '1', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_bargain_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_bargain_activity`;
CREATE TABLE `promotion_bargain_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '砍价活动编号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '砍价活动名称',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `status` int NOT NULL DEFAULT 0 COMMENT '活动状态',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `bargain_first_price` int NOT NULL DEFAULT 0 COMMENT '砍价起始价格，单位分',
  `bargain_price` int NOT NULL DEFAULT 0 COMMENT '砍价底价，单位：分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '活动库存',
  `user_size` int NOT NULL DEFAULT 0 COMMENT '达到该人数，才能砍到低价',
  `bargain_count` int NOT NULL DEFAULT 0 COMMENT '最大帮砍次数',
  `total_limit_count` int NOT NULL DEFAULT 0 COMMENT '总限购数量',
  `random_min_price` int NOT NULL DEFAULT 0 COMMENT '用户每次砍价的最小金额，单位：分',
  `random_max_price` int NOT NULL DEFAULT 0 COMMENT '用户每次砍价的最大金额，单位：分',
  `success_count` int NOT NULL DEFAULT 0 COMMENT '砍价成功数量',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '砍价活动';

-- ----------------------------
-- Records of promotion_bargain_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_bargain_activity` (`id`, `name`, `start_time`, `end_time`, `status`, `spu_id`, `sku_id`, `bargain_first_price`, `bargain_price`, `stock`, `user_size`, `bargain_count`, `total_limit_count`, `random_min_price`, `random_max_price`, `success_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '测试活动', '2023-08-13 00:45:31', '2023-08-13 00:45:34', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '2023-08-12 16:45:48', '', '2023-08-12 16:46:01', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_combination_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_activity`;
CREATE TABLE `promotion_combination_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '拼团名称',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU ID',
  `total_limit_count` int NOT NULL COMMENT '总限购数量',
  `single_limit_count` int NOT NULL COMMENT '单次限购数量',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `user_size` int NULL DEFAULT NULL COMMENT '购买人数',
  `total_count` int NULL DEFAULT 0 COMMENT '开团组数',
  `success_count` int NULL DEFAULT 0 COMMENT '成团组数',
  `order_user_count` int NOT NULL DEFAULT 0 COMMENT '参与人数',
  `virtual_group` int NOT NULL COMMENT '虚拟成团',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态：0开启 1关闭',
  `limit_duration` int NOT NULL COMMENT '限制时长（小时）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团活动';

-- ----------------------------
-- Records of promotion_combination_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_combination_activity` (`id`, `name`, `spu_id`, `total_limit_count`, `single_limit_count`, `start_time`, `end_time`, `user_size`, `total_count`, `success_count`, `order_user_count`, `virtual_group`, `status`, `limit_duration`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, '封神榜真好看', 101, 1, 2, '2023-08-12 00:00:00', '2023-08-13 00:00:00', 2, 0, 0, 0, 0, 0, 3, '1', '2023-08-12 23:32:42', '1', '2023-08-13 00:00:39', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_combination_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_product`;
CREATE TABLE `promotion_combination_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_id` bigint NULL DEFAULT NULL COMMENT '拼团活动编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品 SPU 编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品 SKU 编号',
  `activity_status` tinyint NOT NULL DEFAULT 0 COMMENT '拼团商品状态',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间点',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间点',
  `combination_price` int NOT NULL DEFAULT 0 COMMENT '拼团价格，单位分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团商品';

-- ----------------------------
-- Records of promotion_combination_product
-- ----------------------------
BEGIN;
INSERT INTO `promotion_combination_product` (`id`, `activity_id`, `spu_id`, `sku_id`, `activity_status`, `activity_start_time`, `activity_end_time`, `combination_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (25, 7, 101, 10, 0, '2023-08-12 00:00:00', '2023-08-13 00:00:00', 100, '1', '2023-08-12 23:32:42', '1', '2023-08-13 00:00:39', b'0', 1), (26, 7, 101, 11, 0, '2023-08-12 00:00:00', '2023-08-13 00:00:00', 200, '1', '2023-08-12 23:32:42', '1', '2023-08-13 00:00:39', b'0', 1), (27, 7, 101, 12, 0, '2023-08-12 00:00:00', '2023-08-13 00:00:00', 300, '1', '2023-08-12 23:32:42', '1', '2023-08-13 00:00:39', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_combination_record
-- ----------------------------
DROP TABLE IF EXISTS `promotion_combination_record`;
CREATE TABLE `promotion_combination_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_id` bigint NULL DEFAULT NULL COMMENT '拼团活动编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品 SPU 编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品 SKU 编号',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户编号',
  `head_id` bigint NULL DEFAULT NULL COMMENT '团长编号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '参与状态：1进行中 2已完成 3未完成',
  `combination_price` int NOT NULL COMMENT '拼团商品单价，单位分',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户头像',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `user_size` int NOT NULL COMMENT '可参团人数',
  `user_count` int NOT NULL COMMENT '已参团人数',
  `virtual_group` bit(1) NULL DEFAULT NULL COMMENT '是否虚拟拼团',
  `end_time` datetime NOT NULL COMMENT '结束时间（成团时间/失败时间）',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片',
  `spu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼团记录';

-- ----------------------------
-- Records of promotion_combination_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for promotion_coupon
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon`;
CREATE TABLE `promotion_coupon`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '优惠劵编号',
  `template_id` bigint NOT NULL COMMENT '优惠劵模板编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠劵名',
  `status` tinyint NOT NULL COMMENT '优惠码状态\n     *\n     * 1-未使用\n     * 2-已使用\n     * 3-已失效',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `take_type` tinyint NOT NULL COMMENT '领取类型\n     *\n     * 1 - 用户主动领取\n     * 2 - 后台自动发放',
  `use_price` int NOT NULL COMMENT '是否设置满多少金额可用，单位：分',
  `valid_start_time` datetime NOT NULL COMMENT '生效开始时间',
  `valid_end_time` datetime NOT NULL COMMENT '生效结束时间',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `discount_type` tinyint NOT NULL COMMENT '折扣类型',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `discount_limit_price` int NULL DEFAULT NULL COMMENT '折扣上限',
  `use_order_id` bigint NULL DEFAULT NULL COMMENT '使用订单号',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵';

-- ----------------------------
-- Records of promotion_coupon
-- ----------------------------
BEGIN;
INSERT INTO `promotion_coupon` (`id`, `template_id`, `name`, `status`, `user_id`, `take_type`, `use_price`, `valid_start_time`, `valid_end_time`, `product_scope`, `product_spu_ids`, `discount_type`, `discount_percent`, `discount_price`, `discount_limit_price`, `use_order_id`, `use_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, '优惠劵A', 1, 247, 1, 10000, '2019-04-08 00:00:00', '2019-04-10 00:00:00', 0, NULL, 1, NULL, 1000, NULL, 0, '2019-05-17 17:46:30', '', '2022-11-03 00:09:56', '', '2023-06-02 15:47:54', b'0', 1), (2, 1, '优惠劵B', 2, 247, 1, 2, '2019-04-08 00:00:00', '2019-04-10 00:00:00', 0, NULL, 2, 49, 1000, NULL, 0, '2019-05-17 14:21:17', '', '2022-11-03 00:09:56', '', '2022-11-04 18:58:09', b'0', 1), (3, 1, '优惠劵C', 3, 247, 1, 10, '2019-04-08 00:00:00', '2019-04-10 00:00:00', 0, NULL, 1, NULL, 9, NULL, 0, '2019-05-17 17:58:50', '', '2022-11-03 00:09:56', '', '2022-11-04 18:58:12', b'0', 1), (4, 1, '优惠劵A', 1, 247, 1, 1000, '2020-08-20 11:00:00', '2020-08-22 11:00:00', 0, NULL, 1, NULL, 1000, NULL, 0, NULL, '', '2022-11-03 00:09:56', '1', '2022-11-04 21:05:02', b'1', 1), (5, 1, '优惠劵AAA', 1, 247, 1, 1000, '2020-08-22 11:00:00', '2020-08-24 11:00:00', 0, NULL, 1, NULL, 1000, NULL, 0, NULL, '', '2022-11-03 00:09:56', '1', '2023-08-12 03:04:16', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_coupon_template
-- ----------------------------
DROP TABLE IF EXISTS `promotion_coupon_template`;
CREATE TABLE `promotion_coupon_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '模板编号，自增唯一。',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '优惠劵名',
  `status` tinyint NOT NULL COMMENT '状态',
  `total_count` int NOT NULL COMMENT '发放数量, -1 - 则表示不限制',
  `take_limit_count` tinyint NOT NULL COMMENT '每人限领个数, -1 - 则表示不限制',
  `take_type` tinyint NOT NULL COMMENT '领取方式',
  `use_price` int NOT NULL COMMENT '是否设置满多少金额可用，单位：分',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `validity_type` tinyint NOT NULL COMMENT '生效日期类型',
  `valid_start_time` datetime NULL DEFAULT NULL COMMENT '固定日期-生效开始时间',
  `valid_end_time` datetime NULL DEFAULT NULL COMMENT '固定日期-生效结束时间',
  `fixed_start_term` int NULL DEFAULT NULL COMMENT '领取日期-开始天数',
  `fixed_end_term` int NULL DEFAULT NULL COMMENT '领取日期-结束天数',
  `discount_type` int NOT NULL COMMENT '优惠类型\n     *\n     * 1-代金卷\n     * 2-折扣卷',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `discount_limit_price` int NULL DEFAULT NULL COMMENT '折扣上限，仅在 {@link #preferentialType} 等于 2 时生效。\n     *\n     * 例如，折扣上限为 20 元，当使用 8 折优惠券，订单金额为 1000 元时，最高只可折扣 20 元，而非 80  元。',
  `take_count` int NOT NULL DEFAULT 0 COMMENT '领取优惠券的数量',
  `use_count` int NOT NULL DEFAULT 0 COMMENT '使用优惠券的次数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '优惠劵模板';

-- ----------------------------
-- Records of promotion_coupon_template
-- ----------------------------
BEGIN;
INSERT INTO `promotion_coupon_template` (`id`, `name`, `status`, `total_count`, `take_limit_count`, `take_type`, `use_price`, `product_scope`, `product_spu_ids`, `validity_type`, `valid_start_time`, `valid_end_time`, `fixed_start_term`, `fixed_end_term`, `discount_type`, `discount_percent`, `discount_price`, `discount_limit_price`, `take_count`, `use_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '优惠劵AAA', 0, 100, 10, 2, 1000, 2, '5,2,7,6', 2, NULL, NULL, 1, 2, 2, 90, 1000, 10, 1, 0, '', '2022-10-31 21:12:15', '1', '2022-11-04 21:12:01', b'0', 1), (2, '优惠劵B', 1, 10, 2, 1, 1000, 2, '10', 2, NULL, NULL, 3, 5, 1, NULL, 10000, 10, 0, 0, '', '2022-10-31 21:12:15', '1', '2022-11-02 22:44:18', b'0', 1), (14, '测试一下', 0, 2, 3, 1, 100, 1, '', 1, '2022-11-24 00:00:00', '2022-12-19 23:59:59', NULL, NULL, 1, 0, 100, 0, 0, 0, '1', '2022-11-02 22:05:56', '1', '2023-08-12 10:53:38', b'0', 1), (15, '测试下', 0, 1, 2, 1, 300, 2, '101,2', 2, '2022-11-14 00:00:00', '2022-12-22 23:59:59', 1, 3, 1, 10, 400, 100, 0, 0, '1', '2022-11-02 22:12:19', '1', '2023-08-12 10:59:55', b'0', 1), (16, '1', 0, 1, 2, 1, 300, 1, '', 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', NULL, NULL, 1, NULL, 200, NULL, 0, 0, '1', '2023-08-12 10:53:50', '1', '2023-08-12 02:54:34', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_decorate_component
-- ----------------------------
DROP TABLE IF EXISTS `promotion_decorate_component`;
CREATE TABLE `promotion_decorate_component`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `page` int NOT NULL DEFAULT 0 COMMENT '所属页面 id',
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件编码',
  `status` int NOT NULL DEFAULT 0 COMMENT '状态',
  `value` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件值',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面装修组件';

-- ----------------------------
-- Records of promotion_decorate_component
-- ----------------------------
BEGIN;
INSERT INTO `promotion_decorate_component` (`id`, `page`, `code`, `status`, `value`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (26, 1, 'slide-show', 0, '[\n    {\n      \"name\": \"轮播 1\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/banner-01.jpg\",\n      \"url\": \"/pages/goods_details/index?id=633\"\n    },\n    {\n      \"name\": \"轮播 2\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/banner-02.jpg\",\n      \"url\": \"\"\n    }\n  ]', '1', '2023-08-16 21:59:32', '1', '2023-08-31 11:29:11', b'0', 1), (27, 1, 'menu', 0, '[\n    {\n      \"name\": \"领优惠券\",\n      \"picUrl\": \"https://api.java.crmeb.net/crmebimage/public/content/2023/01/11/2dfb64490f694d78a1ae9b0176884122arrur012nc.png\",\n      \"url\": \"/pages/users/commission_rank/index\"\n    },\n    {\n      \"name\": \"行业资讯\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/6a23b4be15894945b8908762cd6ac10ftxrly6psan.png\",\n      \"url\": \"/pages/news_list/index\"\n    },\n    {\n      \"name\": \"砍价列表\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/dd796e2a4f1e4be287b7e3f045b74513aa0fl2hbcv.png\",\n      \"url\": \"/pages/activity/goods_bargain/index\"\n    },\n    {\n      \"name\": \"分销中心\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/9217fff82f4e4cb2994b0a0350229bf8n5keuknzj4.png\",\n      \"url\": \"/pages/news_list/index\"\n    },\n    {\n      \"name\": \"限时秒杀\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/b2264d00e92e42118756cbeed35835c2u3d250a2ip.png\",\n      \"url\": \"/pages/activity/goods_seckill/index\"\n    },\n    {\n      \"name\": \"商品分类\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/4b6583ac95714bcab675e137717692054zxy59qiiy.png\",\n      \"url\": \"/pages/goods_list/index?cid=0&title=\"\n    },\n    {\n      \"name\": \"签到\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/358787702d464984bcd8e3f6d937188337prsofmsp.png\",\n      \"url\": \"/pages/users/user_sgin/index\"\n    },\n    {\n      \"name\": \"拼团列表\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/3c1129aeef7f4ed2acc999a2f3c04770q1onmg3vp0.png\",\n      \"url\": \"/pages/users/user_get_coupon/index\"\n    },\n    {\n      \"name\": \"地址管理\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/04bde8bb2f2e4acaa7f961f7fa785d8880rv7z7pvt.png\",\n      \"url\": \"/pages/users/user_address_list/index\"\n    },\n    {\n      \"name\": \"优惠劵\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/76943158b9c44d64ab837ec9aa738d5cckxo88dutd.png\",\n      \"url\": \"/pages/users/user_coupon/index\"\n    }\n  ]', '1', '2023-08-16 21:59:32', '1', '2023-08-31 11:35:00', b'0', 1), (28, 1, 'scrolling-news', 0, '[\n    {\n      \"url\": \"/pages/news_details/index?id=23\",\n      \"name\": \"热门新闻\"\n    },\n    {\n      \"url\": \"/pages/user/user\",\n      \"name\": \"你的用户中心！\"\n    },\n    {\n      \"url\": \"/pages/news_list/index\",\n      \"name\": \"最新新闻列表\"\n    },\n    {\n      \"url\": \"/pages/user_spread_user/index\",\n      \"name\": \"如何推广用户？\"\n    }\n  ]', '1', '2023-08-16 21:59:32', '1', '2023-08-31 11:36:54', b'0', 1), (29, 1, 'product-recommend', 0, '[\n    {\n      \"name\": \"精品推荐\",\n      \"type\": \"best\",\n      \"tag\": \"多买多省\"\n    },\n    {\n      \"name\": \"热门榜单\",\n      \"type\": \"hot\",\n      \"tag\": \"热门榜单\"\n    },\n    {\n      \"name\": \"首发新品\",\n      \"type\": \"new\",\n      \"tag\": \"非常不错\"\n    },\n    {\n      \"name\": \"促销单品\",\n      \"id\": 1846,\n      \"type\": \"benefit\",\n      \"tag\": \"新品首发\"\n    }\n  ]', '1', '2023-08-16 21:59:32', '1', '2023-08-31 11:38:17', b'0', 1), (101, 2, 'menu', 0, '[\n    {\n      \"name\": \"砍价记录\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/bb8143158b5d46b9aa8c0f9b9b25a46eqnqrn85rxx.png\",\n      \"url\": \"/pages/activity/bargain/index\"\n    },\n    {\n      \"name\": \"我的推广\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/54389a65125442f8a425d60964f7e98an875g59zlu.png\",\n      \"url\": \"/pages/users/user_spread_user/index\"\n    },\n    {\n      \"name\": \"我的余额\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/54362ba5c45d4774bda6113abf746b39nhpqbam7c1.png\",\n      \"url\": \"/pages/users/user_money/index\"\n    },\n    {\n      \"name\": \"地址信息\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/7dd4af8378c14154a23f6c0b18feb8e4xihlj7tmot.png\",\n      \"url\": \"/pages/users/user_address_list/index\"\n    },\n    {\n      \"name\": \"我的收藏\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/fa4a3bb703b74f24bff8beb5043f5673ubh7c2p722.png\",\n      \"url\": \"/pages/users/user_goods_collection/index\"\n    },\n    {\n      \"name\": \"优惠券\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/d91b92c45c774189a3261e6909708fe5bjqdreuh8i.png\",\n      \"url\": \"/pages/users/user_coupon/index\"\n    },\n    {\n      \"name\": \"签到记录\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/280fd9b20294498ebc36b1d5144f36c3aniowy6l22.png\",\n      \"url\": \"/pages/users/user_sgin_list/index\"\n    },\n    {\n      \"name\": \"我的账户\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/11a6bb69a4094b2792709f952d60a869gu2vpjjueg.png\",\n      \"url\": \"/pages/users/user_money/index\"\n    },\n    {\n      \"name\": \"账单明细\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/6eaf10e8e068450dbfaf27cf44cd0f5btjv2h03umq.png\",\n      \"url\": \"/pages/users/user_bill/index\"\n    },\n    {\n      \"name\": \"积分详情\",\n      \"picUrl\": \"https://static.iocoder.cn/mall/5bb57ed904e24e0ea4f80c87e0014e08r6wsq5uhkz.png\",\n      \"url\": \"/pages/users/user_integral/index\"\n    }\n  ]', '1', '2023-08-16 21:59:32', '1', '2023-08-31 11:41:27', b'0', 1), (102, 2, 'slide-show', 0, '[\n    {\n      \"picUrl\": \"https://static.iocoder.cn/mall/dd84788c53504d61a8e0531125876d5f0zxr4eujft.png\",\n      \"url\": \"https://doc.iocoder.cn/\"\n    },\n    {\n      \"picUrl\": \"https://static.iocoder.cn/mall/dd84788c53504d61a8e0531125876d5f0zxr4eujft.png\",\n      \"url\": \"https://cloud.iocoder.cn/\"\n    },\n    {\n      \"picUrl\": \"https://static.iocoder.cn/mall/a3ea80be646647c49aff41d50f22d39445mdxlejxn.png\",\n      \"url\": \"https://www.iocoder.cn/\"\n    }\n  ]', '1', '2023-08-16 21:59:32', '1', '2023-08-31 11:44:27', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_discount_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_activity`;
CREATE TABLE `promotion_discount_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣活动';

-- ----------------------------
-- Records of promotion_discount_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_discount_activity` (`id`, `name`, `status`, `start_time`, `end_time`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '测试活动', 40, '2022-11-25 00:00:00', '2022-12-23 23:59:59', '12345', '1', '2022-11-05 00:54:34', '1', '2022-11-06 12:32:49', b'1', 1), (5, '111', 40, '2022-11-02 00:00:00', '2022-12-13 23:59:59', '', '1', '2022-11-06 00:35:51', '1', '2022-11-06 12:32:45', b'1', 1), (6, '测11', 10, '2022-11-15 00:00:00', '2022-12-29 23:59:59', '测试一下', '1', '2022-11-06 00:41:55', '1', '2022-11-06 00:41:55', b'0', 1), (7, '123', 40, '2022-11-01 00:00:00', '2022-12-20 23:59:59', '', '1', '2022-11-06 00:42:12', '1', '2022-11-06 12:32:36', b'1', 1), (8, '12', 10, '2022-11-09 00:00:00', '2022-12-21 23:59:59', '', '1', '2022-11-06 01:08:07', '1', '2022-11-06 12:36:35', b'0', 1), (9, '测试活动', 20, '2022-11-01 00:00:00', '2022-12-05 23:59:59', '', '1', '2022-11-06 11:48:40', '1', '2022-11-12 17:42:36', b'0', 1), (10, '满减一个商品', 10, '2022-11-08 00:00:00', '2022-11-09 23:59:59', '', '1', '2022-11-06 11:50:58', '1', '2022-11-07 20:24:31', b'0', 1), (11, '323', 10, '2022-12-08 00:00:00', '2023-01-20 23:59:59', '232', '1', '2022-12-04 15:18:05', '1', '2022-12-04 15:18:05', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_discount_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_discount_product`;
CREATE TABLE `promotion_discount_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，主键自增',
  `activity_id` bigint NOT NULL COMMENT '活动编号',
  `spu_id` bigint NOT NULL DEFAULT -1 COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `discount_type` int NOT NULL COMMENT '优惠类型\n     *\n     * 1-代金卷\n     * 2-折扣卷',
  `discount_percent` tinyint NULL DEFAULT NULL COMMENT '折扣百分比',
  `discount_price` int NULL DEFAULT NULL COMMENT '优惠金额，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '限时折扣商品\n';

-- ----------------------------
-- Records of promotion_discount_product
-- ----------------------------
BEGIN;
INSERT INTO `promotion_discount_product` (`id`, `activity_id`, `spu_id`, `sku_id`, `discount_type`, `discount_percent`, `discount_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, 6, 2, 2, 1, NULL, 1322, '1', '2022-11-06 00:41:55', '1', '2022-11-06 00:41:55', b'0', 1), (6, 8, 1, 1, 1, NULL, 0, '1', '2022-11-06 01:08:07', '1', '2022-11-06 01:08:07', b'0', 1), (7, 9, 1, 1, 1, NULL, 0, '1', '2022-11-06 11:48:40', '1', '2022-11-12 17:37:18', b'1', 1), (8, 9, 2, 2, 2, 1, 0, '1', '2022-11-06 11:48:40', '1', '2022-11-12 17:37:18', b'1', 1), (9, 10, 4, 25, 1, NULL, 0, '1', '2022-11-06 11:50:58', '1', '2022-11-06 11:53:40', b'1', 1), (10, 10, 4, 25, 1, 0, 2, '1', '2022-11-06 11:58:49', '1', '2022-11-06 11:59:34', b'1', 1), (11, 10, 4, 25, 1, 0, 100, '1', '2022-11-06 12:04:43', '1', '2022-11-06 11:59:41', b'1', 1), (12, 10, 4, 25, 1, 0, 200, '1', '2022-11-06 12:04:49', '1', '2022-11-06 12:04:49', b'0', 1), (13, 10, 3, 6, 2, 30, NULL, '1', '2022-11-06 12:05:17', '1', '2022-11-06 12:01:15', b'1', 1), (14, 10, 3, 6, 2, 30, 0, '1', '2022-11-06 12:19:56', '1', '2022-11-06 12:19:56', b'0', 1), (15, 10, 2, 4, 1, NULL, 200, '1', '2022-11-06 12:19:56', '1', '2022-11-06 12:14:53', b'1', 1), (16, 10, 2, 4, 1, 0, 299, '1', '2022-11-06 12:20:02', '1', '2022-11-06 12:14:59', b'1', 1), (17, 10, 2, 4, 2, 20, 299, '1', '2022-11-06 12:20:08', '1', '2022-11-06 12:15:24', b'1', 1), (18, 9, 1, 1, 1, 0, 150, '1', '2022-11-12 17:42:36', '1', '2022-11-12 17:42:36', b'0', 1), (19, 9, 2, 2, 2, 15, 0, '1', '2022-11-12 17:42:36', '1', '2022-11-12 17:42:36', b'0', 1), (20, 11, 3, 6, 2, 10, 100, '1', '2022-12-04 15:18:05', '1', '2022-12-04 15:18:05', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_reward_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_reward_activity`;
CREATE TABLE `promotion_reward_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动编号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动标题',
  `status` tinyint NOT NULL DEFAULT -1 COMMENT '活动状态',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `condition_type` tinyint NOT NULL DEFAULT -1 COMMENT '条件类型',
  `product_scope` tinyint NOT NULL COMMENT '商品范围',
  `product_spu_ids` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品 SPU 编号的数组',
  `rules` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠规则的数组',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '满减送活动';

-- ----------------------------
-- Records of promotion_reward_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_reward_activity` (`id`, `name`, `status`, `start_time`, `end_time`, `remark`, `condition_type`, `product_scope`, `product_spu_ids`, `rules`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '测试活动', 40, '2022-11-25 00:00:00', '2022-12-23 23:59:59', '1234', 10, 2, '1,2', '[{\"limit\":1,\"discountPrice\":10,\"freeDelivery\":true,\"point\":10,\"couponIds\":[10,20],\"couponCounts\":[1,2]},{\"limit\":2,\"discountPrice\":20,\"freeDelivery\":false,\"point\":20,\"couponIds\":[30,40],\"couponCounts\":[3,4]}]', '1', '2022-11-05 00:54:34', '1', '2022-11-05 10:45:40', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_activity
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_activity`;
CREATE TABLE `promotion_seckill_activity`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀活动编号',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '秒杀活动商品',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '秒杀活动名称',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `config_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀时段 id 数组',
  `order_count` int NOT NULL DEFAULT 0 COMMENT '新增订单数',
  `user_count` int NOT NULL DEFAULT 0 COMMENT '付款人数',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '订单实付金额，单位：分',
  `total_limit_count` int NULL DEFAULT 0 COMMENT '总限购数量',
  `single_limit_count` int NULL DEFAULT 0 COMMENT '单次限够数量',
  `stock` int NULL DEFAULT 0 COMMENT '秒杀库存',
  `total_stock` int NULL DEFAULT 0 COMMENT '秒杀总库存',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀活动';

-- ----------------------------
-- Records of promotion_seckill_activity
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_activity` (`id`, `spu_id`, `name`, `status`, `remark`, `start_time`, `end_time`, `sort`, `config_ids`, `order_count`, `user_count`, `total_price`, `total_limit_count`, `single_limit_count`, `stock`, `total_stock`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (40, 101, '我和僵尸有个约会', 0, '321321321', '2023-08-12 00:00:00', '2023-08-13 00:00:00', 3, '26,28', 0, 0, 0, 2, 2, 0, 6, '1', '2023-08-12 15:31:12', '1', '2023-08-12 16:22:46', b'0', 1), (41, 633, '我吃西红柿', 1, '', '2023-08-01 00:00:00', '2023-08-16 00:00:00', 2, '30', 0, 0, 0, 1, 3, 0, 1, '1', '2023-08-12 16:03:37', '1', '2023-08-31 16:21:51', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_config
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_config`;
CREATE TABLE `promotion_seckill_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秒杀时段名称',
  `start_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开始时间点',
  `end_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '结束时间点',
  `slider_pic_urls` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '秒杀主图',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '活动状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀时段';

-- ----------------------------
-- Records of promotion_seckill_config
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_config` (`id`, `name`, `start_time`, `end_time`, `slider_pic_urls`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (26, '上午场', '09:00:00', '11:50:00', '[]', 0, '1', '2022-11-19 15:36:11', '1', '2023-08-31 07:51:14', b'1', 1), (27, '中午场', '12:00:00', '13:30:00', '[]', 0, '1', '2022-11-19 15:36:36', '1', '2023-08-31 07:51:07', b'1', 1), (28, '下午场', '17:30:00', '19:00:00', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/cddcefa0de3a4495205b8973fbbe105300f6fa578b22e37f5856dd61a14c439e.jpg\"]', 0, '1', '2022-11-19 15:37:23', '1', '2023-08-31 07:51:09', b'1', 1), (29, '晚间场', '21:00:00', '23:00:00', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/7831ca02a9d7aa7cbec78e67bd0f0847808d7912f1f8f3b4118a60c1bf9cba2b.jpg\",\"http://127.0.0.1:48080/admin-api/infra/file/4/get/b2d9b4f28372a9695a76a06eec2797bed7d63558e8806315d60bd785e3c4865f.png\"]', 0, '1', '2022-11-19 15:37:53', '1', '2023-08-31 07:51:11', b'1', 1), (30, '上午好', '08:00:00', '11:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/814a81f9a62afaf4c4a9c34a852a0213c8386e2640131141bdebf477be359665.png\"]', 0, '1', '2023-08-31 15:53:08', '1', '2023-08-31 15:56:48', b'0', 1), (31, '下午时光', '14:00:00', '14:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/3a03c0c14146350585a42a368385c2605ac628358e628310f3ab672c91610895.png\"]', 0, '1', '2023-08-31 15:53:48', '1', '2023-08-31 15:56:37', b'0', 1), (32, '凌晨时光', '02:00:00', '03:00:00', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/7b630ed0efc579e2eee7972fcb2f4c479952a457f25b9486e2d7e1cbe76a7874.png\"]', 0, '1', '2023-08-31 15:54:49', '1', '2023-08-31 15:54:49', b'0', 1), (33, '午安时光', '12:00:00', '13:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/0a3d72f25f73c9df63f9062500c7025243a99e0a90d62c684d7fdfa12d014a8c.png\"]', 0, '1', '2023-08-31 15:57:20', '1', '2023-08-31 15:57:20', b'0', 1), (34, '谁前必看', '20:00:00', '21:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/fb051574d1b1e4209116a6786ca5688624e97ad69746d21d910887408c33fd21.png\"]', 0, '1', '2023-08-31 16:03:24', '1', '2023-08-31 16:03:24', b'0', 1), (35, '早茶时光', '06:00:00', '07:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/a8b15e56ae26d087e24fe4e807430d279296540c781dfd02b3da2e9fdbe2e85f.png\"]', 0, '1', '2023-08-31 16:04:14', '1', '2023-08-31 16:04:36', b'0', 1), (36, '深夜狂欢', '22:00:00', '23:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/0998c69bba1acbc6d8211b5e02dc596cabebfb54eaf587910443beb1fcae1e0f.png\"]', 0, '1', '2023-08-31 16:05:29', '1', '2023-08-31 16:05:29', b'0', 1), (37, '休闲时刻', '15:00:00', '15:59:59', '[\"http://127.0.0.1:48080/admin-api/infra/file/4/get/463cdd26eb851b9a1684b552cd828fe8f26e4ff996b9a0d12842476c06f2e1b9.png\"]', 0, '1', '2023-08-31 16:06:27', '1', '2023-08-31 16:06:27', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for promotion_seckill_product
-- ----------------------------
DROP TABLE IF EXISTS `promotion_seckill_product`;
CREATE TABLE `promotion_seckill_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '秒杀参与商品编号',
  `activity_id` bigint NOT NULL DEFAULT 0 COMMENT '秒杀活动 id',
  `config_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '秒杀时段 id 数组',
  `spu_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 spu_id',
  `sku_id` bigint NOT NULL DEFAULT 0 COMMENT '商品 sku_id',
  `seckill_price` int NOT NULL DEFAULT 0 COMMENT '秒杀金额，单位：分',
  `stock` int NOT NULL DEFAULT 0 COMMENT '秒杀库存',
  `activity_status` tinyint NOT NULL DEFAULT 0 COMMENT '秒杀商品状态',
  `activity_start_time` datetime NOT NULL COMMENT '活动开始时间点',
  `activity_end_time` datetime NOT NULL COMMENT '活动结束时间点',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀参与商品';

-- ----------------------------
-- Records of promotion_seckill_product
-- ----------------------------
BEGIN;
INSERT INTO `promotion_seckill_product` (`id`, `activity_id`, `config_ids`, `spu_id`, `sku_id`, `seckill_price`, `stock`, `activity_status`, `activity_start_time`, `activity_end_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (73, 40, '26,28', 101, 10, 100, 1, 0, '2023-08-12 00:00:00', '2023-08-13 00:00:00', '1', '2023-08-12 15:31:12', '1', '2023-08-12 16:22:46', b'0', 1), (74, 40, '26,28', 101, 11, 200, 2, 0, '2023-08-12 00:00:00', '2023-08-13 00:00:00', '1', '2023-08-12 15:31:12', '1', '2023-08-12 16:22:46', b'0', 1), (75, 40, '26,28', 101, 12, 300, 3, 0, '2023-08-12 00:00:00', '2023-08-13 00:00:00', '1', '2023-08-12 15:31:12', '1', '2023-08-12 16:22:46', b'0', 1), (76, 41, '30', 633, 1, 100, 1, 1, '2023-08-01 00:00:00', '2023-08-16 00:00:00', '1', '2023-08-12 16:03:37', '1', '2023-08-31 16:21:51', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale`;
CREATE TABLE `trade_after_sale`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '售后编号',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '售后单号',
  `status` int NOT NULL DEFAULT 0 COMMENT '售后状态',
  `way` tinyint NOT NULL COMMENT '售后方式',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `apply_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '申请原因',
  `apply_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补充描述',
  `apply_pic_urls` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '补充凭证图片',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单流水号',
  `order_item_Id` bigint UNSIGNED NOT NULL COMMENT '订单项编号',
  `spu_id` bigint UNSIGNED NOT NULL COMMENT '商品 SPU 编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint UNSIGNED NOT NULL COMMENT '商品 SKU 编号',
  `properties` json NULL COMMENT '商品属性数组，JSON 格式',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `count` int NOT NULL COMMENT '购买数量',
  `audit_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审批时间',
  `audit_user_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '审批人',
  `audit_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '审批备注',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `pay_refund_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '支付退款编号',
  `refund_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '退款时间',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '退货物流公司编号',
  `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '退货物流单号',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '退货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receive_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '收货备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  `type` tinyint NULL DEFAULT NULL COMMENT '售后类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后订单';

-- ----------------------------
-- Records of trade_after_sale
-- ----------------------------
BEGIN;
INSERT INTO `trade_after_sale` (`id`, `no`, `status`, `way`, `user_id`, `apply_reason`, `apply_description`, `apply_pic_urls`, `order_id`, `order_no`, `order_item_Id`, `spu_id`, `spu_name`, `sku_id`, `properties`, `pic_url`, `count`, `audit_time`, `audit_user_id`, `audit_reason`, `refund_price`, `pay_refund_id`, `refund_time`, `logistics_id`, `logistics_no`, `delivery_time`, `receive_time`, `receive_reason`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`, `type`) VALUES (6, 'r01', 10, 20, 247, '不想要了', '', '[]', 67, '1690656217590009856', 47, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, '2023-08-18 14:35:07', 1, '阿巴巴', 6, 88, '2023-08-18 15:07:04', NULL, NULL, NULL, NULL, NULL, '247', '2023-08-17 22:31:26', '1', '2023-08-18 07:14:54', b'0', 1, 10), (7, 'q3r60t4t6s', 40, 20, 247, '不想要了', '32321', '[]', 74, '1692435420052332544', 54, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 2, '[{\"valueId\": 6, \"valueName\": \"蓝色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, '2023-08-18 15:40:35', 1, NULL, 5, NULL, '2023-08-18 07:20:31', 1, '32132', '2023-08-18 17:31:28', '2023-08-18 18:44:21', NULL, '247', '2023-08-18 15:20:32', '1', '2023-08-18 18:44:21', b'0', 1, 10), (8, '0s70zrw54n', 50, 10, 247, '不想要了', '', '[]', 75, '1692503226265624576', 55, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, '2023-08-31 19:56:04', 1, NULL, 6, 89, '2023-08-31 19:56:20', NULL, NULL, NULL, NULL, NULL, '247', '2023-08-18 19:52:04', '1', '2023-08-31 19:56:24', b'0', 1, 10);
COMMIT;

-- ----------------------------
-- Table structure for trade_after_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `trade_after_sale_log`;
CREATE TABLE `trade_after_sale_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `user_type` tinyint NOT NULL COMMENT '用户类型',
  `after_sale_id` bigint NOT NULL COMMENT '售后编号',
  `operate_log` tinyint NULL DEFAULT NULL,
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `order_item_Id` bigint UNSIGNED NOT NULL COMMENT '订单项编号',
  `operate_type` tinyint NOT NULL COMMENT '操作类型',
  `before_status` tinyint NULL DEFAULT NULL COMMENT '售后状态（之前）',
  `after_status` tinyint NOT NULL COMMENT '售后状态（之后）',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '操作明细',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '售后订单日志';

-- ----------------------------
-- Records of trade_after_sale_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for trade_cart
-- ----------------------------
DROP TABLE IF EXISTS `trade_cart`;
CREATE TABLE `trade_cart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，唯一自增。',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `spu_id` bigint NOT NULL COMMENT '商品 SPU 编号',
  `sku_id` bigint NOT NULL COMMENT '商品 SKU 编号',
  `count` int NOT NULL COMMENT '商品购买数量',
  `selected` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否选中',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车的商品信息';

-- ----------------------------
-- Records of trade_cart
-- ----------------------------
BEGIN;
INSERT INTO `trade_cart` (`id`, `user_id`, `spu_id`, `sku_id`, `count`, `selected`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (55, 247, 633, 1, 38, b'1', '247', '2023-08-29 22:43:37', '247', '2023-08-30 10:09:26', b'1', 1), (56, 247, 109, 1, 1, b'1', '247', '2023-08-29 22:43:37', '247', '2023-08-30 09:47:43', b'1', 1), (57, 247, 109, 1, 1, b'1', '247', '2023-08-29 22:43:37', '247', '2023-08-30 09:47:43', b'1', 1), (58, 247, 109, 1, 1, b'1', '247', '2023-08-29 22:43:37', '247', '2023-08-30 09:47:43', b'1', 1), (59, 247, 633, 111, 1, b'1', '247', '2023-08-29 22:43:37', '247', '2023-08-30 09:44:17', b'1', 1), (60, 247, 633, 3, 1, b'1', '247', '2023-08-30 17:44:22', '247', '2023-08-30 09:56:11', b'1', 1), (61, 247, 633, 1, 3, b'1', '247', '2023-08-30 18:14:55', '247', '2023-08-30 10:57:00', b'1', 1), (62, 247, 633, 2, 1, b'1', '247', '2023-08-30 18:35:14', '247', '2023-08-30 10:57:00', b'1', 1), (63, 247, 633, 3, 1, b'1', '247', '2023-08-30 18:35:17', '247', '2023-08-30 10:57:00', b'1', 1), (64, 247, 633, 1, 1, b'1', '247', '2023-08-31 23:42:14', '247', '2023-08-31 15:43:27', b'1', 1), (65, 247, 634, 14, 1, b'1', '247', '2023-08-31 23:42:33', '247', '2023-08-31 15:43:27', b'1', 1), (66, 247, 634, 14, 1, b'1', '247', '2023-08-31 23:45:29', '247', '2023-08-31 15:46:15', b'1', 1), (67, 247, 634, 15, 1, b'1', '247', '2023-08-31 23:45:31', '247', '2023-08-31 15:46:15', b'1', 1), (68, 247, 634, 16, 1, b'1', '247', '2023-08-31 23:45:33', '247', '2023-08-31 15:46:15', b'1', 1), (69, 247, 634, 17, 1, b'1', '247', '2023-08-31 23:45:35', '247', '2023-08-31 15:46:15', b'1', 1), (70, 247, 633, 1, 1, b'1', '247', '2023-08-31 23:45:43', '247', '2023-08-31 15:46:15', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express`;
CREATE TABLE `trade_delivery_express`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '快递公司名称',
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '快递公司 logo',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递公司';

-- ----------------------------
-- Records of trade_delivery_express
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express` (`id`, `code`, `name`, `logo`, `sort`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 'STO', '申通快递', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/446f517d60ef9e44991225b890f227389b1b6cdf9c572337546e172bda8b7935.png', 1, 0, '1', '2023-05-24 23:30:13', '1', '2023-08-31 15:47:34', b'0', 1), (2, 'SF', '顺丰速运', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/ec8418d431f69a86dbd24b40dfab79536aff614f0d20613cb59c90ddb6fe57c5.png', 2, 0, '1', '2023-05-24 23:31:54', '1', '2023-08-31 15:48:01', b'0', 1), (3, 'ZTO', '中通快递', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/10472d8e00fee77dfff5ac8207bf4c574762de1fea56169b16eb3df1e994b1bf.png', 3, 0, '1', '2023-05-24 23:32:51', '1', '2023-08-31 15:48:22', b'0', 1), (4, 'YD', '韵达快递', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/92ae41aa2c007cd4544162cd53966b5cc8557696927d9ff2d5e5970519ee0cbe.png', 4, 0, '1', '2023-05-24 23:32:51', '1', '2023-08-31 15:48:45', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express_template
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template`;
CREATE TABLE `trade_delivery_express_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '模板名称',
  `charge_mode` tinyint NOT NULL COMMENT '配送计费方式',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板';

-- ----------------------------
-- Records of trade_delivery_express_template
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express_template` (`id`, `name`, `charge_mode`, `sort`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '按照体积配送', 3, 0, '1', '2023-05-24 23:59:25', '1', '2023-08-31 15:47:00', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express_template_charge
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template_charge`;
CREATE TABLE `trade_delivery_express_template_charge`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号，自增',
  `template_id` bigint NOT NULL COMMENT '快递运费模板编号',
  `area_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配送区域 id',
  `charge_mode` tinyint NOT NULL COMMENT '配送计费方式',
  `start_count` double NOT NULL COMMENT '首件数量',
  `start_price` int NOT NULL COMMENT '起步价，单位：分',
  `extra_count` double NOT NULL COMMENT '续件数量',
  `extra_price` int NOT NULL COMMENT '额外价，单位：分',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板计费配置';

-- ----------------------------
-- Records of trade_delivery_express_template_charge
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express_template_charge` (`id`, `template_id`, `area_ids`, `charge_mode`, `start_count`, `start_price`, `extra_count`, `extra_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, '120102', 3, 1, 100, 1, 100, '1', '2023-05-24 23:59:25', '1', '2023-08-31 07:46:59', b'1', 1), (2, 1, '120102', 3, 1, 100, 1, 100, '1', '2023-08-31 15:47:00', '1', '2023-08-31 15:47:00', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_express_template_free
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_express_template_free`;
CREATE TABLE `trade_delivery_express_template_free`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `template_id` bigint NOT NULL COMMENT '快递运费模板编号',
  `area_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '包邮区域 id',
  `free_price` int NOT NULL COMMENT '包邮金额，单位：分',
  `free_count` int NOT NULL DEFAULT 0 COMMENT '包邮件数,',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '快递运费模板包邮配置';

-- ----------------------------
-- Records of trade_delivery_express_template_free
-- ----------------------------
BEGIN;
INSERT INTO `trade_delivery_express_template_free` (`id`, `template_id`, `area_ids`, `free_price`, `free_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, '110101', 100, 1, '1', '2023-05-24 23:59:25', '1', '2023-08-31 07:46:59', b'1', 1), (2, 1, '110101', 100, 1, '1', '2023-08-31 15:47:00', '1', '2023-08-31 15:47:00', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_delivery_pick_up_store
-- ----------------------------
DROP TABLE IF EXISTS `trade_delivery_pick_up_store`;
CREATE TABLE `trade_delivery_pick_up_store`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店名称',
  `introduction` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '门店简介',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店手机',
  `area_id` int NOT NULL COMMENT '区域编号',
  `detail_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店详细地址',
  `logo` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '门店 logo',
  `opening_time` time NOT NULL COMMENT '营业开始时间',
  `closing_time` time NOT NULL COMMENT '营业结束时间',
  `latitude` double NOT NULL COMMENT '纬度',
  `longitude` double NOT NULL COMMENT '经度',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '门店状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '自提门店';

-- ----------------------------
-- Records of trade_delivery_pick_up_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for trade_order
-- ----------------------------
DROP TABLE IF EXISTS `trade_order`;
CREATE TABLE `trade_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '订单流水号',
  `type` int NOT NULL DEFAULT 0 COMMENT '订单类型',
  `terminal` int NOT NULL COMMENT '订单来源终端',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `user_ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户 IP',
  `user_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户备注',
  `status` int NOT NULL DEFAULT 0 COMMENT '订单状态',
  `product_count` int NOT NULL COMMENT '购买的商品数量',
  `cancel_type` int NULL DEFAULT NULL COMMENT '取消类型',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商家备注',
  `comment_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否评价',
  `pay_order_id` bigint NULL DEFAULT NULL COMMENT '支付订单编号',
  `pay_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已支付：[0:未支付 1:已经支付过]',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '订单支付时间',
  `pay_channel_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '支付成功的支付渠道',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '订单完成时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '订单取消时间',
  `total_price` int NOT NULL DEFAULT 0 COMMENT '商品原价（总），单位：分',
  `discount_price` int NOT NULL DEFAULT 0 COMMENT '订单优惠（总），单位：分',
  `delivery_price` int NOT NULL DEFAULT 0 COMMENT '运费金额，单位：分',
  `adjust_price` int NOT NULL DEFAULT 0 COMMENT '订单调价（总），单位：分',
  `pay_price` int NOT NULL DEFAULT 0 COMMENT '应付金额（总），单位：分',
  `delivery_type` tinyint NOT NULL COMMENT '配送类型',
  `logistics_id` bigint NULL DEFAULT NULL COMMENT '发货物流公司编号',
  `logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '物流公司单号',
  `delivery_status` tinyint NOT NULL DEFAULT 0 COMMENT '发货状态',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `receiver_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人名称',
  `receiver_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人手机',
  `receiver_area_id` int NOT NULL COMMENT '收件人地区编号',
  `receiver_detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '收件人详细地址',
  `pick_up_store_id` tinyint NULL DEFAULT NULL COMMENT '自提门店编号',
  `refund_status` tinyint NOT NULL DEFAULT 0 COMMENT '售后状态',
  `refund_price` int NOT NULL DEFAULT 0 COMMENT '退款金额，单位：分',
  `coupon_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '优惠劵编号',
  `coupon_price` int NOT NULL DEFAULT 0 COMMENT '优惠劵减免金额，单位：分',
  `point_price` int NOT NULL DEFAULT 0 COMMENT '积分抵扣的金额',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单表';

-- ----------------------------
-- Records of trade_order
-- ----------------------------
BEGIN;
INSERT INTO `trade_order` (`id`, `no`, `type`, `terminal`, `user_id`, `user_ip`, `user_remark`, `status`, `product_count`, `cancel_type`, `remark`, `comment_status`, `pay_order_id`, `pay_status`, `pay_time`, `pay_channel_code`, `finish_time`, `cancel_time`, `total_price`, `discount_price`, `delivery_price`, `adjust_price`, `pay_price`, `delivery_type`, `logistics_id`, `logistics_no`, `delivery_status`, `delivery_time`, `receive_time`, `receiver_name`, `receiver_mobile`, `receiver_area_id`, `receiver_detail_address`, `pick_up_store_id`, `refund_status`, `refund_price`, `coupon_id`, `coupon_price`, `point_price`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (21, '1595061082189692928', 1, 10, 247, '127.0.0.1', '我是备注', 30, 1, NULL, '312312', b'1', NULL, b'1', NULL, 'wx_pub', NULL, NULL, 200, 0, 0, 0, 200, 2, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2022-11-22 22:26:11', '1', '2023-08-23 00:37:12', b'0', 1), (23, '1595067235174912000', 2, 11, 247, '127.0.0.1', '我是备注', 0, 1, NULL, NULL, b'0', 125, b'1', NULL, NULL, NULL, NULL, 200, 0, 0, 0, 200, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2022-11-22 22:50:38', '247', '2023-05-21 04:10:26', b'0', 1), (24, '1595061082189692928', 3, 10, 248, '127.0.0.1', '我是备注', 30, 1, NULL, NULL, b'0', NULL, b'0', NULL, 'wx_pub', NULL, NULL, 200, 0, 0, 0, 200, 2, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '248', '2022-12-13 22:26:11', '248', '2023-08-22 16:06:56', b'0', 1), (25, '1595067235174912000', 4, 11, 248, '127.0.0.1', '我是备注', 30, 1, NULL, NULL, b'0', 125, b'0', NULL, NULL, NULL, NULL, 200, 0, 0, 0, 200, 0, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '248', '2022-12-13 22:50:38', '248', '2023-05-20 03:05:00', b'0', 1), (29, '1664802570730221568', 0, 20, 247, '127.0.0.1', '我是备注', 0, 2, NULL, NULL, b'0', 172, b'0', NULL, NULL, NULL, NULL, 59800, 0, 0, 0, 59800, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 610632, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-06-03 09:13:58', '247', '2023-06-03 09:13:58', b'0', 1), (30, '1674807288407797760', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 173, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-06-30 23:49:09', '247', '2023-06-30 23:49:09', b'0', 1), (31, '1674814720739651584', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 174, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 2, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', 1, 0, 0, NULL, 0, 0, '247', '2023-07-01 00:18:41', '247', '2023-07-01 16:49:00', b'0', 1), (32, '1676241314821955584', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 175, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 22:47:27', '247', '2023-07-04 22:47:27', b'0', 1), (33, '1676248641276993536', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 176, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 23:16:34', '247', '2023-07-04 23:16:34', b'0', 1), (34, '1676248922656071680', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 177, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 23:17:41', '247', '2023-07-04 23:17:41', b'0', 1), (35, '1676254908489916416', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 178, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-04 23:41:28', '247', '2023-07-04 23:41:28', b'0', 1), (36, '1676610322305904640', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 179, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-05 23:13:45', '247', '2023-07-05 23:13:46', b'0', 1), (37, '1676790423029760000', 0, 20, 247, '39.144.104.107', NULL, 0, 1, NULL, NULL, b'0', 180, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 11:09:25', '247', '2023-07-06 11:09:25', b'0', 1), (38, '1676796859214413824', 0, 20, 247, '39.144.104.107', NULL, 0, 1, NULL, NULL, b'0', 181, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 11:34:59', '247', '2023-07-06 11:34:59', b'0', 1), (39, '1676813795272900608', 0, 20, 247, '39.144.105.28', NULL, 0, 1, NULL, NULL, b'0', 182, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 12:42:17', '247', '2023-07-06 12:42:17', b'0', 1), (40, '1676814319435071488', 0, 20, 247, '39.144.105.28', NULL, 0, 1, NULL, NULL, b'0', 183, b'0', NULL, NULL, NULL, NULL, 29900, 0, 0, 0, 29900, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 12:44:22', '247', '2023-07-06 12:44:22', b'0', 1), (41, '1676814748415901696', 0, 20, 247, '39.144.105.28', NULL, 0, 1, NULL, NULL, b'0', 184, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 12:46:04', '247', '2023-07-06 12:46:04', b'0', 1), (42, '1676842791880556544', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 185, b'0', NULL, NULL, NULL, NULL, 4, 0, 0, 0, 4, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 14:37:30', '247', '2023-07-06 14:37:31', b'0', 1), (43, '1676843246601830400', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 186, b'0', NULL, NULL, NULL, NULL, 4, 0, 0, 0, 4, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 14:39:19', '247', '2023-07-06 14:39:19', b'0', 1), (44, '1676848021946957824', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 187, b'0', NULL, NULL, NULL, NULL, 4, 0, 0, 0, 4, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 14:58:17', '247', '2023-07-06 14:58:18', b'0', 1), (45, '1676871394747936768', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 188, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 16:31:10', '247', '2023-07-06 16:31:10', b'0', 1), (46, '1676871891588411392', 0, 20, 247, '39.144.105.120', NULL, 0, 1, NULL, NULL, b'0', 189, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 16:33:08', '247', '2023-07-06 16:33:08', b'0', 1), (47, '1676878232700792832', 0, 20, 247, '39.144.104.41', NULL, 0, 1, NULL, NULL, b'0', 190, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 16:58:20', '247', '2023-07-06 16:58:20', b'0', 1), (48, '1676880606890766336', 0, 20, 247, '39.144.104.41', NULL, 0, 1, NULL, NULL, b'0', 191, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 17:07:46', '247', '2023-07-06 17:07:46', b'0', 1), (49, '1676883084608745472', 0, 20, 247, '39.144.104.41', NULL, 0, 1, NULL, NULL, b'0', 192, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 17:17:37', '247', '2023-07-06 17:17:37', b'0', 1), (50, '1676919023997497344', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 193, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 19:40:26', '247', '2023-07-06 19:40:26', b'0', 1), (51, '1676919030054072320', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 194, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 19:40:27', '247', '2023-07-06 19:40:27', b'0', 1), (52, '1676922590019923968', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 195, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 19:54:36', '247', '2023-07-06 19:54:36', b'0', 1), (53, '1676925756664918016', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 196, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:07:11', '247', '2023-07-06 20:07:11', b'0', 1), (54, '1676926752342355968', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 197, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:11:08', '247', '2023-07-06 20:11:08', b'0', 1), (55, '1676928765545361408', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 198, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:19:08', '247', '2023-07-06 20:19:08', b'0', 1), (56, '1676933108956868608', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 199, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:36:24', '247', '2023-07-06 20:36:24', b'0', 1), (57, '1676937622568992768', 0, 20, 247, '39.144.103.229', NULL, 0, 1, NULL, NULL, b'0', 200, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 20:54:20', '247', '2023-07-06 20:54:20', b'0', 1), (58, '1676974528767057920', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 201, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 23:20:59', '247', '2023-07-06 23:20:59', b'0', 1), (59, '1676974985623232512', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 202, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-06 23:22:48', '247', '2023-07-06 23:22:48', b'0', 1), (60, '1677531936589414400', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 203, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:15:55', '247', '2023-07-08 12:15:56', b'0', 1), (61, '1677534566103449600', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 204, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:26:22', '247', '2023-07-08 12:26:22', b'0', 1), (62, '1677535579870920704', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 205, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:30:24', '247', '2023-07-08 12:30:24', b'0', 1), (63, '1677536015713632256', 0, 20, 247, '114.86.74.143', NULL, 0, 1, NULL, NULL, b'0', 206, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-07-08 12:32:08', '247', '2023-07-08 12:32:08', b'0', 1), (64, '1690640279503245312', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 307, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 16:23:48', '247', '2023-08-13 16:23:48', b'0', 1), (65, '1690655525575987200', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 308, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 17:24:23', '247', '2023-08-13 17:24:23', b'0', 1), (66, '1690655769877417984', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 309, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 17:25:21', '247', '2023-08-13 17:25:21', b'0', 1), (67, '1690656217590009856', 0, 20, 247, '127.0.0.1', NULL, 10, 1, 20, NULL, b'0', 310, b'1', '2023-08-13 17:27:09', 'mock', NULL, '2023-08-18 15:07:04', 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 20, 42, NULL, 0, 0, '247', '2023-08-13 17:27:08', '1', '2023-08-18 15:07:04', b'0', 1), (68, '1690656420132950016', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 311, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 17:27:56', '247', '2023-08-13 17:27:56', b'0', 1), (69, '1690659233437192192', 0, 20, 247, '127.0.0.1', NULL, 0, 1, NULL, NULL, b'0', 312, b'0', NULL, NULL, NULL, NULL, 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 17:39:07', '247', '2023-08-13 17:39:07', b'0', 1), (70, '1690659326236168192', 0, 20, 247, '127.0.0.1', NULL, 30, 1, NULL, NULL, b'1', 313, b'1', '2023-08-13 17:39:30', 'mock', NULL, NULL, 6, 0, 0, 0, 6, 1, 1, '773220402764314', 0, NULL, '2023-08-13 20:22:53', 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 17:39:29', '247', '2023-08-15 04:37:18', b'0', 1), (71, '1690718626090459136', 0, 20, 247, '127.0.0.1', NULL, 30, 1, NULL, NULL, b'1', 314, b'1', '2023-08-13 21:35:09', 'mock', NULL, NULL, 6, 0, 0, 0, 6, 1, 4, '433239106979647', 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 21:35:07', '247', '2023-08-15 04:28:13', b'0', 1), (72, '1690718859084046336', 0, 20, 247, '127.0.0.1', NULL, 30, 1, NULL, NULL, b'1', 315, b'1', '2023-08-13 21:36:04', 'mock', NULL, NULL, 6, 0, 0, 0, 6, 1, 1, '773227873313167', 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 21:36:03', '247', '2023-08-14 01:26:51', b'0', 1), (73, '1690720321663041536', 0, 20, 247, '127.0.0.1', NULL, 30, 1, NULL, NULL, b'1', 316, b'1', '2023-08-13 21:41:54', 'mock', NULL, NULL, 6, 0, 0, 0, 6, 1, 3, 'LBX03200112943273221', 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-13 21:41:51', '247', '2023-08-14 01:24:52', b'0', 1), (74, '1692435420052332544', 0, 20, 247, '127.0.0.1', NULL, 30, 1, NULL, NULL, b'0', 317, b'1', '2023-08-18 15:17:10', 'mock', NULL, NULL, 5, 0, 0, 0, 5, 1, NULL, NULL, 0, NULL, '2023-08-18 19:30:51', 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-18 15:17:03', '247', '2023-08-18 19:30:51', b'0', 1), (75, '1692503226265624576', 0, 20, 247, '127.0.0.1', NULL, 10, 1, 20, NULL, b'0', 318, b'1', '2023-08-18 19:46:37', 'mock', NULL, '2023-08-31 19:56:21', 6, 0, 0, 0, 6, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 20, 6, NULL, 0, 0, '247', '2023-08-18 19:46:29', '1', '2023-08-31 19:56:21', b'0', 1), (78, '1696836867028389888', 0, 20, 247, '127.0.0.1', NULL, 10, 5, NULL, NULL, b'0', 319, b'1', '2023-08-30 18:46:52', 'mock', NULL, NULL, 27, 0, 0, 0, 27, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-30 18:46:49', NULL, '2023-08-30 18:46:52', b'0', 1), (79, '1696839430691844096', 0, 20, 247, '127.0.0.1', NULL, 0, 5, NULL, NULL, b'0', 320, b'0', NULL, NULL, NULL, NULL, 27, 0, 0, 0, 27, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-30 18:57:01', '247', '2023-08-30 18:57:01', b'0', 1), (80, '1697273902944288768', 0, 20, 247, '127.0.0.1', NULL, 10, 2, NULL, NULL, b'0', 321, b'1', '2023-08-31 23:43:29', 'mock', NULL, NULL, 699906, 0, 0, 0, 699906, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-31 23:43:27', NULL, '2023-08-31 23:43:29', b'0', 1), (81, '1697274609705484288', 0, 20, 247, '127.0.0.1', NULL, 10, 5, NULL, NULL, b'0', 322, b'1', '2023-08-31 23:46:17', 'mock', NULL, NULL, 2799606, 0, 0, 0, 2799606, 1, NULL, NULL, 0, NULL, NULL, 'yunai', '15601691300', 140302, '芋道源码 233 号 666 室', NULL, 0, 0, NULL, 0, 0, '247', '2023-08-31 23:46:15', NULL, '2023-08-31 23:46:17', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for trade_order_item
-- ----------------------------
DROP TABLE IF EXISTS `trade_order_item`;
CREATE TABLE `trade_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单项编号',
  `user_id` bigint UNSIGNED NOT NULL COMMENT '用户编号',
  `order_id` bigint UNSIGNED NOT NULL COMMENT '订单编号',
  `cart_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '购物车项编号',
  `spu_id` bigint UNSIGNED NOT NULL COMMENT '商品 SPU 编号',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '商品 SPU 名称',
  `sku_id` bigint UNSIGNED NOT NULL COMMENT '商品 SKU 编号',
  `properties` json NULL COMMENT '商品属性数组，JSON 格式',
  `pic_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '商品图片',
  `count` int NOT NULL COMMENT '购买数量',
  `comment_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否评价',
  `price` int NOT NULL DEFAULT 0 COMMENT '商品原价（单），单位：分',
  `discount_price` int NOT NULL DEFAULT 0 COMMENT '商品级优惠（总），单位：分',
  `delivery_price` int NOT NULL DEFAULT 0 COMMENT '运费金额，单位：分',
  `adjust_price` int NOT NULL DEFAULT 0 COMMENT '订单调价（总），单位：分',
  `pay_price` int NOT NULL DEFAULT 0 COMMENT '子订单实付金额（总），不算主订单分摊金额，单位：分',
  `coupon_price` int NOT NULL DEFAULT 0 COMMENT '优惠劵减免金额，单位：分',
  `point_price` int NOT NULL DEFAULT 0 COMMENT '积分抵扣的金额',
  `after_sale_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '售后订单编号',
  `after_sale_status` int NOT NULL DEFAULT 0 COMMENT '售后状态',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '交易订单明细表';

-- ----------------------------
-- Records of trade_order_item
-- ----------------------------
BEGIN;
INSERT INTO `trade_order_item` (`id`, `user_id`, `order_id`, `cart_id`, `spu_id`, `spu_name`, `sku_id`, `properties`, `pic_url`, `count`, `comment_status`, `price`, `discount_price`, `delivery_price`, `adjust_price`, `pay_price`, `coupon_price`, `point_price`, `after_sale_id`, `after_sale_status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 247, 21, 0, 10, '好利来', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/11/18/14/00/christmas-tree-7600201_640.jpg', 1, b'1', 200, 0, 0, 0, 200, 0, 0, NULL, 0, '247', '2022-11-22 22:26:15', '247', '2023-05-19 11:41:34', b'0', 1), (2, 247, 21, 0, 10, '好利来（测试）', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, NULL, 0, '247', '2022-11-22 22:26:15', '247', '2022-12-10 11:16:44', b'0', 1), (3, 247, 23, 0, 10, '好利来', 29, '[{\"valueId\": 4, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/12/06/06/21/lavender-7638368_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, NULL, 0, '247', '2022-11-22 22:50:39', '247', '2023-05-21 04:18:11', b'0', 1), (4, 248, 24, 0, 10, '好利来', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/11/18/14/00/christmas-tree-7600201_640.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, NULL, 0, '248', '2022-11-22 22:26:15', '248', '2022-12-13 17:50:27', b'0', 1), (5, 248, 24, 0, 10, '好利来（测试）', 29, '[{\"valueId\": 3, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, NULL, 0, '248', '2022-11-22 22:26:15', '248', '2022-12-13 17:50:31', b'0', 1), (6, 248, 25, 0, 10, '好利来', 29, '[{\"valueId\": 4, \"propertyId\": 2}]', 'https://cdn.pixabay.com/photo/2022/12/06/06/21/lavender-7638368_1280.jpg', 1, b'0', 200, 0, 0, 0, 200, 0, 0, NULL, 0, '248', '2022-11-22 22:50:39', '248', '2022-12-13 17:50:34', b'0', 1), (9, 247, 29, NULL, 102, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": null}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 2, b'0', 29900, 0, 0, 0, 59800, 0, 0, NULL, 0, '247', '2023-06-03 09:13:58', '247', '2023-06-03 09:13:58', b'0', 1), (10, 247, 30, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-06-30 23:49:09', '247', '2023-06-30 23:49:09', b'0', 1), (11, 247, 31, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-01 00:18:41', '247', '2023-07-01 00:18:41', b'0', 1), (12, 247, 32, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-04 22:47:27', '247', '2023-07-04 22:47:27', b'0', 1), (13, 247, 33, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-04 23:16:34', '247', '2023-07-04 23:16:34', b'0', 1), (14, 247, 34, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-04 23:17:41', '247', '2023-07-04 23:17:41', b'0', 1), (15, 247, 35, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-04 23:41:28', '247', '2023-07-04 23:41:28', b'0', 1), (16, 247, 36, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-05 23:13:45', '247', '2023-07-05 23:13:45', b'0', 1), (17, 247, 37, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-06 11:09:25', '247', '2023-07-06 11:09:25', b'0', 1), (18, 247, 38, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-06 11:34:59', '247', '2023-07-06 11:34:59', b'0', 1), (19, 247, 39, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-06 12:42:17', '247', '2023-07-06 12:42:17', b'0', 1), (20, 247, 40, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 29900, 0, 0, 0, 29900, 0, 0, NULL, 0, '247', '2023-07-06 12:44:22', '247', '2023-07-06 12:44:22', b'0', 1), (21, 247, 41, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 12:46:04', '247', '2023-07-06 12:46:04', b'0', 1), (22, 247, 42, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, NULL, 0, '247', '2023-07-06 14:37:31', '247', '2023-07-06 14:37:31', b'0', 1), (23, 247, 43, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, NULL, 0, '247', '2023-07-06 14:39:19', '247', '2023-07-06 14:39:19', b'0', 1), (24, 247, 44, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, NULL, 0, '247', '2023-07-06 14:58:17', '247', '2023-07-06 14:58:17', b'0', 1), (25, 247, 45, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 16:31:10', '247', '2023-07-06 16:31:10', b'0', 1), (26, 247, 46, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 16:33:08', '247', '2023-07-06 16:33:08', b'0', 1), (27, 247, 47, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 16:58:20', '247', '2023-07-06 16:58:20', b'0', 1), (28, 247, 48, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 17:07:46', '247', '2023-07-06 17:07:46', b'0', 1), (29, 247, 49, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 17:17:37', '247', '2023-07-06 17:17:37', b'0', 1), (30, 247, 50, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 19:40:26', '247', '2023-07-06 19:40:26', b'0', 1), (31, 247, 51, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 19:40:27', '247', '2023-07-06 19:40:27', b'0', 1), (32, 247, 52, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 19:54:36', '247', '2023-07-06 19:54:36', b'0', 1), (33, 247, 53, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 20:07:11', '247', '2023-07-06 20:07:11', b'0', 1), (34, 247, 54, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 20:11:08', '247', '2023-07-06 20:11:08', b'0', 1), (35, 247, 55, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 20:19:08', '247', '2023-07-06 20:19:08', b'0', 1), (36, 247, 56, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 20:36:24', '247', '2023-07-06 20:36:24', b'0', 1), (37, 247, 57, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 20:54:20', '247', '2023-07-06 20:54:20', b'0', 1), (38, 247, 58, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 23:20:59', '247', '2023-07-06 23:20:59', b'0', 1), (39, 247, 59, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-06 23:22:48', '247', '2023-07-06 23:22:48', b'0', 1), (40, 247, 60, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-08 12:15:55', '247', '2023-07-08 12:15:55', b'0', 1), (41, 247, 61, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-08 12:26:22', '247', '2023-07-08 12:26:22', b'0', 1), (42, 247, 62, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-08 12:30:24', '247', '2023-07-08 12:30:24', b'0', 1), (43, 247, 63, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-07-08 12:32:08', '247', '2023-07-08 12:32:08', b'0', 1), (44, 247, 64, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 16:23:48', '247', '2023-08-13 16:23:48', b'0', 1), (45, 247, 65, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 17:24:23', '247', '2023-08-13 17:24:23', b'0', 1), (46, 247, 66, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 17:25:21', '247', '2023-08-13 17:25:21', b'0', 1), (47, 247, 67, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 6, 20, '247', '2023-08-13 17:27:08', '1', '2023-08-18 15:07:04', b'0', 1), (48, 247, 68, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 17:27:56', '247', '2023-08-13 17:27:56', b'0', 1), (49, 247, 69, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 17:39:07', '247', '2023-08-13 17:39:07', b'0', 1), (50, 247, 70, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'1', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 17:39:29', '247', '2023-08-13 21:34:48', b'0', 1), (51, 247, 71, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'1', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 21:35:07', '247', '2023-08-13 21:35:32', b'0', 1), (52, 247, 72, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'1', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 21:36:03', '247', '2023-08-13 21:41:40', b'0', 1), (53, 247, 73, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'1', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-13 21:41:51', '247', '2023-08-13 22:01:36', b'0', 1), (54, 247, 74, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 2, '[{\"valueId\": 6, \"valueName\": \"蓝色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 5, 0, 0, 0, 5, 0, 0, 7, 10, '247', '2023-08-18 15:17:03', '247', '2023-08-18 15:20:32', b'0', 1), (55, 247, 75, NULL, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, 8, 20, '247', '2023-08-18 19:46:29', '1', '2023-08-31 19:56:20', b'0', 1), (62, 247, 78, 63, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, NULL, 0, '247', '2023-08-30 18:46:50', '247', '2023-08-30 18:46:50', b'0', 1), (63, 247, 78, 62, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 2, '[{\"valueId\": 6, \"valueName\": \"蓝色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 5, 0, 0, 0, 5, 0, 0, NULL, 0, '247', '2023-08-30 18:46:50', '247', '2023-08-30 18:46:50', b'0', 1), (64, 247, 78, 61, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 3, b'0', 6, 0, 0, 0, 18, 0, 0, NULL, 0, '247', '2023-08-30 18:46:50', '247', '2023-08-30 18:46:50', b'0', 1), (65, 247, 79, 63, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 3, '[{\"valueId\": 7, \"valueName\": \"白色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 4, 0, 0, 0, 4, 0, 0, NULL, 0, '247', '2023-08-30 18:57:01', '247', '2023-08-30 18:57:01', b'0', 1), (66, 247, 79, 62, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 2, '[{\"valueId\": 6, \"valueName\": \"蓝色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 5, 0, 0, 0, 5, 0, 0, NULL, 0, '247', '2023-08-30 18:57:01', '247', '2023-08-30 18:57:01', b'0', 1), (67, 247, 79, 61, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://demo26.crmeb.net/uploads/attach/2021/11/15/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 3, b'0', 6, 0, 0, 0, 18, 0, 0, NULL, 0, '247', '2023-08-30 18:57:01', '247', '2023-08-30 18:57:01', b'0', 1), (68, 247, 80, 65, 634, 'HUAWEI Mate 60 Pro', 14, '[{\"valueId\": 18, \"valueName\": \"雅丹黑\", \"propertyId\": 1, \"propertyName\": \"颜色\"}]', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/49009b73d392657c85bed2e82e22b09720e7c68466b8565c8b2f6c00e03b705e.jpg', 1, b'0', 699900, 0, 0, 0, 699900, 0, 0, NULL, 0, '247', '2023-08-31 23:43:27', '247', '2023-08-31 23:43:27', b'0', 1), (69, 247, 80, 64, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-31 23:43:27', '247', '2023-08-31 23:43:27', b'0', 1), (70, 247, 81, 70, 633, '索尼（SONY）WH-CH510 无线立体声耳机 学生网课 白色', 1, '[{\"valueId\": 5, \"valueName\": \"黑色\", \"propertyId\": 1, \"propertyName\": \"颜色\"}, {\"valueId\": 8, \"valueName\": \"CH510\", \"propertyId\": 3, \"propertyName\": \"版本\"}]', 'https://static.iocoder.cn/mall/a79f5d2ea6bf0c3c11b2127332dfe2df.jpg', 1, b'0', 6, 0, 0, 0, 6, 0, 0, NULL, 0, '247', '2023-08-31 23:46:15', '247', '2023-08-31 23:46:15', b'0', 1), (71, 247, 81, 69, 634, 'HUAWEI Mate 60 Pro', 17, '[{\"valueId\": 21, \"valueName\": \"南糯紫\", \"propertyId\": 1, \"propertyName\": \"颜色\"}]', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/23c7564ad843c326296c17c16dd1d2749a421ae81c416fe9e94fb1d310c02ed5.jpg', 1, b'0', 699900, 0, 0, 0, 699900, 0, 0, NULL, 0, '247', '2023-08-31 23:46:15', '247', '2023-08-31 23:46:15', b'0', 1), (72, 247, 81, 68, 634, 'HUAWEI Mate 60 Pro', 16, '[{\"valueId\": 20, \"valueName\": \"白沙银\", \"propertyId\": 1, \"propertyName\": \"颜色\"}]', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/44c8288cd79d2e7df3a80244e519e5fd98c43c9264335f0cbe2fda2445198e45.jpg', 1, b'0', 699900, 0, 0, 0, 699900, 0, 0, NULL, 0, '247', '2023-08-31 23:46:15', '247', '2023-08-31 23:46:15', b'0', 1), (73, 247, 81, 67, 634, 'HUAWEI Mate 60 Pro', 15, '[{\"valueId\": 19, \"valueName\": \"雅川青\", \"propertyId\": 1, \"propertyName\": \"颜色\"}]', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/3661b4ca3b922d31bef4440a7d68f9112b8f529ba160b3278bb0b5158384abf6.jpg', 1, b'0', 699900, 0, 0, 0, 699900, 0, 0, NULL, 0, '247', '2023-08-31 23:46:15', '247', '2023-08-31 23:46:15', b'0', 1), (74, 247, 81, 66, 634, 'HUAWEI Mate 60 Pro', 14, '[{\"valueId\": 18, \"valueName\": \"雅丹黑\", \"propertyId\": 1, \"propertyName\": \"颜色\"}]', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/49009b73d392657c85bed2e82e22b09720e7c68466b8565c8b2f6c00e03b705e.jpg', 1, b'0', 699900, 0, 0, 0, 699900, 0, 0, NULL, 0, '247', '2023-08-31 23:46:15', '247', '2023-08-31 23:46:15', b'0', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
