CREATE TABLE `department` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `admin-demo`.`department` (`id`, `name`) VALUES (1, '市场部');
INSERT INTO `admin-demo`.`department` (`id`, `name`) VALUES (2, '销售部');
INSERT INTO `admin-demo`.`department` (`id`, `name`) VALUES (3, '软件部');
INSERT INTO `admin-demo`.`department` (`id`, `name`) VALUES (4, '总裁办');
INSERT INTO `admin-demo`.`department` (`id`, `name`) VALUES (5, '工程部');