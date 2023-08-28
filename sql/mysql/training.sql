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

 Date: 20/08/2023 20:49:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for train_store
-- ----------------------------
DROP TABLE IF EXISTS `train_store`;
CREATE TABLE `train_store`  (
  `store_id` bigint NOT NULL AUTO_INCREMENT COMMENT '门店编号',
  `store_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '门店名称',
  `store_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '门店手机号',
  `store_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '门店地址',
  `store_longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '经度',
  `store_latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '纬度',
  `store_logo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '门店logo',
  `store_images` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '门店图片',
  `store_introduce` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '门店介绍',
  `store_notice` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '门店公告',
  `store_business_hours` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT NULL COMMENT '营业时间',
  `store_sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `store_status` bit(1) NOT NULL COMMENT '门店状态',
  `store_recommend` bit(1) NOT NULL COMMENT '是否推荐', 
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '门店表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for train_coach
-- ----------------------------
DROP TABLE IF EXISTS `train_coach`;
CREATE TABLE `train_coach`  (
  `coach_id` bigint NOT NULL AUTO_INCREMENT COMMENT '教练编号',
  `coach_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '教练名称',
  `coach_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练手机号',
  `coach_avatar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练头像',
  `coach_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练级别',
  `coach_images` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练图片',
  `coach_label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练标签',
  `coach_introduce` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练介绍',
  `coach_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '授课单价',
  `coach_status` bit(1) NOT NULL COMMENT '状态',
  `coach_recommend` bit(1) NOT NULL COMMENT '推荐', 
  `coach_sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '教练表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for train_coach
-- ----------------------------
DROP TABLE IF EXISTS `train_coach_store`;
CREATE TABLE `train_coach_store`  (
  `coach_store_id` bigint NOT NULL AUTO_INCREMENT COMMENT '教练门店编号',
  `coach_id` bigint NOT NULL COMMENT '教练编号',
  `store_id` bigint NOT NULL COMMENT '门店编号',
  `coach_store_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '授课单价',
  `coach_store_label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练标签',
  `coach_store_time` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练时间',
  `coach_store_status` bit(1) NOT NULL COMMENT '状态',
  `coach_store_recommend` bit(1) NOT NULL COMMENT '推荐', 
  `coach_store_sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '教练表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for train_class_type
-- ----------------------------
DROP TABLE IF EXISTS `train_class_type`;
CREATE TABLE `train_class_type`  (
  `class_type_id` bigint NOT NULL AUTO_INCREMENT COMMENT '班型编号',
  `class_type_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '班型名称',
  `class_type_introduce` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型介绍',
  `class_type_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '班型价格',
  `class_type_images` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型图片',
  `class_type_label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型标签',
  `class_type_time` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型时间',
  `class_type_status` bit(1) NOT NULL COMMENT '状态',
  `class_type_recommend` bit(1) NOT NULL COMMENT '推荐', 
  `class_type_sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '班型表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for train_class_store
-- ----------------------------
DROP TABLE IF EXISTS `train_class_store`;
CREATE TABLE `train_class_store`  (
  `class_store_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `store_id` bigint NOT NULL COMMENT '门店编号',
  `class_type_id` bigint NOT NULL COMMENT '班型编号',
  `class_store_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '班型价格',
  `class_store_label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型标签',
  `class_store_time` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型时间',
  `class_store_status` bit(1) NOT NULL COMMENT '状态',
  `class_store_recommend` bit(1) NOT NULL COMMENT '推荐', 
  `class_store_sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '班型表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;


-- ----------------------------
-- Table structure for train_reservation
-- ----------------------------
DROP TABLE IF EXISTS `train_reservation`;
CREATE TABLE `train_reservation`  (
  `reservation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '预约编号',
  /*预约教练*/
  `coach_id` bigint NOT NULL COMMENT '教练编号',
  `member_id` bigint NOT NULL COMMENT '用户编号',
  `store_id` bigint NOT NULL COMMENT '门店编号',
  `class_id` bigint NOT NULL COMMENT '班级编号',
  `reservation_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '预约时间',
  `reservation_status` bit(1) NOT NULL COMMENT '状态',
  `reservation_remark` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '教练表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
