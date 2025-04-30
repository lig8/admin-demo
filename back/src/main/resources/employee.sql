CREATE TABLE `employee` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
                            `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
                            `en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Employee No',
                            `age` int DEFAULT NULL COMMENT '年龄',
                            `descr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
                            `department` int DEFAULT NULL COMMENT '所在部门',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `en` (`en`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci


INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (1, 'ligang', '男', '1', 25, '李大头', 1);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (2, 'wjl', '女', '2', 21, '王妹妹', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (3, '李小天', '男', '3', 3, '李小天天向上', 3);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (4, '李二总', '男', '4', 3, '二总', 4);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (5, '李大总', '男', '5', 44, '大总', 5);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (6, '王幺妹', '女', '7', 31, '幺妹', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (7, '张三', '男', '8', 44, '张三', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (8, '张三5', '男', '9', 44, '张三', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (9, 'ligang5', '男', '10', 25, '李大头', 1);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (10, 'ligang5', '男', '11', 25, '李大头', 1);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (11, 'wjl5', '女', '12', 21, '王妹妹', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (13, '李二狗', '男', '14', 3, '二总', 4);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (14, '李大总5', '男', '15', 44, '大总', 5);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (15, '王幺妹5', '女', '17', 31, '幺妹', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (16, '张三5', '男', '18', 44, '张三', 2);
INSERT INTO `admin-demo`.`employee` (`id`, `name`, `gender`, `en`, `age`, `descr`, `department`) VALUES (17, '张三2', '男', '19', 25, '开发工程师', 1);
