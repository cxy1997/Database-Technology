-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog` (
  `Goods_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clothes` varchar(45) DEFAULT NULL,
  `food` varchar(45) DEFAULT NULL,
  `entertainments` varchar(45) DEFAULT NULL,
  `luxary` varchar(45) DEFAULT NULL,
  `commodity_name` varchar(45) NOT NULL,
  `production_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `price` int(10) unsigned NOT NULL,
  `discount` float NOT NULL DEFAULT '1',
  `stock` int(10) unsigned NOT NULL DEFAULT '1',
  `supplier_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Goods_id`),
  KEY `Supplier_id_idx` (`supplier_id`),
  CONSTRAINT `Supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`Supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (0,'1_clothes_1',NULL,NULL,NULL,'1_clothes_1',NULL,NULL,431,0.950511,161,0),(1,'1_clothes_2',NULL,NULL,NULL,'1_clothes_2',NULL,NULL,854,0.99585,473,0),(2,'1_clothes_3',NULL,NULL,NULL,'1_clothes_3',NULL,NULL,206,0.804163,441,0),(3,'1_clothes_4',NULL,NULL,NULL,'1_clothes_4',NULL,NULL,872,0.745109,259,0),(4,NULL,'2_food_1',NULL,NULL,'2_food_1',NULL,NULL,688,0.987677,848,1),(5,NULL,'2_food_2',NULL,NULL,'2_food_2',NULL,NULL,353,0.9747,758,1),(6,NULL,'2_food_3',NULL,NULL,'2_food_3',NULL,NULL,920,0.80873,169,1),(7,NULL,'2_food_4',NULL,NULL,'2_food_4',NULL,NULL,370,0.781509,510,1),(8,NULL,'3_food_1',NULL,NULL,'3_food_1',NULL,NULL,955,0.808026,955,2),(9,NULL,'3_food_2',NULL,NULL,'3_food_2',NULL,NULL,703,0.85083,551,2),(10,NULL,'3_food_3',NULL,NULL,'3_food_3',NULL,NULL,100,0.849723,543,2),(11,NULL,'3_food_4',NULL,NULL,'3_food_4',NULL,NULL,969,0.805396,873,2),(12,'4_clothes_1',NULL,NULL,NULL,'4_clothes_1',NULL,NULL,667,0.828264,321,3),(13,'4_clothes_2',NULL,NULL,NULL,'4_clothes_2',NULL,NULL,954,0.702419,272,3),(14,'4_clothes_3',NULL,NULL,NULL,'4_clothes_3',NULL,NULL,941,0.730396,730,3),(15,'4_clothes_4',NULL,NULL,NULL,'4_clothes_4',NULL,NULL,278,0.966375,861,3),(16,NULL,NULL,'5_entertainments_1',NULL,'5_entertainments_1',NULL,NULL,367,0.935987,136,4),(17,NULL,NULL,'5_entertainments_2',NULL,'5_entertainments_2',NULL,NULL,856,0.724746,901,4),(18,NULL,NULL,'5_entertainments_3',NULL,'5_entertainments_3',NULL,NULL,285,0.808033,262,4),(19,NULL,NULL,'5_entertainments_4',NULL,'5_entertainments_4',NULL,NULL,842,0.874519,490,4),(20,NULL,'6_food_1',NULL,NULL,'6_food_1',NULL,NULL,833,0.942149,630,5),(21,NULL,'6_food_2',NULL,NULL,'6_food_2',NULL,NULL,573,0.958959,763,5),(22,NULL,'6_food_3',NULL,NULL,'6_food_3',NULL,NULL,185,0.778703,125,5),(23,NULL,'6_food_4',NULL,NULL,'6_food_4',NULL,NULL,417,0.904374,412,5),(24,NULL,NULL,'7_entertainments_1',NULL,'7_entertainments_1',NULL,NULL,474,0.702291,809,6),(25,NULL,NULL,'7_entertainments_2',NULL,'7_entertainments_2',NULL,NULL,929,0.772141,494,6),(26,NULL,NULL,'7_entertainments_3',NULL,'7_entertainments_3',NULL,NULL,522,0.709438,774,6),(27,NULL,NULL,'7_entertainments_4',NULL,'7_entertainments_4',NULL,NULL,689,0.707198,240,6),(28,NULL,NULL,'8_entertainments_1',NULL,'8_entertainments_1',NULL,NULL,163,0.768416,936,7),(29,NULL,NULL,'8_entertainments_2',NULL,'8_entertainments_2',NULL,NULL,968,0.710396,350,7),(30,NULL,NULL,'8_entertainments_3',NULL,'8_entertainments_3',NULL,NULL,361,0.884481,283,7),(31,NULL,NULL,'8_entertainments_4',NULL,'8_entertainments_4',NULL,NULL,256,0.777812,796,7),(32,'9_clothes_1',NULL,NULL,NULL,'9_clothes_1',NULL,NULL,231,0.835148,831,8),(33,'9_clothes_2',NULL,NULL,NULL,'9_clothes_2',NULL,NULL,742,0.739105,558,8),(34,'9_clothes_3',NULL,NULL,NULL,'9_clothes_3',NULL,NULL,243,0.77939,861,8),(35,'9_clothes_4',NULL,NULL,NULL,'9_clothes_4',NULL,NULL,494,0.895354,947,8),(36,NULL,NULL,NULL,'10_luxary_1','10_luxary_1',NULL,NULL,954,0.844692,607,9),(37,NULL,NULL,NULL,'10_luxary_2','10_luxary_2',NULL,NULL,432,0.747703,717,9),(38,NULL,NULL,NULL,'10_luxary_3','10_luxary_3',NULL,NULL,955,0.909595,675,9),(39,NULL,NULL,NULL,'10_luxary_4','10_luxary_4',NULL,NULL,193,0.87963,714,9);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER INSERT_GOODS BEFORE INSERT ON Catalog FOR EACH ROW
BEGIN 
  IF (NEW.price > 0 AND 0 <= NEW.discount AND NEW.discount <= 1 AND (NEW.clothes IS NOT NULL OR NEW.food IS NOT NULL OR NEW.entertainments IS NOT NULL OR NEW.luxary IS NOT NULL)) THEN
    SELECT goods_cnt INTO @cnt FROM Variables;
    SET NEW.Goods_id = @cnt;
    UPDATE Variables SET goods_cnt = goods_cnt + 1;
  ELSE
    SET NEW.Goods_id = NULL;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `order_group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(200) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_group_id`),
  UNIQUE KEY `Comment_id_UNIQUE` (`order_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UPDATE_COMMENT BEFORE UPDATE ON Comments FOR EACH ROW
BEGIN 
  IF (NEW.rating IS NULL) THEN
    SET NEW.order_group_id = NULL;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credits` (
  `credit` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`credit`),
  UNIQUE KEY `credit_UNIQUE` (`credit`),
  KEY `rank` (`rank`),
  CONSTRAINT `rank` FOREIGN KEY (`rank`) REFERENCES `ranks` (`rank`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credits`
--

LOCK TABLES `credits` WRITE;
/*!40000 ALTER TABLE `credits` DISABLE KEYS */;
INSERT INTO `credits` VALUES (-1,0),(0,1),(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,2),(102,2),(103,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2),(120,2),(121,2),(122,2),(123,2),(124,2),(125,2),(126,2),(127,2),(128,2),(129,2),(130,2),(131,2),(132,2),(133,2),(134,2),(135,2),(136,2),(137,2),(138,2),(139,2),(140,2),(141,2),(142,2),(143,2),(144,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(157,2),(158,2),(159,2),(160,2),(161,2),(162,2),(163,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(179,2),(180,2),(181,2),(182,2),(183,2),(184,2),(185,2),(186,2),(187,2),(188,2),(189,2),(190,2),(191,2),(192,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(219,2),(220,2),(221,2),(222,2),(223,2),(224,2),(225,2),(226,2),(227,2),(228,2),(229,2),(230,2),(231,2),(232,2),(233,2),(234,2),(235,2),(236,2),(237,2),(238,2),(239,2),(240,2),(241,2),(242,2),(243,2),(244,2),(245,2),(246,2),(247,2),(248,2),(249,2),(250,2),(251,2),(252,2),(253,2),(254,2),(255,2),(256,2),(257,2),(258,2),(259,2),(260,2),(261,2),(262,2),(263,2),(264,2),(265,2),(266,2),(267,2),(268,2),(269,2),(270,2),(271,2),(272,2),(273,2),(274,2),(275,2),(276,2),(277,2),(278,2),(279,2),(280,2),(281,2),(282,2),(283,2),(284,2),(285,2),(286,2),(287,2),(288,2),(289,2),(290,2),(291,2),(292,2),(293,2),(294,2),(295,2),(296,2),(297,2),(298,2),(299,2),(300,2),(301,2),(302,2),(303,2),(304,2),(305,2),(306,2),(307,2),(308,2),(309,2),(310,2),(311,2),(312,2),(313,2),(314,2),(315,2),(316,2),(317,2),(318,2),(319,2),(320,2),(321,2),(322,2),(323,2),(324,2),(325,2),(326,2),(327,2),(328,2),(329,2),(330,2),(331,2),(332,2),(333,2),(334,2),(335,2),(336,2),(337,2),(338,2),(339,2),(340,2),(341,2),(342,2),(343,2),(344,2),(345,2),(346,2),(347,2),(348,2),(349,2),(350,2),(351,2),(352,2),(353,2),(354,2),(355,2),(356,2),(357,2),(358,2),(359,2),(360,2),(361,2),(362,2),(363,2),(364,2),(365,2),(366,2),(367,2),(368,2),(369,2),(370,2),(371,2),(372,2),(373,2),(374,2),(375,2),(376,2),(377,2),(378,2),(379,2),(380,2),(381,2),(382,2),(383,2),(384,2),(385,2),(386,2),(387,2),(388,2),(389,2),(390,2),(391,2),(392,2),(393,2),(394,2),(395,2),(396,2),(397,2),(398,2),(399,2),(400,2),(401,2),(402,2),(403,2),(404,2),(405,2),(406,2),(407,2),(408,2),(409,2),(410,2),(411,2),(412,2),(413,2),(414,2),(415,2),(416,2),(417,2),(418,2),(419,2),(420,2),(421,2),(422,2),(423,2),(424,2),(425,2),(426,2),(427,2),(428,2),(429,2),(430,2),(431,2),(432,2),(433,2),(434,2),(435,2),(436,2),(437,2),(438,2),(439,2),(440,2),(441,2),(442,2),(443,2),(444,2),(445,2),(446,2),(447,2),(448,2),(449,2),(450,2),(451,2),(452,2),(453,2),(454,2),(455,2),(456,2),(457,2),(458,2),(459,2),(460,2),(461,2),(462,2),(463,2),(464,2),(465,2),(466,2),(467,2),(468,2),(469,2),(470,2),(471,2),(472,2),(473,2),(474,2),(475,2),(476,2),(477,2),(478,2),(479,2),(480,2),(481,2),(482,2),(483,2),(484,2),(485,2),(486,2),(487,2),(488,2),(489,2),(490,2),(491,2),(492,2),(493,2),(494,2),(495,2),(496,2),(497,2),(498,2),(499,2),(500,2),(501,3),(502,3),(503,3),(504,3),(505,3),(506,3),(507,3),(508,3),(509,3),(510,3),(511,3),(512,3),(513,3),(514,3),(515,3),(516,3),(517,3),(518,3),(519,3),(520,3),(521,3),(522,3),(523,3),(524,3),(525,3),(526,3),(527,3),(528,3),(529,3),(530,3),(531,3),(532,3),(533,3),(534,3),(535,3),(536,3),(537,3),(538,3),(539,3),(540,3),(541,3),(542,3),(543,3),(544,3),(545,3),(546,3),(547,3),(548,3),(549,3),(550,3),(551,3),(552,3),(553,3),(554,3),(555,3),(556,3),(557,3),(558,3),(559,3),(560,3),(561,3),(562,3),(563,3),(564,3),(565,3),(566,3),(567,3),(568,3),(569,3),(570,3),(571,3),(572,3),(573,3),(574,3),(575,3),(576,3),(577,3),(578,3),(579,3),(580,3),(581,3),(582,3),(583,3),(584,3),(585,3),(586,3),(587,3),(588,3),(589,3),(590,3),(591,3),(592,3),(593,3),(594,3),(595,3),(596,3),(597,3),(598,3),(599,3),(600,3),(601,3),(602,3),(603,3),(604,3),(605,3),(606,3),(607,3),(608,3),(609,3),(610,3),(611,3),(612,3),(613,3),(614,3),(615,3),(616,3),(617,3),(618,3),(619,3),(620,3),(621,3),(622,3),(623,3),(624,3),(625,3),(626,3),(627,3),(628,3),(629,3),(630,3),(631,3),(632,3),(633,3),(634,3),(635,3),(636,3),(637,3),(638,3),(639,3),(640,3),(641,3),(642,3),(643,3),(644,3),(645,3),(646,3),(647,3),(648,3),(649,3),(650,3),(651,3),(652,3),(653,3),(654,3),(655,3),(656,3),(657,3),(658,3),(659,3),(660,3),(661,3),(662,3),(663,3),(664,3),(665,3),(666,3),(667,3),(668,3),(669,3),(670,3),(671,3),(672,3),(673,3),(674,3),(675,3),(676,3),(677,3),(678,3),(679,3),(680,3),(681,3),(682,3),(683,3),(684,3),(685,3),(686,3),(687,3),(688,3),(689,3),(690,3),(691,3),(692,3),(693,3),(694,3),(695,3),(696,3),(697,3),(698,3),(699,3),(700,3),(701,3),(702,3),(703,3),(704,3),(705,3),(706,3),(707,3),(708,3),(709,3),(710,3),(711,3),(712,3),(713,3),(714,3),(715,3),(716,3),(717,3),(718,3),(719,3),(720,3),(721,3),(722,3),(723,3),(724,3),(725,3),(726,3),(727,3),(728,3),(729,3),(730,3),(731,3),(732,3),(733,3),(734,3),(735,3),(736,3),(737,3),(738,3),(739,3),(740,3),(741,3),(742,3),(743,3),(744,3),(745,3),(746,3),(747,3),(748,3),(749,3),(750,3),(751,3),(752,3),(753,3),(754,3),(755,3),(756,3),(757,3),(758,3),(759,3),(760,3),(761,3),(762,3),(763,3),(764,3),(765,3),(766,3),(767,3),(768,3),(769,3),(770,3),(771,3),(772,3),(773,3),(774,3),(775,3),(776,3),(777,3),(778,3),(779,3),(780,3),(781,3),(782,3),(783,3),(784,3),(785,3),(786,3),(787,3),(788,3),(789,3),(790,3),(791,3),(792,3),(793,3),(794,3),(795,3),(796,3),(797,3),(798,3),(799,3),(800,3),(801,3),(802,3),(803,3),(804,3),(805,3),(806,3),(807,3),(808,3),(809,3),(810,3),(811,3),(812,3),(813,3),(814,3),(815,3),(816,3),(817,3),(818,3),(819,3),(820,3),(821,3),(822,3),(823,3),(824,3),(825,3),(826,3),(827,3),(828,3),(829,3),(830,3),(831,3),(832,3),(833,3),(834,3),(835,3),(836,3),(837,3),(838,3),(839,3),(840,3),(841,3),(842,3),(843,3),(844,3),(845,3),(846,3),(847,3),(848,3),(849,3),(850,3),(851,3),(852,3),(853,3),(854,3),(855,3),(856,3),(857,3),(858,3),(859,3),(860,3),(861,3),(862,3),(863,3),(864,3),(865,3),(866,3),(867,3),(868,3),(869,3),(870,3),(871,3),(872,3),(873,3),(874,3),(875,3),(876,3),(877,3),(878,3),(879,3),(880,3),(881,3),(882,3),(883,3),(884,3),(885,3),(886,3),(887,3),(888,3),(889,3),(890,3),(891,3),(892,3),(893,3),(894,3),(895,3),(896,3),(897,3),(898,3),(899,3),(900,3),(901,3),(902,3),(903,3),(904,3),(905,3),(906,3),(907,3),(908,3),(909,3),(910,3),(911,3),(912,3),(913,3),(914,3),(915,3),(916,3),(917,3),(918,3),(919,3),(920,3),(921,3),(922,3),(923,3),(924,3),(925,3),(926,3),(927,3),(928,3),(929,3),(930,3),(931,3),(932,3),(933,3),(934,3),(935,3),(936,3),(937,3),(938,3),(939,3),(940,3),(941,3),(942,3),(943,3),(944,3),(945,3),(946,3),(947,3),(948,3),(949,3),(950,3),(951,3),(952,3),(953,3),(954,3),(955,3),(956,3),(957,3),(958,3),(959,3),(960,3),(961,3),(962,3),(963,3),(964,3),(965,3),(966,3),(967,3),(968,3),(969,3),(970,3),(971,3),(972,3),(973,3),(974,3),(975,3),(976,3),(977,3),(978,3),(979,3),(980,3),(981,3),(982,3),(983,3),(984,3),(985,3),(986,3),(987,3),(988,3),(989,3),(990,3),(991,3),(992,3),(993,3),(994,3),(995,3),(996,3),(997,3),(998,3),(999,3),(1000,3);
/*!40000 ALTER TABLE `credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_contents`
--

DROP TABLE IF EXISTS `order_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_contents` (
  `Order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `Goods_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Order_id`),
  UNIQUE KEY `Order_id_UNIQUE` (`Order_id`),
  KEY `Goods_id` (`Goods_id`),
  CONSTRAINT `Goods_id` FOREIGN KEY (`Goods_id`) REFERENCES `catalog` (`Goods_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_contents`
--

LOCK TABLES `order_contents` WRITE;
/*!40000 ALTER TABLE `order_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_contents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER INSERT_ORDER_CONTENTS BEFORE INSERT ON Order_contents FOR EACH ROW
BEGIN 
  SELECT stock INTO @remains FROM Catalog WHERE Goods_id = NEW.Goods_id;
  IF (NEW.quantity > 0 AND NEW.quantity <= @remains) THEN
    SELECT order_cnt INTO @cnt FROM Variables;
    SET NEW.Order_id = @cnt;
  ELSE
    SET NEW.Order_id = NULL;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Order_id` int(10) unsigned NOT NULL DEFAULT '0',
  `User_id` varchar(16) NOT NULL,
  `post_code` varchar(6) NOT NULL,
  `address` varchar(45) NOT NULL,
  `status` enum('未处理','已备货','已发货','已完成','已退货') NOT NULL DEFAULT '未处理',
  `reject_reason` varchar(200) DEFAULT NULL,
  `credits` int(10) unsigned DEFAULT NULL,
  `cost` float unsigned DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `order_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Order_id`),
  UNIQUE KEY `Order_id_UNIQUE` (`Order_id`),
  KEY `User_id` (`User_id`),
  KEY `order_group_id` (`order_group_id`),
  CONSTRAINT `Order_id` FOREIGN KEY (`Order_id`) REFERENCES `order_contents` (`Order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `User_id` FOREIGN KEY (`User_id`) REFERENCES `userlist` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_group_id` FOREIGN KEY (`order_group_id`) REFERENCES `comments` (`order_group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER INSERT_ORDERS BEFORE INSERT ON Orders FOR EACH ROW
BEGIN 
  IF (NEW.credits < 1) THEN
    SET NEW.credits = 1;
  END IF;
  IF (NEW.credits > 5) THEN
    SET NEW.credits = 5;
  END IF;
  IF (NEW.post_code REGEXP '^[0-9]{6}$' AND NEW.status != '已完成' AND NEW.status != '已退货' AND NEW.reject_reason IS NULL AND NEW.delivery_date IS NULL AND NEW.order_group_id IS NULL) THEN
    SELECT order_cnt INTO @cnt FROM Variables;
    SET NEW.Order_id = @cnt;
    UPDATE Variables SET order_cnt = order_cnt + 1;
    SET NEW.order_date = NOW();
    SELECT order_group_cnt INTO @cnt FROM Variables;
    SET NEW.order_group_id = @cnt;
    SELECT COUNT(*) INTO @group_check FROM Comments WHERE order_group_id = NEW.order_group_id;
    IF (@group_check = 0) THEN
    	INSERT INTO Comments(order_group_id) VALUES(@cnt);
    END IF;
    SELECT price, discount, stock INTO @unit_price, @gamma_1, @num FROM Catalog WHERE Goods_id IN (SELECT Goods_id FROM Order_contents WHERE Order_id = NEW.Order_id);
    SELECT extra_discount INTO @gamma_2 FROM ranks WHERE rank IN (SELECT rank FROM credits WHERE credit IN (SELECT credit FROM UserList WHERE User_id = NEW.User_id));
    SET NEW.cost = @unit_price * @num * @gamma_1 * @gamma_2;
    UPDATE Catalog SET stock = stock - @num WHERE Goods_id IN (SELECT Goods_id FROM Order_contents WHERE Order_id = NEW.Order_id);
  ELSE
    SET NEW.Order_id = NULL;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UPDATE_ORDERS BEFORE UPDATE ON Orders FOR EACH ROW
BEGIN 
  IF (((NEW.status = '已完成' AND NEW.delivery_date IS NULL) OR (NEW.status = '已退货' AND NEW.reject_reason IS NULL)) OR (OLD.status = '已完成' OR OLD.status = '已退货')) THEN
    SET NEW.Order_id = NULL;
  END IF;
  IF (NEW.status = '已完成' AND NEW.delivery_date IS NOT NULL) THEN
    UPDATE UserList SET credit = credit + NEW.credits WHERE User_id = NEW.User_id;
  ELSEIF (NEW.status = '已退货' AND NEW.reject_reason IS NOT NULL) THEN
    SELECT Goods_id, quantity INTO @GID, @num FROM Order_contents WHERE Goods_id IN (SELECT Goods_id FROM Order_contents WHERE Order_id = NEW.Order_id);
    UPDATE Catalog SET stock = stock + @num WHERE Goods_id = @GID;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `rank` int(11) NOT NULL,
  `extra_discount` float NOT NULL,
  PRIMARY KEY (`rank`),
  UNIQUE KEY `rank_UNIQUE` (`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (0,1),(1,0.9),(2,0.8),(3,0.7);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `Supplier_id` int(10) unsigned NOT NULL,
  `supplier_name` varchar(45) NOT NULL,
  PRIMARY KEY (`Supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (0,'supplier_1'),(1,'supplier_2'),(2,'supplier_3'),(3,'supplier_4'),(4,'supplier_5'),(5,'supplier_6'),(6,'supplier_7'),(7,'supplier_8'),(8,'supplier_9'),(9,'supplier_10');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER INSERT_SUPPLIER BEFORE INSERT ON Suppliers FOR EACH ROW
BEGIN 
  SELECT supplier_cnt INTO @cnt FROM Variables;
  SET NEW.Supplier_id = @cnt;
    UPDATE Variables SET supplier_cnt = supplier_cnt + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userlist`
--

DROP TABLE IF EXISTS `userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlist` (
  `User_id` varchar(16) NOT NULL DEFAULT '0000',
  `password` varchar(16) NOT NULL DEFAULT '1234',
  `user_name` varchar(45) NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `tel` varchar(8) DEFAULT NULL,
  `credit` int(11) DEFAULT '-1',
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `User_id_UNIQUE` (`User_id`),
  KEY `credit` (`credit`),
  CONSTRAINT `credit` FOREIGN KEY (`credit`) REFERENCES `credits` (`credit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlist`
--

LOCK TABLES `userlist` WRITE;
/*!40000 ALTER TABLE `userlist` DISABLE KEYS */;
INSERT INTO `userlist` VALUES ('0','0','user_1',NULL,4,NULL,-1),('1','1','user_2',NULL,46,NULL,674),('10','10','user_11',NULL,6,NULL,-1),('11','11','user_12',NULL,67,NULL,13),('12','12','user_13',NULL,16,NULL,274),('13','13','user_14',NULL,15,NULL,-1),('14','14','user_15',NULL,49,NULL,452),('15','15','user_16',NULL,72,NULL,682),('16','16','user_17',NULL,46,NULL,898),('17','17','user_18',NULL,52,NULL,932),('18','18','user_19',NULL,13,NULL,-1),('19','19','user_20',NULL,14,NULL,652),('2','2','user_3',NULL,45,NULL,-1),('20','20','user_21',NULL,60,NULL,-1),('21','21','user_22',NULL,48,NULL,324),('22','22','user_23',NULL,43,NULL,917),('23','23','user_24',NULL,57,NULL,513),('24','24','user_25',NULL,50,NULL,-1),('25','25','user_26',NULL,26,NULL,-1),('26','26','user_27',NULL,36,NULL,154),('27','27','user_28',NULL,53,NULL,-1),('28','28','user_29',NULL,42,NULL,600),('29','29','user_30',NULL,77,NULL,-1),('3','3','user_4',NULL,36,NULL,449),('30','30','user_31',NULL,41,NULL,-1),('31','31','user_32',NULL,80,NULL,-1),('32','32','user_33',NULL,27,NULL,927),('33','33','user_34',NULL,36,NULL,583),('34','34','user_35',NULL,41,NULL,739),('35','35','user_36',NULL,41,NULL,803),('36','36','user_37',NULL,1,NULL,601),('37','37','user_38',NULL,41,NULL,203),('38','38','user_39',NULL,48,NULL,446),('39','39','user_40',NULL,68,NULL,658),('4','4','user_5',NULL,40,NULL,-1),('40','40','user_41',NULL,57,NULL,497),('41','41','user_42',NULL,56,NULL,-1),('42','42','user_43',NULL,78,NULL,425),('43','43','user_44',NULL,6,NULL,389),('44','44','user_45',NULL,58,NULL,-1),('45','45','user_46',NULL,79,NULL,452),('46','46','user_47',NULL,9,NULL,414),('47','47','user_48',NULL,15,NULL,-1),('48','48','user_49',NULL,40,NULL,412),('49','49','user_50',NULL,55,NULL,-1),('5','5','user_6',NULL,35,NULL,-1),('50','50','user_51',NULL,40,NULL,-1),('51','51','user_52',NULL,18,NULL,-1),('52','52','user_53',NULL,57,NULL,-1),('53','53','user_54',NULL,31,NULL,-1),('54','54','user_55',NULL,67,NULL,385),('55','55','user_56',NULL,38,NULL,-1),('56','56','user_57',NULL,30,NULL,-1),('57','57','user_58',NULL,67,NULL,376),('58','58','user_59',NULL,35,NULL,-1),('59','59','user_60',NULL,67,NULL,857),('6','6','user_7',NULL,63,NULL,-1),('60','60','user_61',NULL,71,NULL,-1),('61','61','user_62',NULL,17,NULL,-1),('62','62','user_63',NULL,6,NULL,-1),('63','63','user_64',NULL,30,NULL,227),('64','64','user_65',NULL,36,NULL,-1),('65','65','user_66',NULL,3,NULL,-1),('66','66','user_67',NULL,43,NULL,246),('67','67','user_68',NULL,78,NULL,629),('68','68','user_69',NULL,39,NULL,-1),('69','69','user_70',NULL,46,NULL,-1),('7','7','user_8',NULL,2,NULL,949),('70','70','user_71',NULL,37,NULL,868),('71','71','user_72',NULL,47,NULL,-1),('72','72','user_73',NULL,79,NULL,-1),('73','73','user_74',NULL,25,NULL,92),('74','74','user_75',NULL,73,NULL,724),('75','75','user_76',NULL,48,NULL,927),('76','76','user_77',NULL,1,NULL,-1),('77','77','user_78',NULL,67,NULL,739),('78','78','user_79',NULL,55,NULL,64),('79','79','user_80',NULL,31,NULL,565),('8','8','user_9',NULL,19,NULL,-1),('80','80','user_81',NULL,20,NULL,161),('81','81','user_82',NULL,18,NULL,-1),('82','82','user_83',NULL,3,NULL,278),('83','83','user_84',NULL,39,NULL,-1),('84','84','user_85',NULL,69,NULL,515),('85','85','user_86',NULL,74,NULL,991),('86','86','user_87',NULL,59,NULL,194),('87','87','user_88',NULL,57,NULL,765),('88','88','user_89',NULL,71,NULL,804),('89','89','user_90',NULL,28,NULL,394),('9','9','user_10',NULL,22,NULL,387),('90','90','user_91',NULL,48,NULL,249),('91','91','user_92',NULL,18,NULL,-1),('92','92','user_93',NULL,57,NULL,540),('93','93','user_94',NULL,45,NULL,-1),('94','94','user_95',NULL,20,NULL,-1),('95','95','user_96',NULL,39,NULL,878),('96','96','user_97',NULL,2,NULL,188),('97','97','user_98',NULL,9,NULL,-1),('98','98','user_99',NULL,66,NULL,56),('99','99','user_100',NULL,49,NULL,26);
/*!40000 ALTER TABLE `userlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER INSERT_USER BEFORE INSERT ON UserList FOR EACH ROW
BEGIN 
  IF (NEW.age IS NOT NULL) THEN
    IF (NEW.age < 0) THEN
      SET NEW.age = 0;
    END IF;
    IF (NEW.age > 80) THEN
      SET NEW.age = 80;
    END IF;
  END IF;
  IF (NEW.tel IS NOT NULL AND NEW.tel NOT REGEXP '^[0-9]{8}$') THEN
    SET NEW.User_id = NULL;
    SET NEW.password = NULL;
  ELSE
    SELECT user_cnt INTO @cnt FROM Variables;
    SET NEW.User_id = CAST(@cnt AS CHAR(16));
    SET NEW.password = CAST(@cnt AS CHAR(16));
    UPDATE Variables SET user_cnt = user_cnt + 1;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER UPDATE_USERLIST BEFORE UPDATE ON UserList FOR EACH ROW
BEGIN 
  IF (OLD.credit = -1) THEN
    SET NEW.credit = -1;
  ELSEIF (NEW.credit > 1000) THEN
    SET NEW.credit = 1000;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `user_cnt` int(10) unsigned NOT NULL,
  `supplier_cnt` int(10) unsigned NOT NULL,
  `goods_cnt` int(10) unsigned NOT NULL,
  `order_group_cnt` int(10) unsigned NOT NULL,
  `order_cnt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_cnt`),
  UNIQUE KEY `user_cnt_UNIQUE` (`user_cnt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES (100,10,40,0,0);
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03 16:51:34
