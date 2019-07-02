-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: giftshop
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141023091745'),('20141023091746'),('20141023091747'),('20141023091748'),('20141023091749'),('20141023091750'),('20141023091751'),('20141023091752'),('20141023091753'),('20141023091754'),('20141023091755'),('20141023091756'),('20141023091757'),('20141023091758'),('20141023091759'),('20141023091760'),('20141023091761'),('20141023091762'),('20141023091763'),('20141023091764'),('20141023091765'),('20141023091766'),('20141023091767'),('20141023091768'),('20141023091769'),('20141023091770'),('20141023091771'),('20141023091772'),('20141023091773'),('20141023091774'),('20141023091775'),('20141023091776'),('20141023091777'),('20141023091778'),('20141023091779'),('20141023091780'),('20141023091781'),('20141023091782'),('20141023091783'),('20141023091784'),('20141023091785'),('20141023091786'),('20141023091787'),('20141023091788'),('20141023091789'),('20141023091790'),('20141023091791'),('20141023091792'),('20141023091793'),('20141023091794'),('20141023091795'),('20141023091796'),('20141023091797'),('20141023091798'),('20141023091799'),('20141023091800'),('20141023091801'),('20141023091802'),('20141023091803'),('20141023091804'),('20141023091805'),('20141023091806'),('20141023091807'),('20141023091808'),('20141023091809'),('20141023091810'),('20141023091811'),('20141023091812'),('20141023091813'),('20141023091814'),('20141023091815'),('20141023091816'),('20141023091817'),('20141023091818'),('20141023091819'),('20141023091820'),('20141023091821'),('20141023091822'),('20141023091823'),('20141023091824'),('20141023091825'),('20141023091826'),('20141023091827'),('20141023091828'),('20141023091829'),('20141023091830'),('20141023091831'),('20141023091832'),('20141023091833'),('20141023091834'),('20141023091835'),('20141023091836'),('20141023091837'),('20141023091838'),('20141023091839'),('20141023091840'),('20141023091841'),('20141023091842'),('20141023091843'),('20141023091844'),('20141023091845'),('20141023091846'),('20141023091847'),('20141023091848'),('20141023091849'),('20141023091850'),('20141023091851'),('20141023091852'),('20141023091853'),('20141023091854'),('20141023091855'),('20141023091856'),('20141023091857'),('20141023091858'),('20141023091859'),('20141023091860'),('20141023091861'),('20141023091862'),('20141023091863'),('20141023091864'),('20141023091865'),('20141023091866'),('20141023091867'),('20141023091868'),('20141023091869'),('20141023091870'),('20141023091871'),('20141023091872'),('20141023091873'),('20141023091874'),('20141023091875'),('20141023091876'),('20141023091877'),('20141023091878'),('20141023091879'),('20141023091880'),('20141023091881'),('20141023091882'),('20141023091883'),('20141023091884'),('20141023091885'),('20141023091886'),('20141023091887'),('20141023091888'),('20141023091889'),('20141023091890'),('20141023091891'),('20141023091892'),('20141023091893'),('20141023091894'),('20141023091895'),('20141023091896'),('20141023091897'),('20141023091898'),('20141023091899'),('20141023091900'),('20141023091901'),('20141023091902'),('20141023091903'),('20141023091904'),('20141023091905'),('20141023091906'),('20141023091907'),('20141024104847'),('20141024104848'),('20141024104849'),('20141024104850'),('20141024104851'),('20141024114850'),('20141028095211'),('20141031102111');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_addresses`
--

DROP TABLE IF EXISTS `spree_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addresses_on_firstname` (`firstname`),
  KEY `index_addresses_on_lastname` (`lastname`),
  KEY `index_spree_addresses_on_country_id` (`country_id`),
  KEY `index_spree_addresses_on_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_addresses`
--

LOCK TABLES `spree_addresses` WRITE;
/*!40000 ALTER TABLE `spree_addresses` DISABLE KEYS */;
INSERT INTO `spree_addresses` VALUES (1,'phuong quang','AB','123 c',NULL,'Bạc Liêu','70000','9987654321',NULL,NULL,NULL,NULL,49,'2014-10-31 05:58:30','2014-10-31 05:58:30','Huyện Phước Long'),(2,'phuong quang','AB','123 c',NULL,'Bạc Liêu','70000','9987654321',NULL,NULL,NULL,NULL,49,'2014-10-31 05:58:30','2014-10-31 05:58:30','Huyện Phước Long'),(3,'phuong quang','AB','123 c',NULL,'Bạc Liêu','70000','9987654321',NULL,NULL,NULL,NULL,49,'2014-10-31 05:58:47','2014-10-31 05:58:47','Huyện Phước Long'),(4,'phuong quang','AB','123 c',NULL,'Bạc Liêu','70000','9987654321',NULL,NULL,NULL,NULL,49,'2014-10-31 06:00:35','2014-10-31 06:00:35','Huyện Phước Long'),(5,'phuong quang 2','AB','aaa',NULL,'Bình Phước','70000','9987654321',NULL,NULL,NULL,NULL,49,'2014-10-31 06:01:21','2014-10-31 06:01:21','Huyện Hớn Quản'),(6,'phuong quang 2','AB','aaa',NULL,'Bình Phước','70000','9987654321',NULL,NULL,NULL,NULL,49,'2014-10-31 06:01:21','2014-10-31 06:01:21','Huyện Hớn Quản'),(7,'phuong quang','AB','123 c',NULL,'Bắc Kạn','70000','1234567890',NULL,NULL,NULL,NULL,49,'2014-10-31 06:20:23','2014-10-31 06:20:23','Huyện Chợ Đồn'),(8,'phuong quang','AB','123 c',NULL,'Bắc Kạn','70000','1234567890',NULL,NULL,NULL,NULL,49,'2014-10-31 06:20:23','2014-10-31 06:20:23','Huyện Chợ Đồn'),(9,'TRUONG THINH','AB','123C',NULL,'Bắc Giang','70000','123456789',NULL,NULL,NULL,NULL,49,'2014-10-31 06:39:26','2014-10-31 06:39:26','Huyện Hiệp Hoà'),(10,'TRUONG THINH','AB','123C',NULL,'Bắc Giang','70000','123456789',NULL,NULL,NULL,NULL,49,'2014-10-31 06:39:26','2014-10-31 06:39:26','Huyện Hiệp Hoà'),(11,'khách mua trực tiếp','AB','Quận 11- tp.hcm',NULL,'Hồ Chí Minh (TP)','70000','0933544161',NULL,NULL,NULL,NULL,49,'2014-10-31 11:56:20','2014-10-31 11:56:20','Quận 11'),(12,'khách mua trực tiếp','AB','Quận 11- tp.hcm',NULL,'Hồ Chí Minh (TP)','70000','0933544161',NULL,NULL,NULL,NULL,49,'2014-10-31 11:56:20','2014-10-31 11:56:20','Quận 11');
/*!40000 ALTER TABLE `spree_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_adjustments`
--

DROP TABLE IF EXISTS `spree_adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adjustable_id` int(11) DEFAULT NULL,
  `adjustable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  `eligible` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `included` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_adjustments_on_order_id` (`adjustable_id`),
  KEY `index_spree_adjustments_on_adjustable_id_and_adjustable_type` (`adjustable_id`,`adjustable_type`),
  KEY `index_spree_adjustments_on_eligible` (`eligible`),
  KEY `index_spree_adjustments_on_order_id` (`order_id`),
  KEY `index_spree_adjustments_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_adjustments`
--

LOCK TABLES `spree_adjustments` WRITE;
/*!40000 ALTER TABLE `spree_adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_assets`
--

DROP TABLE IF EXISTS `spree_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewable_id` int(11) DEFAULT NULL,
  `viewable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_width` int(11) DEFAULT NULL,
  `attachment_height` int(11) DEFAULT NULL,
  `attachment_file_size` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `attachment_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_updated_at` datetime DEFAULT NULL,
  `alt` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assets_on_viewable_id` (`viewable_id`),
  KEY `index_assets_on_viewable_type_and_type` (`viewable_type`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_assets`
--

LOCK TABLES `spree_assets` WRITE;
/*!40000 ALTER TABLE `spree_assets` DISABLE KEYS */;
INSERT INTO `spree_assets` VALUES (1,1,'Spree::Variant',553,415,25535,1,'image/jpeg','10698652_267781146765812_2361968369342037043_n.jpg','Spree::Image','2014-10-30 07:49:02','','2014-10-27 07:16:15','2014-10-30 07:49:03'),(2,1,'Spree::Variant',553,415,25701,2,'image/jpeg','10702017_267781150099145_794130780248092790_n.jpg','Spree::Image','2014-10-30 07:49:03','','2014-10-27 07:16:29','2014-10-30 07:49:04'),(3,2,'Spree::Variant',750,750,43707,1,'image/jpeg','10704040_262314097312517_2862869068769951413_n.jpg','Spree::Image','2014-10-30 07:49:04','','2014-10-27 09:50:22','2014-10-30 07:49:05'),(4,3,'Spree::Variant',NULL,NULL,609930,1,'image/png','DHGE-001.png','Spree::Image','2014-10-30 07:49:05','','2014-10-30 02:51:09','2014-10-30 07:49:06'),(5,5,'Spree::Variant',NULL,NULL,739129,1,'image/png','DHGE-BA001.png','Spree::Image','2014-10-30 07:49:06','','2014-10-30 02:51:34','2014-10-30 07:49:08'),(6,4,'Spree::Variant',NULL,NULL,390831,1,'image/png','DHGE-VA001.png','Spree::Image','2014-10-30 07:49:08','','2014-10-30 02:52:00','2014-10-30 07:49:09'),(7,6,'Spree::Variant',NULL,NULL,262687,1,'image/jpeg','6.jpg','Spree::Image','2014-10-30 07:49:09','','2014-10-30 03:03:59','2014-10-30 07:49:10'),(8,12,'Spree::Variant',NULL,NULL,413942,1,'image/png','DHX-TI003.png','Spree::Image','2014-10-30 07:49:10','','2014-10-30 03:28:35','2014-10-30 07:49:11'),(9,13,'Spree::Variant',NULL,NULL,420776,1,'image/png','DHX-003.png','Spree::Image','2014-10-30 07:49:12','','2014-10-30 03:29:16','2014-10-30 07:49:13'),(10,15,'Spree::Variant',NULL,NULL,85870,1,'image/jpeg','IMG_0143.JPG','Spree::Image','2014-10-30 07:49:13','','2014-10-30 03:38:58','2014-10-30 07:49:14'),(11,18,'Spree::Variant',NULL,NULL,386142,1,'image/png','DHX-001.png','Spree::Image','2014-10-30 07:49:14','','2014-10-30 03:43:44','2014-10-30 07:49:15'),(12,22,'Spree::Variant',NULL,NULL,324483,1,'image/png','06.png','Spree::Image','2014-10-30 07:49:15','','2014-10-30 04:00:42','2014-10-30 07:49:17'),(13,23,'Spree::Variant',NULL,NULL,327426,1,'image/png','07.png','Spree::Image','2014-10-30 07:49:17','','2014-10-30 04:01:06','2014-10-30 07:49:18'),(14,21,'Spree::Variant',NULL,NULL,76947,1,'image/jpeg','IMG_0128.JPG','Spree::Image','2014-10-30 07:49:18','','2014-10-30 04:02:32','2014-10-30 07:49:19'),(15,24,'Spree::Variant',NULL,NULL,835236,1,'image/png','DHHA-001.png','Spree::Image','2014-10-30 07:49:19','','2014-10-30 04:18:22','2014-10-30 07:49:21'),(16,24,'Spree::Variant',NULL,NULL,725080,2,'image/png','DHHA-TR001.png','Spree::Image','2014-10-30 07:49:21','','2014-10-30 04:18:47','2014-10-30 07:49:22'),(17,24,'Spree::Variant',NULL,NULL,779556,3,'image/png','DHHA-TR0011.png','Spree::Image','2014-10-30 07:49:22','','2014-10-30 04:19:31','2014-10-30 07:49:24'),(18,27,'Spree::Variant',NULL,NULL,24745,1,'image/jpeg','10644822_262275747316352_8495789067261717827_n.jpg','Spree::Image','2014-10-30 07:49:24','','2014-10-30 04:32:22','2014-10-30 07:49:25'),(19,29,'Spree::Variant',NULL,NULL,484603,1,'image/png','1229947_262275860649674_5397427764275751558_n.png','Spree::Image','2014-10-30 07:49:25','','2014-10-30 04:38:42','2014-10-30 07:49:26'),(20,33,'Spree::Variant',NULL,NULL,52073,1,'image/jpeg','10653851_262275767316350_4809902507874002079_n.jpg','Spree::Image','2014-10-30 07:49:26','','2014-10-30 04:52:54','2014-10-30 07:49:27'),(21,33,'Spree::Variant',NULL,NULL,764204,2,'image/png','10532779_262275930649667_4193498413878768118_n.png','Spree::Image','2014-10-30 07:49:27','','2014-10-30 04:56:03','2014-10-30 07:49:29'),(22,33,'Spree::Variant',NULL,NULL,54886,3,'image/jpeg','10540398_262275783983015_4639703012671995529_n.jpg','Spree::Image','2014-10-30 07:49:29','','2014-10-30 04:56:50','2014-10-30 07:49:30'),(23,40,'Spree::Variant',NULL,NULL,580772,1,'image/png','10426218_262275883983005_6289940260077466787_n.png','Spree::Image','2014-10-30 07:49:30','','2014-10-30 05:04:32','2014-10-30 07:49:32'),(24,41,'Spree::Variant',NULL,NULL,748498,1,'image/png','10375901_262275920649668_8966608043381760481_n.png','Spree::Image','2014-10-30 07:49:32','','2014-10-30 05:05:35','2014-10-30 07:49:34'),(25,41,'Spree::Variant',NULL,NULL,748498,2,'image/png','10375901_262275920649668_8966608043381760481_n.png','Spree::Image','2014-10-30 07:49:34','','2014-10-30 05:05:37','2014-10-30 07:49:35'),(26,42,'Spree::Variant',NULL,NULL,707198,1,'image/png','10639664_262275917316335_8732151365573193996_n.png','Spree::Image','2014-10-30 07:49:35','','2014-10-30 05:09:10','2014-10-30 07:49:36'),(27,43,'Spree::Variant',NULL,NULL,50146,1,'image/jpeg','10428612_261950237348903_2543140816893771484_n.jpg','Spree::Image','2014-10-30 07:49:36','','2014-10-30 05:30:01','2014-10-30 07:49:37'),(28,43,'Spree::Variant',NULL,NULL,43285,2,'image/jpeg','1185700_261950227348904_4046557219285106761_n.jpg','Spree::Image','2014-10-30 07:49:37','','2014-10-30 05:30:21','2014-10-30 07:49:38'),(29,47,'Spree::Variant',NULL,NULL,487460,1,'image/png','1.png','Spree::Image','2014-10-30 07:49:38','Đủ màu như hình nhé,','2014-10-30 07:25:57','2014-10-30 07:49:39'),(30,47,'Spree::Variant',NULL,NULL,327579,2,'image/png','2.png','Spree::Image','2014-10-30 07:49:40','','2014-10-30 07:26:50','2014-10-30 07:49:41'),(31,47,'Spree::Variant',NULL,NULL,373290,3,'image/png','3.png','Spree::Image','2014-10-30 07:49:42','','2014-10-30 07:27:02','2014-10-30 07:49:43'),(32,47,'Spree::Variant',NULL,NULL,373290,4,'image/png','3.png','Spree::Image','2014-10-30 07:49:43','','2014-10-30 07:27:05','2014-10-30 07:49:44'),(33,47,'Spree::Variant',NULL,NULL,380797,5,'image/png','4.png','Spree::Image','2014-10-30 07:49:44','','2014-10-30 07:27:22','2014-10-30 07:49:46'),(34,51,'Spree::Variant',NULL,NULL,301009,1,'image/png','dong_ho_juliuS.png','Spree::Image','2014-10-30 07:49:46','','2014-10-30 07:48:19','2014-10-30 07:54:54'),(35,55,'Spree::Variant',NULL,NULL,38449,2,'image/png','dong_ho_julius_003_den.png','Spree::Image','2014-10-30 07:54:25','','2014-10-30 07:54:26','2014-10-30 07:55:07'),(36,54,'Spree::Variant',NULL,NULL,42807,1,'image/png','dong_ho.png','Spree::Image','2014-10-30 07:57:48','','2014-10-30 07:57:48','2014-10-30 07:57:48'),(37,53,'Spree::Variant',NULL,NULL,42523,1,'image/png','dong_ho_julius_003_day_den_mat_vang.png','Spree::Image','2014-10-30 07:59:53','','2014-10-30 07:59:54','2014-10-30 07:59:54'),(38,56,'Spree::Variant',NULL,NULL,428711,1,'image/png','dhda002.png','Spree::Image','2014-10-30 08:11:34','','2014-10-30 08:11:35','2014-10-30 08:11:35'),(39,59,'Spree::Variant',NULL,NULL,425015,1,'image/png','6a.png','Spree::Image','2014-10-30 08:34:41','','2014-10-30 08:34:42','2014-10-30 08:34:42'),(40,59,'Spree::Variant',NULL,NULL,396025,2,'image/png','6b.png','Spree::Image','2014-10-30 08:35:35','','2014-10-30 08:35:37','2014-10-30 08:35:37'),(41,59,'Spree::Variant',NULL,NULL,305285,3,'image/png','6c.png','Spree::Image','2014-10-30 08:36:00','','2014-10-30 08:36:01','2014-10-30 08:36:01'),(42,59,'Spree::Variant',NULL,NULL,304578,4,'image/png','6dD.png','Spree::Image','2014-10-30 08:37:10','','2014-10-30 08:37:11','2014-10-30 08:37:11'),(43,63,'Spree::Variant',NULL,NULL,501886,1,'image/png','1c.png','Spree::Image','2014-10-30 09:10:56','','2014-10-30 09:10:57','2014-10-30 09:10:57'),(44,66,'Spree::Variant',NULL,NULL,298510,1,'image/png','1e.png','Spree::Image','2014-10-30 09:11:14','','2014-10-30 09:11:15','2014-10-30 09:11:15'),(45,64,'Spree::Variant',NULL,NULL,622906,1,'image/png','1a.png','Spree::Image','2014-10-30 09:11:42','','2014-10-30 09:11:43','2014-10-30 09:11:43'),(46,65,'Spree::Variant',NULL,NULL,253646,1,'image/png','AAD.png','Spree::Image','2014-10-30 09:14:18','','2014-10-30 09:14:19','2014-10-30 09:14:19'),(47,67,'Spree::Variant',NULL,NULL,490444,1,'image/png','1423792946_141552713.png','Spree::Image','2014-10-30 09:39:56','','2014-10-30 09:39:58','2014-10-30 09:39:58'),(48,68,'Spree::Variant',NULL,NULL,512341,1,'image/png','006.png','Spree::Image','2014-10-31 03:00:19','','2014-10-31 03:00:21','2014-10-31 03:00:21'),(49,69,'Spree::Variant',NULL,NULL,464875,1,'image/png','CAF1.png','Spree::Image','2014-10-31 03:00:41','','2014-10-31 03:00:42','2014-10-31 03:00:42'),(50,71,'Spree::Variant',NULL,NULL,532713,1,'image/png','CAF2.png','Spree::Image','2014-10-31 03:01:03','','2014-10-31 03:01:04','2014-10-31 03:01:04'),(51,70,'Spree::Variant',NULL,NULL,388166,1,'image/png','CAF3.png','Spree::Image','2014-10-31 03:01:22','','2014-10-31 03:01:23','2014-10-31 03:01:23'),(52,72,'Spree::Variant',NULL,NULL,491030,1,'image/png','DHCO2.png','Spree::Image','2014-10-31 03:17:42','','2014-10-31 03:17:43','2014-10-31 03:17:43'),(53,72,'Spree::Variant',NULL,NULL,294499,2,'image/png','DHCO1.png','Spree::Image','2014-10-31 03:18:03','','2014-10-31 03:18:04','2014-10-31 03:18:04'),(54,72,'Spree::Variant',NULL,NULL,287373,3,'image/png','DHCO3.png','Spree::Image','2014-10-31 03:19:54','','2014-10-31 03:19:54','2014-10-31 03:19:54'),(55,75,'Spree::Variant',NULL,NULL,80917,1,'image/jpeg','10629785_258170761060184_8284137486124669533_n.jpg','Spree::Image','2014-10-31 03:47:44','','2014-10-31 03:47:45','2014-10-31 03:47:45'),(56,75,'Spree::Variant',NULL,NULL,135716,2,'image/jpeg','1096241149_233998007.jpg','Spree::Image','2014-10-31 03:48:34','','2014-10-31 03:48:34','2014-10-31 03:48:34'),(57,75,'Spree::Variant',NULL,NULL,459488,3,'image/png','DHAL2.png','Spree::Image','2014-10-31 03:49:12','','2014-10-31 03:49:13','2014-10-31 03:49:13'),(58,79,'Spree::Variant',NULL,NULL,334849,1,'image/png','DHLV.png','Spree::Image','2014-10-31 04:00:08','','2014-10-31 04:00:09','2014-10-31 04:00:09'),(59,79,'Spree::Variant',NULL,NULL,322540,2,'image/png','DHLV1.png','Spree::Image','2014-10-31 04:00:36','','2014-10-31 04:00:37','2014-10-31 04:00:37'),(60,79,'Spree::Variant',NULL,NULL,244020,3,'image/png','DHLV2.png','Spree::Image','2014-10-31 04:00:55','','2014-10-31 04:00:56','2014-10-31 04:00:56'),(61,81,'Spree::Variant',NULL,NULL,238259,1,'image/jpeg','dh019.jpg','Spree::Image','2014-10-31 04:43:49','','2014-10-31 04:43:50','2014-10-31 04:43:50'),(62,85,'Spree::Variant',NULL,NULL,264161,1,'image/png','DHWO2.png','Spree::Image','2014-10-31 05:01:54','còn 3 màu: nâu, đỏ, đen','2014-10-31 05:01:55','2014-10-31 05:01:55'),(63,85,'Spree::Variant',NULL,NULL,306206,2,'image/png','DHWO1.png','Spree::Image','2014-10-31 05:02:19','','2014-10-31 05:02:20','2014-10-31 05:02:20'),(64,89,'Spree::Variant',NULL,NULL,92463,1,'image/jpeg','1488087791_1864426003.jpg','Spree::Image','2014-10-31 05:25:42','','2014-10-31 05:25:45','2014-10-31 05:25:45'),(65,89,'Spree::Variant',NULL,NULL,341267,2,'image/png','DHSK1.png','Spree::Image','2014-10-31 05:26:19','','2014-10-31 05:26:20','2014-10-31 05:26:20'),(66,94,'Spree::Variant',NULL,NULL,326535,1,'image/png','2014072513530880.png','Spree::Image','2014-10-31 05:52:47','','2014-10-31 05:52:50','2014-10-31 05:52:50'),(67,94,'Spree::Variant',NULL,NULL,367558,2,'image/png','2014072513572197.png','Spree::Image','2014-10-31 05:53:04','','2014-10-31 05:53:05','2014-10-31 05:53:05'),(68,94,'Spree::Variant',NULL,NULL,312749,3,'image/png','as.png','Spree::Image','2014-10-31 05:53:23','','2014-10-31 05:53:24','2014-10-31 05:53:24'),(69,97,'Spree::Variant',NULL,NULL,365058,1,'image/png','ASU.png','Spree::Image','2014-10-31 06:18:02','','2014-10-31 06:18:04','2014-10-31 06:18:04'),(70,97,'Spree::Variant',NULL,NULL,425069,2,'image/png','dhcap016_mattrang_90k.png','Spree::Image','2014-10-31 06:18:55','','2014-10-31 06:18:56','2014-10-31 06:18:56'),(71,100,'Spree::Variant',NULL,NULL,203033,1,'image/png','OM1.png','Spree::Image','2014-10-31 07:31:40','','2014-10-31 07:31:41','2014-10-31 07:31:41'),(72,100,'Spree::Variant',NULL,NULL,327937,2,'image/png','OM2.png','Spree::Image','2014-10-31 07:32:21','','2014-10-31 07:32:22','2014-10-31 07:32:22'),(73,100,'Spree::Variant',NULL,NULL,334111,3,'image/png','DHOM1.png','Spree::Image','2014-10-31 07:32:41','','2014-10-31 07:32:42','2014-10-31 07:32:42'),(74,103,'Spree::Variant',NULL,NULL,379074,1,'image/png','DHGU1.png','Spree::Image','2014-10-31 07:59:12','','2014-10-31 07:59:15','2014-10-31 07:59:15'),(75,103,'Spree::Variant',NULL,NULL,305431,2,'image/png','DHGU3.png','Spree::Image','2014-10-31 08:00:29','','2014-10-31 08:00:30','2014-10-31 08:00:30'),(76,103,'Spree::Variant',NULL,NULL,313500,3,'image/png','DHGU4.png','Spree::Image','2014-10-31 08:02:02','','2014-10-31 08:02:03','2014-10-31 08:02:03'),(77,107,'Spree::Variant',NULL,NULL,49934,1,'image/png','DHLE1.png','Spree::Image','2014-10-31 08:40:17','','2014-10-31 08:40:19','2014-10-31 08:40:19'),(78,107,'Spree::Variant',NULL,NULL,17240,2,'image/jpeg','dh080_trang_080.jpg','Spree::Image','2014-10-31 08:48:43','','2014-10-31 08:41:47','2014-10-31 08:48:43'),(79,110,'Spree::Variant',NULL,NULL,27238,1,'image/jpeg','dongholedsamurai.jpg','Spree::Image','2014-10-31 09:03:59','','2014-10-31 09:04:00','2014-10-31 09:04:00'),(80,110,'Spree::Variant',NULL,NULL,275543,2,'image/png','DHLE22.png','Spree::Image','2014-10-31 09:04:25','','2014-10-31 09:04:26','2014-10-31 09:04:26'),(81,110,'Spree::Variant',NULL,NULL,123118,3,'image/png','DHLE21.png','Spree::Image','2014-10-31 09:04:48','','2014-10-31 09:04:48','2014-10-31 09:04:48'),(82,113,'Spree::Variant',NULL,NULL,163542,1,'image/png','DHLE31.png','Spree::Image','2014-10-31 09:20:29','','2014-10-31 09:20:30','2014-10-31 09:20:30'),(83,116,'Spree::Variant',NULL,NULL,545378,1,'image/png','3.png','Spree::Image','2014-10-31 09:39:46','','2014-10-31 09:39:48','2014-10-31 09:39:48'),(84,118,'Spree::Variant',NULL,NULL,368785,1,'image/png','DHTI1.png','Spree::Image','2014-10-31 10:14:30','','2014-10-31 10:14:31','2014-10-31 10:14:31'),(85,120,'Spree::Variant',NULL,NULL,494200,1,'image/png','DHDO1.png','Spree::Image','2014-10-31 10:31:41','','2014-10-31 10:31:42','2014-10-31 10:31:42'),(86,123,'Spree::Variant',NULL,NULL,417510,1,'image/png','xe_dap_nhieu_hinh..png','Spree::Image','2014-10-31 10:41:51','','2014-10-31 10:41:53','2014-10-31 10:41:53'),(87,128,'Spree::Variant',NULL,NULL,65993,1,'image/jpeg','IMG_20140323_190013.jpg','Spree::Image','2014-10-31 11:26:23','','2014-10-31 11:26:23','2014-10-31 11:26:23'),(88,128,'Spree::Variant',NULL,NULL,269504,2,'image/png','XHI.png','Spree::Image','2014-10-31 11:26:35','','2014-10-31 11:26:36','2014-10-31 11:26:36'),(89,128,'Spree::Variant',NULL,NULL,251371,3,'image/png','IMG_20140323_190058.png','Spree::Image','2014-10-31 11:26:54','','2014-10-31 11:26:56','2014-10-31 11:26:56'),(90,131,'Spree::Variant',NULL,NULL,439677,1,'image/png','DHJU1.png','Spree::Image','2014-11-01 02:25:16','','2014-11-01 02:25:18','2014-11-01 02:25:18'),(91,131,'Spree::Variant',NULL,NULL,336214,2,'image/png','DHJU2.png','Spree::Image','2014-11-01 02:25:39','','2014-11-01 02:25:40','2014-11-01 02:25:40'),(92,131,'Spree::Variant',NULL,NULL,316743,3,'image/png','DHJU3.png','Spree::Image','2014-11-01 02:25:53','','2014-11-01 02:25:54','2014-11-01 02:25:54'),(93,134,'Spree::Variant',NULL,NULL,37496,1,'image/jpeg','10646807_253766188167308_6523138591103838809_n.jpg','Spree::Image','2014-11-01 03:10:35','','2014-11-01 03:10:36','2014-11-01 03:10:36'),(94,134,'Spree::Variant',NULL,NULL,174401,2,'image/png','DHKO1.png','Spree::Image','2014-11-01 03:11:24','','2014-11-01 03:11:25','2014-11-01 03:11:25'),(95,134,'Spree::Variant',NULL,NULL,369958,3,'image/png','DHKO2.png','Spree::Image','2014-11-01 03:11:46','','2014-11-01 03:11:48','2014-11-01 03:11:48'),(96,134,'Spree::Variant',NULL,NULL,348924,4,'image/png','DHKO3.png','Spree::Image','2014-11-01 03:12:18','','2014-11-01 03:12:19','2014-11-01 03:12:19'),(97,134,'Spree::Variant',NULL,NULL,35036,5,'image/jpeg','10978_253766194833974_6188996520298073614_n.jpg','Spree::Image','2014-11-01 03:12:32','','2014-11-01 03:12:34','2014-11-01 03:12:34'),(98,137,'Spree::Variant',NULL,NULL,26649,1,'image/jpeg','10754847_526342337502715_1959681387_n.jpg','Spree::Image','2014-11-01 03:50:00','','2014-11-01 03:50:02','2014-11-01 03:50:02'),(99,137,'Spree::Variant',NULL,NULL,25898,2,'image/jpeg','10743804_526342397502709_1798262212_n.jpg','Spree::Image','2014-11-01 03:50:25','','2014-11-01 03:50:26','2014-11-01 03:50:26');
/*!40000 ALTER TABLE `spree_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_calculators`
--

DROP TABLE IF EXISTS `spree_calculators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_calculators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculable_id` int(11) DEFAULT NULL,
  `calculable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_spree_calculators_on_id_and_type` (`id`,`type`),
  KEY `index_spree_calculators_on_calculable_id_and_calculable_type` (`calculable_id`,`calculable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_calculators`
--

LOCK TABLES `spree_calculators` WRITE;
/*!40000 ALTER TABLE `spree_calculators` DISABLE KEYS */;
INSERT INTO `spree_calculators` VALUES (1,'Spree::Calculator::Shipping::FlatRate',1,'Spree::ShippingMethod','2014-10-31 05:08:06','2014-10-31 05:08:34','---\n:amount: !ruby/object:BigDecimal 18:0.3E5\n:currency: VND\n'),(2,'Spree::Calculator::DefaultTax',1,'Spree::TaxRate','2014-10-31 05:14:51','2014-10-31 05:14:51','--- {}\n');
/*!40000 ALTER TABLE `spree_calculators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_configurations`
--

DROP TABLE IF EXISTS `spree_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_configurations_on_name_and_type` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_configurations`
--

LOCK TABLES `spree_configurations` WRITE;
/*!40000 ALTER TABLE `spree_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_countries`
--

DROP TABLE IF EXISTS `spree_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numcode` int(11) DEFAULT NULL,
  `states_required` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_countries`
--

LOCK TABLES `spree_countries` WRITE;
/*!40000 ALTER TABLE `spree_countries` DISABLE KEYS */;
INSERT INTO `spree_countries` VALUES (1,'CHAD','TD','TCD','Chad',148,0,'2014-10-26 05:51:33'),(2,'FAROE ISLANDS','FO','FRO','Faroe Islands',234,0,'2014-10-26 05:51:33'),(3,'INDIA','IN','IND','India',356,1,'2014-10-26 05:51:33'),(4,'NICARAGUA','NI','NIC','Nicaragua',558,0,'2014-10-26 05:51:33'),(5,'SAINT LUCIA','LC','LCA','Saint Lucia',662,0,'2014-10-26 05:51:33'),(6,'FIJI','FJ','FJI','Fiji',242,0,'2014-10-26 05:51:33'),(7,'INDONESIA','ID','IDN','Indonesia',360,0,'2014-10-26 05:51:33'),(8,'NIGER','NE','NER','Niger',562,0,'2014-10-26 05:51:33'),(9,'SAINT PIERRE AND MIQUELON','PM','SPM','Saint Pierre and Miquelon',666,0,'2014-10-26 05:51:33'),(10,'FINLAND','FI','FIN','Finland',246,0,'2014-10-26 05:51:33'),(11,'NIGERIA','NG','NGA','Nigeria',566,1,'2014-10-26 05:51:33'),(12,'SAINT VINCENT AND THE GRENADINES','VC','VCT','Saint Vincent and the Grenadines',670,0,'2014-10-26 05:51:33'),(13,'FRANCE','FR','FRA','France',250,0,'2014-10-26 05:51:33'),(14,'IRAN, ISLAMIC REPUBLIC OF','IR','IRN','Iran, Islamic Republic of',364,0,'2014-10-26 05:51:33'),(15,'NIUE','NU','NIU','Niue',570,0,'2014-10-26 05:51:33'),(16,'SAMOA','WS','WSM','Samoa',882,0,'2014-10-26 05:51:33'),(17,'FRENCH GUIANA','GF','GUF','French Guiana',254,0,'2014-10-26 05:51:33'),(18,'IRAQ','IQ','IRQ','Iraq',368,1,'2014-10-26 05:51:33'),(19,'SAN MARINO','SM','SMR','San Marino',674,0,'2014-10-26 05:51:33'),(20,'IRELAND','IE','IRL','Ireland',372,0,'2014-10-26 05:51:33'),(21,'SAO TOME AND PRINCIPE','ST','STP','Sao Tome and Principe',678,0,'2014-10-26 05:51:33'),(22,'ISRAEL','IL','ISR','Israel',376,0,'2014-10-26 05:51:33'),(23,'SAUDI ARABIA','SA','SAU','Saudi Arabia',682,0,'2014-10-26 05:51:33'),(24,'ITALY','IT','ITA','Italy',380,0,'2014-10-26 05:51:33'),(25,'SENEGAL','SN','SEN','Senegal',686,0,'2014-10-26 05:51:33'),(26,'JAMAICA','JM','JAM','Jamaica',388,0,'2014-10-26 05:51:33'),(27,'JAPAN','JP','JPN','Japan',392,0,'2014-10-26 05:51:33'),(28,'JORDAN','JO','JOR','Jordan',400,0,'2014-10-26 05:51:33'),(29,'BELGIUM','BE','BEL','Belgium',56,0,'2014-10-26 05:51:33'),(30,'BELIZE','BZ','BLZ','Belize',84,0,'2014-10-26 05:51:33'),(31,'KAZAKHSTAN','KZ','KAZ','Kazakhstan',398,0,'2014-10-26 05:51:33'),(32,'UGANDA','UG','UGA','Uganda',800,0,'2014-10-26 05:51:33'),(33,'BENIN','BJ','BEN','Benin',204,0,'2014-10-26 05:51:33'),(34,'KENYA','KE','KEN','Kenya',404,0,'2014-10-26 05:51:33'),(35,'UKRAINE','UA','UKR','Ukraine',804,0,'2014-10-26 05:51:33'),(36,'BERMUDA','BM','BMU','Bermuda',60,0,'2014-10-26 05:51:33'),(37,'KIRIBATI','KI','KIR','Kiribati',296,0,'2014-10-26 05:51:33'),(38,'MEXICO','MX','MEX','Mexico',484,1,'2014-10-26 05:51:33'),(39,'UNITED ARAB EMIRATES','AE','ARE','United Arab Emirates',784,1,'2014-10-26 05:51:33'),(40,'BHUTAN','BT','BTN','Bhutan',64,0,'2014-10-26 05:51:33'),(41,'CUBA','CU','CUB','Cuba',192,0,'2014-10-26 05:51:33'),(42,'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','KP','PRK','North Korea',408,0,'2014-10-26 05:51:33'),(43,'MICRONESIA, FEDERATED STATES OF','FM','FSM','Micronesia, Federated States of',583,1,'2014-10-26 05:51:33'),(44,'UNITED KINGDOM','GB','GBR','United Kingdom',826,0,'2014-10-26 05:51:33'),(45,'BOLIVIA','BO','BOL','Bolivia',68,0,'2014-10-26 05:51:33'),(46,'CYPRUS','CY','CYP','Cyprus',196,0,'2014-10-26 05:51:33'),(47,'KOREA, REPUBLIC OF','KR','KOR','South Korea',410,0,'2014-10-26 05:51:33'),(48,'MOLDOVA, REPUBLIC OF','MD','MDA','Moldova, Republic of',498,0,'2014-10-26 05:51:33'),(49,'UNITED STATES','US','USA','United States',840,1,'2014-10-26 05:51:33'),(50,'BOSNIA AND HERZEGOVINA','BA','BIH','Bosnia and Herzegovina',70,0,'2014-10-26 05:51:33'),(51,'CZECH REPUBLIC','CZ','CZE','Czech Republic',203,0,'2014-10-26 05:51:33'),(52,'KUWAIT','KW','KWT','Kuwait',414,0,'2014-10-26 05:51:33'),(53,'MONACO','MC','MCO','Monaco',492,0,'2014-10-26 05:51:33'),(54,'URUGUAY','UY','URY','Uruguay',858,0,'2014-10-26 05:51:33'),(55,'BOTSWANA','BW','BWA','Botswana',72,0,'2014-10-26 05:51:33'),(56,'DENMARK','DK','DNK','Denmark',208,0,'2014-10-26 05:51:33'),(57,'GUADELOUPE','GP','GLP','Guadeloupe',312,0,'2014-10-26 05:51:33'),(58,'KYRGYZSTAN','KG','KGZ','Kyrgyzstan',417,0,'2014-10-26 05:51:33'),(59,'MONGOLIA','MN','MNG','Mongolia',496,0,'2014-10-26 05:51:33'),(60,'PHILIPPINES','PH','PHL','Philippines',608,0,'2014-10-26 05:51:33'),(61,'BRAZIL','BR','BRA','Brazil',76,1,'2014-10-26 05:51:33'),(62,'DJIBOUTI','DJ','DJI','Djibouti',262,0,'2014-10-26 05:51:33'),(63,'GUAM','GU','GUM','Guam',316,0,'2014-10-26 05:51:33'),(64,'LAO PEOPLE\'S DEMOCRATIC REPUBLIC','LA','LAO','Lao People\'s Democratic Republic',418,0,'2014-10-26 05:51:33'),(65,'MONTSERRAT','MS','MSR','Montserrat',500,0,'2014-10-26 05:51:33'),(66,'PITCAIRN','PN','PCN','Pitcairn',612,0,'2014-10-26 05:51:33'),(67,'UZBEKISTAN','UZ','UZB','Uzbekistan',860,0,'2014-10-26 05:51:33'),(68,'BRUNEI DARUSSALAM','BN','BRN','Brunei Darussalam',96,0,'2014-10-26 05:51:33'),(69,'DOMINICA','DM','DMA','Dominica',212,0,'2014-10-26 05:51:33'),(70,'GUATEMALA','GT','GTM','Guatemala',320,0,'2014-10-26 05:51:33'),(71,'MOROCCO','MA','MAR','Morocco',504,0,'2014-10-26 05:51:33'),(72,'POLAND','PL','POL','Poland',616,0,'2014-10-26 05:51:33'),(73,'VANUATU','VU','VUT','Vanuatu',548,0,'2014-10-26 05:51:33'),(74,'DOMINICAN REPUBLIC','DO','DOM','Dominican Republic',214,0,'2014-10-26 05:51:33'),(75,'MOZAMBIQUE','MZ','MOZ','Mozambique',508,0,'2014-10-26 05:51:34'),(76,'PORTUGAL','PT','PRT','Portugal',620,0,'2014-10-26 05:51:34'),(77,'SUDAN','SD','SDN','Sudan',736,1,'2014-10-26 05:51:34'),(78,'VENEZUELA','VE','VEN','Venezuela',862,1,'2014-10-26 05:51:34'),(79,'ECUADOR','EC','ECU','Ecuador',218,0,'2014-10-26 05:51:34'),(80,'GUINEA','GN','GIN','Guinea',324,0,'2014-10-26 05:51:34'),(81,'MYANMAR','MM','MMR','Myanmar',104,0,'2014-10-26 05:51:34'),(82,'PUERTO RICO','PR','PRI','Puerto Rico',630,0,'2014-10-26 05:51:34'),(83,'SURINAME','SR','SUR','Suriname',740,0,'2014-10-26 05:51:34'),(84,'VIET NAM','VN','VNM','Viet Nam',704,0,'2014-10-26 05:51:34'),(85,'EGYPT','EG','EGY','Egypt',818,0,'2014-10-26 05:51:34'),(86,'GUINEA-BISSAU','GW','GNB','Guinea-Bissau',624,0,'2014-10-26 05:51:34'),(87,'NAMIBIA','NA','NAM','Namibia',516,0,'2014-10-26 05:51:34'),(88,'QATAR','QA','QAT','Qatar',634,0,'2014-10-26 05:51:34'),(89,'SVALBARD AND JAN MAYEN','SJ','SJM','Svalbard and Jan Mayen',744,0,'2014-10-26 05:51:34'),(90,'EL SALVADOR','SV','SLV','El Salvador',222,0,'2014-10-26 05:51:34'),(91,'GUYANA','GY','GUY','Guyana',328,0,'2014-10-26 05:51:34'),(92,'REUNION','RE','REU','Reunion',638,0,'2014-10-26 05:51:34'),(93,'HAITI','HT','HTI','Haiti',332,0,'2014-10-26 05:51:34'),(94,'ROMANIA','RO','ROU','Romania',642,0,'2014-10-26 05:51:34'),(95,'SWAZILAND','SZ','SWZ','Swaziland',748,0,'2014-10-26 05:51:34'),(96,'HOLY SEE (VATICAN CITY STATE)','VA','VAT','Holy See (Vatican City State)',336,0,'2014-10-26 05:51:34'),(97,'RUSSIAN FEDERATION','RU','RUS','Russian Federation',643,1,'2014-10-26 05:51:34'),(98,'SWEDEN','SE','SWE','Sweden',752,0,'2014-10-26 05:51:34'),(99,'HONDURAS','HN','HND','Honduras',340,0,'2014-10-26 05:51:34'),(100,'RWANDA','RW','RWA','Rwanda',646,0,'2014-10-26 05:51:34'),(101,'SWITZERLAND','CH','CHE','Switzerland',756,0,'2014-10-26 05:51:34'),(102,'HONG KONG','HK','HKG','Hong Kong',344,0,'2014-10-26 05:51:34'),(103,'SYRIAN ARAB REPUBLIC','SY','SYR','Syrian Arab Republic',760,0,'2014-10-26 05:51:34'),(104,'TAIWAN, PROVINCE OF CHINA','TW','TWN','Taiwan',158,0,'2014-10-26 05:51:34'),(105,'TAJIKISTAN','TJ','TJK','Tajikistan',762,0,'2014-10-26 05:51:34'),(106,'TANZANIA, UNITED REPUBLIC OF','TZ','TZA','Tanzania, United Republic of',834,0,'2014-10-26 05:51:34'),(107,'ARMENIA','AM','ARM','Armenia',51,0,'2014-10-26 05:51:34'),(108,'ARUBA','AW','ABW','Aruba',533,0,'2014-10-26 05:51:34'),(109,'AUSTRALIA','AU','AUS','Australia',36,1,'2014-10-26 05:51:34'),(110,'THAILAND','TH','THA','Thailand',764,0,'2014-10-26 05:51:34'),(111,'AUSTRIA','AT','AUT','Austria',40,0,'2014-10-26 05:51:34'),(112,'MADAGASCAR','MG','MDG','Madagascar',450,0,'2014-10-26 05:51:34'),(113,'TOGO','TG','TGO','Togo',768,0,'2014-10-26 05:51:34'),(114,'AZERBAIJAN','AZ','AZE','Azerbaijan',31,0,'2014-10-26 05:51:34'),(115,'CHILE','CL','CHL','Chile',152,0,'2014-10-26 05:51:34'),(116,'MALAWI','MW','MWI','Malawi',454,0,'2014-10-26 05:51:34'),(117,'TOKELAU','TK','TKL','Tokelau',772,0,'2014-10-26 05:51:34'),(118,'BAHAMAS','BS','BHS','Bahamas',44,0,'2014-10-26 05:51:34'),(119,'CHINA','CN','CHN','China',156,0,'2014-10-26 05:51:34'),(120,'MALAYSIA','MY','MYS','Malaysia',458,0,'2014-10-26 05:51:34'),(121,'TONGA','TO','TON','Tonga',776,0,'2014-10-26 05:51:34'),(122,'BAHRAIN','BH','BHR','Bahrain',48,0,'2014-10-26 05:51:34'),(123,'COLOMBIA','CO','COL','Colombia',170,0,'2014-10-26 05:51:34'),(124,'MALDIVES','MV','MDV','Maldives',462,0,'2014-10-26 05:51:34'),(125,'TRINIDAD AND TOBAGO','TT','TTO','Trinidad and Tobago',780,0,'2014-10-26 05:51:34'),(126,'BANGLADESH','BD','BGD','Bangladesh',50,0,'2014-10-26 05:51:34'),(127,'COMOROS','KM','COM','Comoros',174,1,'2014-10-26 05:51:34'),(128,'FRENCH POLYNESIA','PF','PYF','French Polynesia',258,0,'2014-10-26 05:51:34'),(129,'MALI','ML','MLI','Mali',466,0,'2014-10-26 05:51:34'),(130,'NORFOLK ISLAND','NF','NFK','Norfolk Island',574,0,'2014-10-26 05:51:34'),(131,'TUNISIA','TN','TUN','Tunisia',788,0,'2014-10-26 05:51:34'),(132,'BARBADOS','BB','BRB','Barbados',52,0,'2014-10-26 05:51:34'),(133,'CONGO','CG','COG','Congo',178,0,'2014-10-26 05:51:34'),(134,'GABON','GA','GAB','Gabon',266,0,'2014-10-26 05:51:34'),(135,'MALTA','MT','MLT','Malta',470,0,'2014-10-26 05:51:34'),(136,'NORTHERN MARIANA ISLANDS','MP','MNP','Northern Mariana Islands',580,0,'2014-10-26 05:51:34'),(137,'TURKEY','TR','TUR','Turkey',792,0,'2014-10-26 05:51:34'),(138,'CONGO, THE DEMOCRATIC REPUBLIC OF THE','CD','COD','Congo, the Democratic Republic of the',180,0,'2014-10-26 05:51:34'),(139,'MARSHALL ISLANDS','MH','MHL','Marshall Islands',584,0,'2014-10-26 05:51:34'),(140,'NORWAY','NO','NOR','Norway',578,0,'2014-10-26 05:51:34'),(141,'TURKMENISTAN','TM','TKM','Turkmenistan',795,0,'2014-10-26 05:51:34'),(142,'BELARUS','BY','BLR','Belarus',112,0,'2014-10-26 05:51:34'),(143,'COOK ISLANDS','CK','COK','Cook Islands',184,0,'2014-10-26 05:51:34'),(144,'GAMBIA','GM','GMB','Gambia',270,0,'2014-10-26 05:51:34'),(145,'MARTINIQUE','MQ','MTQ','Martinique',474,0,'2014-10-26 05:51:34'),(146,'OMAN','OM','OMN','Oman',512,0,'2014-10-26 05:51:34'),(147,'SEYCHELLES','SC','SYC','Seychelles',690,0,'2014-10-26 05:51:34'),(148,'TURKS AND CAICOS ISLANDS','TC','TCA','Turks and Caicos Islands',796,0,'2014-10-26 05:51:34'),(149,'GEORGIA','GE','GEO','Georgia',268,0,'2014-10-26 05:51:34'),(150,'MAURITANIA','MR','MRT','Mauritania',478,0,'2014-10-26 05:51:34'),(151,'PAKISTAN','PK','PAK','Pakistan',586,1,'2014-10-26 05:51:34'),(152,'SIERRA LEONE','SL','SLE','Sierra Leone',694,0,'2014-10-26 05:51:34'),(153,'TUVALU','TV','TUV','Tuvalu',798,0,'2014-10-26 05:51:34'),(154,'COSTA RICA','CR','CRI','Costa Rica',188,0,'2014-10-26 05:51:34'),(155,'GERMANY','DE','DEU','Germany',276,0,'2014-10-26 05:51:34'),(156,'MAURITIUS','MU','MUS','Mauritius',480,0,'2014-10-26 05:51:34'),(157,'PALAU','PW','PLW','Palau',585,0,'2014-10-26 05:51:34'),(158,'COTE D\'IVOIRE','CI','CIV','Cote D\'Ivoire',384,0,'2014-10-26 05:51:34'),(159,'PANAMA','PA','PAN','Panama',591,0,'2014-10-26 05:51:34'),(160,'SINGAPORE','SG','SGP','Singapore',702,0,'2014-10-26 05:51:34'),(161,'CROATIA','HR','HRV','Croatia',191,0,'2014-10-26 05:51:34'),(162,'GHANA','GH','GHA','Ghana',288,0,'2014-10-26 05:51:34'),(163,'PAPUA NEW GUINEA','PG','PNG','Papua New Guinea',598,0,'2014-10-26 05:51:34'),(164,'SLOVAKIA','SK','SVK','Slovakia',703,0,'2014-10-26 05:51:34'),(165,'GIBRALTAR','GI','GIB','Gibraltar',292,0,'2014-10-26 05:51:34'),(166,'PARAGUAY','PY','PRY','Paraguay',600,0,'2014-10-26 05:51:34'),(167,'SLOVENIA','SI','SVN','Slovenia',705,0,'2014-10-26 05:51:34'),(168,'GREECE','GR','GRC','Greece',300,0,'2014-10-26 05:51:34'),(169,'PERU','PE','PER','Peru',604,0,'2014-10-26 05:51:34'),(170,'SOLOMON ISLANDS','SB','SLB','Solomon Islands',90,0,'2014-10-26 05:51:34'),(171,'GREENLAND','GL','GRL','Greenland',304,0,'2014-10-26 05:51:34'),(172,'SOMALIA','SO','SOM','Somalia',706,1,'2014-10-26 05:51:34'),(173,'GRENADA','GD','GRD','Grenada',308,0,'2014-10-26 05:51:34'),(174,'SOUTH AFRICA','ZA','ZAF','South Africa',710,0,'2014-10-26 05:51:34'),(175,'SPAIN','ES','ESP','Spain',724,0,'2014-10-26 05:51:34'),(176,'SRI LANKA','LK','LKA','Sri Lanka',144,0,'2014-10-26 05:51:34'),(177,'AFGHANISTAN','AF','AFG','Afghanistan',4,0,'2014-10-26 05:51:34'),(178,'ALBANIA','AL','ALB','Albania',8,0,'2014-10-26 05:51:34'),(179,'ALGERIA','DZ','DZA','Algeria',12,0,'2014-10-26 05:51:34'),(180,'LATVIA','LV','LVA','Latvia',428,0,'2014-10-26 05:51:34'),(181,'AMERICAN SAMOA','AS','ASM','American Samoa',16,0,'2014-10-26 05:51:34'),(182,'BULGARIA','BG','BGR','Bulgaria',100,0,'2014-10-26 05:51:34'),(183,'LEBANON','LB','LBN','Lebanon',422,0,'2014-10-26 05:51:34'),(184,'ANDORRA','AD','AND','Andorra',20,0,'2014-10-26 05:51:34'),(185,'BURKINA FASO','BF','BFA','Burkina Faso',854,0,'2014-10-26 05:51:34'),(186,'LESOTHO','LS','LSO','Lesotho',426,0,'2014-10-26 05:51:34'),(187,'ANGOLA','AO','AGO','Angola',24,0,'2014-10-26 05:51:34'),(188,'BURUNDI','BI','BDI','Burundi',108,0,'2014-10-26 05:51:34'),(189,'LIBERIA','LR','LBR','Liberia',430,0,'2014-10-26 05:51:34'),(190,'VIRGIN ISLANDS, BRITISH','VG','VGB','Virgin Islands, British',92,0,'2014-10-26 05:51:34'),(191,'ANGUILLA','AI','AIA','Anguilla',660,0,'2014-10-26 05:51:34'),(192,'CAMBODIA','KH','KHM','Cambodia',116,0,'2014-10-26 05:51:34'),(193,'EQUATORIAL GUINEA','GQ','GNQ','Equatorial Guinea',226,0,'2014-10-26 05:51:34'),(194,'LIBYAN ARAB JAMAHIRIYA','LY','LBY','Libyan Arab Jamahiriya',434,0,'2014-10-26 05:51:34'),(195,'NAURU','NR','NRU','Nauru',520,0,'2014-10-26 05:51:34'),(196,'VIRGIN ISLANDS, U.S.','VI','VIR','Virgin Islands, U.S.',850,0,'2014-10-26 05:51:34'),(197,'ANTIGUA AND BARBUDA','AG','ATG','Antigua and Barbuda',28,0,'2014-10-26 05:51:34'),(198,'CAMEROON','CM','CMR','Cameroon',120,0,'2014-10-26 05:51:34'),(199,'LIECHTENSTEIN','LI','LIE','Liechtenstein',438,0,'2014-10-26 05:51:34'),(200,'NEPAL','NP','NPL','Nepal',524,1,'2014-10-26 05:51:34'),(201,'WALLIS AND FUTUNA','WF','WLF','Wallis and Futuna',876,0,'2014-10-26 05:51:34'),(202,'WESTERN SAHARA','EH','ESH','Western Sahara',732,0,'2014-10-26 05:51:34'),(203,'ARGENTINA','AR','ARG','Argentina',32,0,'2014-10-26 05:51:34'),(204,'CANADA','CA','CAN','Canada',124,1,'2014-10-26 05:51:34'),(205,'ERITREA','ER','ERI','Eritrea',232,0,'2014-10-26 05:51:34'),(206,'LITHUANIA','LT','LTU','Lithuania',440,0,'2014-10-26 05:51:34'),(207,'NETHERLANDS','NL','NLD','Netherlands',528,0,'2014-10-26 05:51:34'),(208,'YEMEN','YE','YEM','Yemen',887,0,'2014-10-26 05:51:34'),(209,'CAPE VERDE','CV','CPV','Cape Verde',132,0,'2014-10-26 05:51:34'),(210,'ESTONIA','EE','EST','Estonia',233,0,'2014-10-26 05:51:34'),(211,'LUXEMBOURG','LU','LUX','Luxembourg',442,0,'2014-10-26 05:51:34'),(212,'NETHERLANDS ANTILLES','AN','ANT','Netherlands Antilles',530,0,'2014-10-26 05:51:34'),(213,'SAINT HELENA','SH','SHN','Saint Helena',654,0,'2014-10-26 05:51:34'),(214,'ZAMBIA','ZM','ZMB','Zambia',894,0,'2014-10-26 05:51:34'),(215,'CAYMAN ISLANDS','KY','CYM','Cayman Islands',136,0,'2014-10-26 05:51:34'),(216,'ETHIOPIA','ET','ETH','Ethiopia',231,1,'2014-10-26 05:51:34'),(217,'HUNGARY','HU','HUN','Hungary',348,0,'2014-10-26 05:51:34'),(218,'MACAO','MO','MAC','Macao',446,0,'2014-10-26 05:51:34'),(219,'NEW CALEDONIA','NC','NCL','New Caledonia',540,0,'2014-10-26 05:51:34'),(220,'ZIMBABWE','ZW','ZWE','Zimbabwe',716,0,'2014-10-26 05:51:34'),(221,'CENTRAL AFRICAN REPUBLIC','CF','CAF','Central African Republic',140,0,'2014-10-26 05:51:34'),(222,'FALKLAND ISLANDS (MALVINAS)','FK','FLK','Falkland Islands (Malvinas)',238,0,'2014-10-26 05:51:34'),(223,'ICELAND','IS','ISL','Iceland',352,0,'2014-10-26 05:51:34'),(224,'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','MK','MKD','Macedonia',807,0,'2014-10-26 05:51:34'),(225,'NEW ZEALAND','NZ','NZL','New Zealand',554,0,'2014-10-26 05:51:34'),(226,'SAINT KITTS AND NEVIS','KN','KNA','Saint Kitts and Nevis',659,1,'2014-10-26 05:51:34'),(227,'SERBIA','RS','SRB','Serbia',999,0,'2014-10-26 05:51:34'),(228,'MONTENEGRO','ME','MNE','Montenegro',499,0,'2014-10-26 05:51:34'),(229,'JERSEY','JE','JEY','Jersey',44,0,'2014-10-26 05:51:34');
/*!40000 ALTER TABLE `spree_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_credit_cards`
--

DROP TABLE IF EXISTS `spree_credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_credit_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_digits` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `gateway_customer_profile_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gateway_payment_profile_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_credit_cards_on_user_id` (`user_id`),
  KEY `index_spree_credit_cards_on_payment_method_id` (`payment_method_id`),
  KEY `index_spree_credit_cards_on_address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_credit_cards`
--

LOCK TABLES `spree_credit_cards` WRITE;
/*!40000 ALTER TABLE `spree_credit_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_districts`
--

DROP TABLE IF EXISTS `spree_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_districts_on_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=744 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_districts`
--

LOCK TABLES `spree_districts` WRITE;
/*!40000 ALTER TABLE `spree_districts` DISABLE KEYS */;
INSERT INTO `spree_districts` VALUES (1,'Quận Ba Đình',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(2,'Quận Hoàn Kiếm',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(3,'Quận Hai Bà Trưng',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(4,'Quận Đống Đa',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(5,'Quận Tây Hồ',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(6,'Quận Cầu Giấy',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(7,'Quận Thanh Xuân',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(8,'Quận Hoàng Mai',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(9,'Quận Long Biên',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(10,'Huyện Từ Liêm',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(11,'Huyện Thanh Trì',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(12,'Huyện Gia Lâm',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(13,'Huyện Đông Anh',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(14,'Huyện Sóc Sơn',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(15,'Quận Hà Đông',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(16,'Thị xã Sơn Tây',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(17,'Huyện Ba Vì',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(18,'Huyện Phúc Thọ',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(19,'Huyện Thạch Thất',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(20,'Huyện Quốc Oai',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(21,'Huyện Chương Mỹ',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(22,'Huyện Đan Phượng',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(23,'Huyện Hoài Đức',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(24,'Huyện Thanh Oai',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(25,'Huyện Mỹ Đức',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(26,'Huyện Ứng Hoà',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(27,'Huyện Thường Tín',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(28,'Huyện Phú Xuyên',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(29,'Huyện Mê Linh',24,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(31,'Quận 1',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(32,'Quận 2',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(33,'Quận 3',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(34,'Quận 4',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(35,'Quận 5',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(36,'Quận 6',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(37,'Quận 7',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(38,'Quận 8',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(39,'Quận 9',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(40,'Quận 10',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(41,'Quận 11',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(42,'Quận 12',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(43,'Quận Gò Vấp',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(44,'Quận Tân Bình',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(45,'Quận Tân Phú',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(46,'Quận Bình Thạnh',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(47,'Quận Phú Nhuận',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(48,'Quận Thủ Đức',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(49,'Quận Bình Tân',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(50,'Huyện Bình Chánh',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(51,'Huyện Củ Chi',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(52,'Huyện Hóc Môn',29,'2014-10-28 10:13:34','2014-10-28 10:13:34'),(53,'Huyện Nhà Bè',29,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(54,'Huyện Cần Giờ',29,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(56,'Quận Hồng Bàng',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(57,'Quận Lê Chân',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(58,'Quận Ngô Quyền',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(59,'Quận Kiến An',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(60,'Quận Hải An',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(61,'Quận Đồ Sơn',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(62,'Huyện An Lão',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(63,'Huyện Kiến Thụy',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(64,'Huyện Thủy Nguyên',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(65,'Huyện An Dương',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(66,'Huyện Tiên Lãng',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(67,'Huyện Vĩnh Bảo',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(68,'Huyện Cát Hải',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(69,'Huyện Bạch Long Vĩ',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(70,'Quận Dương Kinh',27,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(72,'Quận Hải Châu',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(73,'Quận Thanh Khê',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(74,'Quận Sơn Trà',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(75,'Quận Ngũ Hành Sơn',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(76,'Quận Liên Chiểu',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(77,'Huyện Hoà Vang',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(78,'Quận Cẩm Lệ',15,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(80,'Thành phố Hà Giang',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(81,'Huyện Đồng Văn',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(82,'Huyện Mèo Vạc',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(83,'Huyện Yên Minh',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(84,'Huyện Quản Bạ',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(85,'Huyện Vị Xuyên',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(86,'Huyện Bắc Mê',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(87,'Huyện Hoàng Su Phì',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(88,'Huyện Xín Mần',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(89,'Huyện Bắc Quang',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(90,'Huyện Quang Bình',22,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(92,'Thị xã Cao Bằng',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(93,'Huyện Bảo Lạc',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(94,'Huyện Thông Nông',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(95,'Huyện Hà Quảng',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(96,'Huyện Trà Lĩnh',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(97,'Huyện Trùng Khánh',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(98,'Huyện Nguyên Bình',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(99,'Huyện Hoà An',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(100,'Huyện Quảng Uyên',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(101,'Huyện Thạch An',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(102,'Huyện Hạ Lang',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(103,'Huyện Bảo Lâm',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(104,'Huyện Phục Hoà',13,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(106,'Thị xã Lai Châu',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(107,'Huyện Tam Đường',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(108,'Huyện Phong Thổ',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(109,'Huyện Sìn Hồ',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(110,'Huyện Mường Tè',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(111,'Huyện Than Uyên',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(112,'Huyện Tân Uyên',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(113,'Huyện Nậm Nhùn',35,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(115,'Thành phố Lào Cai',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(116,'Huyện Xi Ma Cai',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(117,'Huyện Bát Xát',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(118,'Huyện Bảo Thắng',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(119,'Huyện Sa Pa',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(120,'Huyện Văn Bàn',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(121,'Huyện Bảo Yên',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(122,'Huyện Bắc Hà',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(123,'Huyện Mường Khương',36,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(125,'Th. phố Tuyên Quang',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(126,'Huyện Lâm Bình',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(127,'Huyện Na Hang',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(128,'Huyện Chiêm Hoá',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(129,'Huyện Hàm Yên',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(130,'Huyện Yên Sơn',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(131,'Huyện Sơn Dương',60,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(133,'Thành phố Lạng Sơn',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(134,'Huyện Tràng Định',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(135,'Huyện Bình Gia',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(136,'Huyện Văn Lãng',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(137,'Huyện Bắc Sơn',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(138,'Huyện Văn Quan',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(139,'Huyện Cao Lộc',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(140,'Huyện Lộc Bình',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(141,'Huyện Chi Lăng',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(142,'Huyện Đình Lập',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(143,'Huyện Hữu Lũng',37,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(145,'Thị xã Bắc Kạn',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(146,'Huyện Chợ Đồn',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(147,'Huyện Bạch Thông',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(148,'Huyện Na Rì',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(149,'Huyện Ngân Sơn',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(150,'Huyện Ba Bể',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(151,'Huyện Chợ Mới',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(152,'Huyện Pác Nặm',4,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(154,'TP.Thái Nguyên',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(155,'Thị xã Sông Công',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(156,'Huyện Định Hoá',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(157,'Huyện Phú Lương',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(158,'Huyện Võ Nhai',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(159,'Huyện Đại Từ',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(160,'Huyện Đồng Hỷ',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(161,'Huyện Phú Bình',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(162,'Huyện Phổ Yên',55,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(164,'Thành phố Yên Bái',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(165,'Thị xã Nghĩa Lộ',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(166,'Huyện Văn Yên',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(167,'Huyện Yên Bình',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(168,'Huyện Mù Cang Chải',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(169,'Huyện Văn Chấn',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(170,'Huyện Trấn Yên',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(171,'Huyện Trạm Tấu',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(172,'Huyện Lục Yên',63,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(174,'Thành phố Sơn La',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(175,'Huyện Quỳnh Nhai',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(176,'Huyện Mường La',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(177,'Huyện Thuận Châu',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(178,'Huyện Bắc Yên',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(179,'Huyện Phù Yên',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(180,'Huyện Mai Sơn',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(181,'Huyện Yên Châu',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(182,'Huyện Sông Mã',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(183,'Huyện Mộc Châu',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(184,'Huyện Sốp Cộp',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(185,'Huyện Vân Hồ',52,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(187,'TP. Việt Trì',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(188,'Thị xã Phú Thọ',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(189,'Huyện Đoan Hùng',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(190,'Huyện Thanh Ba',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(191,'Huyện Hạ Hoà',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(192,'Huyện Cẩm Khê',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(193,'Huyện Yên Lập',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(194,'Huyện Thanh Sơn',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(195,'Huyện Phù Ninh',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(196,'Huyện Lâm Thao',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(197,'Huyện Tam Nông',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(198,'Huyện Thanh Thủy',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(199,'Huyện Tân Sơn',44,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(201,'Thành phố Vĩnh Yên',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(202,'Huyện Tam Dương',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(203,'Huyện Lập Thạch',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(204,'Huyện Vĩnh Tường',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(205,'Huyện Yên Lạc',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(206,'Huyện Bình Xuyên',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(207,'Huyện Sông Lô',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(208,'Thị xã Phúc Yên',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(209,'Huyện Tam Đảo',62,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(211,'Thành phố Hạ Long',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(212,'Thành phố Cẩm Phả',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(213,'Thành phố Uông Bí',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(214,'Thành phố Móng Cái',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(215,'Huyện Bình Liêu',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(216,'Huyện Đầm Hà',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(217,'Huyện Hải Hà',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(218,'Huyện Tiên Yên',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(219,'Huyện Ba Chẽ',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(220,'Huyện Đông Triều',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(221,'Huyện Yên Hưng',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(222,'Huyện Hoành Bồ',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(223,'Huyện Vân Đồn',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(224,'Huyện Cô Tô',49,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(226,'Thành phố Bắc Giang',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(227,'Huyện Yên Thế',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(228,'Huyện Lục Ngạn',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(229,'Huyện Sơn Động',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(230,'Huyện Lục Nam',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(231,'Huyện Tân Yên',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(232,'Huyện Hiệp Hoà',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(233,'Huyện Lạng Giang',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(234,'Huyện Việt Yên',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(235,'Huyện Yên Dũng',5,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(237,'Thành phố Bắc Ninh',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(238,'Huyện Yên Phong',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(239,'Huyện Quế Võ',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(240,'Huyện Tiên Du',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(241,'Thị xã Từ Sơn',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(242,'Huyện Thuận Thành',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(243,'Huyện Gia Bình',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(244,'Huyện Lương Tài',6,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(246,'Thành phố Hải Dương',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(247,'Thị xã Chí Linh',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(248,'Huyện Nam Sách',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(249,'Huyện Kinh Môn',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(250,'Huyện Gia Lộc',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(251,'Huyện Tứ Kỳ',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(252,'Huyện Thanh Miện',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(253,'Huyện Ninh Giang',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(254,'Huyện Cẩm Giàng',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(255,'Huyện Thanh Hà',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(256,'Huyện Kim Thành',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(257,'Huyện Bình Giang',26,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(259,'Thành phố Hưng Yên',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(260,'Huyện Kim Động',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(261,'Huyện Ân Thi',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(262,'Huyện Khoái Châu',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(263,'Huyện Yên Mỹ',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(264,'Huyện Tiên Lữ',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(265,'Huyện Phù Cừ',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(266,'Huyện Mỹ Hào',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(267,'Huyện Văn Lâm',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(268,'Huyện Văn Giang',31,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(270,'Thành phố Hoà Bình',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(271,'Huyện Đà Bắc',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(272,'Huyện Mai Châu',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(273,'Huyện Tân Lạc',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(274,'Huyện Lạc Sơn',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(275,'Huyện Kỳ Sơn',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(276,'Huyện Lư­ơng Sơn',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(277,'Huyện Kim Bôi',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(278,'Huyện Lạc Thuỷ',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(279,'Huyện Yên Thuỷ',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(280,'Huyện Cao Phong',28,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(282,'Thành phố Phủ Lý',23,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(283,'Huyện Duy Tiên',23,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(284,'Huyện Kim Bảng',23,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(285,'Huyện Lý Nhân',23,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(286,'Huyện Thanh Liêm',23,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(287,'Huyện Bình Lục',23,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(289,'Thành phố Nam Định',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(290,'Huyện Mỹ Lộc',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(291,'Huyện Xuân Trường',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(292,'Huyện Giao Thủy',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(293,'Huyện Ý Yên',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(294,'Huyện Vụ Bản',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(295,'Huyện Nam Trực',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(296,'Huyện Trực Ninh',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(297,'Huyện Nghĩa Hưng',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(298,'Huyện Hải Hậu',40,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(300,'Thành phố Thái Bình',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(301,'Huyện Quỳnh Phụ',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(302,'Huyện Hưng Hà',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(303,'Huyện Đông Hưng',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(304,'Huyện Vũ Thư',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(305,'Huyện Kiến Xương',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(306,'Huyện Tiền Hải',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(307,'Huyện Thái Thuỵ',54,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(309,'Thành phố Ninh Bình',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(310,'Thị xã Tam Điệp',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(311,'Huyện Nho Quan',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(312,'Huyện Gia Viễn',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(313,'Huyện Hoa Lư',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(314,'Huyện Yên Mô',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(315,'Huyện Kim Sơn',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(316,'Huyện Yên Khánh',42,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(318,'Thành phố Thanh Hoá',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(319,'Thị xã Bỉm Sơn',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(320,'Thị xã Sầm Sơn',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(321,'Huyện Quan Hoá',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(322,'Huyện Quan Sơn',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(323,'Huyện Mường Lát',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(324,'Huyện Bá Thước',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(325,'Huyện Thường Xuân',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(326,'Huyện Như Xuân',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(327,'Huyện Như Thanh',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(328,'Huyện Lang Chánh',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(329,'Huyện Ngọc Lặc',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(330,'Huyện Thạch Thành',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(331,'Huyện Cẩm Thủy',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(332,'Huyện Thọ Xuân',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(333,'Huyện Vĩnh Lộc',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(334,'Huyện Thiệu Hoá',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(335,'Huyện Triệu Sơn',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(336,'Huyện Nông Cống',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(337,'Huyện Đông Sơn',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(338,'Huyện Hà Trung',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(339,'Huyện Hoằng Hoá',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(340,'Huyện Nga Sơn',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(341,'Huyện Hậu Lộc',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(342,'Huyện Quảng Xương',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(343,'Huyện Tĩnh Gia',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(344,'Huyện Yên Định',56,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(346,'Thành phố Vinh',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(347,'Thị xã Cửa Lò',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(348,'Huyện Quỳ Châu',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(349,'Huyện Quỳ Hợp',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(350,'Huyện Nghĩa Đàn',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(351,'Huyện Quỳnh Lưu',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(352,'Huyện Kỳ Sơn',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(353,'Huyện Tương Dương',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(354,'Huyện Con Cuông',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(355,'Huyện Tân Kỳ',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(356,'Huyện Yên Thành',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(357,'Huyện Diễn Châu',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(358,'Huyện Anh Sơn',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(359,'Huyện Đô Lương',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(360,'Huyện Thanh Chương',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(361,'Huyện Nghi Lộc',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(362,'Huyện Nam Đàn',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(363,'Huyện Hưng Nguyên',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(364,'Huyện Quế Phong',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(365,'Thị xã Thái Hòa',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(366,'Thị xã Hoàng Mai',41,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(368,'Thành phố Hà Tĩnh',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(369,'Thị xã Hồng Lĩnh',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(370,'Huyện Hương Sơn',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(371,'Huyện Đức Thọ',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(372,'Huyện Nghi Xuân',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(373,'Huyện Can Lộc',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(374,'Huyện Hương Khê',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(375,'Huyện Thạch Hà',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(376,'Huyện Cẩm Xuyên',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(377,'Huyện Kỳ Anh',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(378,'Huyện Vũ Quang',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(379,'Huyện Lộc Hà',25,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(381,'Thành phố Đồng Hới',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(382,'Huyện Tuyên Hoá',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(383,'Huyện Minh Hoá',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(384,'Huyện Quảng Trạch',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(385,'Huyện Bố Trạch',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(386,'Huyện Quảng Ninh',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(387,'Huyện Lệ Thuỷ',46,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(389,'Thành phố Đông Hà',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(390,'Thị xã Quảng Trị',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(391,'Huyện Vĩnh Linh',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(392,'Huyện Gio Linh',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(393,'Huyện Cam Lộ',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(394,'Huyện Triệu Phong',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(395,'Huyện Hải Lăng',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(396,'Huyện Hướng Hóa',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(397,'Huyện Đăk Rông',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(398,'Huyện đảo Cồn Cỏ',50,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(400,'Thành phố Tam Kỳ',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(401,'Thành phố Hội An',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(402,'Huyện Duy Xuyên',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(403,'Huyện Điện Bàn',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(404,'Huyện Đại Lộc',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(405,'Huyện Quế Sơn',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(406,'Huyện Hiệp Đức',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(407,'Huyện Thăng Bình',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(408,'Huyện Núi Thành',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(409,'Huyện Tiên Phước',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(410,'Huyện Bắc Trà My',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(411,'Huyện Đông Giang',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(412,'Huyện Nam Giang',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(413,'Huyện Phước Sơn',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(414,'Huyện Nam Trà My',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(415,'Huyện Tây Giang',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(416,'Huyện Phú Ninh',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(417,'Huyện Nông Sơn',47,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(419,'Thành phố Quảng Ngãi',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(420,'Huyện Lý Sơn',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(421,'Huyện Bình Sơn',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(422,'Huyện Trà Bồng',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(423,'Huyện Sơn Tịnh',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(424,'Huyện Sơn Hà',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(425,'Huyện Tư Nghĩa',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(426,'Huyện Nghĩa Hành',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(427,'Huyện Minh Long',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(428,'Huyện Mộ Đức',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(429,'Huyện Đức Phổ',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(430,'Huyện Ba Tơ',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(431,'Huyện Sơn Tây',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(432,'Huyện Tây Trà',48,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(434,'Thành phố KonTum',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(435,'Huyện Đăk Glei',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(436,'Huyện Ngọc Hồi',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(437,'Huyện Đăk Tô',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(438,'Huyện Sa Thầy',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(439,'Huyện Kon Plong',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(440,'Huyện Đăk Hà',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(441,'Huyện Kon Rẫy',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(442,'Huyện Tu Mơ Rông',34,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(444,'Thành phố Quy Nhơn',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(445,'Huyện An Lão',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(446,'Huyện Hoài Ân',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(447,'Huyện Hoài Nhơn',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(448,'Huyện Phù Mỹ',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(449,'Huyện Phù Cát',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(450,'Huyện Vĩnh Thạnh',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(451,'Huyện Tây Sơn',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(452,'Huyện Vân Canh',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(453,'Huyện An Nhơn',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(454,'Huyện Tuy Phước',9,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(456,'Thành phố Pleiku',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(457,'Huyện Chư Păh',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(458,'Huyện Mang Yang',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(459,'Huyện Kbang',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(460,'Thị xã An Khê',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(461,'Huyện Kông Chro',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(462,'Huyện Đức Cơ',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(463,'Huyện Chư Prông',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(464,'Huyện Chư Sê',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(465,'Thị xã Ayunpa',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(466,'Huyện Krông Pa',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(467,'Huyện Ia Grai',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(468,'Huyện Đăk Đoa',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(469,'Huyện Ia Pa',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(470,'Huyện Đăk Pơ',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(471,'Huyện Phú Thiện',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(472,'Huyện Chư Pưh',21,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(474,'Thành phố Tuy Hoà',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(475,'Huyện Đồng Xuân',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(476,'Thị xã Sông Cầu',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(477,'Huyện Tuy An',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(478,'Huyện Sơn Hoà',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(479,'Huyện Sông Hinh',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(480,'Huyện Đông Hoà',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(481,'Huyện Phú Hoà',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(482,'Huyện Tây Hoà',45,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(483,'Thành phố Buôn Ma Thuột',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(484,'Huyện Ea H Leo',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(485,'Huyện Krông Buk',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(486,'Huyện Krông Năng',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(487,'Huyện Ea Súp',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(488,'Huyện Cư M’gar',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(489,'Huyện Krông Pắc',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(490,'Huyện Ea Kar',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(491,'Huyện M\'Đrăk',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(492,'Huyện Krông Ana',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(493,'Huyện Krông Bông',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(494,'Huyện Lăk',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(495,'Huyện Buôn Đôn',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(496,'Huyện Cư Kuin',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(497,'Thị xã Buôn Hồ',16,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(499,'Thành phố Nha Trang',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(500,'Huyện Vạn Ninh',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(501,'Huyện Ninh Hoà',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(502,'Huyện Diên Khánh',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(503,'Huyện Khánh Vĩnh',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(504,'Thị xã Cam Ranh',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(505,'Huyện Khánh Sơn',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(506,'Huyện đảo Trường Sa',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(507,'Huyện Cam Lâm',32,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(509,'Thành phố Đà Lạt',38,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(510,'Thị xã Bảo Lộc',38,'2014-10-28 10:13:35','2014-10-28 10:13:35'),(511,'Huyện Đức Trọng',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(512,'Huyện Di Linh',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(513,'Huyện Đơn Dương',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(514,'Huyện Lạc Dương',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(515,'Huyện Đạ Huoai',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(516,'Huyện Đạ Tẻh',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(517,'Huyện Cát Tiên',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(518,'Huyện Lâm Hà',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(519,'Huyện Bảo Lâm',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(520,'Huyện Đam Rông',38,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(522,'Thị xã Đồng Xoài',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(523,'Huyện Đồng Phú',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(524,'Huyện Chơn Thành',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(525,'Huyện Bình Long',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(526,'Huyện Lộc Ninh',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(527,'Huyện Bù Đốp',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(528,'Huyện Phước Long',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(529,'Huyện Bù Đăng',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(530,'Huyện Hớn Quản',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(531,'Huyện Bù Gia Mập',10,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(533,'Thành phố Thủ Dầu Một',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(534,'Huyện Bến Cát',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(535,'Huyện Tân Uyên',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(536,'Huyện Thuận An',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(537,'Huyện Dĩ An',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(538,'Huyện Phú Giáo',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(539,'Huyện Dầu Tiếng',8,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(541,'Thành phố Phan Rang -Tháp Chàm',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(542,'Huyện Ninh Sơn',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(543,'Huyện Ninh Hải',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(544,'Huyện Ninh Phước',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(545,'Huyện Bác Ái',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(546,'Huyện Thuận Bắc',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(547,'Huyện Thuận Nam',43,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(549,'Thị xã Tây Ninh',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(550,'Huyện Tân Biên',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(551,'Huyện Tân Châu',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(552,'H. Dương Minh Châu',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(553,'Huyện Châu Thành',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(554,'Huyện Hòa Thành',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(555,'Huyện Bến Cầu',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(556,'Huyện Gò Dầu',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(557,'Huyện Trảng Bàng',53,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(559,'Thành phố Phan Thiết',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(560,'Huyện Tuy Phong',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(561,'Huyện Bắc Bình',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(562,'H. Hàm Thuận Bắc',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(563,'H. Hàm Thuận Nam',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(564,'Huyện Hàm Tân',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(565,'Huyện Đức Linh',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(566,'Huyện Tánh Linh',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(567,'Huyện đảo Phú Quý',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(568,'Thị xã La Gi',11,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(570,'Thành phố Biên Hoà',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(571,'Huyện Vĩnh Cửu',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(572,'Huyện Tân Phú',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(573,'Huyện Định Quán',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(574,'Huyện Thống Nhất',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(575,'Thị xã Long Khánh',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(576,'Huyện Xuân Lộc',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(577,'Huyện Long Thành',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(578,'Huyện Nhơn Trạch',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(579,'Huyện Trảng Bom',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(580,'Huyện Cẩm Mỹ',19,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(582,'Thành phố Tân An',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(583,'Huyện Vĩnh Hưng',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(584,'Huyện Mộc Hoá',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(585,'Huyện Tân Thạnh',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(586,'Huyện Thạnh Hoá',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(587,'Huyện Đức Huệ',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(588,'Huyện Đức Hoà',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(589,'Huyện Bến Lức',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(590,'Huyện Thủ Thừa',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(591,'Huyện Châu Thành',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(592,'Huyện Tân Trụ',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(593,'Huyện Cần Đước',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(594,'Huyện Cần Giuộc',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(595,'Huyện Tân Hưng',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(596,'Thị xã Kiến Tường',39,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(598,'Thành phố Cao Lãnh',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(599,'Thị xã Sa Đéc',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(600,'Huyện Tân Hồng',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(601,'Huyện Hồng Ngự',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(602,'Huyện Tam Nông',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(603,'Huyện Thanh Bình',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(604,'Huyện Cao Lãnh',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(605,'Huyện Lấp Vò',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(606,'Huyện Tháp Mười',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(607,'Huyện Lai Vung',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(608,'Huyện Châu Thành',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(609,'Thị xã Hồng Ngự',20,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(611,'Thành phố Long Xuyên',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(612,'Thị xã Châu Đốc',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(613,'Huyện An Phú',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(614,'Huyện Tân Châu',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(615,'Huyện Phú Tân',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(616,'Huyện Tịnh Biên',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(617,'Huyện Tri Tôn',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(618,'Huyện Châu Phú',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(619,'Huyện Chợ Mới',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(620,'Huyện Châu Thành',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(621,'Huyện Thoại Sơn',1,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(622,'Sở Giáo dục Đào tạo',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(623,'Thành phố Mỹ Tho',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(624,'Thị xã Gò Công',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(625,'Huyện Cái Bè',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(626,'Huyện Cai Lậy',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(627,'Huyện Châu Thành',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(628,'Huyện Chợ Gạo',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(629,'Huyện Gò Công Tây',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(630,'Huyện Gò Công Đông',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(631,'Huyện Tân Phước',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(632,'Huyện Tân Phú Đông',58,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(634,'Thành phố Rạch Giá',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(635,'Thị xã Hà Tiên',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(636,'Huyện Kiên Lương',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(637,'Huyện Hòn Đất',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(638,'Huyện Tân Hiệp',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(639,'Huyện Châu Thành',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(640,'Huyện Giồng Riềng',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(641,'Huyện Gò Quao',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(642,'Huyện An Biên',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(643,'Huyện An Minh',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(644,'Huyện Vĩnh Thuận',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(645,'Huyện đảo Phú Quốc',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(646,'Huyện Kiên Hải',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(647,'Huyện U Minh Thượng',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(648,'Huyện Giang Thành',33,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(650,'Quận Ninh Kiều',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(651,'Quận Bình Thuỷ',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(652,'Quận Cái Răng',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(653,'Quận Ô Môn',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(654,'Huyện Phong Điền',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(655,'Huyện Cờ Đỏ',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(656,'Huyện Vĩnh Thạnh',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(657,'Quận Thốt Nốt',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(658,'Huyện Thới Lai',14,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(660,'Thành phố Bến Tre',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(661,'Huyện Châu Thành',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(662,'Huyện Chợ Lách',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(663,'Huyện Mỏ Cày Bắc',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(664,'Huyện Giồng Trôm',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(665,'Huyện Bình Đại',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(666,'Huyện Ba Tri',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(667,'Huyện Thạnh Phú',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(668,'Huyện Mỏ Cày Nam',7,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(670,'Thành phố Vĩnh Long',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(671,'Huyện Long Hồ',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(672,'Huyện Mang Thít',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(673,'Huyện Bình Minh',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(674,'Huyện Tam Bình',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(675,'Huyện Trà Ôn',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(676,'Huyện Vũng Liêm',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(677,'Huyện Bình Tân',61,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(679,'Thành phố Trà Vinh',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(680,'Huyện Càng Long',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(681,'Huyện Cầu Kè',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(682,'Huyện Tiểu Cần',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(683,'Huyện Châu Thành',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(684,'Huyện Trà Cú',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(685,'Huyện Cầu Ngang',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(686,'Huyện Duyên Hải',59,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(688,'Thành phố Sóc Trăng',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(689,'Huyện Kế Sách',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(690,'Huyện Mỹ Tú',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(691,'Huyện Mỹ Xuyên',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(692,'Huyện Thạnh Trị',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(693,'Huyện Long Phú',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(694,'Thị xã Vĩnh Châu',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(695,'Huyện Cù Lao Dung',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(696,'Huyện Ngã Năm',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(697,'Huyện Châu Thành',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(698,'Huyện Trần Đề',51,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(700,'Thành phố Bạc Liêu',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(701,'Huyện Vĩnh Lợi',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(702,'Huyện Hồng Dân',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(703,'Huyện Giá Rai',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(704,'Huyện Phước Long',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(705,'Huyện Đông Hải',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(706,'Huyện Hoà Bình',3,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(708,'Thành phố Cà Mau',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(709,'Huyện Thới Bình',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(710,'Huyện U Minh',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(711,'Huyện Trần Văn Thời',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(712,'Huyện Cái Nước',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(713,'Huyện Đầm Dơi',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(714,'Huyện Ngọc Hiển',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(715,'Huyện Năm Căn',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(716,'Huyện Phú Tân',12,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(718,'TP. Điện Biên Phủ',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(719,'Thị xã Mường Lay',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(720,'Huyện Điện Biên',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(721,'Huyện Tuần Giáo',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(722,'Huyện Mường Chà',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(723,'Huyện Tủa Chùa',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(724,'Huyện Điện Biên Đông',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(725,'Huyện Mường Nhé',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(726,'Huyện Mường Ảng',18,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(728,'Thị xã Gia Nghĩa',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(729,'Huyện Đắk R’Lấp',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(730,'Huyện Đắk Mil',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(731,'Huyện Cư Jút',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(732,'Huyện Đắk Song',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(733,'Huyện Krông Nô',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(734,'Huyện Đắk GLong',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(735,'Huyện Tuy Đức',17,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(737,'Thành phố Vị Thanh',30,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(738,'Huyện Vị Thuỷ',30,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(739,'Huyện Long Mỹ',30,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(740,'Huyện Phụng Hiệp',30,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(741,'Huyện Châu Thành',30,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(742,'Huyện Châu Thành A',30,'2014-10-28 10:13:36','2014-10-28 10:13:36'),(743,'Thị xã Ngã Bảy',30,'2014-10-28 10:13:36','2014-10-28 10:13:36');
/*!40000 ALTER TABLE `spree_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_gateways`
--

DROP TABLE IF EXISTS `spree_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'development',
  `server` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'test',
  `test_mode` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_spree_gateways_on_active` (`active`),
  KEY `index_spree_gateways_on_test_mode` (`test_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_gateways`
--

LOCK TABLES `spree_gateways` WRITE;
/*!40000 ALTER TABLE `spree_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_inventory_units`
--

DROP TABLE IF EXISTS `spree_inventory_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_inventory_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `return_authorization_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pending` tinyint(1) DEFAULT '1',
  `line_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_inventory_units_on_order_id` (`order_id`),
  KEY `index_inventory_units_on_shipment_id` (`shipment_id`),
  KEY `index_inventory_units_on_variant_id` (`variant_id`),
  KEY `index_spree_inventory_units_on_line_item_id` (`line_item_id`),
  KEY `index_spree_inventory_units_on_return_authorization_id` (`return_authorization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_inventory_units`
--

LOCK TABLES `spree_inventory_units` WRITE;
/*!40000 ALTER TABLE `spree_inventory_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_inventory_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_line_items`
--

DROP TABLE IF EXISTS `spree_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `adjustment_total` decimal(10,2) DEFAULT '0.00',
  `additional_tax_total` decimal(10,2) DEFAULT '0.00',
  `promo_total` decimal(10,2) DEFAULT '0.00',
  `included_tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pre_tax_amount` decimal(8,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `index_spree_line_items_on_order_id` (`order_id`),
  KEY `index_spree_line_items_on_variant_id` (`variant_id`),
  KEY `index_spree_line_items_on_tax_category_id` (`tax_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_line_items`
--

LOCK TABLES `spree_line_items` WRITE;
/*!40000 ALTER TABLE `spree_line_items` DISABLE KEYS */;
INSERT INTO `spree_line_items` VALUES (1,1,1,3,400000.00,'2014-10-28 02:27:37','2014-10-31 05:01:52','VND',NULL,NULL,0.00,0.00,0.00,0.00,0.00),(2,4,2,1,300000.00,'2014-10-31 06:01:07','2014-10-31 06:01:08','VND',NULL,1,0.00,0.00,0.00,0.00,300000.00),(3,1,3,1,400000.00,'2014-10-31 06:20:00','2014-10-31 06:20:00','VND',NULL,1,0.00,0.00,0.00,0.00,400000.00),(4,4,6,1,300000.00,'2014-10-31 06:38:47','2014-10-31 06:38:47','VND',NULL,1,0.00,0.00,0.00,0.00,300000.00),(6,91,7,1,0.00,'2014-10-31 11:52:38','2014-10-31 11:52:38','VND',NULL,1,0.00,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `spree_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_log_entries`
--

DROP TABLE IF EXISTS `spree_log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_log_entries_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_log_entries`
--

LOCK TABLES `spree_log_entries` WRITE;
/*!40000 ALTER TABLE `spree_log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_option_type_translations`
--

DROP TABLE IF EXISTS `spree_option_type_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_option_type_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_option_type_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_option_type_translations_on_spree_option_type_id` (`spree_option_type_id`),
  KEY `index_spree_option_type_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_option_type_translations`
--

LOCK TABLES `spree_option_type_translations` WRITE;
/*!40000 ALTER TABLE `spree_option_type_translations` DISABLE KEYS */;
INSERT INTO `spree_option_type_translations` VALUES (1,1,'vi','2014-10-27 10:42:38','2014-10-30 05:56:32','color','Màu');
/*!40000 ALTER TABLE `spree_option_type_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_option_types`
--

DROP TABLE IF EXISTS `spree_option_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_option_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_option_types_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_option_types`
--

LOCK TABLES `spree_option_types` WRITE;
/*!40000 ALTER TABLE `spree_option_types` DISABLE KEYS */;
INSERT INTO `spree_option_types` VALUES (1,'color','Màu',0,'2014-10-27 10:42:38','2014-10-30 05:56:32');
/*!40000 ALTER TABLE `spree_option_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_option_types_prototypes`
--

DROP TABLE IF EXISTS `spree_option_types_prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_option_types_prototypes` (
  `prototype_id` int(11) DEFAULT NULL,
  `option_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_option_types_prototypes`
--

LOCK TABLES `spree_option_types_prototypes` WRITE;
/*!40000 ALTER TABLE `spree_option_types_prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_option_types_prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_option_value_translations`
--

DROP TABLE IF EXISTS `spree_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_option_value_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_option_value_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_option_value_translations_on_spree_option_value_id` (`spree_option_value_id`),
  KEY `index_spree_option_value_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_option_value_translations`
--

LOCK TABLES `spree_option_value_translations` WRITE;
/*!40000 ALTER TABLE `spree_option_value_translations` DISABLE KEYS */;
INSERT INTO `spree_option_value_translations` VALUES (1,1,'vi','2014-10-27 10:43:38','2014-10-27 10:43:38','trang','Trắng'),(2,2,'vi','2014-10-27 10:44:00','2014-10-27 10:44:00','den','Đen'),(3,3,'vi','2014-10-30 01:46:48','2014-10-30 01:46:48','do','Đỏ'),(4,4,'vi','2014-10-30 01:49:17','2014-10-30 01:49:17','tim','Tím'),(5,5,'vi','2014-10-30 01:49:17','2014-10-30 01:49:17','xanh-la','Xanh Lá'),(6,6,'vi','2014-10-30 01:49:17','2014-10-30 01:49:17','vang','Vàng'),(7,7,'vi','2014-10-30 01:49:18','2014-10-30 01:49:18','xanh-lam','Xanh Lam'),(8,8,'vi','2014-10-30 03:22:55','2014-10-30 03:22:55','bac','Bạc');
/*!40000 ALTER TABLE `spree_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_option_values`
--

DROP TABLE IF EXISTS `spree_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_option_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_option_values_on_option_type_id` (`option_type_id`),
  KEY `index_spree_option_values_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_option_values`
--

LOCK TABLES `spree_option_values` WRITE;
/*!40000 ALTER TABLE `spree_option_values` DISABLE KEYS */;
INSERT INTO `spree_option_values` VALUES (1,1,'trang','Trắng',1,'2014-10-27 10:43:38','2014-10-27 10:43:39'),(2,2,'den','Đen',1,'2014-10-27 10:44:00','2014-10-27 10:44:00'),(3,3,'do','Đỏ',1,'2014-10-30 01:46:48','2014-10-30 01:46:48'),(4,4,'tim','Tím',1,'2014-10-30 01:49:17','2014-10-30 01:49:17'),(5,5,'xanh-la','Xanh Lá',1,'2014-10-30 01:49:17','2014-10-30 01:49:17'),(6,6,'vang','Vàng',1,'2014-10-30 01:49:17','2014-10-30 01:49:17'),(7,7,'xanh-lam','Xanh Lam',1,'2014-10-30 01:49:18','2014-10-30 01:49:18'),(8,8,'bac','Bạc',1,'2014-10-30 03:22:55','2014-10-30 03:22:55');
/*!40000 ALTER TABLE `spree_option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_option_values_variants`
--

DROP TABLE IF EXISTS `spree_option_values_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_option_values_variants` (
  `variant_id` int(11) DEFAULT NULL,
  `option_value_id` int(11) DEFAULT NULL,
  KEY `index_option_values_variants_on_variant_id_and_option_value_id` (`variant_id`,`option_value_id`),
  KEY `index_spree_option_values_variants_on_variant_id` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_option_values_variants`
--

LOCK TABLES `spree_option_values_variants` WRITE;
/*!40000 ALTER TABLE `spree_option_values_variants` DISABLE KEYS */;
INSERT INTO `spree_option_values_variants` VALUES (4,6),(5,1),(7,2),(8,1),(10,1),(11,2),(12,4),(13,5),(14,7),(16,1),(17,2),(19,2),(20,7),(22,1),(23,2),(25,1),(26,2),(28,1),(29,2),(30,3),(31,5),(32,7),(34,2),(35,3),(36,7),(37,5),(40,1),(41,2),(42,3),(44,1),(45,2),(46,7),(48,2),(49,3),(50,6),(52,1),(53,2),(54,3),(55,2),(57,1),(58,6),(60,1),(61,2),(62,7),(64,6),(65,2),(66,7),(69,6),(70,1),(71,2),(73,1),(74,2),(76,2),(77,1),(78,6),(80,2),(82,1),(83,2),(84,3),(86,1),(87,2),(88,3),(90,1),(91,3),(92,2),(93,7),(95,1),(96,2),(98,1),(99,2),(101,1),(102,2),(104,1),(105,2),(106,3),(108,1),(109,2),(111,1),(112,2),(114,1),(115,2),(117,2),(119,2),(121,1),(122,2),(124,2),(125,3),(126,6),(127,7),(129,1),(130,2),(132,1),(133,2),(135,1),(136,2),(138,1);
/*!40000 ALTER TABLE `spree_option_values_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_orders`
--

DROP TABLE IF EXISTS `spree_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adjustment_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_id` int(11) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `bill_address_id` int(11) DEFAULT NULL,
  `ship_address_id` int(11) DEFAULT NULL,
  `payment_total` decimal(10,2) DEFAULT '0.00',
  `shipping_method_id` int(11) DEFAULT NULL,
  `shipment_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_instructions` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `shipment_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `additional_tax_total` decimal(10,2) DEFAULT '0.00',
  `promo_total` decimal(10,2) DEFAULT '0.00',
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'spree',
  `included_tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item_count` int(11) DEFAULT '0',
  `approver_id` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `confirmation_delivered` tinyint(1) DEFAULT '0',
  `considered_risky` tinyint(1) DEFAULT '0',
  `guest_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_orders_on_number` (`number`),
  KEY `index_spree_orders_on_user_id` (`user_id`),
  KEY `index_spree_orders_on_completed_at` (`completed_at`),
  KEY `index_spree_orders_on_approver_id` (`approver_id`),
  KEY `index_spree_orders_on_bill_address_id` (`bill_address_id`),
  KEY `index_spree_orders_on_confirmation_delivered` (`confirmation_delivered`),
  KEY `index_spree_orders_on_considered_risky` (`considered_risky`),
  KEY `index_spree_orders_on_created_by_id` (`created_by_id`),
  KEY `index_spree_orders_on_ship_address_id` (`ship_address_id`),
  KEY `index_spree_orders_on_shipping_method_id` (`shipping_method_id`),
  KEY `index_spree_orders_on_user_id_and_created_by_id` (`user_id`,`created_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_orders`
--

LOCK TABLES `spree_orders` WRITE;
/*!40000 ALTER TABLE `spree_orders` DISABLE KEYS */;
INSERT INTO `spree_orders` VALUES (1,'R362896296',1200000.00,1200000.00,'complete',0.00,1,'2014-10-31 06:00:36',4,2,0.00,1,'pending','balance_due','testmely@gmail.com',NULL,'2014-10-28 02:27:37','2014-10-31 06:00:36','VND','14.161.16.235',1,0.00,0.00,0.00,'spree',0.00,3,NULL,NULL,0,0,'E3fk2b1GRVBRFmZcUrFHWg'),(2,'R279296310',300000.00,300000.00,'complete',0.00,1,'2014-10-31 06:01:21',5,6,0.00,1,'pending','balance_due','testmely@gmail.com',NULL,'2014-10-31 06:01:07','2014-10-31 06:01:21','VND','14.161.16.235',1,0.00,0.00,0.00,'spree',0.00,1,NULL,NULL,0,0,'YEp-hAKG6CgaJtRmHkDAyw'),(3,'R196236725',400000.00,400000.00,'canceled',0.00,1,'2014-10-31 06:20:23',7,8,0.00,1,'ready','balance_due','testmely@gmail.com',NULL,'2014-10-31 06:20:00','2014-10-31 06:20:51','VND','14.161.16.235',1,0.00,0.00,0.00,'spree',0.00,1,1,'2014-10-31 06:20:40',0,0,'YEp-hAKG6CgaJtRmHkDAyw'),(4,'R744602635',0.00,0.00,'cart',0.00,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,'2014-10-31 06:37:56','2014-10-31 06:37:56','VND',NULL,2,0.00,0.00,0.00,'spree',0.00,0,NULL,NULL,0,0,'NGNJ9LZVgBjP_NFB3vKPjw'),(5,'R959679415',0.00,0.00,'cart',0.00,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,'2014-10-31 06:38:07','2014-10-31 06:38:07','VND',NULL,2,0.00,0.00,0.00,'spree',0.00,0,NULL,NULL,0,0,'szsAsWhwSkPERnhpRSgEjA'),(6,'R004024682',300000.00,300000.00,'complete',0.00,2,'2014-10-31 06:39:26',9,10,0.00,1,'pending','balance_due','testmely@gmail.com',NULL,'2014-10-31 06:38:47','2014-10-31 06:39:26','VND','14.161.16.235',2,0.00,0.00,0.00,'spree',0.00,1,NULL,NULL,0,0,'9WxFbuGtDgiEdkFqyahIPw'),(7,'R921572248',0.00,0.00,'complete',0.00,2,'2014-10-31 11:56:21',11,12,0.00,1,'ready','paid','testmely@gmail.com',NULL,'2014-10-31 06:44:35','2014-10-31 11:56:21','VND','14.161.16.235',2,0.00,0.00,0.00,'spree',0.00,1,NULL,NULL,0,0,'9WxFbuGtDgiEdkFqyahIPw');
/*!40000 ALTER TABLE `spree_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_orders_promotions`
--

DROP TABLE IF EXISTS `spree_orders_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_orders_promotions` (
  `order_id` int(11) DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  KEY `index_spree_orders_promotions_on_order_id_and_promotion_id` (`order_id`,`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_orders_promotions`
--

LOCK TABLES `spree_orders_promotions` WRITE;
/*!40000 ALTER TABLE `spree_orders_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_orders_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_payment_capture_events`
--

DROP TABLE IF EXISTS `spree_payment_capture_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_payment_capture_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT '0.00',
  `payment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_payment_capture_events_on_payment_id` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_payment_capture_events`
--

LOCK TABLES `spree_payment_capture_events` WRITE;
/*!40000 ALTER TABLE `spree_payment_capture_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_payment_capture_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_payment_methods`
--

DROP TABLE IF EXISTS `spree_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT '1',
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'development',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `display_on` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_capture` tinyint(1) DEFAULT NULL,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_spree_payment_methods_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_payment_methods`
--

LOCK TABLES `spree_payment_methods` WRITE;
/*!40000 ALTER TABLE `spree_payment_methods` DISABLE KEYS */;
INSERT INTO `spree_payment_methods` VALUES (1,'Spree::PaymentMethod::Check','Check','',1,'production',NULL,'2014-10-31 06:00:27','2014-10-31 06:00:27','',1,'--- {}\n');
/*!40000 ALTER TABLE `spree_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_payments`
--

DROP TABLE IF EXISTS `spree_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avs_response` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvv_response_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvv_response_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_payments_on_order_id` (`order_id`),
  KEY `index_spree_payments_on_payment_method_id` (`payment_method_id`),
  KEY `index_spree_payments_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_payments`
--

LOCK TABLES `spree_payments` WRITE;
/*!40000 ALTER TABLE `spree_payments` DISABLE KEYS */;
INSERT INTO `spree_payments` VALUES (1,1200000.00,1,NULL,NULL,1,'checkout',NULL,NULL,'2014-10-31 06:00:35','2014-10-31 06:00:35','BRDACCLS',NULL,NULL),(2,300000.00,2,NULL,NULL,1,'checkout',NULL,NULL,'2014-10-31 06:01:21','2014-10-31 06:01:21','TCDPPPLQ',NULL,NULL),(3,400000.00,3,NULL,NULL,1,'checkout',NULL,NULL,'2014-10-31 06:20:23','2014-10-31 06:20:23','QR9VLVLT',NULL,NULL),(4,300000.00,6,NULL,NULL,1,'checkout',NULL,NULL,'2014-10-31 06:39:26','2014-10-31 06:39:26','E6RW25C4',NULL,NULL),(5,0.00,7,NULL,NULL,1,'checkout',NULL,NULL,'2014-10-31 11:56:21','2014-10-31 11:56:21','T9SSZ5LR',NULL,NULL);
/*!40000 ALTER TABLE `spree_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_preferences`
--

DROP TABLE IF EXISTS `spree_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text COLLATE utf8_unicode_ci,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_spree_preferences_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_preferences`
--

LOCK TABLES `spree_preferences` WRITE;
/*!40000 ALTER TABLE `spree_preferences` DISABLE KEYS */;
INSERT INTO `spree_preferences` VALUES (1,'--- false\n...\n','spree/app_configuration/address_requires_state','2014-10-26 05:51:30','2014-11-01 03:24:02'),(2,'--- false\n...\n','spree/auth_configuration/registration_step','2014-10-26 05:51:30','2014-11-01 03:24:02'),(3,'--- 49\n...\n','spree/app_configuration/default_country_id','2014-10-26 05:51:34','2014-10-26 05:51:34'),(4,'--- false\n...\n','spree/app_configuration/allow_ssl_in_production','2014-10-26 07:10:33','2014-11-01 03:24:02'),(6,'--- \'2014-11-01T09:06:14+07:00\'\n','spree/app_configuration/last_check_for_spree_alerts','2014-10-26 07:10:54','2014-11-01 02:06:14'),(7,'---\n- :en\n','spree_i18n/configuration/supported_locales','2014-10-26 12:43:02','2014-10-27 07:05:01'),(8,'---\n- :en\n','spree_i18n/configuration/available_locales','2014-10-26 12:43:02','2014-10-27 07:05:01'),(9,'--- true\n...\n','spree/app_configuration/allow_ssl_in_staging','2014-10-26 12:43:02','2014-10-27 07:05:01'),(10,'--- false\n...\n','spree/app_configuration/allow_ssl_in_development_and_test','2014-10-26 12:43:02','2014-10-27 07:05:01'),(11,'--- true\n...\n','spree/app_configuration/check_for_spree_alerts','2014-10-26 12:43:02','2014-10-27 07:05:01'),(12,'--- false\n...\n','spree/app_configuration/display_currency','2014-10-26 12:43:02','2014-10-27 07:05:01'),(13,'--- true\n...\n','spree/app_configuration/hide_cents','2014-10-26 12:43:02','2014-10-27 07:05:01'),(14,'--- VND\n...\n','spree/app_configuration/currency','2014-10-26 12:43:02','2014-10-27 07:05:01'),(15,'--- after\n...\n','spree/app_configuration/currency_symbol_position','2014-10-26 12:43:02','2014-10-27 07:05:01'),(16,'--- \".\"\n','spree/app_configuration/currency_decimal_mark','2014-10-26 12:43:02','2014-10-27 07:05:01'),(17,'--- \",\"\n','spree/app_configuration/currency_thousands_separator','2014-10-26 12:43:02','2014-10-27 07:05:01'),(18,'--- true\n...\n','spree/app_configuration/show_raw_product_description','2014-10-28 15:50:18','2014-11-01 03:24:02');
/*!40000 ALTER TABLE `spree_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_prices`
--

DROP TABLE IF EXISTS `spree_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_prices_on_variant_id_and_currency` (`variant_id`,`currency`),
  KEY `index_spree_prices_on_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_prices`
--

LOCK TABLES `spree_prices` WRITE;
/*!40000 ALTER TABLE `spree_prices` DISABLE KEYS */;
INSERT INTO `spree_prices` VALUES (1,1,400000.00,'USD',NULL),(2,1,400000.00,'VND',NULL),(3,2,360000.00,'VND',NULL),(4,3,300000.00,'VND',NULL),(5,4,300000.00,'VND',NULL),(6,5,300000.00,'VND',NULL),(7,6,100000.00,'VND',NULL),(8,7,100000.00,'VND',NULL),(9,8,100000.00,'VND',NULL),(10,9,100000.00,'VND',NULL),(11,10,100000.00,'VND',NULL),(12,11,100000.00,'VND',NULL),(13,12,100000.00,'VND',NULL),(14,13,100000.00,'VND',NULL),(15,14,100000.00,'VND',NULL),(16,15,100000.00,'VND',NULL),(17,16,100000.00,'VND',NULL),(18,17,100000.00,'VND',NULL),(19,18,100000.00,'VND',NULL),(20,19,100000.00,'VND',NULL),(21,20,100000.00,'VND',NULL),(22,21,110000.00,'VND',NULL),(23,22,110000.00,'VND',NULL),(24,23,110000.00,'VND',NULL),(25,24,300000.00,'VND',NULL),(26,25,300000.00,'VND',NULL),(27,26,300000.00,'VND',NULL),(28,27,120000.00,'VND',NULL),(29,28,120000.00,'VND',NULL),(30,29,120000.00,'VND',NULL),(31,30,120000.00,'VND',NULL),(32,31,120000.00,'VND',NULL),(33,32,120000.00,'VND',NULL),(34,33,120000.00,'VND',NULL),(35,34,120000.00,'VND',NULL),(36,35,120000.00,'VND',NULL),(37,36,120000.00,'VND',NULL),(38,37,120000.00,'VND',NULL),(39,38,120000.00,'VND',NULL),(40,39,120000.00,'VND',NULL),(41,40,120000.00,'VND',NULL),(42,41,120000.00,'VND',NULL),(43,42,120000.00,'VND',NULL),(44,43,299000.00,'VND',NULL),(45,44,299000.00,'VND',NULL),(46,45,299000.00,'VND',NULL),(47,46,299000.00,'VND',NULL),(48,47,120000.00,'VND',NULL),(49,48,120000.00,'VND',NULL),(50,49,120000.00,'VND',NULL),(51,50,120000.00,'VND',NULL),(52,51,0.00,'VND',NULL),(53,52,0.00,'VND',NULL),(54,53,0.00,'VND',NULL),(55,54,0.00,'VND',NULL),(56,55,0.00,'VND',NULL),(57,56,0.00,'VND',NULL),(58,57,0.00,'VND',NULL),(59,58,0.00,'VND',NULL),(60,59,0.00,'VND',NULL),(61,60,0.00,'VND',NULL),(62,61,0.00,'VND',NULL),(63,62,0.00,'VND',NULL),(64,63,0.00,'VND',NULL),(65,64,0.00,'VND',NULL),(66,65,0.00,'VND',NULL),(67,66,0.00,'VND',NULL),(68,67,350000.00,'VND',NULL),(69,68,0.00,'VND',NULL),(70,69,0.00,'VND',NULL),(71,70,0.00,'VND',NULL),(72,71,0.00,'VND',NULL),(73,72,400000.00,'VND',NULL),(74,73,400000.00,'VND',NULL),(75,74,400000.00,'VND',NULL),(76,75,150000.00,'VND',NULL),(77,76,150000.00,'VND',NULL),(78,77,150000.00,'VND',NULL),(79,78,150000.00,'VND',NULL),(80,79,0.00,'VND',NULL),(81,80,0.00,'VND',NULL),(82,81,0.00,'VND',NULL),(83,82,0.00,'VND',NULL),(84,83,0.00,'VND',NULL),(85,84,0.00,'VND',NULL),(86,85,0.00,'VND',NULL),(87,86,0.00,'VND',NULL),(88,87,0.00,'VND',NULL),(89,88,0.00,'VND',NULL),(90,89,270000.00,'VND',NULL),(91,90,0.00,'VND',NULL),(92,91,0.00,'VND',NULL),(93,92,0.00,'VND',NULL),(94,93,0.00,'VND',NULL),(95,94,0.00,'VND',NULL),(96,95,0.00,'VND',NULL),(97,96,0.00,'VND',NULL),(98,97,0.00,'VND',NULL),(99,98,0.00,'VND',NULL),(100,99,0.00,'VND',NULL),(101,100,0.00,'VND',NULL),(102,101,0.00,'VND',NULL),(103,102,0.00,'VND',NULL),(104,103,110000.00,'VND',NULL),(105,104,110000.00,'VND',NULL),(106,105,110000.00,'VND',NULL),(107,106,110000.00,'VND',NULL),(108,107,130000.00,'VND',NULL),(109,108,130000.00,'VND',NULL),(110,109,130000.00,'VND',NULL),(111,110,0.00,'VND',NULL),(112,111,0.00,'VND',NULL),(113,112,0.00,'VND',NULL),(114,113,0.00,'VND',NULL),(115,114,0.00,'VND',NULL),(116,115,0.00,'VND',NULL),(117,116,0.00,'VND',NULL),(118,117,0.00,'VND',NULL),(119,118,0.00,'VND',NULL),(120,119,0.00,'VND',NULL),(121,120,0.00,'VND',NULL),(122,121,0.00,'VND',NULL),(123,122,0.00,'VND',NULL),(124,123,0.00,'VND',NULL),(125,124,0.00,'VND',NULL),(126,125,0.00,'VND',NULL),(127,126,0.00,'VND',NULL),(128,127,0.00,'VND',NULL),(129,128,0.00,'VND',NULL),(130,129,0.00,'VND',NULL),(131,130,0.00,'VND',NULL),(132,131,0.00,'VND',NULL),(133,132,0.00,'VND',NULL),(134,133,0.00,'VND',NULL),(135,134,180000.00,'VND',NULL),(136,135,180000.00,'VND',NULL),(137,136,180000.00,'VND',NULL),(138,137,0.00,'VND',NULL),(139,138,0.00,'VND',NULL);
/*!40000 ALTER TABLE `spree_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_product_option_types`
--

DROP TABLE IF EXISTS `spree_product_option_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_product_option_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `option_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_product_option_types_on_option_type_id` (`option_type_id`),
  KEY `index_spree_product_option_types_on_product_id` (`product_id`),
  KEY `index_spree_product_option_types_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_product_option_types`
--

LOCK TABLES `spree_product_option_types` WRITE;
/*!40000 ALTER TABLE `spree_product_option_types` DISABLE KEYS */;
INSERT INTO `spree_product_option_types` VALUES (1,1,3,1,'2014-10-30 02:48:29','2014-10-30 02:48:29'),(2,1,4,1,'2014-10-30 03:08:51','2014-10-30 03:08:51'),(3,1,5,1,'2014-10-30 03:23:02','2014-10-30 03:23:02'),(4,1,6,1,'2014-10-30 03:36:44','2014-10-30 03:36:44'),(5,1,7,1,'2014-10-30 03:42:04','2014-10-30 03:42:04'),(6,1,8,1,'2014-10-30 03:57:30','2014-10-30 03:57:30'),(7,1,9,1,'2014-10-30 04:14:10','2014-10-30 04:14:10'),(8,1,10,1,'2014-10-30 04:27:07','2014-10-30 04:27:07'),(9,1,11,1,'2014-10-30 04:46:48','2014-10-30 04:46:48'),(10,1,12,1,'2014-10-30 05:01:11','2014-10-30 05:01:11'),(11,1,13,1,'2014-10-30 05:27:58','2014-10-30 05:27:58'),(12,1,14,1,'2014-10-30 07:22:57','2014-10-30 07:22:57'),(13,1,15,1,'2014-10-30 07:45:20','2014-10-30 07:45:20'),(14,1,16,1,'2014-10-30 08:10:12','2014-10-30 08:10:12'),(15,1,17,1,'2014-10-30 08:27:07','2014-10-30 08:27:07'),(16,1,18,1,'2014-10-30 09:08:53','2014-10-30 09:08:53'),(17,1,19,1,'2014-10-30 09:38:57','2014-10-30 09:38:57'),(18,1,20,1,'2014-10-31 02:58:04','2014-10-31 02:58:04'),(19,1,21,1,'2014-10-31 03:08:28','2014-10-31 03:08:28'),(20,1,22,1,'2014-10-31 03:43:42','2014-10-31 03:43:42'),(21,1,23,1,'2014-10-31 03:59:23','2014-10-31 03:59:23'),(22,1,24,1,'2014-10-31 04:41:37','2014-10-31 04:41:37'),(23,1,25,1,'2014-10-31 04:59:29','2014-10-31 04:59:29'),(24,1,26,1,'2014-10-31 05:22:58','2014-10-31 05:22:58'),(25,1,27,1,'2014-10-31 05:49:54','2014-10-31 05:49:54'),(26,1,28,1,'2014-10-31 06:16:43','2014-10-31 06:16:43'),(27,1,30,1,'2014-10-31 07:28:11','2014-10-31 07:28:11'),(28,1,32,1,'2014-10-31 07:55:09','2014-10-31 07:55:09'),(29,1,33,1,'2014-10-31 08:37:22','2014-10-31 08:37:22'),(30,1,34,1,'2014-10-31 09:02:59','2014-10-31 09:02:59'),(31,1,35,1,'2014-10-31 09:18:17','2014-10-31 09:18:17'),(32,1,36,1,'2014-10-31 09:37:47','2014-10-31 09:37:47'),(33,1,37,1,'2014-10-31 10:09:58','2014-10-31 10:09:58'),(34,1,38,1,'2014-10-31 10:29:31','2014-10-31 10:29:31'),(35,1,39,1,'2014-10-31 10:38:54','2014-10-31 10:38:54'),(36,1,41,1,'2014-10-31 11:23:21','2014-10-31 11:23:21'),(37,1,42,1,'2014-11-01 02:24:03','2014-11-01 02:24:03'),(38,1,43,1,'2014-11-01 03:09:05','2014-11-01 03:09:05'),(39,1,44,1,'2014-11-01 03:30:05','2014-11-01 03:30:05');
/*!40000 ALTER TABLE `spree_product_option_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_product_properties`
--

DROP TABLE IF EXISTS `spree_product_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_product_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_product_properties_on_product_id` (`product_id`),
  KEY `index_spree_product_properties_on_position` (`position`),
  KEY `index_spree_product_properties_on_property_id` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_product_properties`
--

LOCK TABLES `spree_product_properties` WRITE;
/*!40000 ALTER TABLE `spree_product_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_product_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_product_translations`
--

DROP TABLE IF EXISTS `spree_product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_product_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_product_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_product_translations_on_spree_product_id` (`spree_product_id`),
  KEY `index_spree_product_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_product_translations`
--

LOCK TABLES `spree_product_translations` WRITE;
/*!40000 ALTER TABLE `spree_product_translations` DISABLE KEYS */;
INSERT INTO `spree_product_translations` VALUES (1,1,'vi','2014-10-27 06:59:12','2014-10-30 01:56:32','Đồng hồ cơ Omega 001','Đồng hồ cơ chạy không cần pin, máy hoạt động trọn đời dựa vào những cử động của tay\r\n_chất liệu là dây da cao cấp và mặt kính cường lực có thể chống xướt, với đường viền màu vàng xung quanh mặt kính tạo nên nét thanh lịch cho sản phẩm.\r\n_máy đồng hồ là loại máy cơ, hoạt động trọn đời không cần pin, độ chống nước tuyệt đối có thể mang cả khi đi bơi\r\ngiá chỉ 400k hãy nhanh tay like để được tặng kém 1 hộp đựng có gối kê sang trọng, thích hợp làm quà tặng, 1 món quà đầy ý nghĩa và thiết thực','','','dong-ho-co-omega-001'),(2,2,'vi','2014-10-27 09:49:18','2014-10-30 01:56:59','Đồng hồ dây da cao cấp 001','Đồng hồ dây da cao cấp, đây là hàng cao cấp nên đồng hồ nhỏ bên trong chạy thật sự ( đó là kim giây), chống nước tuyệt đối','','','dong-ho-day-da-cao-cap-001'),(3,3,'vi','2014-10-30 02:45:50','2014-10-30 07:07:36','Đồng hồ  chính hãng GEDI. DHGE-001','<p>ĐỒNG HỒ CAO CẤP CH&Iacute;NH H&Atilde;NG: GEDI<br>- Kiểu d&aacute;ng mảnh mai, sang chảnh<br>- Chống nước tốt<br>- Chất xi cao cấp bền m&agrave;u, sử dụng &gt;1 năm<br>- C&oacute; 2 m&agrave;u: Bạc, v&agrave;ng tươi 24k<br>- Gi&aacute; chỉ: 300k<br>free ship tr&ecirc;n to&agrave;n quốc<br>nhanh tay rinh 1 em về nh&eacute; c&aacute;c n&agrave;ng, số lượng c&oacute; hạn..&nbsp;</p>','','','dong-ho-chinh-hang-gedi'),(4,4,'vi','2014-10-30 02:59:57','2014-10-30 07:15:48','Đồng hồ thời trang đồng giá 100k. DHX002','','','','dong-ho-thoi-trang-dong-gia-100k'),(5,5,'vi','2014-10-30 03:22:33','2014-10-30 07:16:21','Đồng hồ thời trang đồng giá 100k. DHX003','','','','dong-ho-thoi-trang-dong-gia-100k-dhx-003'),(6,6,'vi','2014-10-30 03:35:55','2014-10-30 07:16:56','Đồng hồ thời trang đồng giá 100k. DHX004','','','','dong-ho-thoi-trang-dong-gia-100k-dhx-004'),(7,7,'vi','2014-10-30 03:41:49','2014-10-30 07:17:51','Đồng hồ thời trang đồng giá 100k. DHX-001','','','','dong-ho-thoi-trang-dong-gia-100k-dhx-001'),(8,8,'vi','2014-10-30 03:55:58','2014-10-30 07:06:07','Đồng hồ cỏ 4 lá DHX-006','<p>Đồng hồ thời trang, cực kỳ kute nh&eacute;.<br>V&ograve;ng cỏ 4 l&aacute; trung t&acirc;m đồng hồ chạy thực sự rất đẹp<br>c&oacute; nghĩa l&agrave; n&oacute; xoay được<br>C&oacute; 2 m&agrave;u cho bạn lựa chọn: trắng v&agrave; đen.<br>Gi&aacute;: 110k</p>','','','dong-ho-co-4-la'),(9,9,'vi','2014-10-30 04:13:33','2014-10-30 07:08:37','ĐỒNG HỒ HAYUXI. DHHA-001','<p><span class=\"userContent\">Đồng hồ inox mẫu mới nhất lu&ocirc;n nh&eacute; c&aacute;c n&agrave;ng..<br><br>ĐỒNG HỒ: HAYUXI<br>- Với t&iacute;nh năng kh&ocirc;ng thắm nước c&aacute;c n&agrave;ng c&oacute; thể đeo mọi l&uacute;c, mọi nơi nh&eacute;...<br>- Chất liệu d&acirc;y đeo l&agrave; inox, ko đen<br>- Xuất xứ hồng k&ocirc;ng<br>- Gi&aacute; chỉ : 300k<br>Đặc biệt: free ship tr&ecirc;n to&agrave;n quốc</span>&nbsp;</p>','','','dong-ho-hayuxi'),(10,10,'vi','2014-10-30 04:25:54','2014-10-30 07:09:39','Đồng hồ lắc tay xinh sắn. DHX-007','<p>Đồng hồ lắc tay nữ, dễ thương, vừa l&agrave;m d&acirc;y đeo trang tr&iacute; vừa xem giờ&nbsp;<br>* Free ship nội th&agrave;nh TP.HCM<br>* 30k đối với c&aacute;c bạn ở tỉnh kh&aacute;c (mua 2 c&aacute;i free ship)</p>','','','dong-ho-lac-tay-xinh-san'),(11,11,'vi','2014-10-30 04:43:40','2014-10-30 07:10:15','Đồng hồ lắc tay xinh sắn. DHX-008','<p>Đồng hồ lắc tay nữ, dễ thương, vừa l&agrave;m d&acirc;y đeo trang tr&iacute; vừa xem giờ&nbsp;</p>\r\n<p>M&agrave;u: đỏ, xanh r&ecirc;u, đen,cam,xanh lam<br>* Free ship nội th&agrave;nh TP.HCM<br>* 30k đối với c&aacute;c bạn ở tỉnh kh&aacute;c (mua 2 c&aacute;i free ship)</p>\r\n<p>&nbsp;</p>','','','dong-ho-lac-tay-xinh-san-dhx-008'),(12,12,'vi','2014-10-30 04:59:40','2014-10-30 07:10:41','Đồng hồ lắc tay xinh sắn. DHX-009','<p>Đồng hồ lắc tay nữ, dễ thương, vừa l&agrave;m d&acirc;y đeo trang tr&iacute; vừa xem giờ&nbsp;</p>\r\n<p>M&agrave;u: đỏ, đen, trắng<br>* Free ship nội th&agrave;nh TP.HCM<br>* 30k đối với c&aacute;c bạn ở tỉnh kh&aacute;c (mua 2 c&aacute;i free ship)</p>','','','dong-ho-lac-tay-xinh-san-dhx-009'),(13,13,'vi','2014-10-30 05:26:39','2014-10-30 07:19:34','Đồng hồ thanh lịch. DHYO-001','<p>Đồng hồ thanh lịch d&agrave;nh cho nam.</p>\r\n<p>Thiết kế sang trọng, lịch sự, chống nước tuyệt đối, mặt k&iacute;nh cường lực, d&acirc;y đeo th&eacute;p b&ecirc;n bỉ theo thời gian.</p>\r\n<p>Gi&aacute; b&aacute;n: 299k.</p>\r\n<p>Free ship tận nơi tr&ecirc;n to&agrave;n quốc</p>','','','dong-ho-thanh-lich'),(14,14,'vi','2014-10-30 07:22:16','2014-10-30 07:22:57','Đồng hồ thời trang. DHKM-001','<p>ĐỒNG HỒ THỜI TRANG<br>Điệu đ&agrave;, sang trọng cho c&aacute;c n&agrave;ng dạo phố hay đi tiệc.<br>kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rẻ nữa...&nbsp;&nbsp;<br>Gi&aacute;: 120k<br>Free ship nội th&agrave;nh tphcm</p>','','','dong-ho-thoi-trang-dhkm-001'),(15,15,'vi','2014-10-30 07:40:56','2014-10-30 07:45:20','Đồng hồ  Julius. DHJU-001','<p>D&acirc;y l&agrave; đồng hồ loại tốt nh&eacute; c&aacute;c bạn</p>\r\n<p>k&iacute;ch thước</p>\r\n<p>1/ mặt:1.7 cm</p>\r\n<p>2/ d&acirc;y: 0.6 cm</p>\r\n<p>_Đối với loại d&acirc;y da : kh&ocirc;ng v&ocirc; nước, da mềm &nbsp;đẹp</p>\r\n<p>_Đối với loại d&acirc;y kim loại: th&igrave; đ&acirc;y l&agrave; hợp kim xi tĩnh điện chất lượng cao, ko v&ocirc; nước</p>','','','dong-ho-julius-dhju-001'),(16,16,'vi','2014-10-30 08:08:16','2014-10-30 08:10:12','Đồng hồ đá. DHDA-001','<p>Đồng hồ đ&aacute; fake h&agrave;ng cực đẹp, rất sang trọng, d&acirc;y đeo bằng đ&aacute; rất s&aacute;ng da nh&eacute; , h&agrave;ng giống h&iacute;nh 100%.&nbsp;</p>','','','dong-ho-da-dhda-001'),(17,17,'vi','2014-10-30 08:26:34','2014-10-30 08:31:26','Đồng hồ skmei. DHSK-001','<p>thương hiệu nổi tiếng skmei<br>_chức năng ch&iacute;nh: đồng hồ kim<br>_chống xướt, chống nước tốt<br>_d&acirc;y đồng hồ l&agrave; th&eacute;p b&ecirc;n bỉ theo thời gian<br>_pin sử dụng &gt;1 năm<br>s&agrave;n phẩm chất lượng cao mang đến từng kh&aacute;ch h&agrave;ng<span class=\"text_exposed_show\"><br>Giao h&agrave;ng v&agrave; thu tiền tận nơi tr&ecirc;n to&agrave;n quốc thời gian 2-3 ng&agrave;y.</span></p>','','','dong-ho-skmei-dhsk-001'),(18,18,'vi','2014-10-30 09:02:44','2014-10-30 09:08:53','DHSK-002','<p>thương hiệu nổi tiếng skmei<br>_chức năng ch&iacute;nh: đồng hồ kim v&agrave; mục lịch<br>_chống xướt, chống nước tốt<br>_d&acirc;y đồng hồ l&agrave; th&eacute;p b&ecirc;n bỉ theo thời gian<br>_pin sử dụng &gt;1 năm</p>\r\n<p>- H&agrave;ng bền đẹp giống h&igrave;nh 100%</p>\r\n<p>S&agrave;n phẩm chất lượng cao mang đến từng kh&aacute;ch h&agrave;ng<span class=\"text_exposed_show\"><br>Giao h&agrave;ng v&agrave; thu tiền tận nơi tr&ecirc;n to&agrave;n quốc thời gian 2-3 ng&agrave;y</span></p>\r\n<p>&nbsp;</p>','','','dhsk-002'),(19,19,'vi','2014-10-30 09:38:21','2014-10-30 09:50:40','Đông hồ đôi. DHDO-001','<p>Đồng hồ đ&ocirc;i cực đẹp</p>\r\n<p>gi&aacute; chỉ: 350k/ cặp</p>','','','dong-ho-doi-dhdo-001'),(20,20,'vi','2014-10-31 02:56:49','2014-10-31 02:58:04','Đồng hồ CAFUER. DHCA-001','<p>Đồng hồ cafuer, chống nước rất tốt, pin sử dụng &gt;1 năm, d&acirc;y da cao cấp<br>h&agrave;ng giống h&igrave;nh 100%<br>H&agrave;ng chất d&agrave;nh cho người s&agrave;nh điệu<br>gi&aacute; 170k ship h&agrave;ng v&agrave; thu tiền tr&ecirc;n to&agrave;n quốc</p>','','','dong-ho-cafuer-dhca-001'),(21,21,'vi','2014-10-31 03:07:17','2014-10-31 03:08:28','Đồng hồ cơ. DHCO-002','<p>Đồng hồ cơ chạy kh&ocirc;ng cần pin, m&aacute;y hoạt động trọn đời dựa v&agrave;o những cử động của tay.<br>_Chất liệu l&agrave; d&acirc;y da cao cấp v&agrave; mặt k&iacute;nh cường lực c&oacute; thể chống xướt, với đường viền m&agrave;u v&agrave;ng xung quanh mặt k&iacute;nh tạo n&ecirc;n n&eacute;t thanh lịch cho sản phẩm.<br>_M&aacute;y&nbsp;<span class=\"text_exposed_show\">đồng hồ l&agrave; loại m&aacute;y cơ, hoạt động trọn đời kh&ocirc;ng cần pin, độ chống nước tuyệt đối c&oacute; thể mang cả khi đi bơi.</span></p>','','','dong-ho-co-dhco-002'),(22,22,'vi','2014-10-31 03:39:23','2014-10-31 03:43:42','Đồng hồ ALLWELL. DHAL-001','<p>Đồng hồ allwell d&agrave;nh cho nữ<br>đồng hồ d&acirc;y da cao cấp h&agrave;ng giống h&igrave;nh 100% ( đ&acirc;y l&agrave; h&igrave;nh thật của sp)<br>chống nước th&ocirc;ng thường VD như rữa tay, đi mưa....kh&ocirc;ng đeo khi tắm, đi bơi....</p>','','','dong-ho-allwell-dhal-001'),(23,23,'vi','2014-10-31 03:58:53','2014-10-31 03:59:23','Đồng hồ LV. DHLV-001','','','','dong-ho-lv-dhlv-001'),(24,24,'vi','2014-10-31 04:40:42','2014-10-31 04:41:37','Đồng hồ thời trang. DHX-010','','','','dong-ho-thoi-trang-dhx-010'),(25,25,'vi','2014-10-31 04:58:09','2014-10-31 05:04:04','Đồng hồ WOMAGE. DHWO-001','<p>C&ograve;n 3 m&agrave;u: n&acirc;u, đen, trắng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<span class=\"text_exposed_show\"><br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','','','dong-ho-womage-dhwo-001'),(26,26,'vi','2014-10-31 05:20:01','2014-10-31 05:22:58','Đồng hồ SKMEI. DHSK-003','<p>H&agrave;ng n&agrave;y rất tốt nh&eacute; mọi người, chống nước rất tốt, d&acirc;y da mềm, mặt sau l&agrave; inox s&aacute;ng b&oacute;ng, giống h&igrave;nh 99,9%</p>\r\n<p>Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-skimi-dhsk-003'),(27,27,'vi','2014-10-31 05:48:12','2014-10-31 05:53:51','Đông hồ đôi. DHDO-002','<p>Coa 3 m&agrave;u: n&acirc;u, đen, trắng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<span class=\"text_exposed_show\"><br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','','','dong-ho-doi-dhdo-002'),(28,28,'vi','2014-10-31 06:15:49','2014-10-31 06:16:43','Đồng hồ đôi. DHDO-003','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<span class=\"text_exposed_show\"><br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','','','dong-ho-doi-dhdo-003'),(30,30,'vi','2014-10-31 06:32:01','2014-10-31 07:29:05','Đồng hồ đôi OMEGA. DHOM-002','<p>22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<span class=\"text_exposed_show\"><br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','','','dong-ho-doi-omega-dhom-002'),(32,32,'vi','2014-10-31 07:43:08','2014-10-31 07:55:09','Đông hồ GUESS. DHGU-001','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<span class=\"text_exposed_show\"><br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','','','dong-ho-guess-dhgu-001'),(33,33,'vi','2014-10-31 08:36:37','2014-10-31 08:37:22','Đồng hồ LED. DHLE-001','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-led-dhle-001'),(34,34,'vi','2014-10-31 09:02:19','2014-10-31 09:02:59','Đồng hồ LED. DHLE-002','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-led-dhle-002'),(35,35,'vi','2014-10-31 09:17:27','2014-10-31 09:23:07','Đồng hồ LED. DHLE-003','<p>Đ/c: 22/4 Lữ Gia- P15- Q11</p>\r\n<p>Sđt: 0908482804 - 01647770247</p>\r\n<p>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-led-dhle-003'),(36,36,'vi','2014-10-31 09:36:40','2014-10-31 09:37:47','Đồng hồ SKMEI. DHSK-004','<p>h&agrave;ng n&agrave;y rất tốt, chống nước rất tốt, h&agrave;ng giống h&igrave;nh</p>\r\n<p>mặt sau l&agrave; inox s&aacute;ng b&Oacute;ng</p>\r\n<p>c&oacute; đầy đủ chức năng: đồng hồ kim, đồng hồ điện tử, thứ/ng&agrave;y/th&aacute;ng/năm, đồng hồ bấm giờ, b&aacute;o thức, đ&egrave;n để xem buổi tối.</p>','','','dong-ho-skmei-dhsk-004'),(37,37,'vi','2014-10-31 10:08:42','2014-10-31 10:16:49','Đồng hồ TISSOT.DHTI-001','<p>C&oacute; 2 m&agrave;u: n&acirc;u, đen</p>\r\n<p>Lưu &yacute;: Đồng hồ n&agrave;y kh&ocirc;ng c&oacute; chức năng chống nước, khi tiếp x&uacute;c với nước c&aacute;c bạn phải th&aacute;o ra, h&agrave;ng đẹp y như h&igrave;nh ( v&igrave; đ&acirc;y l&agrave; sản phẩm shop tự chụp)</p>','','','dong-ho-tissot-dhti-001'),(38,38,'vi','2014-10-31 10:28:11','2014-10-31 10:29:32','Đồng hồ đôi. DHDO-004','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-doi-dhdo-004'),(39,39,'vi','2014-10-31 10:38:06','2014-10-31 10:38:54','Đồng hồ thời trang. DHX-011','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-thoi-trang-dhx-011'),(41,41,'vi','2014-10-31 11:22:21','2014-10-31 11:28:18','Đồng hồ thời trang. DHX-012','<p>Đồng hồ thời trang MICKEY</p>\r\n<p>M&Agrave;U: hồng phấn, đen. trắng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-thoi-trang-dhx-012'),(42,42,'vi','2014-11-01 02:20:29','2014-11-01 02:35:42','Đồng hồ JULIUS. DHJU-002','<p>Đồng hồ julius cao cấp, h&agrave;ng chất lượng cao</p>\r\n<p>D&acirc;y da : kh&ocirc;ng v&ocirc; nước, da mềm &nbsp;đẹp</p>\r\n<p>M&agrave;u: trắng, đen, hồng phấn, n&acirc;u</p>\r\n<p>Bảo h&agrave;ng: 3 th&aacute;ng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','','','dong-ho-julius-dhju-002'),(43,43,'vi','2014-11-01 03:07:55','2014-11-01 03:09:05','Đồng hồ KORMI. DHKO-001','<p>Đồng hồ KORMI về lại nh&eacute;<br>Nhanh tay số lượng c&oacute; hạn c&aacute;c n&agrave;ng ơi............&nbsp;<br>H&agrave;ng cao cấp chống nước sinh hoạt rất tốt<br>M&aacute;y nhật bền theo thời gian<br>pin sử dụng &gt;1 năm<br>phong c&aacute;ch d&agrave;nh cho c&aacute;c bạn nữ<span class=\"text_exposed_show\"><br>k&iacute;ch thước<br>mặt 2.1cm<br>d&acirc;y: 0.6cm<br>Gi&aacute;: 180k<br>dưới đ&acirc;y l&agrave; h&igrave;nh thật của sản phẩm, h&agrave;ng b&ecirc;n ngo&agrave;i giống h&igrave;nh 100%<br>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247</span></p>','','','dong-ho-kormi-dhko-001'),(44,44,'vi','2014-11-01 03:29:46','2014-11-01 03:30:05','Đồng hồ thời trang. DHMO-001','','','','dong-ho-thoi-trang-dhmo-001');
/*!40000 ALTER TABLE `spree_product_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_products`
--

DROP TABLE IF EXISTS `spree_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `available_on` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `shipping_category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permalink_idx_unique` (`slug`),
  KEY `index_spree_products_on_available_on` (`available_on`),
  KEY `index_spree_products_on_deleted_at` (`deleted_at`),
  KEY `index_spree_products_on_name` (`name`),
  KEY `index_spree_products_on_slug` (`slug`),
  KEY `index_spree_products_on_shipping_category_id` (`shipping_category_id`),
  KEY `index_spree_products_on_tax_category_id` (`tax_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_products`
--

LOCK TABLES `spree_products` WRITE;
/*!40000 ALTER TABLE `spree_products` DISABLE KEYS */;
INSERT INTO `spree_products` VALUES (1,'Đồng hồ cơ Omega 001','Đồng hồ cơ chạy không cần pin, máy hoạt động trọn đời dựa vào những cử động của tay\r\n_chất liệu là dây da cao cấp và mặt kính cường lực có thể chống xướt, với đường viền màu vàng xung quanh mặt kính tạo nên nét thanh lịch cho sản phẩm.\r\n_máy đồng hồ là loại máy cơ, hoạt động trọn đời không cần pin, độ chống nước tuyệt đối có thể mang cả khi đi bơi\r\ngiá chỉ 400k hãy nhanh tay like để được tặng kém 1 hộp đựng có gối kê sang trọng, thích hợp làm quà tặng, 1 món quà đầy ý nghĩa và thiết thực','2014-10-27 00:00:00',NULL,'dong-ho-co-omega-001',NULL,NULL,NULL,1,'2014-10-27 06:59:12','2014-10-30 07:49:04'),(2,'Đồng hồ dây da cao cấp 001','Đồng hồ dây da cao cấp, đây là hàng cao cấp nên đồng hồ nhỏ bên trong chạy thật sự ( đó là kim giây), chống nước tuyệt đối','2014-10-27 00:00:00',NULL,'dong-ho-day-da-cao-cap-001',NULL,NULL,NULL,1,'2014-10-27 09:49:18','2014-10-30 07:49:05'),(3,'Đồng hồ  chính hãng GEDI. DHGE-001','<p>ĐỒNG HỒ CAO CẤP CH&Iacute;NH H&Atilde;NG: GEDI<br>- Kiểu d&aacute;ng mảnh mai, sang chảnh<br>- Chống nước tốt<br>- Chất xi cao cấp bền m&agrave;u, sử dụng &gt;1 năm<br>- C&oacute; 2 m&agrave;u: Bạc, v&agrave;ng tươi 24k<br>- Gi&aacute; chỉ: 300k<br>free ship tr&ecirc;n to&agrave;n quốc<br>nhanh tay rinh 1 em về nh&eacute; c&aacute;c n&agrave;ng, số lượng c&oacute; hạn..&nbsp;</p>','2014-10-30 00:00:00',NULL,'dong-ho-chinh-hang-gedi',NULL,NULL,NULL,1,'2014-10-30 02:45:50','2014-10-30 07:49:09'),(4,'Đồng hồ thời trang đồng giá 100k. DHX002',NULL,'2014-10-30 00:00:00',NULL,'dong-ho-thoi-trang-dong-gia-100k',NULL,NULL,NULL,1,'2014-10-30 02:59:57','2014-10-30 07:49:10'),(5,'Đồng hồ thời trang đồng giá 100k. DHX003',NULL,'2014-10-30 00:00:00',NULL,'dong-ho-thoi-trang-dong-gia-100k-dhx-003',NULL,NULL,NULL,1,'2014-10-30 03:22:33','2014-10-30 07:49:13'),(6,'Đồng hồ thời trang đồng giá 100k. DHX004',NULL,'2014-10-30 00:00:00',NULL,'dong-ho-thoi-trang-dong-gia-100k-dhx-004',NULL,NULL,NULL,1,'2014-10-30 03:35:55','2014-10-30 07:49:14'),(7,'Đồng hồ thời trang đồng giá 100k. DHX-001',NULL,'2014-10-30 00:00:00',NULL,'dong-ho-thoi-trang-dong-gia-100k-dhx-001',NULL,NULL,NULL,1,'2014-10-30 03:41:48','2014-10-30 07:49:15'),(8,'Đồng hồ cỏ 4 lá DHX-006','<p>Đồng hồ thời trang, cực kỳ kute nh&eacute;.<br>V&ograve;ng cỏ 4 l&aacute; trung t&acirc;m đồng hồ chạy thực sự rất đẹp<br>c&oacute; nghĩa l&agrave; n&oacute; xoay được<br>C&oacute; 2 m&agrave;u cho bạn lựa chọn: trắng v&agrave; đen.<br>Gi&aacute;: 110k</p>','2014-10-30 00:00:00',NULL,'dong-ho-co-4-la',NULL,NULL,NULL,1,'2014-10-30 03:55:58','2014-10-30 07:49:19'),(9,'ĐỒNG HỒ HAYUXI. DHHA-001','<p><span class=\"userContent\">Đồng hồ inox mẫu mới nhất lu&ocirc;n nh&eacute; c&aacute;c n&agrave;ng..<br><br>ĐỒNG HỒ: HAYUXI<br>- Với t&iacute;nh năng kh&ocirc;ng thắm nước c&aacute;c n&agrave;ng c&oacute; thể đeo mọi l&uacute;c, mọi nơi nh&eacute;...<br>- Chất liệu d&acirc;y đeo l&agrave; inox, ko đen<br>- Xuất xứ hồng k&ocirc;ng<br>- Gi&aacute; chỉ : 300k<br>Đặc biệt: free ship tr&ecirc;n to&agrave;n quốc</span>&nbsp;</p>','2014-10-29 00:00:00',NULL,'dong-ho-hayuxi',NULL,NULL,NULL,1,'2014-10-30 04:13:33','2014-10-30 07:49:24'),(10,'Đồng hồ lắc tay xinh sắn. DHX-007','<p>Đồng hồ lắc tay nữ, dễ thương, vừa l&agrave;m d&acirc;y đeo trang tr&iacute; vừa xem giờ&nbsp;<br>* Free ship nội th&agrave;nh TP.HCM<br>* 30k đối với c&aacute;c bạn ở tỉnh kh&aacute;c (mua 2 c&aacute;i free ship)</p>','2014-10-30 00:00:00',NULL,'dong-ho-lac-tay-xinh-san',NULL,NULL,NULL,1,'2014-10-30 04:25:54','2014-10-30 07:49:26'),(11,'Đồng hồ lắc tay xinh sắn. DHX-008','<p>Đồng hồ lắc tay nữ, dễ thương, vừa l&agrave;m d&acirc;y đeo trang tr&iacute; vừa xem giờ&nbsp;</p>\r\n<p>M&agrave;u: đỏ, xanh r&ecirc;u, đen,cam,xanh lam<br>* Free ship nội th&agrave;nh TP.HCM<br>* 30k đối với c&aacute;c bạn ở tỉnh kh&aacute;c (mua 2 c&aacute;i free ship)</p>\r\n<p>&nbsp;</p>','2014-10-30 00:00:00',NULL,'dong-ho-lac-tay-xinh-san-dhx-008',NULL,NULL,NULL,1,'2014-10-30 04:43:40','2014-10-30 07:49:30'),(12,'Đồng hồ lắc tay xinh sắn. DHX-009','<p>Đồng hồ lắc tay nữ, dễ thương, vừa l&agrave;m d&acirc;y đeo trang tr&iacute; vừa xem giờ&nbsp;</p>\r\n<p>M&agrave;u: đỏ, đen, trắng<br>* Free ship nội th&agrave;nh TP.HCM<br>* 30k đối với c&aacute;c bạn ở tỉnh kh&aacute;c (mua 2 c&aacute;i free ship)</p>','2014-10-30 00:00:00',NULL,'dong-ho-lac-tay-xinh-san-dhx-009',NULL,NULL,NULL,1,'2014-10-30 04:59:40','2014-10-30 07:49:36'),(13,'Đồng hồ thanh lịch. DHYO-001','<p>Đồng hồ thanh lịch d&agrave;nh cho nam.</p>\r\n<p>Thiết kế sang trọng, lịch sự, chống nước tuyệt đối, mặt k&iacute;nh cường lực, d&acirc;y đeo th&eacute;p b&ecirc;n bỉ theo thời gian.</p>\r\n<p>Gi&aacute; b&aacute;n: 299k.</p>\r\n<p>Free ship tận nơi tr&ecirc;n to&agrave;n quốc</p>','2014-10-30 00:00:00',NULL,'dong-ho-thanh-lich',NULL,NULL,NULL,1,'2014-10-30 05:26:39','2014-10-30 07:49:38'),(14,'Đồng hồ thời trang. DHKM-001','<p>ĐỒNG HỒ THỜI TRANG<br>Điệu đ&agrave;, sang trọng cho c&aacute;c n&agrave;ng dạo phố hay đi tiệc.<br>kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rẻ nữa...&nbsp;&nbsp;<br>Gi&aacute;: 120k<br>Free ship nội th&agrave;nh tphcm</p>','2014-10-30 00:00:00',NULL,'dong-ho-thoi-trang-dhkm-001',NULL,NULL,NULL,1,'2014-10-30 07:22:16','2014-10-30 07:49:46'),(15,'Đồng hồ  Julius. DHJU-001','<p>D&acirc;y l&agrave; đồng hồ loại tốt nh&eacute; c&aacute;c bạn</p>\r\n<p>k&iacute;ch thước</p>\r\n<p>1/ mặt:1.7 cm</p>\r\n<p>2/ d&acirc;y: 0.6 cm</p>\r\n<p>_Đối với loại d&acirc;y da : kh&ocirc;ng v&ocirc; nước, da mềm &nbsp;đẹp</p>\r\n<p>_Đối với loại d&acirc;y kim loại: th&igrave; đ&acirc;y l&agrave; hợp kim xi tĩnh điện chất lượng cao, ko v&ocirc; nước</p>','2014-10-30 00:00:00',NULL,'dong-ho-julius-dhju-001',NULL,NULL,NULL,1,'2014-10-30 07:40:55','2014-10-30 08:02:32'),(16,'Đồng hồ đá. DHDA-001','<p>Đồng hồ đ&aacute; fake h&agrave;ng cực đẹp, rất sang trọng, d&acirc;y đeo bằng đ&aacute; rất s&aacute;ng da nh&eacute; , h&agrave;ng giống h&iacute;nh 100%.&nbsp;</p>','2014-10-30 00:00:00',NULL,'dong-ho-da-dhda-001',NULL,NULL,NULL,1,'2014-10-30 08:08:16','2014-10-30 08:11:35'),(17,'Đồng hồ skmei. DHSK-001','<p>thương hiệu nổi tiếng skmei<br>_chức năng ch&iacute;nh: đồng hồ kim<br>_chống xướt, chống nước tốt<br>_d&acirc;y đồng hồ l&agrave; th&eacute;p b&ecirc;n bỉ theo thời gian<br>_pin sử dụng &gt;1 năm<br>s&agrave;n phẩm chất lượng cao mang đến từng kh&aacute;ch h&agrave;ng<span class=\"text_exposed_show\"><br>Giao h&agrave;ng v&agrave; thu tiền tận nơi tr&ecirc;n to&agrave;n quốc thời gian 2-3 ng&agrave;y.</span></p>','2014-10-29 00:00:00',NULL,'dong-ho-skmei-dhsk-001',NULL,NULL,NULL,1,'2014-10-30 08:26:34','2014-10-30 08:37:11'),(18,'DHSK-002','<p>thương hiệu nổi tiếng skmei<br>_chức năng ch&iacute;nh: đồng hồ kim v&agrave; mục lịch<br>_chống xướt, chống nước tốt<br>_d&acirc;y đồng hồ l&agrave; th&eacute;p b&ecirc;n bỉ theo thời gian<br>_pin sử dụng &gt;1 năm</p>\r\n<p>- H&agrave;ng bền đẹp giống h&igrave;nh 100%</p>\r\n<p>S&agrave;n phẩm chất lượng cao mang đến từng kh&aacute;ch h&agrave;ng<span class=\"text_exposed_show\"><br>Giao h&agrave;ng v&agrave; thu tiền tận nơi tr&ecirc;n to&agrave;n quốc thời gian 2-3 ng&agrave;y</span></p>\r\n<p>&nbsp;</p>','2014-10-30 00:00:00',NULL,'dhsk-002',NULL,NULL,NULL,1,'2014-10-30 09:02:44','2014-10-30 09:14:19'),(19,'Đông hồ đôi. DHDO-001','<p>Đồng hồ đ&ocirc;i cực đẹp</p>\r\n<p>gi&aacute; chỉ: 350k/ cặp</p>','2014-10-30 00:00:00',NULL,'dong-ho-doi-dhdo-001',NULL,NULL,NULL,1,'2014-10-30 09:38:21','2014-10-30 09:50:40'),(20,'Đồng hồ CAFUER. DHCA-001','<p>Đồng hồ cafuer, chống nước rất tốt, pin sử dụng &gt;1 năm, d&acirc;y da cao cấp<br>h&agrave;ng giống h&igrave;nh 100%<br>H&agrave;ng chất d&agrave;nh cho người s&agrave;nh điệu<br>gi&aacute; 170k ship h&agrave;ng v&agrave; thu tiền tr&ecirc;n to&agrave;n quốc</p>','2014-10-30 00:00:00',NULL,'dong-ho-cafuer-dhca-001',NULL,NULL,NULL,1,'2014-10-31 02:56:49','2014-10-31 03:01:23'),(21,'Đồng hồ cơ. DHCO-002','<p>Đồng hồ cơ chạy kh&ocirc;ng cần pin, m&aacute;y hoạt động trọn đời dựa v&agrave;o những cử động của tay.<br>_Chất liệu l&agrave; d&acirc;y da cao cấp v&agrave; mặt k&iacute;nh cường lực c&oacute; thể chống xướt, với đường viền m&agrave;u v&agrave;ng xung quanh mặt k&iacute;nh tạo n&ecirc;n n&eacute;t thanh lịch cho sản phẩm.<br>_M&aacute;y&nbsp;<span class=\"text_exposed_show\">đồng hồ l&agrave; loại m&aacute;y cơ, hoạt động trọn đời kh&ocirc;ng cần pin, độ chống nước tuyệt đối c&oacute; thể mang cả khi đi bơi.</span></p>','2014-10-30 00:00:00',NULL,'dong-ho-co-dhco-002',NULL,NULL,NULL,1,'2014-10-31 03:07:17','2014-10-31 03:20:26'),(22,'Đồng hồ ALLWELL. DHAL-001','<p>Đồng hồ allwell d&agrave;nh cho nữ<br>đồng hồ d&acirc;y da cao cấp h&agrave;ng giống h&igrave;nh 100% ( đ&acirc;y l&agrave; h&igrave;nh thật của sp)<br>chống nước th&ocirc;ng thường VD như rữa tay, đi mưa....kh&ocirc;ng đeo khi tắm, đi bơi....</p>','2014-10-30 00:00:00',NULL,'dong-ho-allwell-dhal-001',NULL,NULL,NULL,1,'2014-10-31 03:39:23','2014-10-31 03:49:13'),(23,'Đồng hồ LV. DHLV-001',NULL,'2014-10-30 00:00:00',NULL,'dong-ho-lv-dhlv-001',NULL,NULL,NULL,1,'2014-10-31 03:58:53','2014-10-31 04:00:56'),(24,'Đồng hồ thời trang. DHX-010',NULL,'2014-10-30 00:00:00',NULL,'dong-ho-thoi-trang-dhx-010',NULL,NULL,NULL,1,'2014-10-31 04:40:42','2014-10-31 04:43:50'),(25,'Đồng hồ WOMAGE. DHWO-001','<p>C&ograve;n 3 m&agrave;u: n&acirc;u, đen, trắng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<span class=\"text_exposed_show\"><br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','2014-10-31 00:00:00',NULL,'dong-ho-womage-dhwo-001',NULL,NULL,NULL,1,'2014-10-31 04:58:09','2014-10-31 05:04:04'),(26,'Đồng hồ SKMEI. DHSK-003','<p>H&agrave;ng n&agrave;y rất tốt nh&eacute; mọi người, chống nước rất tốt, d&acirc;y da mềm, mặt sau l&agrave; inox s&aacute;ng b&oacute;ng, giống h&igrave;nh 99,9%</p>\r\n<p>Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-30 00:00:00',NULL,'dong-ho-skimi-dhsk-003',NULL,NULL,NULL,1,'2014-10-31 05:20:01','2014-10-31 11:58:03'),(27,'Đông hồ đôi. DHDO-002','<p>Coa 3 m&agrave;u: n&acirc;u, đen, trắng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<span class=\"text_exposed_show\"><br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','2014-10-30 00:00:00',NULL,'dong-ho-doi-dhdo-002',NULL,NULL,NULL,1,'2014-10-31 05:48:12','2014-10-31 05:56:19'),(28,'Đồng hồ đôi. DHDO-003','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<span class=\"text_exposed_show\"><br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','2014-10-30 00:00:00',NULL,'dong-ho-doi-dhdo-003',NULL,NULL,NULL,1,'2014-10-31 06:15:49','2014-10-31 06:19:11'),(30,'Đồng hồ đôi OMEGA. DHOM-002','<p>22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<span class=\"text_exposed_show\"><br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','2014-10-30 00:00:00',NULL,'dong-ho-doi-omega-dhom-002',NULL,NULL,NULL,1,'2014-10-31 06:32:01','2014-10-31 07:33:12'),(32,'Đông hồ GUESS. DHGU-001','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<span class=\"text_exposed_show\"><br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</span></p>','2014-10-30 00:00:00',NULL,'dong-ho-guess-dhgu-001',NULL,NULL,NULL,1,'2014-10-31 07:43:08','2014-10-31 08:02:03'),(33,'Đồng hồ LED. DHLE-001','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-30 00:00:00',NULL,'dong-ho-led-dhle-001',NULL,NULL,NULL,1,'2014-10-31 08:36:37','2014-10-31 08:48:43'),(34,'Đồng hồ LED. DHLE-002','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-30 00:00:00',NULL,'dong-ho-led-dhle-002',NULL,NULL,NULL,1,'2014-10-31 09:02:19','2014-10-31 09:04:48'),(35,'Đồng hồ LED. DHLE-003','<p>Đ/c: 22/4 Lữ Gia- P15- Q11</p>\r\n<p>Sđt: 0908482804 - 01647770247</p>\r\n<p>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-30 00:00:00',NULL,'dong-ho-led-dhle-003',NULL,NULL,NULL,1,'2014-10-31 09:17:27','2014-10-31 09:23:07'),(36,'Đồng hồ SKMEI. DHSK-004','<p>h&agrave;ng n&agrave;y rất tốt, chống nước rất tốt, h&agrave;ng giống h&igrave;nh</p>\r\n<p>mặt sau l&agrave; inox s&aacute;ng b&Oacute;ng</p>\r\n<p>c&oacute; đầy đủ chức năng: đồng hồ kim, đồng hồ điện tử, thứ/ng&agrave;y/th&aacute;ng/năm, đồng hồ bấm giờ, b&aacute;o thức, đ&egrave;n để xem buổi tối.</p>',NULL,NULL,'dong-ho-skmei-dhsk-004',NULL,NULL,NULL,1,'2014-10-31 09:36:40','2014-10-31 09:43:14'),(37,'Đồng hồ TISSOT.DHTI-001','<p>C&oacute; 2 m&agrave;u: n&acirc;u, đen</p>\r\n<p>Lưu &yacute;: Đồng hồ n&agrave;y kh&ocirc;ng c&oacute; chức năng chống nước, khi tiếp x&uacute;c với nước c&aacute;c bạn phải th&aacute;o ra, h&agrave;ng đẹp y như h&igrave;nh ( v&igrave; đ&acirc;y l&agrave; sản phẩm shop tự chụp)</p>','2014-10-30 00:00:00',NULL,'dong-ho-tissot-dhti-001',NULL,NULL,NULL,1,'2014-10-31 10:08:42','2014-10-31 10:16:49'),(38,'Đồng hồ đôi. DHDO-004','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-31 00:00:00',NULL,'dong-ho-doi-dhdo-004',NULL,NULL,NULL,1,'2014-10-31 10:28:11','2014-10-31 10:32:51'),(39,'Đồng hồ thời trang. DHX-011','<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-31 00:00:00',NULL,'dong-ho-thoi-trang-dhx-011',NULL,NULL,NULL,1,'2014-10-31 10:38:06','2014-10-31 10:42:00'),(41,'Đồng hồ thời trang. DHX-012','<p>Đồng hồ thời trang MICKEY</p>\r\n<p>M&Agrave;U: hồng phấn, đen. trắng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-10-31 00:00:00',NULL,'dong-ho-thoi-trang-dhx-012',NULL,NULL,NULL,1,'2014-10-31 11:22:21','2014-10-31 11:42:21'),(42,'Đồng hồ JULIUS. DHJU-002','<p>Đồng hồ julius cao cấp, h&agrave;ng chất lượng cao</p>\r\n<p>D&acirc;y da : kh&ocirc;ng v&ocirc; nước, da mềm &nbsp;đẹp</p>\r\n<p>M&agrave;u: trắng, đen, hồng phấn, n&acirc;u</p>\r\n<p>Bảo h&agrave;ng: 3 th&aacute;ng</p>\r\n<p>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247<br>- Ship tỉnh với đơn h&agrave;ng &gt;= 200k<br>- &gt;= 300k free ship toan quốc<br>- Ship nội th&agrave;nh free<br>- Ship ngoại th&agrave;nh (Q2, Q12, Q9, Q thủ duc, Q b&igrave;nh t&acirc;n) 10k</p>','2014-11-01 00:00:00',NULL,'dong-ho-julius-dhju-002',NULL,NULL,NULL,1,'2014-11-01 02:20:28','2014-11-01 02:35:42'),(43,'Đồng hồ KORMI. DHKO-001','<p>Đồng hồ KORMI về lại nh&eacute;<br>Nhanh tay số lượng c&oacute; hạn c&aacute;c n&agrave;ng ơi............&nbsp;<br>H&agrave;ng cao cấp chống nước sinh hoạt rất tốt<br>M&aacute;y nhật bền theo thời gian<br>pin sử dụng &gt;1 năm<br>phong c&aacute;ch d&agrave;nh cho c&aacute;c bạn nữ<span class=\"text_exposed_show\"><br>k&iacute;ch thước<br>mặt 2.1cm<br>d&acirc;y: 0.6cm<br>Gi&aacute;: 180k<br>dưới đ&acirc;y l&agrave; h&igrave;nh thật của sản phẩm, h&agrave;ng b&ecirc;n ngo&agrave;i giống h&igrave;nh 100%<br>Đ/c: 22/4 Lữ Gia- P15- Q11<br>Sđt: 0908482804 - 01647770247</span></p>','2014-11-01 00:00:00',NULL,'dong-ho-kormi-dhko-001',NULL,NULL,NULL,1,'2014-11-01 03:07:52','2014-11-01 03:12:34'),(44,'Đồng hồ thời trang. DHMO-001',NULL,'2014-11-01 00:00:00',NULL,'dong-ho-thoi-trang-dhmo-001',NULL,NULL,NULL,1,'2014-11-01 03:29:46','2014-11-01 03:50:26');
/*!40000 ALTER TABLE `spree_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_products_promotion_rules`
--

DROP TABLE IF EXISTS `spree_products_promotion_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_products_promotion_rules` (
  `product_id` int(11) DEFAULT NULL,
  `promotion_rule_id` int(11) DEFAULT NULL,
  KEY `index_products_promotion_rules_on_product_id` (`product_id`),
  KEY `index_products_promotion_rules_on_promotion_rule_id` (`promotion_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_products_promotion_rules`
--

LOCK TABLES `spree_products_promotion_rules` WRITE;
/*!40000 ALTER TABLE `spree_products_promotion_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_products_promotion_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_products_taxons`
--

DROP TABLE IF EXISTS `spree_products_taxons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_products_taxons` (
  `product_id` int(11) DEFAULT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_products_taxons_on_product_id` (`product_id`),
  KEY `index_spree_products_taxons_on_taxon_id` (`taxon_id`),
  KEY `index_spree_products_taxons_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_products_taxons`
--

LOCK TABLES `spree_products_taxons` WRITE;
/*!40000 ALTER TABLE `spree_products_taxons` DISABLE KEYS */;
INSERT INTO `spree_products_taxons` VALUES (1,3,1,1),(8,4,2,2),(9,4,3,3),(10,4,4,4),(11,4,5,5),(12,4,6,6),(13,3,7,7),(14,4,8,8),(15,4,9,9),(15,8,10,10),(16,4,11,11),(17,3,12,12),(17,7,13,13),(18,3,14,14),(18,7,15,15),(19,5,16,16),(20,3,17,17),(21,3,18,18),(22,4,19,19),(23,4,20,20),(24,4,21,21),(25,4,22,22),(26,4,23,23),(26,7,24,24),(27,5,25,25),(28,5,26,26),(30,11,27,27),(30,5,28,28),(32,4,29,29),(33,3,30,30),(34,3,31,31),(35,3,32,32),(36,3,33,33),(36,7,34,34),(37,3,35,35),(38,5,36,36),(39,4,37,37),(41,4,38,38),(42,4,39,39),(42,8,40,40),(43,4,41,41),(44,4,42,42);
/*!40000 ALTER TABLE `spree_products_taxons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_promotion_action_line_items`
--

DROP TABLE IF EXISTS `spree_promotion_action_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_promotion_action_line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_action_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_spree_promotion_action_line_items_on_promotion_action_id` (`promotion_action_id`),
  KEY `index_spree_promotion_action_line_items_on_variant_id` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_promotion_action_line_items`
--

LOCK TABLES `spree_promotion_action_line_items` WRITE;
/*!40000 ALTER TABLE `spree_promotion_action_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_promotion_action_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_promotion_actions`
--

DROP TABLE IF EXISTS `spree_promotion_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_promotion_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_promotion_actions_on_id_and_type` (`id`,`type`),
  KEY `index_spree_promotion_actions_on_promotion_id` (`promotion_id`),
  KEY `index_spree_promotion_actions_on_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_promotion_actions`
--

LOCK TABLES `spree_promotion_actions` WRITE;
/*!40000 ALTER TABLE `spree_promotion_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_promotion_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_promotion_rules`
--

DROP TABLE IF EXISTS `spree_promotion_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_group_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_promotion_rules_on_product_group_id` (`product_group_id`),
  KEY `index_promotion_rules_on_user_id` (`user_id`),
  KEY `index_spree_promotion_rules_on_promotion_id` (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_promotion_rules`
--

LOCK TABLES `spree_promotion_rules` WRITE;
/*!40000 ALTER TABLE `spree_promotion_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_promotion_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_promotion_rules_users`
--

DROP TABLE IF EXISTS `spree_promotion_rules_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_promotion_rules_users` (
  `user_id` int(11) DEFAULT NULL,
  `promotion_rule_id` int(11) DEFAULT NULL,
  KEY `index_promotion_rules_users_on_promotion_rule_id` (`promotion_rule_id`),
  KEY `index_promotion_rules_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_promotion_rules_users`
--

LOCK TABLES `spree_promotion_rules_users` WRITE;
/*!40000 ALTER TABLE `spree_promotion_rules_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_promotion_rules_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_promotion_translations`
--

DROP TABLE IF EXISTS `spree_promotion_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_promotion_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_promotion_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_promotion_translations_on_spree_promotion_id` (`spree_promotion_id`),
  KEY `index_spree_promotion_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_promotion_translations`
--

LOCK TABLES `spree_promotion_translations` WRITE;
/*!40000 ALTER TABLE `spree_promotion_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_promotion_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_promotions`
--

DROP TABLE IF EXISTS `spree_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `match_policy` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'all',
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `advertise` tinyint(1) DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_promotions_on_id_and_type` (`id`,`type`),
  KEY `index_spree_promotions_on_code` (`code`),
  KEY `index_spree_promotions_on_expires_at` (`expires_at`),
  KEY `index_spree_promotions_on_starts_at` (`starts_at`),
  KEY `index_spree_promotions_on_advertise` (`advertise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_promotions`
--

LOCK TABLES `spree_promotions` WRITE;
/*!40000 ALTER TABLE `spree_promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_properties`
--

DROP TABLE IF EXISTS `spree_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_properties`
--

LOCK TABLES `spree_properties` WRITE;
/*!40000 ALTER TABLE `spree_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_properties_prototypes`
--

DROP TABLE IF EXISTS `spree_properties_prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_properties_prototypes` (
  `prototype_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_properties_prototypes`
--

LOCK TABLES `spree_properties_prototypes` WRITE;
/*!40000 ALTER TABLE `spree_properties_prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_properties_prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_property_translations`
--

DROP TABLE IF EXISTS `spree_property_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_property_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_property_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_property_translations_on_spree_property_id` (`spree_property_id`),
  KEY `index_spree_property_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_property_translations`
--

LOCK TABLES `spree_property_translations` WRITE;
/*!40000 ALTER TABLE `spree_property_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_property_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_prototypes`
--

DROP TABLE IF EXISTS `spree_prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_prototypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_prototypes`
--

LOCK TABLES `spree_prototypes` WRITE;
/*!40000 ALTER TABLE `spree_prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_return_authorizations`
--

DROP TABLE IF EXISTS `spree_return_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_return_authorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `stock_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_return_authorizations_on_number` (`number`),
  KEY `index_spree_return_authorizations_on_order_id` (`order_id`),
  KEY `index_spree_return_authorizations_on_stock_location_id` (`stock_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_return_authorizations`
--

LOCK TABLES `spree_return_authorizations` WRITE;
/*!40000 ALTER TABLE `spree_return_authorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_return_authorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_roles`
--

DROP TABLE IF EXISTS `spree_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_roles`
--

LOCK TABLES `spree_roles` WRITE;
/*!40000 ALTER TABLE `spree_roles` DISABLE KEYS */;
INSERT INTO `spree_roles` VALUES (1,'admin'),(2,'user'),(3,'sales_rep');
/*!40000 ALTER TABLE `spree_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_roles_users`
--

DROP TABLE IF EXISTS `spree_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_spree_roles_users_on_role_id` (`role_id`),
  KEY `index_spree_roles_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_roles_users`
--

LOCK TABLES `spree_roles_users` WRITE;
/*!40000 ALTER TABLE `spree_roles_users` DISABLE KEYS */;
INSERT INTO `spree_roles_users` VALUES (1,1),(2,2),(3,2);
/*!40000 ALTER TABLE `spree_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_shipments`
--

DROP TABLE IF EXISTS `spree_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_shipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracking` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT '0.00',
  `shipped_at` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `stock_location_id` int(11) DEFAULT NULL,
  `adjustment_total` decimal(10,2) DEFAULT '0.00',
  `additional_tax_total` decimal(10,2) DEFAULT '0.00',
  `promo_total` decimal(10,2) DEFAULT '0.00',
  `included_tax_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pre_tax_amount` decimal(8,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `index_shipments_on_number` (`number`),
  KEY `index_spree_shipments_on_order_id` (`order_id`),
  KEY `index_spree_shipments_on_stock_location_id` (`stock_location_id`),
  KEY `index_spree_shipments_on_address_id` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_shipments`
--

LOCK TABLES `spree_shipments` WRITE;
/*!40000 ALTER TABLE `spree_shipments` DISABLE KEYS */;
INSERT INTO `spree_shipments` VALUES (1,NULL,'H56887367581',0.00,NULL,1,2,'pending','2014-10-31 06:00:36','2014-10-31 06:00:36',NULL,0.00,0.00,0.00,0.00,0.00),(2,NULL,'H08836378587',0.00,NULL,2,6,'pending','2014-10-31 06:01:21','2014-10-31 06:01:21',NULL,0.00,0.00,0.00,0.00,0.00),(3,NULL,'H12806848208',0.00,NULL,3,8,'canceled','2014-10-31 06:20:23','2014-10-31 06:20:51',NULL,0.00,0.00,0.00,0.00,0.00),(4,NULL,'H41882570151',0.00,NULL,6,10,'pending','2014-10-31 06:39:26','2014-10-31 06:39:26',NULL,0.00,0.00,0.00,0.00,0.00),(5,NULL,'H20122260342',0.00,NULL,7,12,'ready','2014-10-31 11:56:21','2014-10-31 11:56:21',NULL,0.00,0.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `spree_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_shipping_categories`
--

DROP TABLE IF EXISTS `spree_shipping_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_shipping_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_shipping_categories`
--

LOCK TABLES `spree_shipping_categories` WRITE;
/*!40000 ALTER TABLE `spree_shipping_categories` DISABLE KEYS */;
INSERT INTO `spree_shipping_categories` VALUES (1,'Default','2014-10-26 05:50:39','2014-10-26 05:50:39');
/*!40000 ALTER TABLE `spree_shipping_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_shipping_method_categories`
--

DROP TABLE IF EXISTS `spree_shipping_method_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_shipping_method_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_method_id` int(11) NOT NULL,
  `shipping_category_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_spree_shipping_method_categories` (`shipping_category_id`,`shipping_method_id`),
  KEY `index_spree_shipping_method_categories_on_shipping_method_id` (`shipping_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_shipping_method_categories`
--

LOCK TABLES `spree_shipping_method_categories` WRITE;
/*!40000 ALTER TABLE `spree_shipping_method_categories` DISABLE KEYS */;
INSERT INTO `spree_shipping_method_categories` VALUES (1,1,1,'2014-10-31 05:08:07','2014-10-31 05:08:07');
/*!40000 ALTER TABLE `spree_shipping_method_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_shipping_methods`
--

DROP TABLE IF EXISTS `spree_shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_shipping_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_on` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tracking_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_shipping_methods_on_deleted_at` (`deleted_at`),
  KEY `index_spree_shipping_methods_on_tax_category_id` (`tax_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_shipping_methods`
--

LOCK TABLES `spree_shipping_methods` WRITE;
/*!40000 ALTER TABLE `spree_shipping_methods` DISABLE KEYS */;
INSERT INTO `spree_shipping_methods` VALUES (1,'Bưu điện','',NULL,'2014-10-31 05:08:06','2014-10-31 05:08:06','','',NULL);
/*!40000 ALTER TABLE `spree_shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_shipping_methods_zones`
--

DROP TABLE IF EXISTS `spree_shipping_methods_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_shipping_methods_zones` (
  `shipping_method_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_shipping_methods_zones`
--

LOCK TABLES `spree_shipping_methods_zones` WRITE;
/*!40000 ALTER TABLE `spree_shipping_methods_zones` DISABLE KEYS */;
INSERT INTO `spree_shipping_methods_zones` VALUES (1,3);
/*!40000 ALTER TABLE `spree_shipping_methods_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_shipping_rates`
--

DROP TABLE IF EXISTS `spree_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_shipping_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipment_id` int(11) DEFAULT NULL,
  `shipping_method_id` int(11) DEFAULT NULL,
  `selected` tinyint(1) DEFAULT '0',
  `cost` decimal(8,2) DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spree_shipping_rates_join_index` (`shipment_id`,`shipping_method_id`),
  KEY `index_spree_shipping_rates_on_selected` (`selected`),
  KEY `index_spree_shipping_rates_on_tax_rate_id` (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_shipping_rates`
--

LOCK TABLES `spree_shipping_rates` WRITE;
/*!40000 ALTER TABLE `spree_shipping_rates` DISABLE KEYS */;
INSERT INTO `spree_shipping_rates` VALUES (1,1,1,1,0.00,'2014-10-31 06:00:36','2014-10-31 06:00:36',NULL),(2,2,1,1,0.00,'2014-10-31 06:01:21','2014-10-31 06:01:21',NULL),(3,3,1,1,0.00,'2014-10-31 06:20:23','2014-10-31 06:20:23',NULL),(4,4,1,1,0.00,'2014-10-31 06:39:26','2014-10-31 06:39:26',NULL),(5,5,1,1,0.00,'2014-10-31 11:56:21','2014-10-31 11:56:21',NULL);
/*!40000 ALTER TABLE `spree_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_skrill_transactions`
--

DROP TABLE IF EXISTS `spree_skrill_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_skrill_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_skrill_transactions`
--

LOCK TABLES `spree_skrill_transactions` WRITE;
/*!40000 ALTER TABLE `spree_skrill_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_skrill_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_state_changes`
--

DROP TABLE IF EXISTS `spree_state_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_state_changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previous_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stateful_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stateful_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_state_changes_on_stateful_id_and_stateful_type` (`stateful_id`,`stateful_type`),
  KEY `index_spree_state_changes_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_state_changes`
--

LOCK TABLES `spree_state_changes` WRITE;
/*!40000 ALTER TABLE `spree_state_changes` DISABLE KEYS */;
INSERT INTO `spree_state_changes` VALUES (1,'order','cart',1,1,'Spree::Order','address','2014-10-28 16:02:02','2014-10-28 16:02:02'),(2,'order','address',1,1,'Spree::Order','complete','2014-10-31 06:00:36','2014-10-31 06:00:36'),(3,'payment',NULL,1,1,'Spree::Order','balance_due','2014-10-31 06:00:36','2014-10-31 06:00:36'),(4,'order','cart',2,1,'Spree::Order','address','2014-10-31 06:01:10','2014-10-31 06:01:10'),(5,'order','address',2,1,'Spree::Order','complete','2014-10-31 06:01:21','2014-10-31 06:01:21'),(6,'payment',NULL,2,1,'Spree::Order','balance_due','2014-10-31 06:01:21','2014-10-31 06:01:21'),(7,'order','cart',3,1,'Spree::Order','address','2014-10-31 06:20:02','2014-10-31 06:20:02'),(8,'order','address',3,1,'Spree::Order','complete','2014-10-31 06:20:23','2014-10-31 06:20:23'),(9,'payment',NULL,3,1,'Spree::Order','balance_due','2014-10-31 06:20:23','2014-10-31 06:20:23'),(10,'shipment','pending',3,NULL,'Spree::Shipment','ready','2014-10-31 06:20:40','2014-10-31 06:20:40'),(11,'order','complete',3,1,'Spree::Order','canceled','2014-10-31 06:20:51','2014-10-31 06:20:51'),(12,'shipment','ready',3,NULL,'Spree::Shipment','canceled','2014-10-31 06:20:51','2014-10-31 06:20:51'),(13,'order','cart',6,2,'Spree::Order','address','2014-10-31 06:38:49','2014-10-31 06:38:49'),(14,'order','address',6,2,'Spree::Order','complete','2014-10-31 06:39:26','2014-10-31 06:39:26'),(15,'payment',NULL,6,2,'Spree::Order','balance_due','2014-10-31 06:39:26','2014-10-31 06:39:26'),(16,'order','cart',7,2,'Spree::Order','address','2014-10-31 06:44:42','2014-10-31 06:44:42'),(17,'order','address',7,2,'Spree::Order','complete','2014-10-31 11:56:21','2014-10-31 11:56:21'),(18,'payment',NULL,7,2,'Spree::Order','paid','2014-10-31 11:56:21','2014-10-31 11:56:21'),(19,'shipment','pending',7,2,'Spree::Order','ready','2014-10-31 11:56:21','2014-10-31 11:56:21');
/*!40000 ALTER TABLE `spree_state_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_states`
--

DROP TABLE IF EXISTS `spree_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abbr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_states`
--

LOCK TABLES `spree_states` WRITE;
/*!40000 ALTER TABLE `spree_states` DISABLE KEYS */;
INSERT INTO `spree_states` VALUES (1,'An Giang','AG',84),(2,'Bà Rịa-Vũng Tàu','VT',84),(3,'Bạc Liêu','NA',84),(4,'Bắc Kạn','NA',84),(5,'Bắc Giang','BG',84),(6,'Bắc Ninh','NA',84),(7,'Bến Tre','NA',84),(8,'Bình Dương','NA',84),(9,'Bình Định','NA',84),(10,'Bình Phước','NA',84),(11,'Bình Thuận','NA',84),(12,'Cà Mau','NA',84),(13,'Cao Bằng','NA',84),(14,'Cần Thơ (TP)','NA',84),(15,'Đà Nẵng (TP)','NA',84),(16,'Đắk Lắk','NA',84),(17,'Đắk Nông','NA',84),(18,'Điện Biên','NA',84),(19,'Đồng Nai','NA',84),(20,'Đồng Tháp','NA',84),(21,'Gia Lai','NA',84),(22,'Hà Giang','NA',84),(23,'Hà Nam','NA',84),(24,'Hà Nội (TP)','NA',84),(25,'Hà Tĩnh','NA',84),(26,'Hải Dương','NA',84),(27,'Hải Phòng (TP)','NA',84),(28,'Hòa Bình','NA',84),(29,'Hồ Chí Minh (TP)','hcm',84),(30,'Hậu Giang','NA',84),(31,'Hưng Yên','NA',84),(32,'Khánh Hòa','NA',84),(33,'Kiên Giang','NA',84),(34,'Kon Tum','NA',84),(35,'Lai Châu','NA',84),(36,'Lào Cai','NA',84),(37,'Lạng Sơn','NA',84),(38,'Lâm Đồng','NA',84),(39,'Long An','NA',84),(40,'Nam Định','NA',84),(41,'Nghệ An','NA',84),(42,'Ninh Bình','NA',84),(43,'Ninh Thuận','NA',84),(44,'Phú Thọ','NA',84),(45,'Phú Yên','NA',84),(46,'Quảng Bình','NA',84),(47,'Quảng Nam','NA',84),(48,'Quảng Ngãi','NA',84),(49,'Quảng Ninh','NA',84),(50,'Quảng Trị','NA',84),(51,'Sóc Trăng','NA',84),(52,'Sơn La','NA',84),(53,'Tây Ninh','NA',84),(54,'Thái Bình','NA',84),(55,'Thái Nguyên','NA',84),(56,'Thanh Hóa','NA',84),(57,'Thừa Thiên - Huế','NA',84),(58,'Tiền Giang','NA',84),(59,'Trà Vinh','NA',84),(60,'Tuyên Quang','NA',84),(61,'Vĩnh Long','NA',84),(62,'Vĩnh Phúc','NA',84),(63,'Yên Bái','NA',84);
/*!40000 ALTER TABLE `spree_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_stock_items`
--

DROP TABLE IF EXISTS `spree_stock_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_stock_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_location_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `count_on_hand` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `backorderable` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_stock_items_on_stock_location_id` (`stock_location_id`),
  KEY `stock_item_by_loc_and_var_id` (`stock_location_id`,`variant_id`),
  KEY `index_spree_stock_items_on_deleted_at` (`deleted_at`),
  KEY `index_spree_stock_items_on_backorderable` (`backorderable`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_stock_items`
--

LOCK TABLES `spree_stock_items` WRITE;
/*!40000 ALTER TABLE `spree_stock_items` DISABLE KEYS */;
INSERT INTO `spree_stock_items` VALUES (1,1,1,0,'2014-10-27 06:59:12','2014-10-27 06:59:12',1,NULL),(2,1,2,0,'2014-10-27 09:49:18','2014-10-27 09:49:18',1,NULL),(3,1,3,0,'2014-10-30 02:45:50','2014-10-30 02:45:50',1,NULL),(4,1,4,0,'2014-10-30 02:47:23','2014-10-30 02:47:23',1,NULL),(5,1,5,0,'2014-10-30 02:50:00','2014-10-30 02:50:00',1,NULL),(6,1,6,0,'2014-10-30 02:59:57','2014-10-30 02:59:57',1,NULL),(7,1,7,0,'2014-10-30 03:04:32','2014-10-30 03:04:32',1,NULL),(8,1,8,0,'2014-10-30 03:10:06','2014-10-30 03:10:06',1,NULL),(9,1,9,0,'2014-10-30 03:22:33','2014-10-30 03:22:33',1,NULL),(10,1,10,0,'2014-10-30 03:24:07','2014-10-30 03:24:07',1,NULL),(11,1,11,0,'2014-10-30 03:25:34','2014-10-30 03:25:34',1,NULL),(12,1,12,0,'2014-10-30 03:26:09','2014-10-30 03:26:09',1,NULL),(13,1,13,0,'2014-10-30 03:26:59','2014-10-30 03:26:59',1,NULL),(14,1,14,0,'2014-10-30 03:28:03','2014-10-30 03:28:03',1,NULL),(15,1,15,0,'2014-10-30 03:35:55','2014-10-30 03:35:55',1,NULL),(16,1,16,0,'2014-10-30 03:37:17','2014-10-30 03:37:17',1,NULL),(17,1,17,0,'2014-10-30 03:37:37','2014-10-30 03:37:37',1,NULL),(18,1,18,0,'2014-10-30 03:41:48','2014-10-30 03:41:48',1,NULL),(19,1,19,0,'2014-10-30 03:42:35','2014-10-30 03:42:35',1,NULL),(20,1,20,0,'2014-10-30 03:43:22','2014-10-30 03:43:22',1,NULL),(21,1,21,0,'2014-10-30 03:55:58','2014-10-30 03:55:58',1,NULL),(22,1,22,0,'2014-10-30 03:59:33','2014-10-30 03:59:33',1,NULL),(23,1,23,0,'2014-10-30 03:59:56','2014-10-30 03:59:56',1,NULL),(24,1,24,0,'2014-10-30 04:13:33','2014-10-30 04:13:33',1,NULL),(25,1,25,0,'2014-10-30 04:15:10','2014-10-30 04:15:10',1,NULL),(26,1,26,0,'2014-10-30 04:16:56','2014-10-30 04:16:56',1,NULL),(27,1,27,0,'2014-10-30 04:25:54','2014-10-30 04:25:54',1,NULL),(28,1,28,0,'2014-10-30 04:29:18','2014-10-30 04:29:18',1,NULL),(29,1,29,0,'2014-10-30 04:29:46','2014-10-30 04:29:46',1,NULL),(30,1,30,0,'2014-10-30 04:33:26','2014-10-30 04:33:26',1,NULL),(31,1,31,0,'2014-10-30 04:34:55','2014-10-30 04:34:55',1,NULL),(32,1,32,0,'2014-10-30 04:35:40','2014-10-30 04:35:40',1,NULL),(33,1,33,0,'2014-10-30 04:43:40','2014-10-30 04:43:40',1,NULL),(34,1,34,0,'2014-10-30 04:48:22','2014-10-30 04:48:22',1,NULL),(35,1,35,0,'2014-10-30 04:48:58','2014-10-30 04:48:58',1,NULL),(36,1,36,0,'2014-10-30 04:49:35','2014-10-30 04:49:35',1,NULL),(37,1,37,0,'2014-10-30 04:50:51','2014-10-30 04:50:51',1,NULL),(38,1,38,0,'2014-10-30 04:52:21','2014-10-30 04:52:21',1,NULL),(39,1,39,0,'2014-10-30 04:59:40','2014-10-30 04:59:40',1,NULL),(40,1,40,0,'2014-10-30 05:01:55','2014-10-30 05:01:55',1,NULL),(41,1,41,0,'2014-10-30 05:03:33','2014-10-30 05:03:33',1,NULL),(42,1,42,0,'2014-10-30 05:04:02','2014-10-30 05:04:02',1,NULL),(43,1,43,0,'2014-10-30 05:26:39','2014-10-30 05:26:39',1,NULL),(44,1,44,0,'2014-10-30 05:28:52','2014-10-30 05:28:52',1,NULL),(45,1,45,0,'2014-10-30 05:29:15','2014-10-30 05:29:15',1,NULL),(46,1,46,0,'2014-10-30 05:29:39','2014-10-30 05:29:39',1,NULL),(47,1,47,0,'2014-10-30 07:22:16','2014-10-30 07:22:16',1,NULL),(48,1,48,0,'2014-10-30 07:23:45','2014-10-30 07:23:45',1,NULL),(49,1,49,0,'2014-10-30 07:24:12','2014-10-30 07:24:12',1,NULL),(50,1,50,0,'2014-10-30 07:24:57','2014-10-30 07:24:57',1,NULL),(51,1,51,0,'2014-10-30 07:40:56','2014-10-30 07:40:56',1,NULL),(52,1,52,0,'2014-10-30 07:45:46','2014-10-30 07:45:46',1,NULL),(53,1,53,0,'2014-10-30 07:46:37','2014-10-30 07:46:37',1,NULL),(54,1,54,0,'2014-10-30 07:47:10','2014-10-30 07:47:10',1,NULL),(55,1,55,0,'2014-10-30 07:47:57','2014-10-30 07:47:57',1,NULL),(56,1,56,0,'2014-10-30 08:08:16','2014-10-30 08:08:16',1,NULL),(57,1,57,0,'2014-10-30 08:10:48','2014-10-30 08:10:48',1,NULL),(58,1,58,0,'2014-10-30 08:11:06','2014-10-30 08:11:06',1,NULL),(59,1,59,0,'2014-10-30 08:26:34','2014-10-30 08:26:34',1,NULL),(60,1,60,0,'2014-10-30 08:32:23','2014-10-30 08:32:23',1,NULL),(61,1,61,0,'2014-10-30 08:33:12','2014-10-30 08:33:12',1,NULL),(62,1,62,0,'2014-10-30 08:34:22','2014-10-30 08:34:22',1,NULL),(63,1,63,0,'2014-10-30 09:02:44','2014-10-30 09:02:44',1,NULL),(64,1,64,0,'2014-10-30 09:09:48','2014-10-30 09:09:48',1,NULL),(65,1,65,0,'2014-10-30 09:10:15','2014-10-30 09:10:15',1,NULL),(66,1,66,0,'2014-10-30 09:10:31','2014-10-30 09:10:31',1,NULL),(67,1,67,0,'2014-10-30 09:38:21','2014-10-30 09:38:21',1,NULL),(68,1,68,0,'2014-10-31 02:56:49','2014-10-31 02:56:49',1,NULL),(69,1,69,0,'2014-10-31 02:59:11','2014-10-31 02:59:11',1,NULL),(70,1,70,0,'2014-10-31 02:59:28','2014-10-31 02:59:28',1,NULL),(71,1,71,0,'2014-10-31 02:59:51','2014-10-31 02:59:51',1,NULL),(72,1,72,0,'2014-10-31 03:07:17','2014-10-31 03:07:17',1,NULL),(73,1,73,0,'2014-10-31 03:11:35','2014-10-31 03:11:35',1,NULL),(74,1,74,0,'2014-10-31 03:12:30','2014-10-31 03:12:30',1,NULL),(75,1,75,0,'2014-10-31 03:39:23','2014-10-31 03:39:23',1,NULL),(76,1,76,0,'2014-10-31 03:44:48','2014-10-31 03:44:48',1,NULL),(77,1,77,0,'2014-10-31 03:45:08','2014-10-31 03:45:08',1,NULL),(78,1,78,0,'2014-10-31 03:47:16','2014-10-31 03:47:16',1,NULL),(79,1,79,0,'2014-10-31 03:58:53','2014-10-31 03:58:53',1,NULL),(80,1,80,0,'2014-10-31 03:59:51','2014-10-31 03:59:51',1,NULL),(81,1,81,0,'2014-10-31 04:40:42','2014-10-31 04:40:42',1,NULL),(82,1,82,0,'2014-10-31 04:42:28','2014-10-31 04:42:28',1,NULL),(83,1,83,0,'2014-10-31 04:42:43','2014-10-31 04:42:43',1,NULL),(84,1,84,0,'2014-10-31 04:42:59','2014-10-31 04:42:59',1,NULL),(85,1,85,0,'2014-10-31 04:58:09','2014-10-31 04:58:09',1,NULL),(86,1,86,0,'2014-10-31 05:00:03','2014-10-31 05:00:03',1,NULL),(87,1,87,0,'2014-10-31 05:00:26','2014-10-31 05:00:26',1,NULL),(88,1,88,0,'2014-10-31 05:00:59','2014-10-31 05:00:59',1,NULL),(89,1,89,0,'2014-10-31 05:20:01','2014-10-31 05:20:01',1,NULL),(90,1,90,0,'2014-10-31 05:23:35','2014-10-31 05:23:35',1,NULL),(91,1,91,0,'2014-10-31 05:24:38','2014-10-31 05:24:38',1,NULL),(92,1,92,0,'2014-10-31 05:24:54','2014-10-31 05:24:54',1,NULL),(93,1,93,0,'2014-10-31 05:25:12','2014-10-31 05:25:12',1,NULL),(94,1,94,0,'2014-10-31 05:48:12','2014-10-31 05:48:12',1,NULL),(95,1,95,0,'2014-10-31 05:51:00','2014-10-31 05:51:00',1,NULL),(96,1,96,0,'2014-10-31 05:51:35','2014-10-31 05:51:35',1,NULL),(97,1,97,0,'2014-10-31 06:15:49','2014-10-31 06:15:49',1,NULL),(98,1,98,0,'2014-10-31 06:17:20','2014-10-31 06:17:20',1,NULL),(99,1,99,0,'2014-10-31 06:17:35','2014-10-31 06:17:35',1,NULL),(100,1,100,0,'2014-10-31 06:32:01','2014-10-31 06:32:01',1,NULL),(101,1,101,0,'2014-10-31 07:29:35','2014-10-31 07:29:35',1,NULL),(102,1,102,0,'2014-10-31 07:29:56','2014-10-31 07:29:56',1,NULL),(103,1,103,0,'2014-10-31 07:43:08','2014-10-31 07:43:08',1,NULL),(104,1,104,0,'2014-10-31 07:57:03','2014-10-31 07:57:03',1,NULL),(105,1,105,0,'2014-10-31 07:57:25','2014-10-31 07:57:25',1,NULL),(106,1,106,0,'2014-10-31 07:58:26','2014-10-31 07:58:26',1,NULL),(107,1,107,0,'2014-10-31 08:36:37','2014-10-31 08:36:37',1,NULL),(108,1,108,0,'2014-10-31 08:38:32','2014-10-31 08:38:32',1,NULL),(109,1,109,0,'2014-10-31 08:38:48','2014-10-31 08:38:48',1,NULL),(110,1,110,0,'2014-10-31 09:02:19','2014-10-31 09:02:19',1,NULL),(111,1,111,0,'2014-10-31 09:03:30','2014-10-31 09:03:30',1,NULL),(112,1,112,0,'2014-10-31 09:03:47','2014-10-31 09:03:47',1,NULL),(113,1,113,0,'2014-10-31 09:17:27','2014-10-31 09:17:27',1,NULL),(114,1,114,0,'2014-10-31 09:18:54','2014-10-31 09:18:54',1,NULL),(115,1,115,0,'2014-10-31 09:19:09','2014-10-31 09:19:09',1,NULL),(116,1,116,0,'2014-10-31 09:36:40','2014-10-31 09:36:40',1,NULL),(117,1,117,0,'2014-10-31 09:38:27','2014-10-31 09:38:27',1,NULL),(118,1,118,0,'2014-10-31 10:08:42','2014-10-31 10:08:42',1,NULL),(119,1,119,0,'2014-10-31 10:13:07','2014-10-31 10:13:07',1,NULL),(120,1,120,0,'2014-10-31 10:28:11','2014-10-31 10:28:11',1,NULL),(121,1,121,0,'2014-10-31 10:30:35','2014-10-31 10:30:35',1,NULL),(122,1,122,0,'2014-10-31 10:31:00','2014-10-31 10:31:00',1,NULL),(123,1,123,0,'2014-10-31 10:38:06','2014-10-31 10:38:06',1,NULL),(124,1,124,0,'2014-10-31 10:40:02','2014-10-31 10:40:02',1,NULL),(125,1,125,0,'2014-10-31 10:40:27','2014-10-31 10:40:27',1,NULL),(126,1,126,0,'2014-10-31 10:40:53','2014-10-31 10:40:53',1,NULL),(127,1,127,0,'2014-10-31 10:41:11','2014-10-31 10:41:11',1,NULL),(128,1,128,0,'2014-10-31 11:22:21','2014-10-31 11:22:21',1,NULL),(129,1,129,0,'2014-10-31 11:25:44','2014-10-31 11:25:44',1,NULL),(130,1,130,0,'2014-10-31 11:26:04','2014-10-31 11:26:04',1,NULL),(131,1,131,0,'2014-11-01 02:20:29','2014-11-01 02:20:29',1,NULL),(132,1,132,0,'2014-11-01 02:24:35','2014-11-01 02:24:35',1,NULL),(133,1,133,0,'2014-11-01 02:24:48','2014-11-01 02:24:48',1,NULL),(134,1,134,0,'2014-11-01 03:07:52','2014-11-01 03:07:52',1,NULL),(135,1,135,0,'2014-11-01 03:09:43','2014-11-01 03:09:43',1,NULL),(136,1,136,0,'2014-11-01 03:10:00','2014-11-01 03:10:00',1,NULL),(137,1,137,0,'2014-11-01 03:29:46','2014-11-01 03:29:46',1,NULL),(138,1,138,0,'2014-11-01 03:30:25','2014-11-01 03:30:25',1,NULL);
/*!40000 ALTER TABLE `spree_stock_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_stock_locations`
--

DROP TABLE IF EXISTS `spree_stock_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_stock_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `backorderable_default` tinyint(1) DEFAULT '0',
  `propagate_all_variants` tinyint(1) DEFAULT '1',
  `admin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_stock_locations_on_active` (`active`),
  KEY `index_spree_stock_locations_on_backorderable_default` (`backorderable_default`),
  KEY `index_spree_stock_locations_on_country_id` (`country_id`),
  KEY `index_spree_stock_locations_on_propagate_all_variants` (`propagate_all_variants`),
  KEY `index_spree_stock_locations_on_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_stock_locations`
--

LOCK TABLES `spree_stock_locations` WRITE;
/*!40000 ALTER TABLE `spree_stock_locations` DISABLE KEYS */;
INSERT INTO `spree_stock_locations` VALUES (1,'default','2014-10-26 05:50:05','2014-10-26 05:50:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,NULL);
/*!40000 ALTER TABLE `spree_stock_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_stock_movements`
--

DROP TABLE IF EXISTS `spree_stock_movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_stock_movements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `originator_id` int(11) DEFAULT NULL,
  `originator_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_stock_movements_on_stock_item_id` (`stock_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_stock_movements`
--

LOCK TABLES `spree_stock_movements` WRITE;
/*!40000 ALTER TABLE `spree_stock_movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_stock_movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_stock_transfers`
--

DROP TABLE IF EXISTS `spree_stock_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_stock_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_location_id` int(11) DEFAULT NULL,
  `destination_location_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_stock_transfers_on_number` (`number`),
  KEY `index_spree_stock_transfers_on_source_location_id` (`source_location_id`),
  KEY `index_spree_stock_transfers_on_destination_location_id` (`destination_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_stock_transfers`
--

LOCK TABLES `spree_stock_transfers` WRITE;
/*!40000 ALTER TABLE `spree_stock_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_stock_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_stores`
--

DROP TABLE IF EXISTS `spree_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_from_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_stores_on_code` (`code`),
  KEY `index_spree_stores_on_default` (`default`),
  KEY `index_spree_stores_on_url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_stores`
--

LOCK TABLES `spree_stores` WRITE;
/*!40000 ALTER TABLE `spree_stores` DISABLE KEYS */;
INSERT INTO `spree_stores` VALUES (1,'Dong ho xteen','donghox.com','','','Đồng hồ giá rẻ, chất lượng cao dành cho giới trẻ - donghox','spree@example.com',NULL,'spree',1,'2014-10-26 05:50:57','2014-10-27 01:19:45');
/*!40000 ALTER TABLE `spree_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_tax_categories`
--

DROP TABLE IF EXISTS `spree_tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_tax_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_tax_categories_on_deleted_at` (`deleted_at`),
  KEY `index_spree_tax_categories_on_is_default` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_tax_categories`
--

LOCK TABLES `spree_tax_categories` WRITE;
/*!40000 ALTER TABLE `spree_tax_categories` DISABLE KEYS */;
INSERT INTO `spree_tax_categories` VALUES (1,'FREE','',1,NULL,'2014-10-31 05:14:19','2014-10-31 05:14:19');
/*!40000 ALTER TABLE `spree_tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_tax_rates`
--

DROP TABLE IF EXISTS `spree_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(8,5) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `included_in_price` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_rate_in_label` tinyint(1) DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_tax_rates_on_deleted_at` (`deleted_at`),
  KEY `index_spree_tax_rates_on_included_in_price` (`included_in_price`),
  KEY `index_spree_tax_rates_on_show_rate_in_label` (`show_rate_in_label`),
  KEY `index_spree_tax_rates_on_tax_category_id` (`tax_category_id`),
  KEY `index_spree_tax_rates_on_zone_id` (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_tax_rates`
--

LOCK TABLES `spree_tax_rates` WRITE;
/*!40000 ALTER TABLE `spree_tax_rates` DISABLE KEYS */;
INSERT INTO `spree_tax_rates` VALUES (1,0.00000,3,1,1,'2014-10-31 05:14:51','2014-10-31 05:15:01','FREE TAX',1,NULL);
/*!40000 ALTER TABLE `spree_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_taxon_translations`
--

DROP TABLE IF EXISTS `spree_taxon_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_taxon_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_taxon_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_taxon_translations_on_spree_taxon_id` (`spree_taxon_id`),
  KEY `index_spree_taxon_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_taxon_translations`
--

LOCK TABLES `spree_taxon_translations` WRITE;
/*!40000 ALTER TABLE `spree_taxon_translations` DISABLE KEYS */;
INSERT INTO `spree_taxon_translations` VALUES (2,2,'vi','2014-10-26 12:48:39','2014-10-26 12:48:39','Danh mục',NULL,NULL,NULL,NULL,'danh-muc'),(3,3,'vi','2014-10-26 12:49:20','2014-10-26 12:49:20','Đồng hồ nam',NULL,NULL,NULL,NULL,'danh-muc/dong-ho-nam'),(4,4,'vi','2014-10-26 12:49:35','2014-10-26 12:49:35','Đồng hồ nữ',NULL,NULL,NULL,NULL,'danh-muc/dong-ho-nu'),(5,5,'vi','2014-10-26 12:49:48','2014-10-26 12:49:48','Đồng hồ cặp',NULL,NULL,NULL,NULL,'danh-muc/dong-ho-cap'),(6,6,'vi','2014-10-26 13:02:45','2014-10-26 13:02:45','Thương hiệu',NULL,NULL,NULL,NULL,'thuong-hieu'),(7,7,'vi','2014-10-26 13:03:01','2014-10-26 13:03:01','Skmei',NULL,NULL,NULL,NULL,'thuong-hieu/skmei'),(8,8,'vi','2014-10-26 13:03:08','2014-10-26 13:03:08','Julius',NULL,NULL,NULL,NULL,'thuong-hieu/julius'),(9,9,'vi','2014-10-28 02:02:26','2014-10-28 02:02:26','Casio',NULL,NULL,NULL,NULL,'thuong-hieu/casio'),(10,10,'vi','2014-10-28 02:02:35','2014-10-28 02:02:35','Tissot',NULL,NULL,NULL,NULL,'thuong-hieu/tissot'),(11,11,'vi','2014-10-29 07:10:05','2014-10-29 07:10:05','Omega',NULL,NULL,NULL,NULL,'thuong-hieu/omega'),(12,12,'vi','2014-10-31 09:54:12','2014-10-31 09:54:12','JEDI',NULL,NULL,NULL,NULL,'thuong-hieu/jedi');
/*!40000 ALTER TABLE `spree_taxon_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_taxonomies`
--

DROP TABLE IF EXISTS `spree_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_taxonomies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_spree_taxonomies_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_taxonomies`
--

LOCK TABLES `spree_taxonomies` WRITE;
/*!40000 ALTER TABLE `spree_taxonomies` DISABLE KEYS */;
INSERT INTO `spree_taxonomies` VALUES (2,'Danh mục','2014-10-26 12:48:39','2014-11-01 03:50:26',0),(3,'Thương hiệu','2014-10-26 13:02:45','2014-11-01 02:35:42',0);
/*!40000 ALTER TABLE `spree_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_taxonomy_translations`
--

DROP TABLE IF EXISTS `spree_taxonomy_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_taxonomy_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spree_taxonomy_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_taxonomy_translations_on_spree_taxonomy_id` (`spree_taxonomy_id`),
  KEY `index_spree_taxonomy_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_taxonomy_translations`
--

LOCK TABLES `spree_taxonomy_translations` WRITE;
/*!40000 ALTER TABLE `spree_taxonomy_translations` DISABLE KEYS */;
INSERT INTO `spree_taxonomy_translations` VALUES (2,2,'vi','2014-10-26 12:48:39','2014-10-26 12:48:39','Danh mục'),(3,3,'vi','2014-10-26 13:02:45','2014-10-26 13:02:45','Thương hiệu');
/*!40000 ALTER TABLE `spree_taxonomy_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_taxons`
--

DROP TABLE IF EXISTS `spree_taxons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_taxons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taxonomy_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taxons_on_parent_id` (`parent_id`),
  KEY `index_taxons_on_permalink` (`permalink`),
  KEY `index_taxons_on_taxonomy_id` (`taxonomy_id`),
  KEY `index_spree_taxons_on_position` (`position`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_taxons`
--

LOCK TABLES `spree_taxons` WRITE;
/*!40000 ALTER TABLE `spree_taxons` DISABLE KEYS */;
INSERT INTO `spree_taxons` VALUES (2,NULL,0,'Danh mục','danh-muc',2,1,8,NULL,NULL,NULL,NULL,NULL,'2014-10-26 12:48:39','2014-11-01 03:50:26',NULL,NULL,NULL,0),(3,2,0,'Đồng hồ nam','danh-muc/dong-ho-nam',2,2,3,NULL,NULL,NULL,NULL,NULL,'2014-10-26 12:49:20','2014-10-31 10:16:49',NULL,NULL,NULL,1),(4,2,0,'Đồng hồ nữ','danh-muc/dong-ho-nu',2,4,5,NULL,NULL,NULL,NULL,NULL,'2014-10-26 12:49:35','2014-11-01 03:50:26',NULL,NULL,NULL,1),(5,2,0,'Đồng hồ cặp','danh-muc/dong-ho-cap',2,6,7,NULL,NULL,NULL,NULL,NULL,'2014-10-26 12:49:48','2014-10-31 10:32:51',NULL,NULL,NULL,1),(6,NULL,0,'Thương hiệu','thuong-hieu',3,9,22,NULL,NULL,NULL,NULL,NULL,'2014-10-26 13:02:45','2014-11-01 02:35:42',NULL,NULL,NULL,0),(7,6,0,'Skmei','thuong-hieu/skmei',3,18,19,NULL,NULL,NULL,NULL,NULL,'2014-10-26 13:03:01','2014-10-31 11:58:03',NULL,NULL,NULL,1),(8,6,0,'Julius','thuong-hieu/julius',3,14,15,NULL,NULL,NULL,NULL,NULL,'2014-10-26 13:03:08','2014-11-01 02:35:42',NULL,NULL,NULL,1),(9,6,0,'Casio','thuong-hieu/casio',3,10,11,NULL,NULL,NULL,NULL,NULL,'2014-10-28 02:02:26','2014-10-29 07:10:14',NULL,NULL,NULL,1),(10,6,0,'Tissot','thuong-hieu/tissot',3,20,21,NULL,NULL,NULL,NULL,NULL,'2014-10-28 02:02:35','2014-10-31 09:54:17',NULL,NULL,NULL,1),(11,6,0,'Omega','thuong-hieu/omega',3,16,17,NULL,NULL,NULL,NULL,NULL,'2014-10-29 07:10:05','2014-10-31 09:54:17',NULL,NULL,NULL,1),(12,6,0,'JEDI','thuong-hieu/jedi',3,12,13,NULL,NULL,NULL,NULL,NULL,'2014-10-31 09:54:12','2014-10-31 09:54:17',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `spree_taxons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_tokenized_permissions`
--

DROP TABLE IF EXISTS `spree_tokenized_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_tokenized_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissable_id` int(11) DEFAULT NULL,
  `permissable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tokenized_name_and_type` (`permissable_id`,`permissable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_tokenized_permissions`
--

LOCK TABLES `spree_tokenized_permissions` WRITE;
/*!40000 ALTER TABLE `spree_tokenized_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_tokenized_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_trackers`
--

DROP TABLE IF EXISTS `spree_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `analytics_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_trackers_on_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_trackers`
--

LOCK TABLES `spree_trackers` WRITE;
/*!40000 ALTER TABLE `spree_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `spree_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_users`
--

DROP TABLE IF EXISTS `spree_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encrypted_password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_address_id` int(11) DEFAULT NULL,
  `bill_address_id` int(11) DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `spree_api_key` varchar(48) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_idx_unique` (`email`),
  KEY `index_spree_users_on_spree_api_key` (`spree_api_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_users`
--

LOCK TABLES `spree_users` WRITE;
/*!40000 ALTER TABLE `spree_users` DISABLE KEYS */;
INSERT INTO `spree_users` VALUES (1,'f82ac33ddc1069a663358824faef48c47b466129f24bd2b7e34af4280fcfbe2290d4e69743ffec259807db39820a6e0dc1d76018dfe7eca86848500ae9ab11c0','Ss76BNrKdm_hNRqPj4Ky','admin@donghox.com',NULL,NULL,NULL,NULL,5,0,NULL,'2014-10-31 12:00:24','2014-10-30 03:35:21','14.161.16.235','14.161.16.235','admin@donghox.com',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-26 05:52:27','2014-10-31 12:00:24','c5ce9fb6362007ddf76cd26b0c07a94e5853b7a462c106af',NULL),(2,'d1346245aed20212e1c8f56c0fa52226b26c084822f1aa2438da67f069b6c0bccb41382b52b78353964dafd2e30fb56925af54ecfc949f0f44e556f11585875f','CSacyVKWrESy5dvE5NEb','sale01@donghox.com',NULL,NULL,NULL,NULL,6,0,NULL,'2014-11-01 02:06:37','2014-10-31 03:27:09','14.161.16.235','14.161.16.235','sale01@donghox.com',NULL,NULL,NULL,NULL,NULL,NULL,'2014-10-26 07:12:54','2014-11-01 02:06:37',NULL,NULL);
/*!40000 ALTER TABLE `spree_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_variants`
--

DROP TABLE IF EXISTS `spree_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` decimal(8,2) DEFAULT '0.00',
  `height` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `depth` decimal(8,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_master` tinyint(1) DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `cost_currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `track_inventory` tinyint(1) DEFAULT '1',
  `tax_category_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_variants_on_product_id` (`product_id`),
  KEY `index_spree_variants_on_sku` (`sku`),
  KEY `index_spree_variants_on_tax_category_id` (`tax_category_id`),
  KEY `index_spree_variants_on_deleted_at` (`deleted_at`),
  KEY `index_spree_variants_on_is_master` (`is_master`),
  KEY `index_spree_variants_on_position` (`position`),
  KEY `index_spree_variants_on_track_inventory` (`track_inventory`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_variants`
--

LOCK TABLES `spree_variants` WRITE;
/*!40000 ALTER TABLE `spree_variants` DISABLE KEYS */;
INSERT INTO `spree_variants` VALUES (1,'DHOM-001',0.00,NULL,NULL,NULL,NULL,1,1,NULL,'USD',1,1,NULL,'2014-10-30 07:49:04'),(2,'LN001',0.00,NULL,NULL,NULL,NULL,1,2,NULL,'VND',1,1,NULL,'2014-10-30 07:49:05'),(3,'DHGE-001',0.00,NULL,NULL,NULL,NULL,1,3,NULL,'VND',1,1,NULL,'2014-10-30 07:49:06'),(4,'DHGE-VA001',0.00,NULL,NULL,NULL,NULL,0,3,NULL,'VND',1,1,NULL,'2014-10-30 07:49:09'),(5,'DHGE-BA001',0.00,NULL,NULL,NULL,NULL,0,3,NULL,'VND',2,1,NULL,'2014-10-30 07:49:08'),(6,'DHX-002',0.00,NULL,NULL,NULL,NULL,1,4,NULL,'VND',1,1,NULL,'2014-10-30 07:49:10'),(7,'DHX-DE002',0.00,NULL,NULL,NULL,NULL,0,4,NULL,'VND',1,1,NULL,'2014-10-30 03:10:25'),(8,'DHX-TR002',0.00,NULL,NULL,NULL,NULL,0,4,NULL,'VND',2,1,NULL,'2014-10-30 03:10:06'),(9,'DHX-003',0.00,NULL,NULL,NULL,NULL,1,5,NULL,'VND',1,1,NULL,'2014-10-30 03:22:33'),(10,'DHX-TR003',0.00,NULL,NULL,NULL,NULL,0,5,NULL,'VND',1,1,NULL,'2014-10-30 03:24:32'),(11,'DHX-DE003',0.00,NULL,NULL,NULL,NULL,0,5,NULL,'VND',2,1,NULL,'2014-10-30 03:25:34'),(12,'DHX-TI003',0.00,NULL,NULL,NULL,NULL,0,5,NULL,'VND',3,1,NULL,'2014-10-30 07:49:11'),(13,'DHX-XA003',0.00,NULL,NULL,NULL,NULL,0,5,NULL,'VND',4,1,NULL,'2014-10-30 07:49:13'),(14,'DHX-LA003',0.00,NULL,NULL,NULL,NULL,0,5,NULL,'VND',5,1,NULL,'2014-10-30 03:28:03'),(15,'DHX-004',0.00,NULL,NULL,NULL,NULL,1,6,NULL,'VND',1,1,NULL,'2014-10-30 07:49:14'),(16,'DHX-TR004',0.00,NULL,NULL,NULL,NULL,0,6,NULL,'VND',1,1,NULL,'2014-10-30 03:37:17'),(17,'DHX-DE004',0.00,NULL,NULL,NULL,NULL,0,6,NULL,'VND',2,1,NULL,'2014-10-30 03:37:37'),(18,'DHX-001',0.00,NULL,NULL,NULL,NULL,1,7,NULL,'VND',1,1,NULL,'2014-10-30 07:49:15'),(19,'DHX-DE001',0.00,NULL,NULL,NULL,NULL,0,7,NULL,'VND',1,1,NULL,'2014-10-30 03:42:35'),(20,'DHX-LA001',0.00,NULL,NULL,NULL,NULL,0,7,NULL,'VND',2,1,NULL,'2014-10-30 03:43:22'),(21,'DHX-006',0.00,NULL,NULL,NULL,NULL,1,8,NULL,'VND',1,1,NULL,'2014-10-30 07:49:19'),(22,'DHX-TR006',0.00,NULL,NULL,NULL,NULL,0,8,NULL,'VND',1,1,NULL,'2014-10-30 07:49:17'),(23,'DHX-DE006',0.00,NULL,NULL,NULL,NULL,0,8,NULL,'VND',2,1,NULL,'2014-10-30 07:49:18'),(24,'DHHA-001',0.00,NULL,NULL,NULL,NULL,1,9,NULL,'VND',1,1,NULL,'2014-10-30 07:49:24'),(25,'DHHA-TR001',0.00,NULL,NULL,NULL,NULL,0,9,NULL,'VND',1,1,NULL,'2014-10-30 04:15:10'),(26,'DHHA-DE001',0.00,NULL,NULL,NULL,NULL,0,9,NULL,'VND',2,1,NULL,'2014-10-30 04:16:56'),(27,'DHX-007',0.00,NULL,NULL,NULL,NULL,1,10,NULL,'VND',1,1,NULL,'2014-10-30 07:49:25'),(28,'DHX-TR007',0.00,NULL,NULL,NULL,NULL,0,10,NULL,'VND',1,1,NULL,'2014-10-30 04:29:18'),(29,'DHX-DE007',0.00,NULL,NULL,NULL,NULL,0,10,NULL,'VND',2,1,NULL,'2014-10-30 07:49:26'),(30,'DHX-DO007',0.00,NULL,NULL,NULL,NULL,0,10,NULL,'VND',3,1,NULL,'2014-10-30 04:33:26'),(31,'DHX-XA007',0.00,NULL,NULL,NULL,NULL,0,10,NULL,'VND',4,1,NULL,'2014-10-30 04:34:55'),(32,'DHX-LA007',0.00,NULL,NULL,NULL,NULL,0,10,NULL,'VND',5,1,NULL,'2014-10-30 04:35:40'),(33,'DHX-008',0.00,NULL,NULL,NULL,NULL,1,11,NULL,'VND',1,1,NULL,'2014-10-30 07:49:30'),(34,'DHX-DE008',0.00,NULL,NULL,NULL,NULL,0,11,NULL,'VND',1,1,NULL,'2014-10-30 04:48:22'),(35,'DHX-DO008',0.00,NULL,NULL,NULL,NULL,0,11,NULL,'VND',2,1,NULL,'2014-10-30 04:48:58'),(36,'DHX-LA008',0.00,NULL,NULL,NULL,NULL,0,11,NULL,'VND',3,1,NULL,'2014-10-30 04:49:35'),(37,'DHX-XA008',0.00,NULL,NULL,NULL,NULL,0,11,NULL,'VND',4,1,NULL,'2014-10-30 04:50:51'),(38,'DHX-CA008',0.00,NULL,NULL,NULL,NULL,0,11,NULL,'VND',5,1,NULL,'2014-10-30 04:52:21'),(39,'DHX-009',0.00,NULL,NULL,NULL,NULL,1,12,NULL,'VND',1,1,NULL,'2014-10-30 05:05:08'),(40,'DHX-TR009',0.00,NULL,NULL,NULL,NULL,0,12,NULL,'VND',1,1,NULL,'2014-10-30 07:49:32'),(41,'DHX-DE009',0.00,NULL,NULL,NULL,NULL,0,12,NULL,'VND',2,1,NULL,'2014-10-30 07:49:35'),(42,'DHX-DO009',0.00,NULL,NULL,NULL,NULL,0,12,NULL,'VND',3,1,NULL,'2014-10-30 07:49:36'),(43,'DHOY-001',0.00,NULL,NULL,NULL,NULL,1,13,NULL,'VND',1,1,NULL,'2014-10-30 07:49:38'),(44,'DHYO-TR001',0.00,NULL,NULL,NULL,NULL,0,13,NULL,'VND',1,1,NULL,'2014-10-30 05:28:52'),(45,'DHYO-DE001',0.00,NULL,NULL,NULL,NULL,0,13,NULL,'VND',2,1,NULL,'2014-10-30 05:29:15'),(46,'DHYO-LA001',0.00,NULL,NULL,NULL,NULL,0,13,NULL,'VND',3,1,NULL,'2014-10-30 05:29:39'),(47,'DHKM-001',0.00,NULL,NULL,NULL,NULL,1,14,NULL,'VND',1,1,NULL,'2014-10-30 07:49:46'),(48,'DHKM-DE001',0.00,NULL,NULL,NULL,NULL,0,14,NULL,'VND',1,1,NULL,'2014-10-30 07:23:45'),(49,'DHKM-DO001',0.00,NULL,NULL,NULL,NULL,0,14,NULL,'VND',2,1,NULL,'2014-10-30 07:24:12'),(50,'DHKM-VA001',0.00,NULL,NULL,NULL,NULL,0,14,NULL,'VND',3,1,NULL,'2014-10-30 07:24:57'),(51,' DHJU-001',0.00,NULL,NULL,NULL,NULL,1,15,NULL,'VND',1,1,NULL,'2014-10-30 07:55:07'),(52,'DHJU-TR001',0.00,NULL,NULL,NULL,NULL,0,15,NULL,'VND',1,1,NULL,'2014-10-30 07:45:46'),(53,'DHJU-DE001',0.00,NULL,NULL,NULL,NULL,0,15,NULL,'VND',2,1,NULL,'2014-10-30 07:59:54'),(54,'DHJU-DO001',0.00,NULL,NULL,NULL,NULL,0,15,NULL,'VND',3,1,NULL,'2014-10-30 07:57:48'),(55,'DHJU-DEE001',0.00,NULL,NULL,NULL,NULL,0,15,NULL,'VND',4,1,NULL,'2014-10-30 07:55:07'),(56,'DHDA-001',0.00,NULL,NULL,NULL,NULL,1,16,NULL,'VND',1,1,NULL,'2014-10-30 08:11:35'),(57,'DHDA-TR001',0.00,NULL,NULL,NULL,NULL,0,16,NULL,'VND',1,1,NULL,'2014-10-30 08:10:48'),(58,'DHDA-VA001',0.00,NULL,NULL,NULL,NULL,0,16,NULL,'VND',2,1,NULL,'2014-10-30 08:11:06'),(59,'. DHSK-001',0.00,NULL,NULL,NULL,NULL,1,17,NULL,'VND',1,1,NULL,'2014-10-30 08:37:11'),(60,'DHSK-TR001',0.00,NULL,NULL,NULL,NULL,0,17,NULL,'VND',1,1,NULL,'2014-10-30 08:32:23'),(61,'DHSK-DE001',0.00,NULL,NULL,NULL,NULL,0,17,NULL,'VND',2,1,NULL,'2014-10-30 08:34:00'),(62,'DHSK-LA001',0.00,NULL,NULL,NULL,NULL,0,17,NULL,'VND',3,1,NULL,'2014-10-30 08:34:22'),(63,'DHSK-002',0.00,NULL,NULL,NULL,NULL,1,18,NULL,'VND',1,1,NULL,'2014-10-30 09:10:57'),(64,'DHSK-VA002',0.00,NULL,NULL,NULL,NULL,0,18,NULL,'VND',1,1,NULL,'2014-10-30 09:11:43'),(65,'DHSK-DE002',0.00,NULL,NULL,NULL,NULL,0,18,NULL,'VND',2,1,NULL,'2014-10-30 09:14:19'),(66,'DHSK-LA002',0.00,NULL,NULL,NULL,NULL,0,18,NULL,'VND',3,1,NULL,'2014-10-30 09:11:15'),(67,'DHDO-001',0.00,NULL,NULL,NULL,NULL,1,19,NULL,'VND',1,1,NULL,'2014-10-30 09:49:05'),(68,'DHCA-001',0.00,NULL,NULL,NULL,NULL,1,20,NULL,'VND',1,1,NULL,'2014-10-31 03:00:21'),(69,'DHCA-VA001',0.00,NULL,NULL,NULL,NULL,0,20,NULL,'VND',1,1,NULL,'2014-10-31 03:00:42'),(70,'DHCA-TR001',0.00,NULL,NULL,NULL,NULL,0,20,NULL,'VND',2,1,NULL,'2014-10-31 03:01:23'),(71,'DHCA-DE001',0.00,NULL,NULL,NULL,NULL,0,20,NULL,'VND',3,1,NULL,'2014-10-31 03:01:04'),(72,' DHCO-002',0.00,NULL,NULL,NULL,NULL,1,21,NULL,'VND',1,1,NULL,'2014-10-31 03:19:54'),(73,'DHCO-TR002',0.00,NULL,NULL,NULL,NULL,0,21,NULL,'VND',1,1,NULL,'2014-10-31 03:11:35'),(74,'DHCO-DE002',0.00,NULL,NULL,NULL,NULL,0,21,NULL,'VND',2,1,NULL,'2014-10-31 03:20:26'),(75,' DHAL-001',0.00,NULL,NULL,NULL,NULL,1,22,NULL,'VND',1,1,NULL,'2014-10-31 03:49:13'),(76,'DHAL-DE001',0.00,NULL,NULL,NULL,NULL,0,22,NULL,'VND',1,1,NULL,'2014-10-31 03:44:48'),(77,'DHAL-TR001',0.00,NULL,NULL,NULL,NULL,0,22,NULL,'VND',2,1,NULL,'2014-10-31 03:45:08'),(78,'DHAL-VA001',0.00,NULL,NULL,NULL,NULL,0,22,NULL,'VND',3,1,NULL,'2014-10-31 03:47:16'),(79,'DHLV-001',0.00,NULL,NULL,NULL,NULL,1,23,NULL,'VND',1,1,NULL,'2014-10-31 04:00:56'),(80,' DHLV-001',0.00,NULL,NULL,NULL,NULL,0,23,NULL,'VND',1,1,NULL,'2014-10-31 03:59:51'),(81,'DHX-010',0.00,NULL,NULL,NULL,NULL,1,24,NULL,'VND',1,1,NULL,'2014-10-31 04:43:50'),(82,'DHX-TR010',0.00,NULL,NULL,NULL,NULL,0,24,NULL,'VND',1,1,NULL,'2014-10-31 04:42:28'),(83,'DHX-DE010',0.00,NULL,NULL,NULL,NULL,0,24,NULL,'VND',2,1,NULL,'2014-10-31 04:42:43'),(84,'DHX-DO010',0.00,NULL,NULL,NULL,NULL,0,24,NULL,'VND',3,1,NULL,'2014-10-31 04:42:59'),(85,'DHWO-001',0.00,NULL,NULL,NULL,NULL,1,25,NULL,'VND',1,1,NULL,'2014-10-31 05:02:20'),(86,'DHWO-TR001',0.00,NULL,NULL,NULL,NULL,0,25,NULL,'VND',1,1,NULL,'2014-10-31 05:00:03'),(87,'DHWO-DE001',0.00,NULL,NULL,NULL,NULL,0,25,NULL,'VND',2,1,NULL,'2014-10-31 05:00:26'),(88,'DHWO-DO001',0.00,NULL,NULL,NULL,NULL,0,25,NULL,'VND',3,1,NULL,'2014-10-31 05:00:59'),(89,'DHSK-003',0.00,NULL,NULL,NULL,NULL,1,26,NULL,'VND',1,1,NULL,'2014-10-31 11:58:03'),(90,'DHSK-TR003',0.00,NULL,NULL,NULL,NULL,0,26,NULL,'VND',1,1,NULL,'2014-10-31 05:23:35'),(91,'DHSK-DO003',0.00,NULL,NULL,NULL,NULL,0,26,NULL,'VND',2,1,NULL,'2014-10-31 05:24:38'),(92,'DHSK-DE003',0.00,NULL,NULL,NULL,NULL,0,26,NULL,'VND',3,1,NULL,'2014-10-31 05:24:54'),(93,'DHSK-LA003',0.00,NULL,NULL,NULL,NULL,0,26,NULL,'VND',4,1,NULL,'2014-10-31 05:25:12'),(94,'DHDO-002',0.00,NULL,NULL,NULL,NULL,1,27,NULL,'VND',1,1,NULL,'2014-10-31 05:53:24'),(95,'DHDO-TR002',0.00,NULL,NULL,NULL,NULL,0,27,NULL,'VND',1,1,NULL,'2014-10-31 05:51:00'),(96,'DHDO-DE002',0.00,NULL,NULL,NULL,NULL,0,27,NULL,'VND',2,1,NULL,'2014-10-31 05:51:35'),(97,'DHDO-003',0.00,NULL,NULL,NULL,NULL,1,28,NULL,'VND',1,1,NULL,'2014-10-31 06:18:56'),(98,'DHDO-TR003',0.00,NULL,NULL,NULL,NULL,0,28,NULL,'VND',1,1,NULL,'2014-10-31 06:17:20'),(99,'DHDO-DE003',0.00,NULL,NULL,NULL,NULL,0,28,NULL,'VND',2,1,NULL,'2014-10-31 06:17:35'),(100,'DHOM-002',0.00,NULL,NULL,NULL,NULL,1,30,NULL,'VND',1,1,NULL,'2014-10-31 07:32:42'),(101,'DHOM-TR002',0.00,NULL,NULL,NULL,NULL,0,30,NULL,'VND',1,1,NULL,'2014-10-31 07:29:35'),(102,'DHOM-DE002',0.00,NULL,NULL,NULL,NULL,0,30,NULL,'VND',2,1,NULL,'2014-10-31 07:29:56'),(103,'DHGU-001',0.00,NULL,NULL,NULL,NULL,1,32,NULL,'VND',1,1,NULL,'2014-10-31 08:02:03'),(104,'DHGU-TR001',0.00,NULL,NULL,NULL,NULL,0,32,NULL,'VND',1,1,NULL,'2014-10-31 07:57:03'),(105,'DHGU-DE001',0.00,NULL,NULL,NULL,NULL,0,32,NULL,'VND',2,1,NULL,'2014-10-31 07:57:25'),(106,'DHGU-DO001',0.00,NULL,NULL,NULL,NULL,0,32,NULL,'VND',3,1,NULL,'2014-10-31 07:58:26'),(107,'DHLE-001',0.00,NULL,NULL,NULL,NULL,1,33,NULL,'VND',1,1,NULL,'2014-10-31 08:48:43'),(108,'DHLE-TR001',0.00,NULL,NULL,NULL,NULL,0,33,NULL,'VND',1,1,NULL,'2014-10-31 08:38:32'),(109,'DHLE-DE001',0.00,NULL,NULL,NULL,NULL,0,33,NULL,'VND',2,1,NULL,'2014-10-31 08:38:48'),(110,'DHLE-002',0.00,NULL,NULL,NULL,NULL,1,34,NULL,'VND',1,1,NULL,'2014-10-31 09:04:48'),(111,'DHLE-TR002',0.00,NULL,NULL,NULL,NULL,0,34,NULL,'VND',1,1,NULL,'2014-10-31 09:03:30'),(112,'DHLE-DE002',0.00,NULL,NULL,NULL,NULL,0,34,NULL,'VND',2,1,NULL,'2014-10-31 09:03:47'),(113,'DHLE-003',0.00,NULL,NULL,NULL,NULL,1,35,NULL,'VND',1,1,NULL,'2014-10-31 09:20:30'),(114,'DHLE-TR003',0.00,NULL,NULL,NULL,NULL,0,35,NULL,'VND',1,1,NULL,'2014-10-31 09:18:54'),(115,'DHLE-DE003',0.00,NULL,NULL,NULL,NULL,0,35,NULL,'VND',2,1,NULL,'2014-10-31 09:19:09'),(116,'DHSK-004',0.00,NULL,NULL,NULL,NULL,1,36,NULL,'VND',1,1,NULL,'2014-10-31 09:39:48'),(117,'DHSK-DE004',0.00,NULL,NULL,NULL,NULL,0,36,NULL,'VND',1,1,NULL,'2014-10-31 09:38:27'),(118,'DHTI-001',0.00,NULL,NULL,NULL,NULL,1,37,NULL,'VND',1,1,NULL,'2014-10-31 10:14:31'),(119,'DHTI-DE001',0.00,NULL,NULL,NULL,NULL,0,37,NULL,'VND',1,1,NULL,'2014-10-31 10:13:07'),(120,'DHDO-004',0.00,NULL,NULL,NULL,NULL,1,38,NULL,'VND',1,1,NULL,'2014-10-31 10:31:42'),(121,'DHDO-TR004',0.00,NULL,NULL,NULL,NULL,0,38,NULL,'VND',1,1,NULL,'2014-10-31 10:30:35'),(122,'DHDO-DE004',0.00,NULL,NULL,NULL,NULL,0,38,NULL,'VND',2,1,NULL,'2014-10-31 10:31:00'),(123,'DHX-011',0.00,NULL,NULL,NULL,NULL,1,39,NULL,'VND',1,1,NULL,'2014-10-31 10:41:53'),(124,'DHX-DE011',0.00,NULL,NULL,NULL,NULL,0,39,NULL,'VND',1,1,NULL,'2014-10-31 10:40:02'),(125,'DHX-DO011',0.00,NULL,NULL,NULL,NULL,0,39,NULL,'VND',2,1,NULL,'2014-10-31 10:40:27'),(126,'DHX-VA011',0.00,NULL,NULL,NULL,NULL,0,39,NULL,'VND',3,1,NULL,'2014-10-31 10:40:53'),(127,'DHX-LA011',0.00,NULL,NULL,NULL,NULL,0,39,NULL,'VND',4,1,NULL,'2014-10-31 10:41:11'),(128,'DHX-012',0.00,NULL,NULL,NULL,NULL,1,41,NULL,'VND',1,1,NULL,'2014-10-31 11:26:56'),(129,'DHX-TR012',0.00,NULL,NULL,NULL,NULL,0,41,NULL,'VND',1,1,NULL,'2014-10-31 11:25:44'),(130,'DHX-DE012',0.00,NULL,NULL,NULL,NULL,0,41,NULL,'VND',2,1,NULL,'2014-10-31 11:26:04'),(131,'DHJU-002',0.00,NULL,NULL,NULL,NULL,1,42,NULL,'VND',1,1,NULL,'2014-11-01 02:25:54'),(132,'DHJU-TR002',0.00,NULL,NULL,NULL,NULL,0,42,NULL,'VND',1,1,NULL,'2014-11-01 02:24:35'),(133,'DHJU-DE002',0.00,NULL,NULL,NULL,NULL,0,42,NULL,'VND',2,1,NULL,'2014-11-01 02:24:48'),(134,'DHKO-001',0.00,NULL,NULL,NULL,NULL,1,43,NULL,'VND',1,1,NULL,'2014-11-01 03:12:34'),(135,'DHKO-TR001',0.00,NULL,NULL,NULL,NULL,0,43,NULL,'VND',1,1,NULL,'2014-11-01 03:09:43'),(136,'DHKO-DE001',0.00,NULL,NULL,NULL,NULL,0,43,NULL,'VND',2,1,NULL,'2014-11-01 03:10:00'),(137,'DHMO-001',0.00,NULL,NULL,NULL,NULL,1,44,NULL,'VND',1,1,NULL,'2014-11-01 03:50:26'),(138,'DHMO-TR001',0.00,NULL,NULL,NULL,NULL,0,44,NULL,'VND',1,1,NULL,'2014-11-01 03:30:25');
/*!40000 ALTER TABLE `spree_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_zone_members`
--

DROP TABLE IF EXISTS `spree_zone_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_zone_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoneable_id` int(11) DEFAULT NULL,
  `zoneable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_zone_members_on_zone_id` (`zone_id`),
  KEY `index_spree_zone_members_on_zoneable_id_and_zoneable_type` (`zoneable_id`,`zoneable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_zone_members`
--

LOCK TABLES `spree_zone_members` WRITE;
/*!40000 ALTER TABLE `spree_zone_members` DISABLE KEYS */;
INSERT INTO `spree_zone_members` VALUES (1,72,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(2,10,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(3,76,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(4,94,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(5,155,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(6,13,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(7,164,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(8,217,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(9,167,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(10,20,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(11,111,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(12,175,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(13,24,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(14,29,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(15,98,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(16,180,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(17,182,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(18,44,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(19,206,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(20,46,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(21,211,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(22,135,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(23,56,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(24,207,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(25,210,'Spree::Country',1,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(26,49,'Spree::Country',2,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(27,204,'Spree::Country',2,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(29,84,'Spree::Country',3,'2014-10-26 12:43:42','2014-10-26 12:43:42');
/*!40000 ALTER TABLE `spree_zone_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spree_zones`
--

DROP TABLE IF EXISTS `spree_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spree_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_tax` tinyint(1) DEFAULT '0',
  `zone_members_count` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_spree_zones_on_default_tax` (`default_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spree_zones`
--

LOCK TABLES `spree_zones` WRITE;
/*!40000 ALTER TABLE `spree_zones` DISABLE KEYS */;
INSERT INTO `spree_zones` VALUES (1,'EU_VAT','Countries that make up the EU VAT zone.',0,25,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(2,'North America','USA + Canada',0,2,'2014-10-26 05:51:35','2014-10-26 05:51:35'),(3,'VN','',1,1,'2014-10-26 12:43:34','2014-10-26 12:43:42');
/*!40000 ALTER TABLE `spree_zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-01 10:55:32
