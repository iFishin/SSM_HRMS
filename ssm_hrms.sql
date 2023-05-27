/*
 Navicat Premium Data Transfer

 Source Server         : 本地服务器
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : ssm_hrms

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/05/2023 14:55:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `dept_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dept_leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES (1, '技术部门', 'Fish');
INSERT INTO `tbl_dept` VALUES (2, '摸鱼部门', 'Fish');
INSERT INTO `tbl_dept` VALUES (3, '修仙部门', '鱼头头');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp`  (
  `emp_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `emp_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gender` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `department_id` int NOT NULL DEFAULT 10000,
  PRIMARY KEY (`emp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES (1, '鱼宝', '2079797279@qq.com', 'M', 1);
INSERT INTO `tbl_emp` VALUES (2, '珍珠鱼', '123@qq.com', 'F', 2);
INSERT INTO `tbl_emp` VALUES (3, '鲤鱼', '123@qq.com', 'F', 2);
INSERT INTO `tbl_emp` VALUES (4, '爱吃鱼头头', '2079797279@qq.com', 'M', 3);
INSERT INTO `tbl_emp` VALUES (5, 'catFish', '2079797279@qq.com', 'M', 3);
INSERT INTO `tbl_emp` VALUES (6, 'swordFish', '2079797279@qq.com', 'M', 1);
INSERT INTO `tbl_emp` VALUES (7, 'goldFish', '2079797279@qq.com', 'M', 2);
INSERT INTO `tbl_emp` VALUES (8, 'jellyFish', '2079797279@qq.com', 'F', 2);
INSERT INTO `tbl_emp` VALUES (9, 'angelFish', '123@qq.com', 'F', 3);
INSERT INTO `tbl_emp` VALUES (10, 'starFish', '1234@gmail.com', 'F', 2);
INSERT INTO `tbl_emp` VALUES (11, 'clownFish', '333@gmail.com', 'M', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'fish', '2079797279@qq.com', '2023-05-24 19:24:36', '2023-05-27 13:35:50');
INSERT INTO `user` VALUES (2, 'iFishing', 'fish', '2802151862@qq.com', '2023-05-24 19:25:02', '2023-05-27 13:37:01');

SET FOREIGN_KEY_CHECKS = 1;
