/*
 Navicat Premium Data Transfer

 Source Server         : localhost-test
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 09/11/2017 16:40:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values`  (
  `id` int(10) NOT NULL,
  `att_id` int(10) NOT NULL AUTO_INCREMENT,
  `value` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` double(10, 0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `att_id`(`att_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------
INSERT INTO `attribute_values` VALUES (1, 1, 'Зеленый', 40);
INSERT INTO `attribute_values` VALUES (2, 1, 'Красный', 45);
INSERT INTO `attribute_values` VALUES (3, 1, 'Синий', 35);

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int(10) NOT NULL,
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES (1, 'цвет');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `n`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Шарф', 5);
INSERT INTO `products` VALUES (2, 'Шапка', 6);

-- ----------------------------
-- Table structure for relations
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations`  (
  `id_products` int(10) NOT NULL,
  `id_attributes` int(10) NOT NULL,
  `id_attributes_value` int(10) NOT NULL,
  INDEX `Fk_id-p-1`(`id_products`) USING BTREE,
  INDEX `Fk_id-p-2`(`id_attributes`) USING BTREE,
  INDEX `Fk_id-p-3`(`id_attributes_value`) USING BTREE,
  CONSTRAINT `Fk_id-p-1` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_id-p-2` FOREIGN KEY (`id_attributes`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Fk_id-p-3` FOREIGN KEY (`id_attributes_value`) REFERENCES `attribute_values` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relations
-- ----------------------------
INSERT INTO `relations` VALUES (1, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
