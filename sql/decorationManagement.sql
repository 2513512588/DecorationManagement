/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : decorationmanagement

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 14/02/2021 20:57:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE decorationmanagement;
USE decorationmanagement;
-- ----------------------------
-- Table structure for sys_designer
-- ----------------------------
DROP TABLE IF EXISTS `sys_designer`;
CREATE TABLE `sys_designer`  (
  `id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '@desc 主键id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '@desc 设计师 名字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `cover` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_designer
-- ----------------------------
INSERT INTO `sys_designer` VALUES ('99123071083872281', 'Sheila Schroeder', 'Ut voluptatibus aute', '2021-02-14 20:19:14', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/b5958abfc25e48a6ac036254de43cf18');
INSERT INTO `sys_designer` VALUES ('99123071083872282', 'Nehru Lawrence', 'Incididunt eiusmod i', '2021-02-14 20:20:25', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/66bcf1de309040af9df7ba4e09377049');
INSERT INTO `sys_designer` VALUES ('99123071083872283', 'Regina Castro', 'Magnam iste in vel d', '2021-02-14 20:20:52', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/d7f25e65baf64d488859c50619cd7a99');

-- ----------------------------
-- Table structure for sys_materials_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_materials_group`;
CREATE TABLE `sys_materials_group`  (
  `id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `group_id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `designer_id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_materials_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order`  (
  `id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `material_group_id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` decimal(10, 2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_scar
-- ----------------------------
DROP TABLE IF EXISTS `sys_scar`;
CREATE TABLE `sys_scar`  (
  `id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `materials_group_id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_scar
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `balance` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `enable` tinyint(1) NOT NULL DEFAULT 1,
  `regtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('99123071083872281', 'User1', '$2a$10$1maFrONfZkk1IFXAJl6b9eFe80P5hWV6dSf6TjMDuh7swSn3RbuFa', 0.00, 1, '2021-02-14 20:19:15');
INSERT INTO `sys_user` VALUES ('99123071083872282', 'zupuca', '$2a$10$7qYwNrbsf3wgHOrlBBHYMOc7vTuzHtxuqJ/xKtYzWc3VBMSUby5pW', 0.00, 1, '2021-02-14 20:20:25');
INSERT INTO `sys_user` VALUES ('99123071083872283', 'pyqixiruzo', '$2a$10$XlTnmUGI0eZsSWHZ6Vrf9.7X2zc.iVSH2YBjPwa.lnjRSnGCes3YK', 0.00, 1, '2021-02-14 20:20:52');

SET FOREIGN_KEY_CHECKS = 1;
