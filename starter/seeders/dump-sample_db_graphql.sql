-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: sample_db_graphql
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_DEPARTMENT`
--

DROP TABLE IF EXISTS `ADMIN_DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_DEPARTMENT` (
  `DEPT_CODE` varchar(8) NOT NULL,
  `PARENT_DEPT_CODE` varchar(8) DEFAULT NULL,
  `NAME` varchar(45) NOT NULL,
  `TYPE` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `DEPT_ORDER` int NOT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`DEPT_CODE`),
  KEY `FK_PARENT_ID` (`PARENT_DEPT_CODE`),
  KEY `fk_ADMIN_MENU_1` (`PARENT_DEPT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_DEPARTMENT`
--

LOCK TABLES `ADMIN_DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `ADMIN_DEPARTMENT` DISABLE KEYS */;
INSERT INTO `ADMIN_DEPARTMENT` VALUES ('DAAFFA','DAAFF0','앱개발1팀','LEAF',NULL,1,'C0000001','2018-01-17 00:00:00','2019-02-08 11:20:01');
/*!40000 ALTER TABLE `ADMIN_DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADMIN_USER`
--

DROP TABLE IF EXISTS `ADMIN_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_USER` (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME` varchar(64) NOT NULL,
  `PASSWORD` varchar(64) NOT NULL,
  `GROUP_ID` bigint NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `DEPARTMENT` varchar(8) DEFAULT NULL,
  `RANK` varchar(16) DEFAULT NULL,
  `POSITION` varchar(16) DEFAULT NULL,
  `SEX` varchar(8) DEFAULT NULL,
  `ADDRESS` varchar(128) DEFAULT NULL,
  `OFFICE_PHONE` varchar(16) DEFAULT NULL,
  `MOBILE_PHONE` varchar(16) DEFAULT NULL,
  `FAMILY_PHONE` varchar(16) DEFAULT NULL,
  `EXECUTIVE` varchar(16) DEFAULT NULL,
  `STATUS` varchar(8) DEFAULT NULL,
  `STANDARD_WORK_HOURS` int DEFAULT '8',
  `TIME_FLOW_CLASS` varchar(32) DEFAULT '',
  `FCM_TOKEN` varchar(1024) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_USER`
--

LOCK TABLES `ADMIN_USER` WRITE;
/*!40000 ALTER TABLE `ADMIN_USER` DISABLE KEYS */;
INSERT INTO `ADMIN_USER` VALUES ('admin','administrator','db25f2fc14cd2d2b1e7af307241f548fb03c312a',4,'2013-10-29 16:43:30','2014-10-31 14:43:33','',NULL,'J001010','J002006','M','','','','','J003003','C0000001',8,'',''),('ksh7512','권순홍','db25f2fc14cd2d2b1e7af307241f548fb03c312a',4,'2021-05-03 15:57:26','2021-06-28 06:47:26','ksh7512@gmail.com','test dep','J001010','J002006','M','test address','000-000-0000','010-0000-0000','000-000-0000','J003003','C0000001',8,'',''),('neoroman','김응식','db25f2fc14cd2d2b1e7af307241f548fb03c312a',47,'2014-01-28 09:40:42','2021-06-29 15:00:00','neoroman@gmail.com','앱개발1팀','J001006','J002005','M1','분당구 황새울로240번길 3','031-710-xxxx','+82 10-87xx-xx40','010-87xx-xx40','J003003','C0000001',8,'AUTO003','Abra_Cadabra'),('sunghong32','민성홍','db25f2fc14cd2d2b1e7af307241f548fb03c312a',4,'2021-06-02 09:41:40','2021-06-23 00:00:00','sunghong32@gmail.com','앱개발1팀','J001010','J002006','M','죽전','031-710-xxxx','010-29xx-xx80','010-00xx-xx00','J003003','C0000001',8,'',''),('test ID','test ID','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3',4,'2015-03-13 18:18:34','2017-04-24 16:15:50','',NULL,'J001010','J002006','M','','','','','J003003','C0000000',8,'',''),('user','user','db25f2fc14cd2d2b1e7af307241f548fb03c312a',4,'2014-01-10 13:28:48','2014-01-10 13:28:48','',NULL,'J001010','J002006','M','','','','','J003003','C0000000',8,'','');
/*!40000 ALTER TABLE `ADMIN_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT`
--

DROP TABLE IF EXISTS `PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT` (
  `PROJECT_ID` smallint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `DEPT_CODE` varchar(16) DEFAULT NULL,
  `PROJECT_CODE` varchar(32) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT '1',
  PRIMARY KEY (`PROJECT_ID`),
  KEY `fk_ADMIN_DEPARTMENT_DEPT_CODE1` (`DEPT_CODE`),
  CONSTRAINT `fk_ADMIN_DEPARTMENT_DEPT_CODE1` FOREIGN KEY (`DEPT_CODE`) REFERENCES `ADMIN_DEPARTMENT` (`DEPT_CODE`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1746 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT`
--

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;
INSERT INTO `PROJECT` VALUES (1713,'TK 2021년 사이드 화면형 서비스 개발','DAAFFA','yTKISg2103','C002001'),(1720,'TK 2021년 SM개발유지보수(기니앱) 운영','DAAFFA','yTKSMu2103','C002001'),(1723,'TK 2021년 서비스플랫폼_SM개발','DAAFFA','yRCSIg2104','C002001'),(1726,'TK 2021년 SM개발(기니웹앱,런처)','DAAFFA','yGIGIg2104','C002001'),(1729,'TK 2021년 무망 장비 유지보수','DAAFFA','cISCPu2104','C002001'),(1730,'TKDS 2021년 비즈용량증설,고도화','DAAFFA','yTKDSg2104','C002001'),(1731,'TK 2021년 로밍 개발 및 렌탈 서비스개발','DAAFFA','cTKIRg2104','C002001'),(1732,'TK 2021년 선불개발유지보수','DAAFFA','cTKISu2104','C002001');
/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECT_USER_MAP`
--

DROP TABLE IF EXISTS `PROJECT_USER_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROJECT_USER_MAP` (
  `PROJECT_ID` smallint DEFAULT NULL,
  `USER_ID` char(16) NOT NULL DEFAULT '',
  `STATUS` varchar(16) DEFAULT NULL,
  KEY `PROJECT_USER_MAP` (`PROJECT_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECT_USER_MAP`
--

LOCK TABLES `PROJECT_USER_MAP` WRITE;
/*!40000 ALTER TABLE `PROJECT_USER_MAP` DISABLE KEYS */;
INSERT INTO `PROJECT_USER_MAP` VALUES (1713,'neoroman','C002002'),(1720,'neoroman','C002001'),(1723,'neoroman','C002001'),(1726,'neoroman','C002002'),(1729,'neoroman','C002002'),(1730,'neoroman','C002001'),(1731,'neoroman','C002001'),(1732,'neoroman','C002001'),(1713,'ksh7512','C002002'),(1720,'ksh7512','C002001'),(1723,'ksh7512','C002001'),(1726,'ksh7512','C002002'),(1729,'ksh7512','C002002'),(1730,'ksh7512','C002001'),(1731,'ksh7512','C002001'),(1732,'ksh7512','C002001'),(1713,'sunghong32','C002002'),(1720,'sunghong32','C002001'),(1723,'sunghong32','C002001'),(1726,'sunghong32','C002002'),(1729,'sunghong32','C002002'),(1730,'sunghong32','C002001'),(1731,'sunghong32','C002001'),(1732,'sunghong32','C002001');
/*!40000 ALTER TABLE `PROJECT_USER_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_MAP`
--

DROP TABLE IF EXISTS `TASK_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TASK_MAP` (
  `USER_ID` varchar(32) NOT NULL DEFAULT '',
  `TASK_ID` smallint NOT NULL DEFAULT '0',
  `PROJECT_ID` smallint DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `percentage` double DEFAULT '0',
  KEY `idx_memberid_TASK_MAP` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_MAP`
--

LOCK TABLES `TASK_MAP` WRITE;
/*!40000 ALTER TABLE `TASK_MAP` DISABLE KEYS */;
INSERT INTO `TASK_MAP` VALUES ('neoroman',2588,1720,'C0000001',0.25),('neoroman',1573,1713,'C0000001',0.375),('neoroman',853,1713,'C0000001',0.25),('neoroman',2145,1723,'C0000001',0),('neoroman',1409,1723,'C0000001',0),('neoroman',61,1723,'C0000001',0.125),('neoroman',2144,1723,'C0000001',0),('neoroman',1574,1713,'C0000001',0),('neoroman',4851,1731,'C0000001',0),('neoroman',1231,1720,'C0000001',0),('neoroman',4534,1726,'C0000001',0),('neoroman',798,1720,'C0000001',0),('neoroman',2353,1723,'C0000001',0),('neoroman',2201,1723,'C0000001',0),('neoroman',4479,1726,'C0000001',0),('neoroman',98,1720,'C0000001',0),('neoroman',4852,1731,'C0000001',0),('neoroman',58,1720,'C0000001',0),('neoroman',57,1720,'C0000001',0),('neoroman',4847,1730,'C0000001',0),('neoroman',3714,1720,'C0000001',0),('neoroman',4844,1730,'C0000001',0),('neoroman',4758,1729,'C0000001',0),('neoroman',4747,1729,'C0000001',0),('neoroman',4857,1732,'C0000001',0),('neoroman',4854,1732,'C0000001',0),('sunghong32',2588,1720,'C0000001',0.25),('sunghong32',1573,1713,'C0000001',0.375),('sunghong32',853,1713,'C0000001',0.25),('sunghong32',2145,1723,'C0000001',0),('sunghong32',1409,1723,'C0000001',0),('sunghong32',61,1723,'C0000001',0.125),('sunghong32',2144,1723,'C0000001',0),('sunghong32',1574,1713,'C0000001',0),('sunghong32',4851,1731,'C0000001',0),('sunghong32',1231,1720,'C0000001',0),('sunghong32',4534,1726,'C0000001',0),('sunghong32',798,1720,'C0000001',0),('sunghong32',2353,1723,'C0000001',0),('sunghong32',2201,1723,'C0000001',0),('sunghong32',4479,1726,'C0000001',0),('sunghong32',98,1720,'C0000001',0),('sunghong32',4852,1731,'C0000001',0),('sunghong32',58,1720,'C0000001',0),('sunghong32',57,1720,'C0000001',0),('sunghong32',4847,1730,'C0000001',0),('sunghong32',3714,1720,'C0000001',0),('sunghong32',4844,1730,'C0000001',0),('sunghong32',4758,1729,'C0000001',0),('sunghong32',4747,1729,'C0000001',0),('sunghong32',4857,1732,'C0000001',0),('sunghong32',4854,1732,'C0000001',0),('ksh7512',2588,1720,'C0000001',0.25),('ksh7512',1573,1713,'C0000001',0.375),('ksh7512',853,1713,'C0000001',0.25),('ksh7512',2145,1723,'C0000001',0),('ksh7512',1409,1723,'C0000001',0),('ksh7512',61,1723,'C0000001',0.125),('ksh7512',2144,1723,'C0000001',0),('ksh7512',1574,1713,'C0000001',0),('ksh7512',4851,1731,'C0000001',0),('ksh7512',1231,1720,'C0000001',0),('ksh7512',4534,1726,'C0000001',0),('ksh7512',798,1720,'C0000001',0),('ksh7512',2353,1723,'C0000001',0),('ksh7512',2201,1723,'C0000001',0),('ksh7512',4479,1726,'C0000001',0),('ksh7512',98,1720,'C0000001',0),('ksh7512',4852,1731,'C0000001',0),('ksh7512',58,1720,'C0000001',0),('ksh7512',57,1720,'C0000001',0),('ksh7512',4847,1730,'C0000001',0),('ksh7512',3714,1720,'C0000001',0),('ksh7512',4844,1730,'C0000001',0),('ksh7512',4758,1729,'C0000001',0),('ksh7512',4747,1729,'C0000001',0),('ksh7512',4857,1732,'C0000001',0),('ksh7512',4854,1732,'C0000001',0);
/*!40000 ALTER TABLE `TASK_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASKS`
--

DROP TABLE IF EXISTS `TASKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TASKS` (
  `TASK_ID` smallint NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) DEFAULT NULL,
  `PROJECT_ID` smallint DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`TASK_ID`),
  KEY `idx_projid_TASKS` (`PROJECT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9848 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASKS`
--

LOCK TABLES `TASKS` WRITE;
/*!40000 ALTER TABLE `TASKS` DISABLE KEYS */;
INSERT INTO `TASKS` VALUES (57,'행정, 공통 개발',127,'C0000001'),(58,'지원업무',127,'C0000001'),(61,'가정의 날',129,'C0000000'),(98,'제안서 작성',127,'C0000001'),(798,'회의',127,'C0000001'),(853,'신규사업제안',72,'C0000001'),(1231,'교육',127,'C0000001'),(1409,'연차',129,'C0000001'),(1573,'내부 교육',72,'C0000001'),(1574,'외부 교육',72,'C0000001'),(2144,'경조사',129,'C0000001'),(2145,'반차(오후)',129,'C0000001'),(2201,'공가(오전)',129,'C0000001'),(2353,'반차(오전)',129,'C0000001'),(2588,'신규 제안',127,'C0000001'),(3714,'개발관련 지원',127,'C0000001'),(4479,'개발',870,'C0000001'),(4534,'회의/문서',870,'C0000001'),(4747,'개발',913,'C0000001'),(4758,'회의',913,'C0000001'),(4844,'개발',932,'C0000001'),(4847,'회의',932,'C0000001'),(4851,'개발',933,'C0000001'),(4852,'회의',933,'C0000001'),(4854,'개발',934,'C0000000'),(4857,'회의',934,'C0000000');
/*!40000 ALTER TABLE `TASKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIMETABLE`
--

DROP TABLE IF EXISTS `TIMETABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIMETABLE` (
  `WORK_DAY` varchar(10) DEFAULT '',
  `WORK_HOUR` int DEFAULT '0',
  `USER_ID` varchar(32) DEFAULT NULL,
  `TASK_ID` smallint DEFAULT NULL,
  `PROJECT_ID` int DEFAULT NULL,
  `IS_LOCKED` tinyint(1) NOT NULL DEFAULT '0',
  KEY `date_TIMETABLE` (`WORK_DAY`,`USER_ID`,`TASK_ID`,`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIMETABLE`
--

LOCK TABLES `TIMETABLE` WRITE;
/*!40000 ALTER TABLE `TIMETABLE` DISABLE KEYS */;
INSERT INTO `TIMETABLE` VALUES ('20131101',5,'neoroman',4479,870,0),('20131101',5,'neoroman',4534,870,0),('20131104',5,'neoroman',4479,870,0),('20131104',5,'neoroman',4534,870,0),('20131105',5,'neoroman',4479,870,0),('20131106',5,'neoroman',4479,870,0),('20131106',5,'neoroman',4534,870,0),('20131107',5,'neoroman',4479,870,0),('20131108',5,'neoroman',4479,870,0),('20131108',5,'neoroman',4534,870,0),('20131111',5,'neoroman',4747,913,0),('20131118',5,'neoroman',4479,870,0),('20131118',5,'neoroman',4534,870,0),('20131119',5,'neoroman',4479,870,0),('20131121',5,'neoroman',4851,933,0),('20131121',5,'neoroman',4852,933,0),('20131122',5,'neoroman',4851,933,0),('20131122',5,'neoroman',4852,933,0),('20131125',5,'neoroman',4851,933,0),('20131125',5,'neoroman',4852,933,0),('20131126',5,'neoroman',4851,933,0),('20131126',5,'neoroman',4852,933,0),('20131127',5,'neoroman',4851,933,0),('20131127',5,'neoroman',4852,933,0),('20131128',5,'neoroman',4851,933,0),('20131128',5,'neoroman',4852,933,0),('20131129',5,'neoroman',4851,933,0),('20131129',5,'neoroman',4852,933,0),('20131202',5,'neoroman',4851,933,0),('20131202',5,'neoroman',4852,933,0),('20131203',5,'neoroman',4851,933,0),('20131203',5,'neoroman',4852,933,0),('20131204',5,'neoroman',4852,933,0),('20131204',5,'neoroman',4851,933,0),('20131204',5,'neoroman',4747,913,0),('20131205',5,'neoroman',4851,933,0),('20131205',5,'neoroman',4852,933,0),('20131206',5,'neoroman',4851,933,0),('20131206',5,'neoroman',4852,933,0),('20131206',5,'neoroman',4479,870,0),('20131209',5,'neoroman',4851,933,0),('20131209',5,'neoroman',4852,933,0),('20131210',5,'neoroman',4479,870,0),('20131210',5,'neoroman',4851,933,0),('20131210',5,'neoroman',4852,933,0),('20131211',5,'neoroman',4851,933,0),('20131211',5,'neoroman',4852,933,0),('20131212',5,'neoroman',4851,933,0),('20131212',5,'neoroman',4852,933,0),('20131213',5,'neoroman',4851,933,0),('20131213',5,'neoroman',4852,933,0),('20131213',5,'neoroman',4854,934,0),('20131216',5,'neoroman',4852,933,0),('20131216',5,'neoroman',4854,934,0),('20131217',5,'neoroman',4851,933,0),('20131217',5,'neoroman',4852,933,0),('20131217',5,'neoroman',4857,934,0),('20131218',5,'neoroman',4851,933,0),('20131218',5,'neoroman',4852,933,0),('20131218',5,'neoroman',4854,934,0),('20131219',5,'neoroman',1409,129,0),('20131220',5,'neoroman',1409,129,0),('20131223',5,'neoroman',4844,932,0),('20131223',5,'neoroman',4847,932,0),('20131223',5,'neoroman',4851,933,0),('20131223',5,'neoroman',4852,933,0),('20131224',5,'neoroman',4844,932,0),('20131224',5,'neoroman',4847,932,0),('20131224',5,'neoroman',4852,933,0),('20131225',5,'neoroman',4844,932,0),('20131225',5,'neoroman',4847,932,0),('20131225',5,'neoroman',4852,933,0),('20131225',5,'neoroman',2145,129,0),('20131226',5,'neoroman',4844,932,0),('20131226',5,'neoroman',4847,932,0),('20131226',5,'neoroman',4852,933,0),('20131227',5,'neoroman',4851,933,0),('20131227',5,'neoroman',4852,933,0),('20131230',5,'neoroman',4844,932,0),('20131230',5,'neoroman',4851,933,0),('20131230',5,'neoroman',4852,933,0),('20131231',5,'neoroman',4844,932,0),('20131231',5,'neoroman',4851,933,0),('20131231',5,'neoroman',4852,933,0),('20131231',5,'neoroman',4854,934,0),('20131231',5,'neoroman',4857,934,0),('20210617',5,'neoroman',4534,870,0),('20210618',5,'neoroman',4479,870,0),('20210619',5,'neoroman',4479,870,0),('20210620',5,'neoroman',4534,870,0),('20210621',5,'neoroman',4534,870,0),('20210625',5,'neoroman',4479,870,0),('20210626',5,'neoroman',4534,870,0),('20210627',5,'neoroman',4534,870,0),('20210622',5,'neoroman',4479,870,0),('20210623',5,'neoroman',4534,870,0),('20210624',5,'neoroman',4534,870,0),('20210628',3,'neoroman',4479,870,0),('20210629',4,'neoroman',4534,870,0),('20210630',5,'neoroman',4534,870,0),('20210601',0,'neoroman',4534,870,0),('20210603',0,'neoroman',4479,870,0),('20210605',6,'neoroman',4479,870,0),('20210605',5,'neoroman',4534,870,0),('20210607',7,'neoroman',4479,870,0),('20210604',6,'ksh7512',4854,1732,0),('20210621',5,'ksh7512',4857,1732,0),('20210602',6,'ksh7512',4857,1732,0),('20210603',7,'ksh7512',4854,1732,0),('20210605',15,'ksh7512',4857,1732,0),('20210606',16,'ksh7512',4857,1732,0),('20210607',17,'ksh7512',4854,1732,0),('20210601',2,'neoroman',2588,1720,0),('20210601',3,'neoroman',1573,1713,0),('20210601',2,'neoroman',853,1713,0),('20210601',1,'neoroman',61,1723,0),('20210602',2,'neoroman',2588,1720,0),('20210602',3,'neoroman',1573,1713,0),('20210602',2,'neoroman',853,1713,0),('20210602',1,'neoroman',61,1723,0),('20210603',2,'neoroman',2588,1720,0),('20210603',3,'neoroman',1573,1713,0),('20210603',2,'neoroman',853,1713,0),('20210603',1,'neoroman',61,1723,0),('20210604',2,'neoroman',2588,1720,0),('20210604',3,'neoroman',1573,1713,0),('20210604',2,'neoroman',853,1713,0),('20210604',1,'neoroman',61,1723,0),('20210607',2,'neoroman',2588,1720,0),('20210607',3,'neoroman',1573,1713,0),('20210607',2,'neoroman',853,1713,0),('20210607',1,'neoroman',61,1723,0),('20210608',2,'neoroman',2588,1720,0),('20210608',3,'neoroman',1573,1713,0),('20210608',2,'neoroman',853,1713,0),('20210608',1,'neoroman',61,1723,0),('20210609',2,'neoroman',2588,1720,0),('20210609',3,'neoroman',1573,1713,0),('20210609',2,'neoroman',853,1713,0),('20210609',1,'neoroman',61,1723,0),('20210610',2,'neoroman',2588,1720,0),('20210610',3,'neoroman',1573,1713,0),('20210610',2,'neoroman',853,1713,0),('20210610',1,'neoroman',61,1723,0),('20210611',2,'neoroman',2588,1720,0),('20210611',3,'neoroman',1573,1713,0),('20210611',2,'neoroman',853,1713,0),('20210611',1,'neoroman',61,1723,0),('20210614',2,'neoroman',2588,1720,0),('20210614',3,'neoroman',1573,1713,0),('20210614',2,'neoroman',853,1713,0),('20210614',1,'neoroman',61,1723,0),('20210615',2,'neoroman',2588,1720,0),('20210615',3,'neoroman',1573,1713,0),('20210615',2,'neoroman',853,1713,0),('20210615',1,'neoroman',61,1723,0),('20210616',2,'neoroman',2588,1720,0),('20210616',3,'neoroman',1573,1713,0),('20210616',2,'neoroman',853,1713,0),('20210616',1,'neoroman',61,1723,0),('20210617',2,'neoroman',2588,1720,0),('20210617',3,'neoroman',1573,1713,0),('20210617',2,'neoroman',853,1713,0),('20210617',1,'neoroman',61,1723,0),('20210618',2,'neoroman',2588,1720,0),('20210618',3,'neoroman',1573,1713,0),('20210618',2,'neoroman',853,1713,0),('20210618',1,'neoroman',61,1723,0),('20210621',2,'neoroman',2588,1720,0),('20210621',3,'neoroman',1573,1713,0),('20210621',2,'neoroman',853,1713,0),('20210621',1,'neoroman',61,1723,0),('20210622',2,'neoroman',2588,1720,0),('20210622',3,'neoroman',1573,1713,0),('20210622',2,'neoroman',853,1713,0),('20210622',1,'neoroman',61,1723,0),('20210623',2,'neoroman',2588,1720,0),('20210623',3,'neoroman',1573,1713,0),('20210623',2,'neoroman',853,1713,0),('20210623',1,'neoroman',61,1723,0),('20210624',2,'neoroman',2588,1720,0),('20210624',3,'neoroman',1573,1713,0),('20210624',2,'neoroman',853,1713,0),('20210624',1,'neoroman',61,1723,0),('20210625',2,'neoroman',2588,1720,0),('20210625',3,'neoroman',1573,1713,0),('20210625',2,'neoroman',853,1713,0),('20210625',1,'neoroman',61,1723,0),('20210628',2,'neoroman',2588,1720,0),('20210628',3,'neoroman',1573,1713,0),('20210628',2,'neoroman',853,1713,0),('20210628',1,'neoroman',61,1723,0),('20210629',2,'neoroman',2588,1720,0),('20210629',3,'neoroman',1573,1713,0),('20210629',2,'neoroman',853,1713,0),('20210629',1,'neoroman',61,1723,0),('20210630',2,'neoroman',2588,1720,0),('20210630',3,'neoroman',1573,1713,0),('20210630',2,'neoroman',853,1713,0),('20210630',1,'neoroman',61,1723,0),('20210503',2,'neoroman',2588,1720,0),('20210503',3,'neoroman',1573,1713,0),('20210503',2,'neoroman',853,1713,0),('20210503',1,'neoroman',61,1723,0),('20210504',2,'neoroman',2588,1720,0),('20210504',3,'neoroman',1573,1713,0),('20210504',2,'neoroman',853,1713,0),('20210504',1,'neoroman',61,1723,0),('20210505',2,'neoroman',2588,1720,0),('20210505',3,'neoroman',1573,1713,0),('20210505',2,'neoroman',853,1713,0),('20210505',1,'neoroman',61,1723,0),('20210506',2,'neoroman',2588,1720,0),('20210506',3,'neoroman',1573,1713,0),('20210506',2,'neoroman',853,1713,0),('20210506',1,'neoroman',61,1723,0),('20210507',2,'neoroman',2588,1720,0),('20210507',3,'neoroman',1573,1713,0),('20210507',2,'neoroman',853,1713,0),('20210507',1,'neoroman',61,1723,0),('20210510',2,'neoroman',2588,1720,0),('20210510',3,'neoroman',1573,1713,0),('20210510',2,'neoroman',853,1713,0),('20210510',1,'neoroman',61,1723,0),('20210511',2,'neoroman',2588,1720,0),('20210511',3,'neoroman',1573,1713,0),('20210511',2,'neoroman',853,1713,0),('20210511',1,'neoroman',61,1723,0),('20210512',2,'neoroman',2588,1720,0),('20210512',3,'neoroman',1573,1713,0),('20210512',2,'neoroman',853,1713,0),('20210512',1,'neoroman',61,1723,0),('20210513',2,'neoroman',2588,1720,0),('20210513',3,'neoroman',1573,1713,0),('20210513',2,'neoroman',853,1713,0),('20210513',1,'neoroman',61,1723,0),('20210514',2,'neoroman',2588,1720,0),('20210514',3,'neoroman',1573,1713,0),('20210514',2,'neoroman',853,1713,0),('20210514',1,'neoroman',61,1723,0),('20210517',2,'neoroman',2588,1720,0),('20210517',3,'neoroman',1573,1713,0),('20210517',2,'neoroman',853,1713,0),('20210517',1,'neoroman',61,1723,0),('20210518',2,'neoroman',2588,1720,0),('20210518',3,'neoroman',1573,1713,0),('20210518',2,'neoroman',853,1713,0),('20210518',1,'neoroman',61,1723,0),('20210519',2,'neoroman',2588,1720,0),('20210519',3,'neoroman',1573,1713,0),('20210519',2,'neoroman',853,1713,0),('20210519',1,'neoroman',61,1723,0),('20210520',2,'neoroman',2588,1720,0),('20210520',3,'neoroman',1573,1713,0),('20210520',2,'neoroman',853,1713,0),('20210520',1,'neoroman',61,1723,0),('20210521',2,'neoroman',2588,1720,0),('20210521',3,'neoroman',1573,1713,0),('20210521',2,'neoroman',853,1713,0),('20210521',1,'neoroman',61,1723,0),('20210524',2,'neoroman',2588,1720,0),('20210524',3,'neoroman',1573,1713,0),('20210524',2,'neoroman',853,1713,0),('20210524',1,'neoroman',61,1723,0),('20210525',2,'neoroman',2588,1720,0),('20210525',3,'neoroman',1573,1713,0),('20210525',2,'neoroman',853,1713,0),('20210525',1,'neoroman',61,1723,0),('20210526',2,'neoroman',2588,1720,0),('20210526',3,'neoroman',1573,1713,0),('20210526',2,'neoroman',853,1713,0),('20210526',1,'neoroman',61,1723,0),('20210527',2,'neoroman',2588,1720,0),('20210527',3,'neoroman',1573,1713,0),('20210527',2,'neoroman',853,1713,0),('20210527',1,'neoroman',61,1723,0),('20210528',2,'neoroman',2588,1720,0),('20210528',3,'neoroman',1573,1713,0),('20210528',2,'neoroman',853,1713,0),('20210528',1,'neoroman',61,1723,0),('20210531',2,'neoroman',2588,1720,0),('20210531',3,'neoroman',1573,1713,0),('20210531',2,'neoroman',853,1713,0),('20210531',1,'neoroman',61,1723,0);
/*!40000 ALTER TABLE `TIMETABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_DEPT`
--

DROP TABLE IF EXISTS `USER_DEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_DEPT` (
  `USER_ID` varchar(32) NOT NULL,
  `DEPT_CODE` varchar(16) NOT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_DEPT`
--

LOCK TABLES `USER_DEPT` WRITE;
/*!40000 ALTER TABLE `USER_DEPT` DISABLE KEYS */;
INSERT INTO `USER_DEPT` VALUES ('ksh7512','DAAFFA','2014-01-28 09:40:42','2019-02-08 00:00:00'),('neoroman','DAAFFA','2014-01-28 09:40:42','2019-02-08 00:00:00'),('sunghong32','DAAFFA','2014-01-28 09:40:42','2019-02-08 00:00:00');
/*!40000 ALTER TABLE `USER_DEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sample_db_graphql'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-30 12:10:32
