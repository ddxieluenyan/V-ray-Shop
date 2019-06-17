/*
 Navicat Premium Data Transfer

 Source Server         : Local-MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : vray_shop

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 17/06/2019 21:11:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections`  (
  `user_id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commodities
-- ----------------------------
DROP TABLE IF EXISTS `commodities`;
CREATE TABLE `commodities`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `type_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品类别ID',
  `picture` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品详情页里的图片的链接',
  `thumbnail` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '在商品列表中显示的图片的链接',
  `is_mapped` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否有贴图，1是有，0是没有',
  `price` smallint(6) NOT NULL DEFAULT 0 COMMENT '价格，以分为单位',
  `file` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文件链接/路径',
  `size` smallint(6) NOT NULL DEFAULT 0 COMMENT '文件大小，以0.01M为单位',
  `is_sales` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否上架，1是上架，0是下架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commodity_types
-- ----------------------------
DROP TABLE IF EXISTS `commodity_types`;
CREATE TABLE `commodity_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品类型的ID',
  `name` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品类型的名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for purchase_histories
-- ----------------------------
DROP TABLE IF EXISTS `purchase_histories`;
CREATE TABLE `purchase_histories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` int(11) NOT NULL COMMENT '购买用户ID',
  `commodity_id` int(11) NOT NULL COMMENT '商品ID',
  `price` int(10) UNSIGNED NOT NULL COMMENT '商品价格（以分为单位）',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '购买时间（自动生成不用传入）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `phone_number` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `token` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '记录一次登录的token',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
