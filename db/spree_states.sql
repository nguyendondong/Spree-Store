-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: 128.199.223.29    Database: donghox
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19  9:50:42
