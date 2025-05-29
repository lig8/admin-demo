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

 Date: 29/05/2025 10:58:15
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
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (6, 'aaa', '333', 'ADMIN', 'ad王幺妹', '7', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (7, 'aab', '123', 'ADMIN', 'ad张三', '8', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (8, 'aac', '123', 'ADMIN', 'ad张三5', '9', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (9, 'aad', '123', 'ADMIN', 'adligang5', '10', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (10, 'aae', '123', 'ADMIN', 'adligang5', '11', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (11, 'aaf', '123', 'ADMIN', 'adwjl5', '12', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (15, 'aai', '123', 'ADMIN', 'ad王幺妹5', '17', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (47, 'bba', '123', 'ADMIN', '李小天', '1347', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (48, 'lixiaolong', '123', 'ADMIN', '李小龙', '12345', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `admin` (`id`, `username`, `password`, `role`, `name`, `en`, `avatar`) VALUES (49, 'maozedong', '123', 'ADMIN', '毛泽东', '12371', 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  `update_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '最近修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `title`, `img`, `description`, `content`, `create_time`, `update_time`) VALUES (1, 'test', 'http://localhost:8080/files/download/cover22_21fb3e4.jpeg', 'test,test', 'test,test,test,test', '2025-05-27 23:24:25', '2025-05-28 16:51:26');
INSERT INTO `article` (`id`, `title`, `img`, `description`, `content`, `create_time`, `update_time`) VALUES (2, 'test', 'http://localhost:8080/files/download/cover4_d81891e.webp', 'test,test', '<p>这是一段<span style=\"font-size: 29px; font-family: 华文楷体;\">可编</span>辑文本，</p><p>蓝色文字和图示混排</p><p><br></p>', '2025-05-27 23:27:01', '2025-05-28 17:45:56');
INSERT INTO `article` (`id`, `title`, `img`, `description`, `content`, `create_time`, `update_time`) VALUES (3, 'test', 'http://localhost:8080/files/download/cover12_69cd67e.jpeg', 'test,test', '<p style=\"text-align: left;\">《父母的期望：克服家庭和校园中的骄纵文化<span style=\"font-size: 22px;\"><strong>》是美国教育学者威廉·戴蒙（</strong></span>William Damon）的经典著作，首次出版于1995年。书中以20世纪末美国青少年问题为切入点，深刻剖析了家庭和校园中普遍存在的“骄纵文化”现象，并提出教育改革的系统性方案。以下是核心内容的提炼：</p><p style=\"text-align: center;\"><img src=\"http://localhost:8080/files/download/pic_e5558bb.jpg\" alt=\"\" data-href=\"\" style=\"width: 657.00px;height: 369.55px;\"></p><p style=\"text-align: left;\"><br></p><p style=\"text-align: left;\">　　1、握拍与快攻型第一种握法相同。它在正手拉弧圈球时,拇指、中指和无名指协调用力,中指和无名指略微伸直(不是完全伸直,仍有一些弯屈),以利于出手击球时较好地保持拍形的前倾。这种握拍法的优点是手腕比较灵活,正、反手和推挡的结合比较容易,处理台内球也较好。缺点是拍型不易固定,对正手大角度球和扣杀较高的球较难处理。</p><p style=\"text-align: left;\">　　2、拇指贴在球拍左侧,食指轻轻扣住拍柄,形成一个小环状。中指和无名指较直地以第一指节托住球拍背部,小指自然紧贴在无名指之下。这种握拍法,很自然地将手臂、手腕和球拍联成—条线,拍呈横状,扩大了右半台的照顾范围。在正手拉弧圈球和扣杀时,容易发挥手臂的力量。正、反手结合运用时,主要靠前臂带动手腕作回旋动作。缺点是手腕不灵活,处理快攻球、台内球,追身球及反手近台球比较困难。</p><blockquote style=\"text-align: left;\">哈哈哈哈你好吗什么东西，哈哈<br><br></blockquote>', '2025-05-27 23:35:27', '2025-05-28 16:50:56');
INSERT INTO `article` (`id`, `title`, `img`, `description`, `content`, `create_time`, `update_time`) VALUES (4, 'acdacdacd', 'http://localhost:8080/files/download/cover10_766b301.png', 'acdacdacdacd acd', '<p style=\"text-align: left;\">acdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acdacdacdacdacd acd</p><p style=\"text-align: left;\"><br></p><p style=\"text-align: left;\">😈😭😱</p>', '2025-05-27 23:35:27', '2025-05-28 17:44:02');
INSERT INTO `article` (`id`, `title`, `img`, `description`, `content`, `create_time`, `update_time`) VALUES (5, '中国的红色政权为什么能够存在', 'http://localhost:8080/files/download/cover4_ad800c0f-57.webp', '《中国的红色政权为什么能够存在？》写作背景', '<p style=\"text-align: left;\"><span style=\"font-size: 24px; font-family: 华文楷体;\"><strong>《中国的红色政权为什么能够存在？》</strong></span>是毛泽东将马克思主义与中国实际结合的里程碑。在敌我力量悬殊、革命陷入低潮的背景下，毛泽东通过井冈山实践，论证了红色政权在帝国主义与军阀夹缝中生存的逻辑，回答了革命前途问题。此文不仅稳定了军心，更开创了“农村包围城市”的中国革命道路，标志着毛泽东思想的初步形成。尽管当时未被共产国际和党内完全接受，但其战略思想在抗战时期的敌后根据地和解放战争中得到充分验证，成为中共夺取政权的核心理论之一。</p><p style=\"text-align: left;\"><img src=\"http://localhost:8080/files/download/wang_16eed360-e0.jpg\" alt=\"\" data-href=\"\" style=\"width: 694.00px;height: 390.37px;\"></p><p style=\"text-align: left;\">1988年，我19岁，和小我两岁的妹妹姜婷一起给大姐做伴娘。</p><p style=\"text-align: left;\">新郎官去年刚从监狱里被放出来，他作奸犯科吃喝嫖赌。</p><p style=\"text-align: left;\">一个监狱常客，怎么可能会被黄花闺女相中。</p><p style=\"text-align: left;\">他放出来没两个月，就在苞米地里强奸了大姐。</p><p style=\"text-align: left;\">家里为了不被乡亲们戳脊梁骨，就只能勉强同意对方的提亲。</p><p style=\"text-align: left;\">大姐的牺牲，是无妄之灾。</p><p style=\"text-align: left;\">婚礼上，一对新人在拜天地。</p><p style=\"text-align: left;\"><img src=\"http://localhost:8080/files/download/wang_c684258c-0e.jpg\" alt=\"\" data-href=\"\" style=\"width: 671.00px;height: 377.44px;\">我在一旁捏着竹篮子，嘴唇快咬出了血。</p><p style=\"text-align: left;\">“我不同意！宋雪飞明明是强奸犯，他不是我姐夫！”</p><p style=\"text-align: left;\">一声叱喝，一道炸雷。</p><p style=\"text-align: left;\">场上乡里乡亲无不投射来目光看向我。</p><p style=\"text-align: left;\">那是一种看戏，一种讥笑。</p><p style=\"text-align: left;\">乡亲们都知道怎么回事，只不过，看破不说破。</p><p style=\"text-align: left;\">“妈了个巴子的，老子是你姐夫，我娶你姐跟你有什么关系！”</p><p style=\"text-align: left;\">宋雪飞瞪圆眼睛，一巴掌朝我扇了过来。</p><p style=\"text-align: left;\">啪！<img src=\"http://localhost:8080/files/download/wang_b1bec17a-97.webp\" alt=\"\" data-href=\"\" style=\"\"></p><p style=\"text-align: left;\">啪啪！</p><p style=\"text-align: left;\">三巴掌下去，我脸上红地渗出血。</p><p style=\"text-align: left;\">我倒在地上抿了抿嘴角，不让血流出来。</p><p style=\"text-align: left;\">但比我脸上眼色更加猩红的，是三妹的眼球。</p><p style=\"text-align: left;\">我眼睁睁看着姜婷从衣服里掏出菜刀，朝着宋雪飞砍了上去。</p><p style=\"text-align: left;\">坐在地上的我，赶不及，拦不住。</p><p style=\"text-align: left;\">“杀人啦！”</p><p style=\"text-align: left;\">“姜家三闺女杀人啦！”<br><br></p>', '2025-05-29 10:56:48', '2025-05-29 10:56:48');
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
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (6, 'aaa', '333', 'EMP', '王幺妹', '女', '7', 31, '昨晚吃过晚饭后，老婆说明天约了其发小，打算去周边某网红打卡点，我听了颇感意料，想想后也在情理之中。之情听她提起过几个景点，网红打卡点便是其一。', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (7, 'aab', '123', 'EMP', '张三', '男', '8', 44, '张三', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (8, 'aac', '123', 'EMP', '张三5', '男', '9', 44, '张三', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (9, 'aad', '123', 'EMP', 'ligang5', '男', '10', 25, '李大头', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (10, 'aae', '123', 'EMP', 'ligang5', '男', '11', 25, '李大头', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (11, 'aaf', '123', 'EMP', 'wjl5', '女', '12', 21, '王妹妹', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (13, 'aag', '123', 'EMP', '李二狗', '男', '14', 3, '二总', 4, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (14, 'aah', '123', 'EMP', '李大总5', '男', '15', 44, '大总', 5, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (15, 'aai', '123', 'EMP', '王幺妹5', '女', '17', 31, '幺妹', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (16, 'aaj', '123', 'EMP', '张三5', '男', '18', 44, '张三', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (17, 'aak', '123', 'EMP', '张三2', '男', '19', 25, '开发工程师', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (18, 'aal', '123', 'EMP', '李大虎', '男', '1111', 18, '李大虎李大虎李大虎李大虎李大虎李大虎', 3, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (21, 'aao', '123', 'EMP', '李世民', '男', '1004', 18, '李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民李世民', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (22, 'aap', '123', 'EMP', '李小龙', '男', '1008', 18, '李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (25, 'aar', '123', 'EMP', '李小龙', '男', '1010', 18, '李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙李小龙', 3, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (26, 'aas', '123', 'EMP', '李建成', '男', '1011', 18, '李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成李建成', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (27, 'aat', '123', 'EMP', '李元吉', '男', '1012', 35, '李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉李元吉', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (32, 'aau', '123', 'EMP', '顾红雅', '女', '1020', 60, '960年5月14日生，1982年毕业于南京大学生物系，1988年在美国华盛顿大学生物系获博士学位 现为北京大学生命科学学院教授，北京大学生命科学学院副院长。现任北京大学现代农学院副院长', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (33, 'aav', '123', 'EMP', 'wjl', '女', '30', 18, '王妹妹王妹妹王妹妹王妹妹王妹妹王妹妹王妹妹', 4, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (34, 'aaw', '123', 'EMP', '李大头', '男', '1', 18, '李大头李大头李大头', 4, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (35, 'aax', '123', 'EMP', '李白', '男', '2', 18, '李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白李白', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (36, 'aay', '123', 'EMP', '杜虎', '男', '3', 18, '杜虎杜虎杜虎杜虎杜虎杜虎杜虎杜虎', 3, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (37, 'aaz', '123', 'EMP', '关大爷', '男', '5', 18, '关大爷关大爷关大爷关大爷关大爷关大爷关大爷关大爷关大爷关大爷v', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (38, 'aba', '123', 'EMP', '刘三姐', '女', '6', 18, '刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐刘三姐v', 5, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (40, 'abb', '123', 'EMP', '丁宁', '女', '20', 18, '丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁丁宁', 4, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (41, 'abc', '123', 'EMP', '董袭莹', '女', '22', 18, '董袭莹，女，北京协和医学院实习医生，中国医学科学院肿瘤医院执业医师，北京协和医学院临床医学长学制试点班（“协和医学院4+4”，协和新医科卓越人才班 [32]）非定向内科学博士，毕业于哥伦比亚大学巴纳德学院经济学专业。 [2-3] [6-7] [16-17]\n2016年，董袭莹接替父亲董晓辉出任北京一家股权投资公司法人，两年多后卸任。 [22]2019年，董袭莹通过选拔进入了北京协和医学院“4+4临床医学试点班”项目。 [6]2021年11月5日，董袭莹在北京市第六医院的医联体胸外科病房手术室，北京协和医学院实习医生董袭莹在团队协作中开展荧光腔镜精准肺段手术。 [1]2025年4月，有网友看到北京中日友好医院胸外科副主任医师肖飞妻子举报信中提到，肖飞出轨的董袭莹本该去脊柱外科轮转，为了维持不正当关系，肖飞去和骨科教学秘书麻昊宁打招呼，希望董袭莹继续留在胸外科工作一个月。4月29日消息，知网已搜不到董袭莹相关论文。此外，网友爆料董袭莹本科相当于国内三本，不符合协和4+4要求 [4-5]。4月30日，据第一财经记者调查，董袭莹已不在中日友好医院胸外科规培，现职为中国医学科学院肿瘤医院泌尿外科住院医师（规培阶段）。', 2, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
INSERT INTO `employee` (`id`, `username`, `password`, `role`, `name`, `gender`, `en`, `age`, `descr`, `department`, `avatar`) VALUES (42, 'abc', '123', 'EMP', '肖飞傻逼', '男', '23', 46, '肖飞，男，研究生学历，博士学位，北京协和医学院硕士研究生导师。 [1]\n肖飞毕业于北京大学医学部，获外科学博士学位。2017年7月至2018年8月，在美国MayoClinic医学中心和WashingtonUniversityinSt.Louis医学院任访问学者。2012年起，历任中日医院胸外科住院医师、主治医师、副主任医师。2021年，入围中日医院“菁英计划”人才培育工程骨干人才项目。 [1]\n2025年4月18日起，一则与肖飞有关的举报信开始在网络流传。在这封写给中日友好医院纪委的举报信中，肖飞的妻子称，肖飞曾与中日友好医院胸外科某护士长、中国医学科学院肿瘤医院某规培住院医师产生婚外情。肖飞的妻子还在举报信中指控肖飞曾在手术期间将病人扔在手术台。4月27日，中日友好医院通报，医院根据相关规定，对肖某予以开除党籍处分，并解除聘用关系 [2]；4月27日晚，针对中日友好医院的处理决定，肖飞回应称“有异议”。', 1, 'http://localhost:8080/files/download/avarta8_cc596aa.webp');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
