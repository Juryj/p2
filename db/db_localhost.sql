/*
 Navicat Premium Data Transfer

 Source Server         : localhost-test
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : db_localhost

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 21/11/2017 21:51:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES (1, 'Цвет');
INSERT INTO `attributes` VALUES (2, 'Размер');

-- ----------------------------
-- Table structure for attributes_values
-- ----------------------------
DROP TABLE IF EXISTS `attributes_values`;
CREATE TABLE `attributes_values`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `value` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attributes_values
-- ----------------------------
INSERT INTO `attributes_values` VALUES (1, 'Зеленый');
INSERT INTO `attributes_values` VALUES (2, 'Красный');
INSERT INTO `attributes_values` VALUES (3, 'Синий');
INSERT INTO `attributes_values` VALUES (4, '40');
INSERT INTO `attributes_values` VALUES (5, '41');
INSERT INTO `attributes_values` VALUES (6, '42');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Шапка', 5);
INSERT INTO `products` VALUES (2, 'Шарф', 6);

-- ----------------------------
-- Table structure for relations
-- ----------------------------
DROP TABLE IF EXISTS `relations`;
CREATE TABLE `relations`  (
  `id_products` int(10) NULL DEFAULT NULL,
  `id_attributes` int(10) NULL DEFAULT NULL,
  `id_attributes_values` int(10) NULL DEFAULT NULL,
  INDEX `id_products`(`id_products`) USING BTREE,
  INDEX `id_attributes`(`id_attributes`) USING BTREE,
  INDEX `id_attributes_values`(`id_attributes_values`) USING BTREE,
  CONSTRAINT `relations_ibfk_1` FOREIGN KEY (`id_products`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relations_ibfk_2` FOREIGN KEY (`id_attributes`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relations_ibfk_3` FOREIGN KEY (`id_attributes_values`) REFERENCES `attributes_values` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relations
-- ----------------------------
INSERT INTO `relations` VALUES (1, 2, 4);
INSERT INTO `relations` VALUES (2, 1, 1);
INSERT INTO `relations` VALUES (1, 2, 1);
INSERT INTO `relations` VALUES (1, 1, 2);
INSERT INTO `relations` VALUES (1, 1, 3);
INSERT INTO `relations` VALUES (1, 2, 5);
INSERT INTO `relations` VALUES (1, 2, 6);

SET FOREIGN_KEY_CHECKS = 1;
