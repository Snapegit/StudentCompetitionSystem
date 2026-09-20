-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl56503127
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl56503127`
--

/*!40000 DROP DATABASE IF EXISTS `cl56503127`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl56503127` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl56503127`;

--
-- Table structure for table `bisaibaoming`
--

DROP TABLE IF EXISTS `bisaibaoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bisaibaoming` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) DEFAULT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) DEFAULT NULL COMMENT '比赛类型',
  `bisaishijian` datetime DEFAULT NULL COMMENT '比赛时间',
  `bisaididian` varchar(200) DEFAULT NULL COMMENT '比赛地点',
  `bisaineirong` longtext COMMENT '比赛内容',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `canjiashijian` datetime DEFAULT NULL COMMENT '参加时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `duiwumingcheng` varchar(200) DEFAULT NULL COMMENT '队伍名称',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='比赛报名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bisaibaoming`
--

LOCK TABLES `bisaibaoming` WRITE;
/*!40000 ALTER TABLE `bisaibaoming` DISABLE KEYS */;
INSERT INTO `bisaibaoming` VALUES (61,'2024-03-28 03:08:57','比赛名称1','比赛类型1','2024-03-28 11:08:57','比赛地点1','比赛内容1','教师工号1','教师姓名1','2024-03-28 11:08:57','学号1','学生姓名1','队伍名称1','是','',1,1),(62,'2024-03-28 03:08:57','比赛名称2','比赛类型2','2024-03-28 11:08:57','比赛地点2','比赛内容2','教师工号2','教师姓名2','2024-03-28 11:08:57','学号2','学生姓名2','队伍名称2','是','',2,2),(63,'2024-03-28 03:08:57','比赛名称3','比赛类型3','2024-03-28 11:08:57','比赛地点3','比赛内容3','教师工号3','教师姓名3','2024-03-28 11:08:57','学号3','学生姓名3','队伍名称3','是','',3,3),(64,'2024-03-28 03:08:57','比赛名称4','比赛类型4','2024-03-28 11:08:57','比赛地点4','比赛内容4','教师工号4','教师姓名4','2024-03-28 11:08:57','学号4','学生姓名4','队伍名称4','是','',4,4),(65,'2024-03-28 03:08:57','比赛名称5','比赛类型5','2024-03-28 11:08:57','比赛地点5','比赛内容5','教师工号5','教师姓名5','2024-03-28 11:08:57','学号5','学生姓名5','队伍名称5','是','',5,5),(66,'2024-03-28 03:08:57','比赛名称6','比赛类型6','2024-03-28 11:08:57','比赛地点6','比赛内容6','教师工号6','教师姓名6','2024-03-28 11:08:57','学号6','学生姓名6','队伍名称6','是','',6,6);
/*!40000 ALTER TABLE `bisaibaoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bisaichengji`
--

DROP TABLE IF EXISTS `bisaichengji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bisaichengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) DEFAULT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) DEFAULT NULL COMMENT '比赛类型',
  `bisaineirong` longtext COMMENT '比赛内容',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `duiwumingcheng` varchar(200) DEFAULT NULL COMMENT '队伍名称',
  `bisaifenshu` int(11) DEFAULT NULL COMMENT '比赛分数',
  `dengjiriqi` datetime DEFAULT NULL COMMENT '登记日期',
  `huojiangxinxi` longtext COMMENT '获奖信息',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bisaifenshu` (`bisaifenshu`)
) ENGINE=InnoDB AUTO_INCREMENT=1711595608310 DEFAULT CHARSET=utf8 COMMENT='比赛成绩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bisaichengji`
--

LOCK TABLES `bisaichengji` WRITE;
/*!40000 ALTER TABLE `bisaichengji` DISABLE KEYS */;
INSERT INTO `bisaichengji` VALUES (71,'2024-03-28 03:08:57','比赛名称1','比赛类型1','比赛内容1','教师工号1','教师姓名1','学号1','学生姓名1','队伍名称1',1,'2024-03-28 11:08:57','获奖信息1',1,1),(72,'2024-03-28 03:08:57','比赛名称2','比赛类型2','比赛内容2','教师工号2','教师姓名2','学号2','学生姓名2','队伍名称2',2,'2024-03-28 11:08:57','获奖信息2',2,2),(73,'2024-03-28 03:08:57','比赛名称3','比赛类型3','比赛内容3','教师工号3','教师姓名3','学号3','学生姓名3','队伍名称3',3,'2024-03-28 11:08:57','获奖信息3',3,3),(74,'2024-03-28 03:08:57','比赛名称4','比赛类型4','比赛内容4','教师工号4','教师姓名4','学号4','学生姓名4','队伍名称4',4,'2024-03-28 11:08:57','获奖信息4',4,4),(75,'2024-03-28 03:08:57','比赛名称5','比赛类型5','比赛内容5','教师工号5','教师姓名5','学号5','学生姓名5','队伍名称5',5,'2024-03-28 11:08:57','获奖信息5',5,5),(76,'2024-03-28 03:08:57','比赛名称6','比赛类型6','比赛内容6','教师工号6','教师姓名6','学号6','学生姓名6','队伍名称6',6,'2024-03-28 11:08:57','获奖信息6',6,6),(1711595608309,'2024-03-28 03:13:27','比赛名称1','比赛类型1','1','教师工号1','教师姓名1','学号1','学生姓名1','队伍名称1',7,'2024-03-28 11:13:14','1',81,111);
/*!40000 ALTER TABLE `bisaichengji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bisaileixing`
--

DROP TABLE IF EXISTS `bisaileixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bisaileixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaileixing` varchar(200) NOT NULL COMMENT '比赛类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bisaileixing` (`bisaileixing`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='比赛类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bisaileixing`
--

LOCK TABLES `bisaileixing` WRITE;
/*!40000 ALTER TABLE `bisaileixing` DISABLE KEYS */;
INSERT INTO `bisaileixing` VALUES (41,'2024-03-28 03:08:57','比赛类型1'),(42,'2024-03-28 03:08:57','比赛类型2'),(43,'2024-03-28 03:08:57','比赛类型3'),(44,'2024-03-28 03:08:57','比赛类型4'),(45,'2024-03-28 03:08:57','比赛类型5'),(46,'2024-03-28 03:08:57','比赛类型6');
/*!40000 ALTER TABLE `bisaileixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bisaixinxi`
--

DROP TABLE IF EXISTS `bisaixinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bisaixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) DEFAULT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) DEFAULT NULL COMMENT '比赛类型',
  `bisaitupian` longtext COMMENT '比赛图片',
  `bisaishijian` datetime DEFAULT NULL COMMENT '比赛时间',
  `bisaididian` varchar(200) DEFAULT NULL COMMENT '比赛地点',
  `bisaiguize` longtext COMMENT '比赛规则',
  `bisaineirong` longtext COMMENT '比赛内容',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `reversetime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='比赛信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bisaixinxi`
--

LOCK TABLES `bisaixinxi` WRITE;
/*!40000 ALTER TABLE `bisaixinxi` DISABLE KEYS */;
INSERT INTO `bisaixinxi` VALUES (51,'2024-03-28 03:08:57','比赛名称1','比赛类型1','file/bisaixinxiBisaitupian1.jpg,file/bisaixinxiBisaitupian2.jpg,file/bisaixinxiBisaitupian3.jpg','2024-03-28 11:08:57','比赛地点1','比赛规则1','比赛内容1','教师工号1','教师姓名1','2024-03-29 00:00:00','是',''),(52,'2024-03-28 03:08:57','比赛名称2','比赛类型2','file/bisaixinxiBisaitupian2.jpg,file/bisaixinxiBisaitupian3.jpg,file/bisaixinxiBisaitupian4.jpg','2024-03-28 11:08:57','比赛地点2','比赛规则2','比赛内容2','教师工号2','教师姓名2','2024-03-29 00:00:00','是',''),(53,'2024-03-28 03:08:57','比赛名称3','比赛类型3','file/bisaixinxiBisaitupian3.jpg,file/bisaixinxiBisaitupian4.jpg,file/bisaixinxiBisaitupian5.jpg','2024-03-28 11:08:57','比赛地点3','比赛规则3','比赛内容3','教师工号3','教师姓名3','2024-03-29 00:00:00','是',''),(54,'2024-03-28 03:08:57','比赛名称4','比赛类型4','file/bisaixinxiBisaitupian4.jpg,file/bisaixinxiBisaitupian5.jpg,file/bisaixinxiBisaitupian6.jpg','2024-03-28 11:08:57','比赛地点4','比赛规则4','比赛内容4','教师工号4','教师姓名4','2024-03-29 00:00:00','是',''),(55,'2024-03-28 03:08:57','比赛名称5','比赛类型5','file/bisaixinxiBisaitupian5.jpg,file/bisaixinxiBisaitupian6.jpg,file/bisaixinxiBisaitupian7.jpg','2024-03-28 11:08:57','比赛地点5','比赛规则5','比赛内容5','教师工号5','教师姓名5','2024-03-29 00:00:00','是',''),(56,'2024-03-28 03:08:57','比赛名称6','比赛类型6','file/bisaixinxiBisaitupian6.jpg,file/bisaixinxiBisaitupian7.jpg,file/bisaixinxiBisaitupian8.jpg','2024-03-28 11:08:57','比赛地点6','比赛规则6','比赛内容6','教师工号6','教师姓名6','2024-03-29 00:00:00','是','');
/*!40000 ALTER TABLE `bisaixinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canjiabisai`
--

DROP TABLE IF EXISTS `canjiabisai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canjiabisai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bisaimingcheng` varchar(200) DEFAULT NULL COMMENT '比赛名称',
  `bisaileixing` varchar(200) DEFAULT NULL COMMENT '比赛类型',
  `bisaididian` varchar(200) DEFAULT NULL COMMENT '比赛地点',
  `zuopinmingcheng` varchar(200) DEFAULT NULL COMMENT '作品名称',
  `zuopinxiangqing` longtext COMMENT '作品详情',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `duiwumingcheng` varchar(200) DEFAULT NULL COMMENT '队伍名称',
  `canjiashijian` datetime DEFAULT NULL COMMENT '参加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='参加比赛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canjiabisai`
--

LOCK TABLES `canjiabisai` WRITE;
/*!40000 ALTER TABLE `canjiabisai` DISABLE KEYS */;
INSERT INTO `canjiabisai` VALUES (111,'2024-03-28 03:08:57','比赛名称1','比赛类型1','比赛地点1','作品名称1','','教师工号1','教师姓名1','学号1','学生姓名1','队伍名称1','2024-03-28 11:08:57'),(112,'2024-03-28 03:08:57','比赛名称2','比赛类型2','比赛地点2','作品名称2','','教师工号2','教师姓名2','学号2','学生姓名2','队伍名称2','2024-03-28 11:08:57'),(113,'2024-03-28 03:08:57','比赛名称3','比赛类型3','比赛地点3','作品名称3','','教师工号3','教师姓名3','学号3','学生姓名3','队伍名称3','2024-03-28 11:08:57'),(114,'2024-03-28 03:08:57','比赛名称4','比赛类型4','比赛地点4','作品名称4','','教师工号4','教师姓名4','学号4','学生姓名4','队伍名称4','2024-03-28 11:08:57'),(115,'2024-03-28 03:08:57','比赛名称5','比赛类型5','比赛地点5','作品名称5','','教师工号5','教师姓名5','学号5','学生姓名5','队伍名称5','2024-03-28 11:08:57'),(116,'2024-03-28 03:08:57','比赛名称6','比赛类型6','比赛地点6','作品名称6','','教师工号6','教师姓名6','学号6','学生姓名6','队伍名称6','2024-03-28 11:08:57');
/*!40000 ALTER TABLE `canjiabisai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) NOT NULL COMMENT '教师姓名',
  `touxiang` longtext COMMENT '头像',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `shengri` date DEFAULT NULL COMMENT '生日',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `pquestion` varchar(200) DEFAULT NULL COMMENT '密保问题',
  `panswer` varchar(200) DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (81,'2024-03-28 03:08:57','教师工号1','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','教师姓名1','file/jiaoshiTouxiang1.jpg','19819881111','男','身份证1','2024-03-28','102020001@qq.com','密保问题1','密保答案1'),(82,'2024-03-28 03:08:57','教师工号2','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','教师姓名2','file/jiaoshiTouxiang2.jpg','19819881112','男','身份证2','2024-03-28','102020002@qq.com','密保问题2','密保答案2'),(83,'2024-03-28 03:08:57','教师工号3','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','教师姓名3','file/jiaoshiTouxiang3.jpg','19819881113','男','身份证3','2024-03-28','102020003@qq.com','密保问题3','密保答案3'),(84,'2024-03-28 03:08:57','教师工号4','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','教师姓名4','file/jiaoshiTouxiang4.jpg','19819881114','男','身份证4','2024-03-28','102020004@qq.com','密保问题4','密保答案4'),(85,'2024-03-28 03:08:57','教师工号5','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','教师姓名5','file/jiaoshiTouxiang5.jpg','19819881115','男','身份证5','2024-03-28','102020005@qq.com','密保问题5','密保答案5'),(86,'2024-03-28 03:08:57','教师工号6','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','教师姓名6','file/jiaoshiTouxiang6.jpg','19819881116','男','身份证6','2024-03-28','102020006@qq.com','密保问题6','密保答案6');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-03-28 03:08:57','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-form\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"},{\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"公告信息\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common27\",\"menu\":\"管理员管理\",\"unicode\":\"&#xee2c;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-list\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"教师\",\"menuJump\":\"列表\",\"tableName\":\"jiaoshi\"}],\"fontClass\":\"icon-user2\",\"menu\":\"教师管理\",\"unicode\":\"&#xef98;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"学生\",\"menuJump\":\"列表\",\"tableName\":\"xuesheng\"}],\"fontClass\":\"icon-user1\",\"menu\":\"学生管理\",\"unicode\":\"&#xef97;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"比赛类型\",\"menuJump\":\"列表\",\"tableName\":\"bisaileixing\"}],\"fontClass\":\"icon-common30\",\"menu\":\"比赛类型管理\",\"unicode\":\"&#xee30;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"审核\"],\"menu\":\"比赛信息\",\"menuJump\":\"列表\",\"tableName\":\"bisaixinxi\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛信息管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"比赛报名\",\"menuJump\":\"列表\",\"tableName\":\"bisaibaoming\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛报名管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"参加比赛\",\"menuJump\":\"列表\",\"tableName\":\"canjiabisai\"}],\"fontClass\":\"icon-common37\",\"menu\":\"参加比赛管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"删除\",\"导出\"],\"menu\":\"比赛成绩\",\"menuJump\":\"列表\",\"tableName\":\"bisaichengji\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛成绩管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"操作日志\",\"menuJump\":\"列表\",\"tableName\":\"syslog\"}],\"fontClass\":\"icon-common36\",\"menu\":\"操作日志管理\",\"unicode\":\"&#xee9f;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common18\",\"menu\":\"公告信息\",\"menuJump\":\"列表\",\"tableName\":\"news\",\"unicode\":\"&#xedff;\"}],\"fontClass\":\"icon-common18\",\"menu\":\"公告信息\",\"unicode\":\"&#xedff;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"报名\"],\"fontClass\":\"icon-common22\",\"menu\":\"比赛信息\",\"menuJump\":\"列表\",\"tableName\":\"bisaixinxi\",\"unicode\":\"&#xee04;\"}],\"fontClass\":\"icon-common22\",\"menu\":\"比赛信息管理\",\"unicode\":\"&#xee04;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"比赛类型\",\"menuJump\":\"列表\",\"tableName\":\"bisaileixing\"}],\"fontClass\":\"icon-common30\",\"menu\":\"比赛类型管理\",\"unicode\":\"&#xee30;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"比赛信息\",\"menuJump\":\"列表\",\"tableName\":\"bisaixinxi\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛信息管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"删除\",\"审核\"],\"menu\":\"比赛报名\",\"menuJump\":\"列表\",\"tableName\":\"bisaibaoming\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛报名管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"查看\",\"删除\",\"成绩\"],\"menu\":\"参加比赛\",\"menuJump\":\"列表\",\"tableName\":\"canjiabisai\"}],\"fontClass\":\"icon-common37\",\"menu\":\"参加比赛管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"比赛成绩\",\"menuJump\":\"列表\",\"tableName\":\"bisaichengji\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛成绩管理\",\"unicode\":\"&#xef3d;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common18\",\"menu\":\"公告信息\",\"menuJump\":\"列表\",\"tableName\":\"news\",\"unicode\":\"&#xedff;\"}],\"fontClass\":\"icon-common18\",\"menu\":\"公告信息\",\"unicode\":\"&#xedff;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"报名\"],\"fontClass\":\"icon-common22\",\"menu\":\"比赛信息\",\"menuJump\":\"列表\",\"tableName\":\"bisaixinxi\",\"unicode\":\"&#xee04;\"}],\"fontClass\":\"icon-common22\",\"menu\":\"比赛信息管理\",\"unicode\":\"&#xee04;\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"教师\",\"tableName\":\"jiaoshi\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"删除\",\"参加\"],\"menu\":\"比赛报名\",\"menuJump\":\"列表\",\"tableName\":\"bisaibaoming\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛报名管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-shop\",\"buttons\":[\"查看\",\"删除\",\"修改\"],\"menu\":\"参加比赛\",\"menuJump\":\"列表\",\"tableName\":\"canjiabisai\"}],\"fontClass\":\"icon-common37\",\"menu\":\"参加比赛管理\",\"unicode\":\"&#xeea4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-flashlightopen\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"比赛成绩\",\"menuJump\":\"列表\",\"tableName\":\"bisaichengji\"}],\"fontClass\":\"icon-common46\",\"menu\":\"比赛成绩管理\",\"unicode\":\"&#xef3d;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\"],\"fontClass\":\"icon-common18\",\"menu\":\"公告信息\",\"menuJump\":\"列表\",\"tableName\":\"news\",\"unicode\":\"&#xedff;\"}],\"fontClass\":\"icon-common18\",\"menu\":\"公告信息\",\"unicode\":\"&#xedff;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"报名\"],\"fontClass\":\"icon-common22\",\"menu\":\"比赛信息\",\"menuJump\":\"列表\",\"tableName\":\"bisaixinxi\",\"unicode\":\"&#xee04;\"}],\"fontClass\":\"icon-common22\",\"menu\":\"比赛信息管理\",\"unicode\":\"&#xee04;\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"学生\",\"tableName\":\"xuesheng\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='公告信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (31,'2024-03-28 03:08:57','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(32,'2024-03-28 03:08:57','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(33,'2024-03-28 03:08:57','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(34,'2024-03-28 03:08:57','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(35,'2024-03-28 03:08:57','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。'),(36,'2024-03-28 03:08:57','孤勇者','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望','file/newsPicture6.jpg','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望，不肯哭一场，爱你破烂的衣裳，却敢堵命运的枪，爱你和我那么像，缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，他们说 要戒了你的狂，就像擦掉了污垢，他们说 要顺台阶而上，而代价是低头，那就让我 不可 乘风，你一样骄傲着 那种孤勇，谁说对弈平凡的不算英雄，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你破烂的衣裳 却敢堵命运的枪，爱你和我那么像 缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，你的斑驳 与众不同 与众不同，你的沉默 震耳欲聋 震耳欲聋，You Are The Hero，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你来自于蛮荒 一生不借谁的光，你将造你的城邦 在废墟之上，去吗 去啊 以最卑微的梦，战吗 战啊 以最孤高的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syslog`
--

DROP TABLE IF EXISTS `syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `syslog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `operation` varchar(200) NOT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` longtext COMMENT '请求参数',
  `time` bigint(20) DEFAULT NULL COMMENT '请求时长(毫秒)',
  `ip` varchar(200) DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syslog`
--

LOCK TABLES `syslog` WRITE;
/*!40000 ALTER TABLE `syslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','q8t7jz4sveejiam30cio5ors789znzkx','2024-03-28 03:12:43','2024-03-28 04:12:44'),(2,81,'教师工号1','jiaoshi','管理员','prh90c4lf3ddh3is5856ohim76x0ob6n','2024-03-28 03:13:09','2024-03-28 04:13:10');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-03-28 03:08:57','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shengri` varchar(200) DEFAULT NULL COMMENT '生日',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `duiwumingcheng` varchar(200) DEFAULT NULL COMMENT '队伍名称',
  `pquestion` varchar(200) DEFAULT NULL COMMENT '密保问题',
  `panswer` varchar(200) DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (101,'2024-03-28 03:08:57','学号1','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','学生姓名1','file/xueshengTouxiang1.jpg','男','19819881111','102020001@qq.com','生日1','身份证1','队伍名称1','密保问题1','密保答案1'),(102,'2024-03-28 03:08:57','学号2','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','学生姓名2','file/xueshengTouxiang2.jpg','男','19819881112','102020002@qq.com','生日2','身份证2','队伍名称2','密保问题2','密保答案2'),(103,'2024-03-28 03:08:57','学号3','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','学生姓名3','file/xueshengTouxiang3.jpg','男','19819881113','102020003@qq.com','生日3','身份证3','队伍名称3','密保问题3','密保答案3'),(104,'2024-03-28 03:08:57','学号4','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','学生姓名4','file/xueshengTouxiang4.jpg','男','19819881114','102020004@qq.com','生日4','身份证4','队伍名称4','密保问题4','密保答案4'),(105,'2024-03-28 03:08:57','学号5','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','学生姓名5','file/xueshengTouxiang5.jpg','男','19819881115','102020005@qq.com','生日5','身份证5','队伍名称5','密保问题5','密保答案5'),(106,'2024-03-28 03:08:57','学号6','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','学生姓名6','file/xueshengTouxiang6.jpg','男','19819881116','102020006@qq.com','生日6','身份证6','队伍名称6','密保问题6','密保答案6');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 14:10:57
