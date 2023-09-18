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
-- Table structure for training_store
-- ----------------------------
DROP TABLE IF EXISTS `training_store`;
CREATE TABLE `training_store` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '门店编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '门店名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '门店手机号',
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '门店地址',
  `longitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '纬度',
  `logo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '门店logo',
  `images` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '门店图片',
  `introduce` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '门店介绍',
  `notice` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '门店公告',
  `business_hours` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '营业时间',
  `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '门店状态',
  `recommend` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否推荐',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='门店表';

-- ----------------------------
-- Records of training_store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for training_coach
-- ----------------------------
DROP TABLE IF EXISTS `training_coach`;
CREATE TABLE `training_coach`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教练编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '教练名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练手机号',
  `avatar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练头像',
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练级别',
  `images` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练图片',
  `label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练标签',
  `introduce` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练介绍',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '授课单价',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `recommend` bit(1) NOT NULL DEFAULT b'0' COMMENT '推荐',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '教练表';

-- ----------------------------
-- Records of training_coach
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for training_student
-- ----------------------------
DROP TABLE IF EXISTS `training_student`;
CREATE TABLE `training_student`  (
   `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
   `store_id` bigint DEFAULT NULL COMMENT '门店ID',
   `coach_id` bigint DEFAULT NULL COMMENT '教练ID',
   `member_id` bigint DEFAULT NULL COMMENT '会员ID',
   `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '姓名',
   `avatar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
   `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
   `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
   `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
   `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
   `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '学员表';

-- ----------------------------
-- Records of training_student
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gw_coach_store
-- ----------------------------
DROP TABLE IF EXISTS `gw_coach_store`;
CREATE TABLE `train_store`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '教练门店编号',
  `id` bigint NOT NULL COMMENT '教练编号',
  `id` bigint NOT NULL COMMENT '门店编号',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '授课单价',
  `label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练标签',
  `time` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教练时间',
  `status` bit(1) NOT NULL COMMENT '状态',
  `recommend` bit(1) NOT NULL COMMENT '推荐', 
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '教练表';

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '班型表';

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
  `class_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `id` bigint NOT NULL COMMENT '门店编号',
  `class_type_id` bigint NOT NULL COMMENT '班型编号',
  `class_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '班型价格',
  `class_label` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型标签',
  `class_time` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '班型时间',
  `class_status` bit(1) NOT NULL COMMENT '状态',
  `class_recommend` bit(1) NOT NULL COMMENT '推荐', 
  `class_sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '班型表';

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
  `id` bigint NOT NULL COMMENT '教练编号',
  `member_id` bigint NOT NULL COMMENT '用户编号',
  `id` bigint NOT NULL COMMENT '门店编号',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '教练表';

-- ----------------------------
-- Records of train_store
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- Table structure for training_classes
-- ----------------------------
DROP TABLE IF EXISTS `training_classes`;
CREATE TABLE `training_classes`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `store_id` bigint(0) DEFAULT NULL COMMENT '门店ID',
  `coach_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '教练编号',
  `start_date` datetime(0) DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime(0) DEFAULT NULL COMMENT '结束日期',
  `day` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '周几',
  `start_time` datetime(0) DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) DEFAULT NULL COMMENT '结束时间',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '类型',
  `extend` json COMMENT '扩展属性',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '租户编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_name`(`name`, `update_time`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '班级信息表' ROW_FORMAT = Dynamic;