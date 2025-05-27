/*
 Navicat Premium Data Transfer

 Source Server         : mydatabase
 Source Server Type    : MySQL
 Source Server Version : 90200
 Source Host           : localhost:3306
 Source Schema         : admin-demo

 Target Server Type    : MySQL
 Target Server Version : 90200
 File Encoding         : 65001

 Date: 27/05/2025 17:03:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `en` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Employee No',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `en` (`en`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (6, 'aaa', '333', 'ADMIN', 'ad王幺妹', '7', 'http://localhost:8080/files/download/eb710c28-3b78-485c-b9ce-107840cb8c96.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (7, 'aab', '123', 'ADMIN', 'ad张三', '8', 'http://localhost:8080/files/download/00d6b84b-855e-4aca-ac32-d8cd103d0547.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (8, 'aac', '123', 'ADMIN', 'ad张三5', '9', 'http://localhost:8080/files/download/19eeee10-404f-4065-8e45-1f5b7304186b.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (9, 'aad', '123', 'ADMIN', 'adligang5', '10', 'http://localhost:8080/files/download/19eeee10-404f-4065-8e45-1f5b7304186b.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (10, 'aae', '123', 'ADMIN', 'adligang5', '11', 'http://localhost:8080/files/download/a24f0789-c9ce-4655-8d0e-794ef7cbb225.png');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (11, 'aaf', '123', 'ADMIN', 'adwjl5', '12', 'http://localhost:8080/files/download/922b48fe-96f0-4660-affe-77e413b3f0bf.jpeg');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (15, 'aai', '123', 'ADMIN', 'ad王幺妹5', '17', 'http://localhost:8080/files/download/a24f0789-c9ce-4655-8d0e-794ef7cbb225.png');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (47, 'bba', '123', 'ADMIN', '李小天', '1347', 'http://localhost:8080/files/download/1c50338a-5040-4cf9-acec-392a9bfd75b5.png');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (48, 'lixiaolong', '123', 'ADMIN', '李小龙', '12345', 'http://localhost:8080/files/download/a24f0789-c9ce-4655-8d0e-794ef7cbb225.png');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (49, 'maozedong', '123', 'ADMIN', '毛泽东', '12371', 'http://localhost:8080/files/download/a24f0789-c9ce-4655-8d0e-794ef7cbb225.png');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` (`id`, `name`) VALUES (1, '市场部');
INSERT INTO `department` (`id`, `name`) VALUES (2, '销售部');
INSERT INTO `department` (`id`, `name`) VALUES (3, '软件部');
INSERT INTO `department` (`id`, `name`) VALUES (4, '总裁办');
INSERT INTO `department` (`id`, `name`) VALUES (5, '工程部');
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Employee No',
  `age` int DEFAULT NULL COMMENT '年龄',
  `descr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `department` int DEFAULT NULL COMMENT '所在部门',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `en` (`en`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (6, 'aaa', '333', 'EMP', '王幺妹', '女', '7', 31, '昨晚吃过晚饭后，老婆说明天约了其发小，打算去周边某网红打卡点，我听了颇感意料，想想后也在情理之中。之情听她提起过几个景点，网红打卡点便是其一。', 2, 'http://localhost:8080/files/download/7ee9b39e-82a5-40ea-9cdf-beb115bea189.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (7, 'aab', '123', 'EMP', '张三', '男', '8', 44, '张三', 2, 'http://localhost:8080/files/download/ec6b2297-fe17-4f08-a680-85288da288a7.jpeg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (8, 'aac', '123', 'EMP', '张三5', '男', '9', 44, '张三', 2, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (9, 'aad', '123', 'EMP', 'ligang5', '男', '10', 25, '李大头', 1, 'http://localhost:8080/files/download/1c1108da-d14c-41c4-ac85-78f3653a827e.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (10, 'aae', '123', 'EMP', 'ligang5', '男', '11', 25, '李大头', 1, 'http://localhost:8080/files/download/1c1108da-d14c-41c4-ac85-78f3653a827e.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (11, 'aaf', '123', 'EMP', 'wjl5', '女', '12', 21, '王妹妹', 2, 'http://localhost:8080/files/download/1c1108da-d14c-41c4-ac85-78f3653a827e.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (13, 'aag', '123', 'EMP', '李二狗', '男', '14', 3, '二总', 4, 'http://localhost:8080/files/download/1c1108da-d14c-41c4-ac85-78f3653a827e.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (14, 'aah', '123', 'EMP', '李大总5', '男', '15', 44, '大总', 5, 'http://localhost:8080/files/download/1c1108da-d14c-41c4-ac85-78f3653a827e.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (15, 'aai', '123', 'EMP', '王幺妹5', '女', '17', 31, '幺妹', 2, 'http://localhost:8080/files/download/1c1108da-d14c-41c4-ac85-78f3653a827e.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (16, 'aaj', '123', 'EMP', '张三5', '男', '18', 44, '张三', 2, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (17, 'aak', '123', 'EMP', '张三2', '男', '19', 25, '开发工程师', 1, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (18, 'aal', '123', 'EMP', '李大虎', '男', '1111', 18, '李大虎李大虎李大虎李大虎李大虎李大虎', 3, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (21, 'aao', '123', 'EMP', '李世民', '男', '1004', 18, '李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民', 1, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (22, 'aap', '123', 'EMP', '李小龙', '男', '1008', 18, '李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙', 2, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (25, 'aar', '123', 'EMP', '李小龙', '男', '1010', 18, '李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙', 3, 'http://localhost:8080/files/download/fc7d3e0a-306e-41b4-9e8d-18c709478c2f.png');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (26, 'aas', '123', 'EMP', '李建成', '男', '1011', 18, '李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成', 1, 'http://localhost:8080/files/download/ec6b2297-fe17-4f08-a680-85288da288a7.jpeg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (27, 'aat', '123', 'EMP', '李元吉', '男', '1012', 35, '李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉', 2, 'http://localhost:8080/files/download/ec6b2297-fe17-4f08-a680-85288da288a7.jpeg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (32, 'aau', '123', 'EMP', '顾红雅', '女', '1020', 60, '960年5月14日生，1982年毕业于南京大学生物系，1988年在美国华盛顿大学生物系获博士学位 现为北京大学生命科学学院教授，北京大学生命科学学院副院长。现任北京大学现代农学院副院长', 2, 'http://localhost:8080/files/download/4ef7148a-e44c-40d2-b10d-9c35948277e1.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (33, 'aav', '123', 'EMP', 'wjl', '女', '30', 18, '王妹妹王妹妹王妹妹王妹妹王妹妹王妹妹王妹妹', 4, 'http://localhost:8080/files/download/ec6b2297-fe17-4f08-a680-85288da288a7.jpeg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (34, 'aaw', '123', 'EMP', '李大头', '男', '1', 18, '李大头李大头李大头', 4, 'http://localhost:8080/files/download/124b333d-955c-4c65-96d6-75ee0b89ef38.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (35, 'aax', '123', 'EMP', '李白', '男', '2', 18, '李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白', 2, 'http://localhost:8080/files/download/124b333d-955c-4c65-96d6-75ee0b89ef38.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (36, 'aay', '123', 'EMP', '杜虎', '男', '3', 18, '杜虎杜虎杜虎杜虎杜虎杜虎杜虎杜虎', 3, 'http://localhost:8080/files/download/124b333d-955c-4c65-96d6-75ee0b89ef38.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (37, 'aaz', '123', 'EMP', '关大爷', '男', '5', 18, '关大爷关大爷关大爷关大爷关大爷关大爷关大爷关大爷关大爷关大爷v', 1, 'http://localhost:8080/files/download/bb093fae-bfed-41fa-8af0-fd961860105c.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (38, 'aba', '123', 'EMP', '刘三姐', '女', '6', 18, '刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐v', 5, 'http://localhost:8080/files/download/124b333d-955c-4c65-96d6-75ee0b89ef38.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (40, 'abb', '123', 'EMP', '丁宁', '女', '20', 18, '丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁', 4, 'http://localhost:8080/files/download/124b333d-955c-4c65-96d6-75ee0b89ef38.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (41, 'abc', '123', 'EMP', '董袭莹', '女', '22', 18, '董袭莹，女，北京协和医学院实习医生，中国医学科学院肿瘤医院执业医师，北京协和医学院临床医学长学制试点班（“协和医学院4+4”，协和新医科卓越人才班 [32]）非定向内科学博士，毕业于哥伦比亚大学巴纳德学院经济学专业。 [2-3] [6-7] [16-17]\n2016年，董袭莹接替父亲董晓辉出任北京一家股权投资公司法人，两年多后卸任。 [22]2019年，董袭莹通过选拔进入了北京协和医学院“4+4临床医学试点班”项目。 [6]2021年11月5日，董袭莹在北京市第六医院的医联体胸外科病房手术室，北京协和医学院实习医生董袭莹在团队协作中开展荧光腔镜精准肺段手术。 [1]2025年4月，有网友看到北京中日友好医院胸外科副主任医师肖飞妻子举报信中提到，肖飞出轨的董袭莹本该去脊柱外科轮转，为了维持不正当关系，肖飞去和骨科教学秘书麻昊宁打招呼，希望董袭莹继续留在胸外科工作一个月。4月29日消息，知网已搜不到董袭莹相关论文。此外，网友爆料董袭莹本科相当于国内三本，不符合协和4+4要求 [4-5]。4月30日，据第一财经记者调查，董袭莹已不在中日友好医院胸外科规培，现职为中国医学科学院肿瘤医院泌尿外科住院医师（规培阶段）。', 2, 'http://localhost:8080/files/download/fe42f57b-04f0-454b-8958-edac5a6b6e4f.jpg');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (42, 'abc', '123', 'EMP', '肖飞傻逼', '男', '23', 46, '肖飞，男，研究生学历，博士学位，北京协和医学院硕士研究生导师。 [1]\n肖飞毕业于北京大学医学部，获外科学博士学位。2017年7月至2018年8月，在美国MayoClinic医学中心和WashingtonUniversityinSt.Louis医学院任访问学者。2012年起，历任中日医院胸外科住院医师、主治医师、副主任医师。2021年，入围中日医院“菁英计划”人才培育工程骨干人才项目。 [1]\n2025年4月18日起，一则与肖飞有关的举报信开始在网络流传。在这封写给中日友好医院纪委的举报信中，肖飞的妻子称，肖飞曾与中日友好医院胸外科某护士长、中国医学科学院肿瘤医院某规培住院医师产生婚外情。肖飞的妻子还在举报信中指控肖飞曾在手术期间将病人扔在手术台。4月27日，中日友好医院通报，医院根据相关规定，对肖某予以开除党籍处分，并解除聘用关系 [2]；4月27日晚，针对中日友好医院的处理决定，肖飞回应称“有异议”。', 1, 'http://localhost:8080/files/download/87b43ba8-b550-45fd-b6f8-a739a683530a.webp');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
