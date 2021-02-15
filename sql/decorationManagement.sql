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

 Date: 15/02/2021 09:44:12
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
INSERT INTO `sys_designer` VALUES ('99123071083872290', 'Harlan', 'Eveniet et aut odit', '2021-02-14 22:10:42', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/dd1194fc77e943fb9beb4b491bc1b899');
INSERT INTO `sys_designer` VALUES ('99123071083872291', 'Kylee Chapman', 'Eveniet perspiciati', '2021-02-14 22:44:32', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/658d920208b24774a8eae2ebd67af65f');
INSERT INTO `sys_designer` VALUES ('99123071083872292', 'Ori Kelly', 'Cumque aspernatur en', '2021-02-14 22:44:43', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/70a795791c7843f2afb900c99f9d48ce');
INSERT INTO `sys_designer` VALUES ('99123071083872293', 'Neve Fitzgerald', 'Illo dolor nemo saep', '2021-02-14 22:45:00', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/108dc1f5e94545adb196ca8c35803131');
INSERT INTO `sys_designer` VALUES ('99123071083872294', 'Uma Carr', 'Est provident qui ', '2021-02-14 22:45:12', 'https://decoration01.oss-cn-shenzhen.aliyuncs.com/75cff8cafb074e1f9cccf5970abc3ee8');

-- ----------------------------
-- Table structure for sys_materials_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_materials_group`;
CREATE TABLE `sys_materials_group`  (
  `id` char(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
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
INSERT INTO `sys_user` VALUES ('99123071083872281', 'UserTest', '$2a$10$rlwcef65AdEpKGa0kDgvTeLdZbLeDwgDDEEPQO.NHdFszm8bkOrba', 0.00, 1, '2021-02-14 20:19:15');
INSERT INTO `sys_user` VALUES ('99123071083872282', 'zupuca', '$2a$10$7qYwNrbsf3wgHOrlBBHYMOc7vTuzHtxuqJ/xKtYzWc3VBMSUby5pW', 0.00, 1, '2021-02-14 20:20:25');
INSERT INTO `sys_user` VALUES ('99123071083872286', 'cikulomele', '$2a$10$c.OH6ea1d4X.ZyN19xfo3Obn/7zmahOl3Nns.DCEJU27SgsjVmXnm', 0.00, 1, '2021-02-14 22:09:51');
INSERT INTO `sys_user` VALUES ('99123071083872287', 'zusovone', '$2a$10$BuoLmKosuAMFAwQeHj9J3uEu7sgMdr9CoRwa1zahcIkd4wb10BcUq', 0.00, 1, '2021-02-14 22:09:58');
INSERT INTO `sys_user` VALUES ('99123071083872288', 'zomihy', '$2a$10$Glf4a.qEMrkqnas/Jlns3.NWhL5HLiKo4Qitttf84oIZkqXAeaB1m', 0.00, 1, '2021-02-14 22:10:04');
INSERT INTO `sys_user` VALUES ('99123071083872289', 'sopedam', '$2a$10$pYqtb/AVtcFzXxwXYyRhfOmG6WNioB9i/d/9c.8mpWVIrTYnBOBlG', 0.00, 1, '2021-02-14 22:10:11');
INSERT INTO `sys_user` VALUES ('99123071083872290', 'xabuvokyny', '$2a$10$B70pZ8p0YfsG6VKly1ptnOjyUXT81G8t1EqvVJTS/cY.HOIlyyL0i', 0.00, 0, '2021-02-14 22:10:42');
INSERT INTO `sys_user` VALUES ('99123071083872291', 'fefiwofudo', '$2a$10$erY3mDGQd.gN0XNVhz0Z9O2ZClcY2YOyTimJFwqEEK00tl8Z/Zyjy', 0.00, 1, '2021-02-14 22:44:32');
INSERT INTO `sys_user` VALUES ('99123071083872292', 'xucigyxi', '$2a$10$QF1yMuGS5krJqoN7yFDqT.uPULnGCSxsJrUu7Lg5uxx9CWIEZM6bK', 0.00, 1, '2021-02-14 22:44:43');
INSERT INTO `sys_user` VALUES ('99123071083872293', 'zuxajaqeve', '$2a$10$MddZPOogcoTZ9ccCNGC93.Go8C/zZrkv9zZJtIuXD3aIoGD1.8rAC', 0.00, 1, '2021-02-14 22:45:00');
INSERT INTO `sys_user` VALUES ('99123071083872294', 'hufalu', '$2a$10$jF05HnaX7Ugt7L9t1tzgrOoAm.c3Mn1tCgZ7P4WqZDysltTGtnBtS', 0.00, 1, '2021-02-14 22:45:12');

SET FOREIGN_KEY_CHECKS = 1;
