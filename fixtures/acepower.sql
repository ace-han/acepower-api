-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: localhost    Database: acepower
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `account_profile`
--

DROP TABLE IF EXISTS `account_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar_url` varchar(256) NOT NULL,
  `country` varchar(32) NOT NULL,
  `gender` smallint(5) unsigned NOT NULL,
  `city` varchar(128) NOT NULL,
  `language` varchar(4) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `province` varchar(64) NOT NULL,
  `unionid` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `account_profile_user_id_bdd52018_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_profile`
--

LOCK TABLES `account_profile` WRITE;
/*!40000 ALTER TABLE `account_profile` DISABLE KEYS */;
INSERT INTO `account_profile` VALUES (1,'https://wx.qlogo.cn/mmopen/vi_32/VbIDicpTEPZrDlQKkXDcIR9uiaklNKc2WAfVX2KguedqibKiaa7m07qDdY8SB4R2YggJjgCviavwKicI4TPT2G8FMWcQ/0','China',1,'Guangzhou','en','黑伯爵','Guangdong','',2);
/*!40000 ALTER TABLE `account_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_country`
--

DROP TABLE IF EXISTS `address_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_country` (
  `iso_3166_1_a2` varchar(2) NOT NULL,
  `iso_3166_1_a3` varchar(3) NOT NULL,
  `iso_3166_1_numeric` varchar(3) NOT NULL,
  `printable_name` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_order` smallint(5) unsigned NOT NULL,
  `is_shipping_country` tinyint(1) NOT NULL,
  PRIMARY KEY (`iso_3166_1_a2`),
  KEY `address_country_display_order_dc88cde8` (`display_order`),
  KEY `address_country_is_shipping_country_f7b6c461` (`is_shipping_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_country`
--

LOCK TABLES `address_country` WRITE;
/*!40000 ALTER TABLE `address_country` DISABLE KEYS */;
INSERT INTO `address_country` VALUES ('GB','GBR','826','United Kingdom','United Kingdom of Great Britain and Northern Ireland',990,1);
/*!40000 ALTER TABLE `address_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_useraddress`
--

DROP TABLE IF EXISTS `address_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `notes` longtext NOT NULL,
  `is_default_for_shipping` tinyint(1) NOT NULL,
  `is_default_for_billing` tinyint(1) NOT NULL,
  `num_orders_as_shipping_address` int(10) unsigned NOT NULL,
  `hash` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `num_orders_as_billing_address` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address_useraddress_user_id_hash_9d1738c7_uniq` (`user_id`,`hash`),
  KEY `address_useraddress_country_id_fa26a249_fk_address_c` (`country_id`),
  KEY `address_useraddress_hash_e0a6b290` (`hash`),
  CONSTRAINT `address_useraddress_country_id_fa26a249_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `address_useraddress_user_id_6edf0244_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_useraddress`
--

LOCK TABLES `address_useraddress` WRITE;
/*!40000 ALTER TABLE `address_useraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_productrecord`
--

DROP TABLE IF EXISTS `analytics_productrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_productrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_purchases` int(10) unsigned NOT NULL,
  `score` double NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `analytics_productrecord_num_purchases_405301a0` (`num_purchases`),
  CONSTRAINT `analytics_productrec_product_id_dad3a871_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_productrecord`
--

LOCK TABLES `analytics_productrecord` WRITE;
/*!40000 ALTER TABLE `analytics_productrecord` DISABLE KEYS */;
INSERT INTO `analytics_productrecord` VALUES (1,4,1,0,0,198),(2,0,1,0,0,197),(3,2,0,0,0,196),(4,25,0,0,0,8),(5,0,1,0,0,186),(6,1,0,0,0,5),(7,8,1,29,0,199),(8,2,1,0,0,194),(9,1,0,0,0,178),(10,0,1,0,0,11);
/*!40000 ALTER TABLE `analytics_productrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userproductview`
--

DROP TABLE IF EXISTS `analytics_userproductview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userproductview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_userproduc_product_id_a55b87ad_fk_catalogue` (`product_id`),
  KEY `analytics_userproductview_user_id_5e49a8b1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `analytics_userproduc_product_id_a55b87ad_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `analytics_userproductview_user_id_5e49a8b1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userproductview`
--

LOCK TABLES `analytics_userproductview` WRITE;
/*!40000 ALTER TABLE `analytics_userproductview` DISABLE KEYS */;
INSERT INTO `analytics_userproductview` VALUES (1,'2017-10-30 04:02:47.444665',198,1),(2,'2017-10-30 04:02:53.702833',198,1),(3,'2017-10-30 04:33:21.243589',196,1),(4,'2017-10-30 07:41:23.520005',196,1),(5,'2017-10-30 16:40:24.178003',198,1),(6,'2017-10-30 16:41:31.876689',198,1),(7,'2017-10-30 16:43:10.327876',8,1),(8,'2017-10-30 17:10:27.533665',8,1),(9,'2017-10-30 17:10:47.695020',8,1),(10,'2017-10-31 14:35:13.638119',8,1),(11,'2017-10-31 14:36:43.244057',8,1),(12,'2017-10-31 14:38:03.529369',8,1),(13,'2017-10-31 14:38:21.331240',8,1),(14,'2017-10-31 14:40:02.519877',8,1),(15,'2017-10-31 14:41:17.170297',8,1),(16,'2017-10-31 14:42:41.743399',8,1),(17,'2017-10-31 14:47:01.236064',8,1),(18,'2017-10-31 14:49:07.401489',8,1),(19,'2017-10-31 14:53:12.552816',5,1),(20,'2017-11-01 16:14:43.957800',199,1),(21,'2017-11-01 16:23:09.919016',199,1),(22,'2017-11-01 16:41:56.235180',199,1),(23,'2017-11-02 16:16:44.566075',199,1),(24,'2017-11-02 16:19:06.156608',194,1),(25,'2017-11-02 16:28:34.967867',194,1),(26,'2017-11-05 14:27:11.066133',199,1),(27,'2017-11-05 14:28:47.602222',199,1),(28,'2017-11-05 18:00:40.833462',199,1),(29,'2017-11-05 18:07:27.442520',199,1),(30,'2017-11-18 03:29:50.018576',178,1),(31,'2017-11-18 03:30:07.177671',8,1),(32,'2017-11-18 03:58:22.457553',8,1),(33,'2017-11-18 03:59:15.615269',8,1),(34,'2017-11-18 03:59:30.815658',8,1),(35,'2017-11-18 03:59:49.181831',8,1),(36,'2017-11-18 04:03:44.142088',8,1),(37,'2017-11-18 04:04:22.738154',8,1),(38,'2017-11-18 04:05:57.184777',8,1),(39,'2017-11-18 04:08:12.139035',8,1),(40,'2017-11-18 04:09:19.999515',8,1),(41,'2017-11-18 04:22:39.993099',8,1),(42,'2017-11-18 04:31:22.848240',8,1),(43,'2017-11-20 16:34:37.581308',8,1);
/*!40000 ALTER TABLE `analytics_userproductview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_userrecord`
--

DROP TABLE IF EXISTS `analytics_userrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_userrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_product_views` int(10) unsigned NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `num_order_lines` int(10) unsigned NOT NULL,
  `num_order_items` int(10) unsigned NOT NULL,
  `total_spent` decimal(12,2) NOT NULL,
  `date_last_order` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `analytics_userrecord_num_orders_b352ffd1` (`num_orders`),
  KEY `analytics_userrecord_num_order_lines_97cc087f` (`num_order_lines`),
  KEY `analytics_userrecord_num_order_items_fb2a8304` (`num_order_items`),
  CONSTRAINT `analytics_userrecord_user_id_702cff4c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_userrecord`
--

LOCK TABLES `analytics_userrecord` WRITE;
/*!40000 ALTER TABLE `analytics_userrecord` DISABLE KEYS */;
INSERT INTO `analytics_userrecord` VALUES (1,43,6,0,0,0,0.00,NULL,1),(2,0,0,29,29,29,174.00,'2017-11-29 17:05:27.985115',2);
/*!40000 ALTER TABLE `analytics_userrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_usersearch`
--

DROP TABLE IF EXISTS `analytics_usersearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_usersearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_usersearch_user_id_1775992d_fk_auth_user_id` (`user_id`),
  KEY `analytics_usersearch_query_ad36478b` (`query`),
  CONSTRAINT `analytics_usersearch_user_id_1775992d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_usersearch`
--

LOCK TABLES `analytics_usersearch` WRITE;
/*!40000 ALTER TABLE `analytics_usersearch` DISABLE KEYS */;
INSERT INTO `analytics_usersearch` VALUES (1,'T-shirt','2017-10-30 16:40:16.328815',1),(2,'T-shirt','2017-10-31 14:43:42.824465',1),(3,'shirt','2017-10-31 14:43:52.973450',1);
/*!40000 ALTER TABLE `analytics_usersearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add content type',3,'add_contenttype'),(8,'Can change content type',3,'change_contenttype'),(9,'Can delete content type',3,'delete_contenttype'),(10,'Can add session',4,'add_session'),(11,'Can change session',4,'change_session'),(12,'Can delete session',4,'delete_session'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(19,'Can add profile',7,'add_profile'),(20,'Can change profile',7,'change_profile'),(21,'Can delete profile',7,'delete_profile'),(22,'Can add site',8,'add_site'),(23,'Can change site',8,'change_site'),(24,'Can delete site',8,'delete_site'),(25,'Can add flat page',9,'add_flatpage'),(26,'Can change flat page',9,'change_flatpage'),(27,'Can delete flat page',9,'delete_flatpage'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(31,'Can add Product record',11,'add_productrecord'),(32,'Can change Product record',11,'change_productrecord'),(33,'Can delete Product record',11,'delete_productrecord'),(34,'Can add User product view',12,'add_userproductview'),(35,'Can change User product view',12,'change_userproductview'),(36,'Can delete User product view',12,'delete_userproductview'),(37,'Can add User record',13,'add_userrecord'),(38,'Can change User record',13,'change_userrecord'),(39,'Can delete User record',13,'delete_userrecord'),(40,'Can add User search query',14,'add_usersearch'),(41,'Can change User search query',14,'change_usersearch'),(42,'Can delete User search query',14,'delete_usersearch'),(43,'Can add Country',15,'add_country'),(44,'Can change Country',15,'change_country'),(45,'Can delete Country',15,'delete_country'),(46,'Can add User address',16,'add_useraddress'),(47,'Can change User address',16,'change_useraddress'),(48,'Can delete User address',16,'delete_useraddress'),(49,'Can add Order and Item Charge',17,'add_orderanditemcharges'),(50,'Can change Order and Item Charge',17,'change_orderanditemcharges'),(51,'Can delete Order and Item Charge',17,'delete_orderanditemcharges'),(52,'Can add Weight Band',18,'add_weightband'),(53,'Can change Weight Band',18,'change_weightband'),(54,'Can delete Weight Band',18,'delete_weightband'),(55,'Can add Weight-based Shipping Method',19,'add_weightbased'),(56,'Can change Weight-based Shipping Method',19,'change_weightbased'),(57,'Can delete Weight-based Shipping Method',19,'delete_weightbased'),(58,'Can add Attribute option',20,'add_attributeoption'),(59,'Can change Attribute option',20,'change_attributeoption'),(60,'Can delete Attribute option',20,'delete_attributeoption'),(61,'Can add Attribute option group',21,'add_attributeoptiongroup'),(62,'Can change Attribute option group',21,'change_attributeoptiongroup'),(63,'Can delete Attribute option group',21,'delete_attributeoptiongroup'),(64,'Can add Category',22,'add_category'),(65,'Can change Category',22,'change_category'),(66,'Can delete Category',22,'delete_category'),(67,'Can add Option',23,'add_option'),(68,'Can change Option',23,'change_option'),(69,'Can delete Option',23,'delete_option'),(70,'Can add Product',24,'add_product'),(71,'Can change Product',24,'change_product'),(72,'Can delete Product',24,'delete_product'),(73,'Can add Product attribute',25,'add_productattribute'),(74,'Can change Product attribute',25,'change_productattribute'),(75,'Can delete Product attribute',25,'delete_productattribute'),(76,'Can add Product attribute value',26,'add_productattributevalue'),(77,'Can change Product attribute value',26,'change_productattributevalue'),(78,'Can delete Product attribute value',26,'delete_productattributevalue'),(79,'Can add Product category',27,'add_productcategory'),(80,'Can change Product category',27,'change_productcategory'),(81,'Can delete Product category',27,'delete_productcategory'),(82,'Can add Product class',28,'add_productclass'),(83,'Can change Product class',28,'change_productclass'),(84,'Can delete Product class',28,'delete_productclass'),(85,'Can add Product image',29,'add_productimage'),(86,'Can change Product image',29,'change_productimage'),(87,'Can delete Product image',29,'delete_productimage'),(88,'Can add Product recommendation',30,'add_productrecommendation'),(89,'Can change Product recommendation',30,'change_productrecommendation'),(90,'Can delete Product recommendation',30,'delete_productrecommendation'),(91,'Can add Product review',31,'add_productreview'),(92,'Can change Product review',31,'change_productreview'),(93,'Can delete Product review',31,'delete_productreview'),(94,'Can add Vote',32,'add_vote'),(95,'Can change Vote',32,'change_vote'),(96,'Can delete Vote',32,'delete_vote'),(97,'Can add Fulfillment partner',33,'add_partner'),(98,'Can change Fulfillment partner',33,'change_partner'),(99,'Can delete Fulfillment partner',33,'delete_partner'),(100,'Can access dashboard',33,'dashboard_access'),(101,'Can add Partner address',34,'add_partneraddress'),(102,'Can change Partner address',34,'change_partneraddress'),(103,'Can delete Partner address',34,'delete_partneraddress'),(104,'Can add Stock alert',35,'add_stockalert'),(105,'Can change Stock alert',35,'change_stockalert'),(106,'Can delete Stock alert',35,'delete_stockalert'),(107,'Can add Stock record',36,'add_stockrecord'),(108,'Can change Stock record',36,'change_stockrecord'),(109,'Can delete Stock record',36,'delete_stockrecord'),(110,'Can add Basket',37,'add_basket'),(111,'Can change Basket',37,'change_basket'),(112,'Can delete Basket',37,'delete_basket'),(113,'Can add Basket line',38,'add_line'),(114,'Can change Basket line',38,'change_line'),(115,'Can delete Basket line',38,'delete_line'),(116,'Can add Line attribute',39,'add_lineattribute'),(117,'Can change Line attribute',39,'change_lineattribute'),(118,'Can delete Line attribute',39,'delete_lineattribute'),(119,'Can add Bankcard',40,'add_bankcard'),(120,'Can change Bankcard',40,'change_bankcard'),(121,'Can delete Bankcard',40,'delete_bankcard'),(122,'Can add Source',41,'add_source'),(123,'Can change Source',41,'change_source'),(124,'Can delete Source',41,'delete_source'),(125,'Can add Source Type',42,'add_sourcetype'),(126,'Can change Source Type',42,'change_sourcetype'),(127,'Can delete Source Type',42,'delete_sourcetype'),(128,'Can add Transaction',43,'add_transaction'),(129,'Can change Transaction',43,'change_transaction'),(130,'Can delete Transaction',43,'delete_transaction'),(131,'Can add Benefit',44,'add_benefit'),(132,'Can change Benefit',44,'change_benefit'),(133,'Can delete Benefit',44,'delete_benefit'),(134,'Can add Condition',45,'add_condition'),(135,'Can change Condition',45,'change_condition'),(136,'Can delete Condition',45,'delete_condition'),(137,'Can add Conditional offer',46,'add_conditionaloffer'),(138,'Can change Conditional offer',46,'change_conditionaloffer'),(139,'Can delete Conditional offer',46,'delete_conditionaloffer'),(140,'Can add Range',47,'add_range'),(141,'Can change Range',47,'change_range'),(142,'Can delete Range',47,'delete_range'),(143,'Can add range product',48,'add_rangeproduct'),(144,'Can change range product',48,'change_rangeproduct'),(145,'Can delete range product',48,'delete_rangeproduct'),(146,'Can add Range Product Uploaded File',49,'add_rangeproductfileupload'),(147,'Can change Range Product Uploaded File',49,'change_rangeproductfileupload'),(148,'Can delete Range Product Uploaded File',49,'delete_rangeproductfileupload'),(149,'Can add Absolute discount benefit',44,'add_absolutediscountbenefit'),(150,'Can change Absolute discount benefit',44,'change_absolutediscountbenefit'),(151,'Can delete Absolute discount benefit',44,'delete_absolutediscountbenefit'),(152,'Can add Count condition',45,'add_countcondition'),(153,'Can change Count condition',45,'change_countcondition'),(154,'Can delete Count condition',45,'delete_countcondition'),(155,'Can add Coverage Condition',45,'add_coveragecondition'),(156,'Can change Coverage Condition',45,'change_coveragecondition'),(157,'Can delete Coverage Condition',45,'delete_coveragecondition'),(158,'Can add Fixed price benefit',44,'add_fixedpricebenefit'),(159,'Can change Fixed price benefit',44,'change_fixedpricebenefit'),(160,'Can delete Fixed price benefit',44,'delete_fixedpricebenefit'),(161,'Can add Multibuy discount benefit',44,'add_multibuydiscountbenefit'),(162,'Can change Multibuy discount benefit',44,'change_multibuydiscountbenefit'),(163,'Can delete Multibuy discount benefit',44,'delete_multibuydiscountbenefit'),(164,'Can add Percentage discount benefit',44,'add_percentagediscountbenefit'),(165,'Can change Percentage discount benefit',44,'change_percentagediscountbenefit'),(166,'Can delete Percentage discount benefit',44,'delete_percentagediscountbenefit'),(167,'Can add shipping benefit',44,'add_shippingbenefit'),(168,'Can change shipping benefit',44,'change_shippingbenefit'),(169,'Can delete shipping benefit',44,'delete_shippingbenefit'),(170,'Can add Shipping absolute discount benefit',44,'add_shippingabsolutediscountbenefit'),(171,'Can change Shipping absolute discount benefit',44,'change_shippingabsolutediscountbenefit'),(172,'Can delete Shipping absolute discount benefit',44,'delete_shippingabsolutediscountbenefit'),(173,'Can add Fixed price shipping benefit',44,'add_shippingfixedpricebenefit'),(174,'Can change Fixed price shipping benefit',44,'change_shippingfixedpricebenefit'),(175,'Can delete Fixed price shipping benefit',44,'delete_shippingfixedpricebenefit'),(176,'Can add Shipping percentage discount benefit',44,'add_shippingpercentagediscountbenefit'),(177,'Can change Shipping percentage discount benefit',44,'change_shippingpercentagediscountbenefit'),(178,'Can delete Shipping percentage discount benefit',44,'delete_shippingpercentagediscountbenefit'),(179,'Can add Value condition',45,'add_valuecondition'),(180,'Can change Value condition',45,'change_valuecondition'),(181,'Can delete Value condition',45,'delete_valuecondition'),(182,'Can add Billing address',61,'add_billingaddress'),(183,'Can change Billing address',61,'change_billingaddress'),(184,'Can delete Billing address',61,'delete_billingaddress'),(185,'Can add Communication Event',62,'add_communicationevent'),(186,'Can change Communication Event',62,'change_communicationevent'),(187,'Can delete Communication Event',62,'delete_communicationevent'),(188,'Can add Order Line',63,'add_line'),(189,'Can change Order Line',63,'change_line'),(190,'Can delete Order Line',63,'delete_line'),(191,'Can add Line Attribute',64,'add_lineattribute'),(192,'Can change Line Attribute',64,'change_lineattribute'),(193,'Can delete Line Attribute',64,'delete_lineattribute'),(194,'Can add Line Price',65,'add_lineprice'),(195,'Can change Line Price',65,'change_lineprice'),(196,'Can delete Line Price',65,'delete_lineprice'),(197,'Can add Order',66,'add_order'),(198,'Can change Order',66,'change_order'),(199,'Can delete Order',66,'delete_order'),(200,'Can add Order Discount',67,'add_orderdiscount'),(201,'Can change Order Discount',67,'change_orderdiscount'),(202,'Can delete Order Discount',67,'delete_orderdiscount'),(203,'Can add Order Note',68,'add_ordernote'),(204,'Can change Order Note',68,'change_ordernote'),(205,'Can delete Order Note',68,'delete_ordernote'),(206,'Can add Payment Event',69,'add_paymentevent'),(207,'Can change Payment Event',69,'change_paymentevent'),(208,'Can delete Payment Event',69,'delete_paymentevent'),(209,'Can add Payment Event Quantity',70,'add_paymenteventquantity'),(210,'Can change Payment Event Quantity',70,'change_paymenteventquantity'),(211,'Can delete Payment Event Quantity',70,'delete_paymenteventquantity'),(212,'Can add Payment Event Type',71,'add_paymenteventtype'),(213,'Can change Payment Event Type',71,'change_paymenteventtype'),(214,'Can delete Payment Event Type',71,'delete_paymenteventtype'),(215,'Can add Shipping address',72,'add_shippingaddress'),(216,'Can change Shipping address',72,'change_shippingaddress'),(217,'Can delete Shipping address',72,'delete_shippingaddress'),(218,'Can add Shipping Event',73,'add_shippingevent'),(219,'Can change Shipping Event',73,'change_shippingevent'),(220,'Can delete Shipping Event',73,'delete_shippingevent'),(221,'Can add Shipping Event Quantity',74,'add_shippingeventquantity'),(222,'Can change Shipping Event Quantity',74,'change_shippingeventquantity'),(223,'Can delete Shipping Event Quantity',74,'delete_shippingeventquantity'),(224,'Can add Shipping Event Type',75,'add_shippingeventtype'),(225,'Can change Shipping Event Type',75,'change_shippingeventtype'),(226,'Can delete Shipping Event Type',75,'delete_shippingeventtype'),(227,'Can add Communication event type',76,'add_communicationeventtype'),(228,'Can change Communication event type',76,'change_communicationeventtype'),(229,'Can delete Communication event type',76,'delete_communicationeventtype'),(230,'Can add Email',77,'add_email'),(231,'Can change Email',77,'change_email'),(232,'Can delete Email',77,'delete_email'),(233,'Can add Notification',78,'add_notification'),(234,'Can change Notification',78,'change_notification'),(235,'Can delete Notification',78,'delete_notification'),(236,'Can add Product alert',79,'add_productalert'),(237,'Can change Product alert',79,'change_productalert'),(238,'Can delete Product alert',79,'delete_productalert'),(239,'Can add Automatic product list',80,'add_automaticproductlist'),(240,'Can change Automatic product list',80,'change_automaticproductlist'),(241,'Can delete Automatic product list',80,'delete_automaticproductlist'),(242,'Can add Hand Picked Product List',81,'add_handpickedproductlist'),(243,'Can change Hand Picked Product List',81,'change_handpickedproductlist'),(244,'Can delete Hand Picked Product List',81,'delete_handpickedproductlist'),(245,'Can add Image',82,'add_image'),(246,'Can change Image',82,'change_image'),(247,'Can delete Image',82,'delete_image'),(248,'Can add Keyword Promotion',83,'add_keywordpromotion'),(249,'Can change Keyword Promotion',83,'change_keywordpromotion'),(250,'Can delete Keyword Promotion',83,'delete_keywordpromotion'),(251,'Can add Multi Image',84,'add_multiimage'),(252,'Can change Multi Image',84,'change_multiimage'),(253,'Can delete Multi Image',84,'delete_multiimage'),(254,'Can add Ordered product',85,'add_orderedproduct'),(255,'Can change Ordered product',85,'change_orderedproduct'),(256,'Can delete Ordered product',85,'delete_orderedproduct'),(257,'Can add Ordered Product List',86,'add_orderedproductlist'),(258,'Can change Ordered Product List',86,'change_orderedproductlist'),(259,'Can delete Ordered Product List',86,'delete_orderedproductlist'),(260,'Can add Page Promotion',87,'add_pagepromotion'),(261,'Can change Page Promotion',87,'change_pagepromotion'),(262,'Can delete Page Promotion',87,'delete_pagepromotion'),(263,'Can add Raw HTML',88,'add_rawhtml'),(264,'Can change Raw HTML',88,'change_rawhtml'),(265,'Can delete Raw HTML',88,'delete_rawhtml'),(266,'Can add Single product',89,'add_singleproduct'),(267,'Can change Single product',89,'change_singleproduct'),(268,'Can delete Single product',89,'delete_singleproduct'),(269,'Can add Tabbed Block',90,'add_tabbedblock'),(270,'Can change Tabbed Block',90,'change_tabbedblock'),(271,'Can delete Tabbed Block',90,'delete_tabbedblock'),(272,'Can add Voucher',91,'add_voucher'),(273,'Can change Voucher',91,'change_voucher'),(274,'Can delete Voucher',91,'delete_voucher'),(275,'Can add Voucher Application',92,'add_voucherapplication'),(276,'Can change Voucher Application',92,'change_voucherapplication'),(277,'Can delete Voucher Application',92,'delete_voucherapplication'),(278,'Can add Wish list line',93,'add_line'),(279,'Can change Wish list line',93,'change_line'),(280,'Can delete Wish list line',93,'delete_line'),(281,'Can add Wish List',94,'add_wishlist'),(282,'Can change Wish List',94,'change_wishlist'),(283,'Can delete Wish List',94,'delete_wishlist'),(284,'Can add kv store',95,'add_kvstore'),(285,'Can change kv store',95,'change_kvstore'),(286,'Can delete kv store',95,'delete_kvstore'),(287,'Can add api key',96,'add_apikey'),(288,'Can change api key',96,'change_apikey'),(289,'Can delete api key',96,'delete_apikey'),(290,'Can add Partner Asset',97,'add_partnerasset'),(291,'Can change Partner Asset',97,'change_partnerasset'),(292,'Can delete Partner Asset',97,'delete_partnerasset'),(293,'Can add Asset Location',98,'add_assetlocation'),(294,'Can change Asset Location',98,'change_assetlocation'),(295,'Can delete Asset Location',98,'delete_assetlocation');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `source` varchar(8) NOT NULL,
  `unionid` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$ncoeoFjNaEBH$3TNKugRYx73YRkHsnLw0nxgpVEvy4Sp98nTPqbSVFx0=','2017-10-29 18:10:53.674184',1,'admin','',1,1,'2017-09-17 17:17:11.420711','',''),(2,'7o9k/tG06BVmyg05W5lFFw==',NULL,0,'oXuEB0TcxclU2cYRsYZYRQ9XrdDQ','',0,1,'2017-10-22 06:31:08.731987','wx',''),(3,'pbkdf2_sha256$10000$EhDNXhiM1P6f$eVSrbJxxdsflcd9Cl9ysN13lQHR/EtRPgp5+ZRRDZgU=','2012-09-12 17:11:20.000000',0,'staff','staff@example.com',1,1,'2012-09-12 17:08:56.000000','','');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket`
--

DROP TABLE IF EXISTS `basket_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_merged` datetime(6) DEFAULT NULL,
  `date_submitted` datetime(6) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_basket_owner_id_3a018de5_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `basket_basket_owner_id_3a018de5_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket`
--

LOCK TABLES `basket_basket` WRITE;
/*!40000 ALTER TABLE `basket_basket` DISABLE KEYS */;
INSERT INTO `basket_basket` VALUES (1,'Open','2017-10-29 18:10:54.847510',NULL,NULL,1),(2,'Open','2017-11-08 16:24:37.394833',NULL,NULL,NULL),(3,'Open','2017-11-08 16:24:56.992068',NULL,NULL,NULL),(4,'Open','2017-11-08 16:31:23.063671',NULL,NULL,NULL),(5,'Open','2017-11-08 17:13:10.730224',NULL,NULL,NULL),(6,'Open','2017-11-08 17:14:01.072429',NULL,NULL,NULL),(7,'Open','2017-11-08 17:27:52.683819',NULL,NULL,NULL),(8,'Open','2017-11-08 17:28:14.921626',NULL,NULL,NULL),(9,'Open','2017-11-08 17:32:28.854266',NULL,NULL,NULL),(10,'Open','2017-11-08 17:32:46.375086',NULL,NULL,NULL),(11,'Open','2017-11-08 17:55:29.272402',NULL,NULL,NULL),(12,'Open','2017-11-08 17:55:33.238757',NULL,NULL,NULL),(13,'Open','2017-11-08 18:12:14.578940',NULL,NULL,NULL),(14,'Open','2017-11-08 18:13:41.006480',NULL,NULL,NULL),(15,'Open','2017-11-08 18:16:49.529850',NULL,NULL,NULL),(16,'Open','2017-11-08 18:17:29.668118',NULL,NULL,NULL),(17,'Frozen','2017-11-08 18:52:57.744497',NULL,NULL,2),(18,'Open','2017-11-13 08:52:16.331500',NULL,NULL,NULL),(19,'Open','2017-11-13 08:52:59.962288',NULL,NULL,NULL),(20,'Open','2017-11-13 16:25:57.301587',NULL,NULL,NULL),(21,'Open','2017-11-13 16:26:24.141139',NULL,NULL,NULL),(22,'Open','2017-11-19 15:12:32.912041',NULL,NULL,NULL),(23,'Frozen','2017-11-20 18:19:27.989809',NULL,NULL,2),(24,'Frozen','2017-11-20 18:25:07.967865',NULL,NULL,2),(25,'Frozen','2017-11-20 18:28:32.516354',NULL,NULL,2),(26,'Frozen','2017-11-20 18:32:44.951303',NULL,NULL,2),(27,'Frozen','2017-11-20 18:34:38.497840',NULL,NULL,2),(28,'Frozen','2017-11-20 18:35:38.914205',NULL,NULL,2),(29,'Open','2017-11-20 18:35:39.332361',NULL,NULL,NULL),(30,'Frozen','2017-11-20 18:38:34.155584',NULL,NULL,2),(31,'Frozen','2017-11-25 04:55:46.385456',NULL,NULL,2),(32,'Frozen','2017-11-25 05:48:19.810591',NULL,NULL,2),(33,'Frozen','2017-11-25 07:25:48.874726',NULL,NULL,2),(34,'Frozen','2017-11-27 16:32:23.550064',NULL,NULL,2),(35,'Frozen','2017-11-27 16:41:49.186093',NULL,NULL,2),(36,'Frozen','2017-11-27 17:07:26.413334',NULL,NULL,2),(37,'Open','2017-11-27 17:07:43.737901',NULL,NULL,NULL),(38,'Open','2017-11-27 17:07:45.153341',NULL,NULL,NULL),(39,'Open','2017-11-27 17:07:46.473711',NULL,NULL,NULL),(40,'Open','2017-11-27 17:07:47.803519',NULL,NULL,NULL),(41,'Open','2017-11-27 17:07:49.080392',NULL,NULL,NULL),(42,'Open','2017-11-27 17:07:50.350954',NULL,NULL,NULL),(43,'Open','2017-11-27 17:07:51.633067',NULL,NULL,NULL),(44,'Open','2017-11-27 17:07:52.902610',NULL,NULL,NULL),(45,'Open','2017-11-27 17:07:54.152206',NULL,NULL,NULL),(46,'Open','2017-11-27 17:07:55.403511',NULL,NULL,NULL),(47,'Open','2017-11-27 17:07:56.670081',NULL,NULL,NULL),(48,'Open','2017-11-27 17:07:57.925052',NULL,NULL,NULL),(49,'Open','2017-11-27 17:07:59.187255',NULL,NULL,NULL),(50,'Open','2017-11-27 17:08:00.510359',NULL,NULL,NULL),(51,'Open','2017-11-27 17:08:01.964925',NULL,NULL,NULL),(52,'Open','2017-11-27 17:08:03.298800',NULL,NULL,NULL),(53,'Open','2017-11-27 17:08:04.566767',NULL,NULL,NULL),(54,'Open','2017-11-27 17:08:05.846320',NULL,NULL,NULL),(55,'Open','2017-11-27 17:08:07.128106',NULL,NULL,NULL),(56,'Open','2017-11-27 17:08:08.392518',NULL,NULL,NULL),(57,'Open','2017-11-27 17:08:09.709550',NULL,NULL,NULL),(58,'Open','2017-11-27 17:08:10.991695',NULL,NULL,NULL),(59,'Open','2017-11-27 17:08:12.255019',NULL,NULL,NULL),(60,'Open','2017-11-27 17:08:13.513689',NULL,NULL,NULL),(61,'Open','2017-11-27 17:08:14.735083',NULL,NULL,NULL),(62,'Open','2017-11-27 17:08:15.980843',NULL,NULL,NULL),(63,'Open','2017-11-27 17:08:17.258622',NULL,NULL,NULL),(64,'Open','2017-11-27 17:08:18.512744',NULL,NULL,NULL),(65,'Open','2017-11-27 17:08:19.844953',NULL,NULL,NULL),(66,'Open','2017-11-27 17:08:21.155597',NULL,NULL,NULL),(67,'Open','2017-11-27 17:08:22.553005',NULL,NULL,NULL),(68,'Open','2017-11-27 17:08:23.816281',NULL,NULL,NULL),(69,'Open','2017-11-27 17:08:25.055469',NULL,NULL,NULL),(70,'Open','2017-11-27 17:08:26.362103',NULL,NULL,NULL),(71,'Open','2017-11-27 17:08:27.630475',NULL,NULL,NULL),(72,'Open','2017-11-27 17:08:28.905325',NULL,NULL,NULL),(73,'Open','2017-11-27 17:08:30.174899',NULL,NULL,NULL),(74,'Open','2017-11-27 17:08:31.505077',NULL,NULL,NULL),(75,'Open','2017-11-27 17:08:32.809964',NULL,NULL,NULL),(76,'Open','2017-11-27 17:08:34.157888',NULL,NULL,NULL),(77,'Open','2017-11-27 17:08:35.455917',NULL,NULL,NULL),(78,'Open','2017-11-27 17:08:36.746378',NULL,NULL,NULL),(79,'Open','2017-11-27 17:08:38.039714',NULL,NULL,NULL),(80,'Open','2017-11-27 17:08:39.315335',NULL,NULL,NULL),(81,'Open','2017-11-27 17:08:40.601299',NULL,NULL,NULL),(82,'Open','2017-11-27 17:08:41.857079',NULL,NULL,NULL),(83,'Open','2017-11-27 17:08:43.119135',NULL,NULL,NULL),(84,'Open','2017-11-27 17:08:44.489894',NULL,NULL,NULL),(85,'Open','2017-11-27 17:08:45.820231',NULL,NULL,NULL),(86,'Open','2017-11-27 17:08:47.063482',NULL,NULL,NULL),(87,'Open','2017-11-27 17:08:48.341400',NULL,NULL,NULL),(88,'Open','2017-11-27 17:08:49.635075',NULL,NULL,NULL),(89,'Open','2017-11-27 17:10:41.874758',NULL,NULL,NULL),(90,'Frozen','2017-11-27 17:16:51.067120',NULL,NULL,2),(91,'Frozen','2017-11-27 17:26:07.888712',NULL,NULL,2),(92,'Frozen','2017-11-27 17:39:50.508808',NULL,NULL,2),(93,'Frozen','2017-11-28 13:43:38.744503',NULL,NULL,2),(94,'Frozen','2017-11-28 13:55:08.226924',NULL,NULL,2),(95,'Frozen','2017-11-28 15:16:30.240305',NULL,NULL,2),(96,'Frozen','2017-11-28 15:21:31.715773',NULL,NULL,2),(97,'Frozen','2017-11-28 15:27:33.135515',NULL,NULL,2),(98,'Frozen','2017-11-28 15:31:32.409330',NULL,NULL,2),(99,'Frozen','2017-11-28 15:36:51.059119',NULL,NULL,2),(100,'Frozen','2017-11-28 15:42:08.763016',NULL,NULL,2),(101,'Frozen','2017-11-28 15:49:03.952153',NULL,NULL,2),(102,'Frozen','2017-11-28 15:57:08.200439',NULL,NULL,2),(103,'Frozen','2017-11-28 16:56:55.090092',NULL,NULL,2),(104,'Open','2017-11-29 16:19:34.242237',NULL,NULL,NULL),(105,'Frozen','2017-11-29 17:01:00.891928',NULL,NULL,2),(106,'Open','2017-11-29 17:05:29.369854',NULL,NULL,2);
/*!40000 ALTER TABLE `basket_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_basket_vouchers`
--

DROP TABLE IF EXISTS `basket_basket_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_basket_vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_basket_vouchers_basket_id_voucher_id_0731eee2_uniq` (`basket_id`,`voucher_id`),
  KEY `basket_basket_vouchers_voucher_id_c2b66981_fk_voucher_voucher_id` (`voucher_id`),
  CONSTRAINT `basket_basket_vouchers_basket_id_f857c2f8_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `basket_basket_vouchers_voucher_id_c2b66981_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_basket_vouchers`
--

LOCK TABLES `basket_basket_vouchers` WRITE;
/*!40000 ALTER TABLE `basket_basket_vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `basket_basket_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_line`
--

DROP TABLE IF EXISTS `basket_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line_reference` varchar(128) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_incl_tax` decimal(12,2) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `basket_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `basket_line_basket_id_line_reference_8977e974_uniq` (`basket_id`,`line_reference`),
  KEY `basket_line_line_reference_08e91113` (`line_reference`),
  KEY `basket_line_product_id_303d743e_fk_catalogue_product_id` (`product_id`),
  KEY `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `basket_line_basket_id_b615c905_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `basket_line_product_id_303d743e_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_line`
--

LOCK TABLES `basket_line` WRITE;
/*!40000 ALTER TABLE `basket_line` DISABLE KEYS */;
INSERT INTO `basket_line` VALUES (16,'11_5',1,'GBP',15.00,15.00,'2017-11-18 04:31:16.830361',1,11,5),(57,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 17:13:59.458572',17,199,199),(58,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 18:25:02.227601',23,199,199),(59,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 18:28:26.934692',24,199,199),(60,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 18:32:40.103641',25,199,199),(61,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 18:34:31.736773',26,199,199),(62,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 18:35:34.460763',27,199,199),(63,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-20 18:38:28.888378',28,199,199),(73,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-25 04:55:40.586015',30,199,199),(74,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-25 05:48:08.220536',31,199,199),(75,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-25 07:25:43.014964',32,199,199),(77,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 16:32:07.647069',33,199,199),(78,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 16:41:37.173164',34,199,199),(79,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 17:07:20.023925',35,199,199),(81,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 17:16:40.795619',36,199,199),(82,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 17:26:00.246057',90,199,199),(83,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 17:39:33.480757',91,199,199),(84,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-27 17:45:15.461031',92,199,199),(90,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 13:54:47.062933',93,199,199),(93,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:16:24.512462',94,199,199),(94,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:21:26.139418',95,199,199),(95,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:27:27.790354',96,199,199),(96,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:31:21.675335',97,199,199),(97,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:36:44.147568',98,199,199),(99,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:41:50.052667',99,199,199),(100,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:48:58.376173',100,199,199),(102,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 15:57:03.254034',101,199,199),(107,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-28 16:56:28.316730',102,199,199),(131,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-29 17:00:53.467667',103,199,199),(132,'199_199_4235827387',1,'CNY',6.00,6.00,'2017-11-29 17:05:22.698935',105,199,199);
/*!40000 ALTER TABLE `basket_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket_lineattribute`
--

DROP TABLE IF EXISTS `basket_lineattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id` (`line_id`),
  KEY `basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id` FOREIGN KEY (`line_id`) REFERENCES `basket_line` (`id`),
  CONSTRAINT `basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_lineattribute`
--

LOCK TABLES `basket_lineattribute` WRITE;
/*!40000 ALTER TABLE `basket_lineattribute` DISABLE KEYS */;
INSERT INTO `basket_lineattribute` VALUES (97,'GZTHHILTON-06606',57,2),(98,'45',57,1),(99,'GZTHHILTON-06606',58,2),(100,'45',58,1),(101,'GZTHHILTON-06606',59,2),(102,'45',59,1),(103,'GZTHHILTON-06606',60,2),(104,'45',60,1),(105,'GZTHHILTON-06606',61,2),(106,'45',61,1),(107,'GZTHHILTON-06606',62,2),(108,'45',62,1),(109,'GZTHHILTON-06606',63,2),(110,'45',63,1),(129,'GZTHHILTON-06606',73,2),(130,'45',73,1),(131,'GZTHHILTON-06606',74,2),(132,'45',74,1),(133,'GZTHHILTON-06606',75,2),(134,'45',75,1),(137,'GZTHHILTON-06606',77,2),(138,'45',77,1),(139,'GZTHHILTON-06606',78,2),(140,'45',78,1),(141,'GZTHHILTON-06606',79,2),(142,'45',79,1),(145,'GZTHHILTON-06606',81,2),(146,'45',81,1),(147,'GZTHHILTON-06606',82,2),(148,'45',82,1),(149,'GZTHHILTON-06606',83,2),(150,'45',83,1),(151,'GZTHHILTON-06606',84,2),(152,'45',84,1),(163,'GZTHHILTON-06606',90,2),(164,'45',90,1),(169,'GZTHHILTON-06606',93,2),(170,'45',93,1),(171,'GZTHHILTON-06606',94,2),(172,'45',94,1),(173,'GZTHHILTON-06606',95,2),(174,'45',95,1),(175,'GZTHHILTON-06606',96,2),(176,'45',96,1),(177,'GZTHHILTON-06606',97,2),(178,'45',97,1),(181,'GZTHHILTON-06606',99,2),(182,'45',99,1),(183,'GZTHHILTON-06606',100,2),(184,'45',100,1),(187,'GZTHHILTON-06606',102,2),(188,'45',102,1),(197,'GZTHHILTON-06606',107,2),(198,'45',107,1),(245,'GZTHHILTON-06606',131,2),(246,'45',131,1),(247,'GZTHHILTON-06606',132,2),(248,'45',132,1);
/*!40000 ALTER TABLE `basket_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoption`
--

DROP TABLE IF EXISTS `catalogue_attributeoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_attributeoption_group_id_option_7a8f6c11_uniq` (`group_id`,`option`),
  CONSTRAINT `catalogue_attributeo_group_id_3d4a5e24_fk_catalogue` FOREIGN KEY (`group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoption`
--

LOCK TABLES `catalogue_attributeoption` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoption` DISABLE KEYS */;
INSERT INTO `catalogue_attributeoption` VALUES (3,'Large',1),(2,'Medium',1),(1,'Small',1);
/*!40000 ALTER TABLE `catalogue_attributeoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_attributeoptiongroup`
--

DROP TABLE IF EXISTS `catalogue_attributeoptiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_attributeoptiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_attributeoptiongroup`
--

LOCK TABLES `catalogue_attributeoptiongroup` WRITE;
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` DISABLE KEYS */;
INSERT INTO `catalogue_attributeoptiongroup` VALUES (1,'Sizes');
/*!40000 ALTER TABLE `catalogue_attributeoptiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_category`
--

DROP TABLE IF EXISTS `catalogue_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `depth` int(10) unsigned NOT NULL,
  `numchild` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `catalogue_category_name_1f342ac2` (`name`),
  KEY `catalogue_category_slug_9635febd` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_category`
--

LOCK TABLES `catalogue_category` WRITE;
/*!40000 ALTER TABLE `catalogue_category` DISABLE KEYS */;
INSERT INTO `catalogue_category` VALUES (1,'0001',1,2,'Books','','','books'),(2,'00010001',2,1,'Fiction','','','fiction'),(3,'000100010001',3,0,'Computers in Literature','','','computers-in-literature'),(4,'00010002',2,2,'Non-Fiction','','','non-fiction'),(5,'000100020001',3,0,'Essential programming','','','essential-programming'),(6,'000100020002',3,0,'Hacking','','','hacking'),(7,'0002',1,1,'Appliances','','','appliances'),(8,'00020001',2,0,'Household','','','household');
/*!40000 ALTER TABLE `catalogue_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_option`
--

DROP TABLE IF EXISTS `catalogue_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_option`
--

LOCK TABLES `catalogue_option` WRITE;
/*!40000 ALTER TABLE `catalogue_option` DISABLE KEYS */;
INSERT INTO `catalogue_option` VALUES (1,'Unit Duration Minutes','unit_duration_min','Optional'),(2,'SKU Code','sku_code','Required');
/*!40000 ALTER TABLE `catalogue_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product`
--

DROP TABLE IF EXISTS `catalogue_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structure` varchar(10) NOT NULL,
  `upc` varchar(64) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `rating` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `is_discountable` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upc` (`upc`),
  KEY `catalogue_product_slug_c8e2e2b9` (`slug`),
  KEY `catalogue_product_date_updated_d3a1785d` (`date_updated`),
  KEY `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` (`parent_id`),
  KEY `catalogue_product_product_class_id_0c6c5b54_fk_catalogue` (`product_class_id`),
  CONSTRAINT `catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id` FOREIGN KEY (`parent_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_product_product_class_id_0c6c5b54_fk_catalogue` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product`
--

LOCK TABLES `catalogue_product` WRITE;
/*!40000 ALTER TABLE `catalogue_product` DISABLE KEYS */;
INSERT INTO `catalogue_product` VALUES (1,'standalone',NULL,'David\'s book','davids-book','',NULL,'2013-07-18 12:23:29.804000','2013-07-18 12:23:50.102000',1,NULL,1),(2,'standalone','ABC','Other book','other-book','',NULL,'2013-07-18 14:35:52.484000','2013-07-18 14:35:52.484000',1,NULL,1),(3,'child',NULL,'','oscar-t-shirt','',NULL,'2013-12-12 16:34:32.170000','2013-12-12 16:34:32.170000',1,1,NULL),(4,'child',NULL,'','oscar-t-shirt','',NULL,'2013-12-12 17:32:15.016000','2013-12-12 17:32:15.016000',1,1,NULL),(5,'parent',NULL,'commandlinefu T-shirt','commandlinefu-t-shirt','',NULL,'2013-12-13 11:34:21.810000','2013-12-13 11:34:21.810000',1,NULL,1),(6,'child',NULL,'','commandlinefu-t-shirt','',NULL,'2013-12-13 11:37:08.138000','2013-12-13 11:37:08.138000',1,5,NULL),(7,'child',NULL,'','commandlinefu-t-shirt','',NULL,'2013-12-13 11:37:45.834000','2013-12-13 11:37:45.834000',1,5,NULL),(8,'parent',NULL,'Django T-shirt','django-t-shirt','',NULL,'2013-12-13 11:38:15.107000','2013-12-13 11:38:15.107000',1,NULL,1),(9,'child',NULL,'','django-t-shirt','',NULL,'2013-12-13 11:38:49.769000','2013-12-13 11:38:49.769000',1,8,NULL),(10,'child',NULL,'','django-t-shirt','',NULL,'2013-12-13 11:39:12.859000','2013-12-13 11:39:12.859000',1,8,NULL),(11,'child',NULL,'','django-t-shirt','',NULL,'2013-12-13 11:39:53.073000','2013-12-13 11:39:53.073000',1,8,NULL),(12,'standalone','9780060987046','Microserfs','microserfs','A novel of life in the nineties explores the world of computer giant Microsoft, viewing it as a microcosm of modern society Microserfs: a hilarious, fanatically detailed, and oddly moving book about a handful of misfit Microsoft employees ...',NULL,'2017-10-29 10:28:19.330532','2017-10-29 10:28:19.330606',1,NULL,1),(13,'standalone','9780525951575','Freedom','freedom','After the outbreak of a brutal civil war in the American Midwest stemming from the Daemon\'s civilization-rebuilding activities, reluctant Daemon operative Pete Sebeck leads a small band of enlightened humans in an effort to protect the new ...',NULL,'2017-10-29 10:28:19.397041','2017-10-29 10:28:19.397115',1,NULL,1),(14,'standalone','9780345331199','The Robot Novels','the-robot-novels','Lije Baley and R. Daneel Olivaw, a robot, investigate the murders of a famous robotocist, an isolated inhabitant of Solaria, and Jander Panell, an advanced robot',NULL,'2017-10-29 10:28:19.465007','2017-10-29 10:28:19.465083',1,NULL,1),(15,'standalone','9780684833392','Catch-22','catch-22','Presents the contemporary classic depicting the struggles of a United States airman attempting to survive the lunacy and depravity of a World War II airbase.',NULL,'2017-10-29 10:28:19.530952','2017-10-29 10:28:19.531027',1,NULL,1),(16,'standalone','9780450055508','Tron','tron','',NULL,'2017-10-29 10:28:19.599176','2017-10-29 10:28:19.599255',1,NULL,1),(17,'standalone','9780307887436','Cart\'s Top 200 Adult Books for Young Adults: Two Decades in Review','carts-top-200-adult-books-for-young-adults-two-decades-in-review','ISBN: 9780307887436. SPEC, HUM Welcome to the year 2044, a grandly   dystopian future where kids like Wade live a largely virtual existence thanks to   global warming. Wade lives in a kind of ghetto area called the Stacks, for the   stacks of ...',NULL,'2017-10-29 10:28:19.665527','2017-10-29 10:28:19.665601',1,NULL,1),(18,'standalone','9780765319852','Little Brother','little-brother','Zit took the fore. “We seem to have gotten off to a bad start. We identified your son   as someone with a nonstandard public transit usage pattern,as part of a new   proactive enforcement program. When we spot people whose travels are unusual  , ...',NULL,'2017-10-29 10:28:19.732060','2017-10-29 10:28:30.797100',1,NULL,1),(19,'standalone','9780765348272','Old Man\'s War','old-mans-war','A first novel. By the author of The Rough Guide to the Universe. Reprint.',NULL,'2017-10-29 10:28:19.799574','2017-10-29 10:28:19.799652',1,NULL,1),(20,'standalone','9781429963947','Speaker for the Dead','speaker-for-the-dead','In the aftermath of his terrible war, Ender Wiggin disappeared, and a powerful voice arose: The Speaker for the Dead, who told the true story of the Bugger War.',NULL,'2017-10-29 10:28:19.868982','2017-10-29 10:28:19.869067',1,NULL,1),(21,'standalone','9781409903291','The Machine Stops (Dodo Press)','the-machine-stops-dodo-press','He achieved his greatest success with A Passage to India (1924). The novel takes as its subject the relationship between East and West, seen through the lens of India in the later days of the British Raj.',NULL,'2017-10-29 10:28:19.936829','2017-10-29 10:28:19.936906',1,NULL,1),(22,'standalone','9780441013678','Count Zero','count-zero','In the future world of the Sprawl, an urban complex that extends from Boston to Houston, where a sentient computer database known as the Cyberspace matrix dominates humanity\'s fate, a corporate mercenary, awakening in a reconstructed body, ...',NULL,'2017-10-29 10:28:20.002070','2017-10-29 10:28:20.002148',1,NULL,1),(23,'standalone','9780553380965','The diamond age','the-diamond-age','The story of an engineer who creates a device to raise a girl capable of thinking for herself reveals what happens when a young girl of the poor underclass obtains the device.',NULL,'2017-10-29 10:28:20.069168','2017-10-29 10:28:20.069252',1,NULL,1),(24,'standalone','9780345467171','The Shockwave Riders','the-shockwave-riders','',NULL,'2017-10-29 10:28:20.135160','2017-10-29 10:28:20.135233',1,NULL,1),(25,'standalone','9780385533850','Robopocalypse','robopocalypse','Two decades into the future humans are battling for their very survival when a powerful AI computer goes rogue, and all the machines on earth rebel against their human controllers.',NULL,'2017-10-29 10:28:20.201164','2017-10-29 10:28:20.201241',1,NULL,1),(26,'standalone','9780691147543','The Silicon Jungle','the-silicon-jungle','Baluja tells a story about something that could happen to any of us--if you\'re even modestly concerned about information privacy, this is an important book to read.',NULL,'2017-10-29 10:28:20.270381','2017-10-29 10:28:20.270458',1,NULL,1),(27,'standalone','9780307594778','Stieg Larsson\'s Millennium Trilogy Bundle','stieg-larssons-millennium-trilogy-bundle','Stieg Larsson’s Millennium Trilogy is now available in a complete hardcover set.',NULL,'2017-10-29 10:28:20.337375','2017-10-29 10:28:20.337463',1,NULL,1),(28,'standalone','9780425198681','Pattern Recognition','pattern-recognition','Hired to investigate a mysterious video collection that has been appearing on the Internet, market research consultant Cayce Pollard realizes that there is more to the assignment when her computer is hacked. Reprint.',NULL,'2017-10-29 10:28:20.403825','2017-10-29 10:28:20.403894',1,NULL,1),(29,'standalone','9780441016792','WWW','www','Receiving an implant to restore her sight, math genius Caitlin\'s life is changed in ways she could have never imagined when she suddenly begins to see a world beyond reality and an incredible realm that others cannot.',NULL,'2017-10-29 10:28:20.471774','2017-10-29 10:28:20.471851',1,NULL,1),(30,'standalone','9781450556569','A Terrace on the Tower of Babel','a-terrace-on-the-tower-of-babel','Delve deep into its provocative and compelling depths or float along at the surface and enjoy it in either case - this is a story you\'ll never forget!',NULL,'2017-10-29 10:28:20.536895','2017-10-29 10:28:20.536977',1,NULL,1),(31,'standalone','9780552151696','Digital Fortress','digital-fortress','DIGITAL FORTRESS Dan Brown El CORGI BOOKS DIGITAL FORTRESS A   CORGI BOOK: 9780552151696 First publication in Great.',NULL,'2017-10-29 10:28:20.605532','2017-10-29 10:28:20.605609',1,NULL,1),(32,'standalone','9780763622596','Feed','feed','In a future where most people have computer implants in their heads to control their environment, Titus meets Violet, an unusual teenage girl who is in serious trouble.',NULL,'2017-10-29 10:28:20.671443','2017-10-29 10:28:20.671519',1,NULL,1),(33,'standalone','9780804115483','Enigma','enigma','A fictional account of the desperate efforts to break the Nazi\'s Enigma code takes place in a British railway town, a struggle that becomes complicated by the pivotal disappearance of a beautiful cryptographer --The Orlando Sentinel As an ...',NULL,'2017-10-29 10:28:20.736471','2017-10-29 10:28:20.736547',1,NULL,1),(34,'standalone','9780441363957','I Have No Mouth','i-have-no-mouth','The concerns and stylistic evolution of the famed futuristic writer are revealed in seven science fiction tales',NULL,'2017-10-29 10:28:20.803487','2017-10-29 10:28:20.803564',1,NULL,1),(35,'standalone','9780553264654','When Harlie was one','when-harlie-was-one','',NULL,'2017-10-29 10:28:20.875297','2017-10-29 10:28:20.875373',1,NULL,1),(36,'standalone','9780446364966','The Turing Option','the-turing-option','The world\'s foremost authority on artificial intelligence is shot by terrorists, and it is up to a brilliant surgeon to reconstruct the scientist\'s brain using the research he pioneered',NULL,'2017-10-29 10:28:20.940259','2017-10-29 10:28:20.940336',1,NULL,1),(37,'standalone','9780312423131','Galatea 2.2','galatea-22','The protagonist, a Humanist-in-Residence at the center for Advanced Scientific Research, gets involved with a project to train a machine to pass a comprehensive exam in English literature--and with the degree candidate against whom the ...',NULL,'2017-10-29 10:28:21.005728','2017-10-29 10:28:21.005817',1,NULL,1),(38,'standalone','9780982792827','Sherry and Narcotics','sherry-and-narcotics','',NULL,'2017-10-29 10:28:21.073325','2017-10-29 10:28:21.073407',1,NULL,1),(39,'standalone','9780156032971','Foucault\'s Pendulum','foucaults-pendulum','. . A virtuoso performance.\" --\"San Francisco\"\" Chronicle\" A literary joke plunges its creators into mortal danger in this captivating intellectual thriller by celebrated author Umberto Eco.',NULL,'2017-10-29 10:28:21.139590','2017-10-29 10:28:21.139665',1,NULL,1),(40,'standalone','9780553575378','Excession','excession','A diplomat is sent to investigate the sudden disappearance of a star older than the universe, requiring him to steal the soul of the long-deceased starship captain who first encountered the star and bring her back to life. Reprint.',NULL,'2017-10-29 10:28:21.207838','2017-10-29 10:28:21.207913',1,NULL,1),(41,'standalone','9780812524826','Slant','slant','SLANT, Greg Bearís sequel to the popular QUEEN OF ANGELS, ìshows that Bear is one of our very best, most innovative, speculative writers.î óNew York Daily News ìTense and fast-paced, beautifully written with complex, engaging ...',NULL,'2017-10-29 10:28:21.274362','2017-10-29 10:28:21.274437',1,NULL,1),(42,'standalone','9780425074657','Destination Void','destination-void','',NULL,'2017-10-29 10:28:21.342620','2017-10-29 10:28:21.342696',1,NULL,1),(43,'standalone','9780425074671','The Jesus Incident','the-jesus-incident','',NULL,'2017-10-29 10:28:21.410094','2017-10-29 10:28:21.410171',1,NULL,1),(44,'standalone','9781425470890','The Adding Machine','the-adding-machine','',NULL,'2017-10-29 10:28:21.476163','2017-10-29 10:28:21.476240',1,NULL,1),(45,'standalone','9780375724503','Ghostwritten','ghostwritten','The lives of nine total strangers from nine different countries become intertwined in a strange series of circumstances.',NULL,'2017-10-29 10:28:21.544472','2017-10-29 10:28:21.544547',1,NULL,1),(46,'standalone','9780812536362','Rainbows End','rainbows-end','In a near-future western civilization that is threatened by corruptive practices within its technologically advanced information networks, a recovered Alzheimer\'s victim, his military son and daughter-in-law, and his middle school-age ...',NULL,'2017-10-29 10:28:21.610513','2017-10-29 10:28:21.610590',1,NULL,1),(47,'standalone','9780452286511','Transmission','transmission','Lonely, naïve, and insecure, Indian computer programmer Arjun finds his life and security destroyed when he is fired and, in order to keep his job and the woman he loves, unleashes a mischievous and destructive virus that wreaks havoc on ...',NULL,'2017-10-29 10:28:21.676566','2017-10-29 10:28:21.676652',1,NULL,1),(48,'standalone','9780881848120','Lingo','lingo','When computer programming genius Brewster Billings invents a program that enables him to communicate with Lingo, his PC, he is ill-prepared for Lingo\'s growing hunger for power, as it taps into the country\'s most powerful computer networks',NULL,'2017-10-29 10:28:21.745044','2017-10-29 10:28:21.745121',1,NULL,1),(49,'standalone','9780345475824','Star Wars trilogy','star-wars-trilogy','A collector\'s edition brings together the three original, complete Star Wars novels in a single volume that includes Star Wars: A New Hope, Star Wars: The Empire Strikes Back, and Star Wars: Return of the Jedi.',NULL,'2017-10-29 10:28:21.811716','2017-10-29 10:28:21.811801',1,NULL,1),(50,'standalone','9781416533214','A Hymn Before Battle','a-hymn-before-battle','With Earth in the path of the rapacious Posleen, the peaceful and friendly races of the Galactic Federation offer their resources to help the backward Terrans--for a price.',NULL,'2017-10-29 10:28:21.882280','2017-10-29 10:28:21.882359',1,NULL,1),(51,'standalone','9781419669972','Hack','hack','His characters are rich and engaging, and his prose is razor sharp. This is a wonderful book for any computer fanatic or any young person who enjoys a great read.',NULL,'2017-10-29 10:28:21.949659','2017-10-29 10:28:21.949766',1,NULL,1),(52,'standalone','9780375700514','Exegesis','exegesis','Invented by Alice Lu in her Standford lab, \"edgar,\" an artificial intelligence program, grows into something far beyond Alice\'s--or anyone eles\'s--control, in a novel that explores the many implications of the technology we create',NULL,'2017-10-29 10:28:22.018984','2017-10-29 10:28:22.019069',1,NULL,1),(53,'standalone','9781575660813','Back Slash','back-slash','When a cyber terrorist seizes control of the Worldwide Information Network, computer crimes special agent Luanne Russell hunts down a second computer criminal on the run and challenges him to confront the terrorist.',NULL,'2017-10-29 10:28:22.085499','2017-10-29 10:28:22.085576',1,NULL,1),(54,'standalone','9780307430083','Vulcan\'s Hammer','vulcans-hammer','With breathtaking insight, he utilizes vividly unfamiliar worlds to evoke the hauntingly and hilariously familiar in our society and ourselves. From the Trade Paperback edition.',NULL,'2017-10-29 10:28:22.156162','2017-10-29 10:28:22.156368',1,NULL,1),(55,'standalone','9781568582474','The Hacker and the Ants','the-hacker-and-the-ants','An \"innocent\" computer hacker suddenly finds himself on the most wanted list when his computer becomes the source of the worst computer virus in history--a virus he had nothing to do with. Original.',NULL,'2017-10-29 10:28:22.224294','2017-10-29 10:28:22.224370',1,NULL,1),(56,'standalone','9781607012115','The Ware Tetralogy','the-ware-tetralogy','A collection of four science fiction works includes \"Software,\" where rebel robots bring immortality to their human creator by eating his brain, and \"Wetware,\" where robots begin to build their own race of humans.',NULL,'2017-10-29 10:28:22.292366','2017-10-29 10:28:22.292445',1,NULL,1),(57,'standalone','9780752837451','Host','host','Brilliant scientist Joe Messenger believes that people can be made to live for ever.',NULL,'2017-10-29 10:28:22.359388','2017-10-29 10:28:22.359462',1,NULL,1),(58,'standalone','9780714530338','Computer One','computer-one','',NULL,'2017-10-29 10:28:22.426809','2017-10-29 10:28:22.426885',1,NULL,1),(59,'standalone','9780593018958','Weapon','weapon','',NULL,'2017-10-29 10:28:22.492821','2017-10-29 10:28:22.492897',1,NULL,1),(60,'standalone','9781416507789','The Cuckoo\'s Egg','the-cuckoos-egg','Updated with a new afterword, a true-life account of computer espionage tells of a year-long single-handed hunt for a computer thief known as \"Hunter,\" a hacker who stole sensitive security and military information from American computer ...',NULL,'2017-10-29 10:28:22.558977','2017-10-29 10:28:29.961939',1,NULL,1),(61,'standalone','9780425137482','Solo','solo','When Solo--the government\'s secret weapon--abandons his mission in Nicaragua and flies to New York City, the government sets out to destroy him. By the author of Weapon. Reprint.',NULL,'2017-10-29 10:28:22.627413','2017-10-29 10:28:22.627492',1,NULL,1),(62,'standalone','9780486419268','R.U.R. (Rossum\'s Universal Robots)','rur-rossums-universal-robots','Must-read play looks to a future in which all workers are automatons. They revolt when they acquire souls (i.e., when they gain the ability to hate) and the resulting catastrophe make for a powerful theatrical experience.',NULL,'2017-10-29 10:28:22.692915','2017-10-29 10:28:22.692991',1,NULL,1),(63,'standalone','9780786123322','The Humanoids','the-humanoids','A classic science fiction novel features humanoids spreading throughout the galaxy, threatening to stifle all human endeavor, and the hidden group of rebels who try to stem the humanoid tide, if it is not already too late',NULL,'2017-10-29 10:28:22.759311','2017-10-29 10:28:22.759387',1,NULL,1),(64,'standalone','9780812531930','The Ai War','the-ai-war','The dreaded AI\'s have regrouped in an alternate universe and are preparing to launch their invincible fleet.',NULL,'2017-10-29 10:28:22.827479','2017-10-29 10:28:22.827558',1,NULL,1),(65,'standalone','9781556342332','Gurps Robots','gurps-robots','',NULL,'2017-10-29 10:28:22.901650','2017-10-29 10:28:22.901733',1,NULL,1),(66,'standalone','9781466207608','Why Is Unit 142857 Sad?','why-is-unit-142857-sad','The story is about a robot who achieved consciousness at 3:34 pm and fell in love by 4:00 pm with Ellen, a brilliant and beautiful woman from the team that had programmed the robot.',NULL,'2017-10-29 10:28:22.968419','2017-10-29 10:28:22.968501',1,NULL,1),(67,'standalone','9780553290028','This Perfect Day','this-perfect-day','Chip fights for freedom from a mechanized, chemically controlled world which stifles nature and human individuality',NULL,'2017-10-29 10:28:23.036286','2017-10-29 10:28:23.036368',1,NULL,1),(68,'standalone','9780252072239','March Of The Machines','march-of-the-machines','Now available for the first time in America, March of the Machines is part history of robotics, part futurism.',NULL,'2017-10-29 10:28:23.106177','2017-10-29 10:28:23.106701',1,NULL,1),(69,'standalone','9780886822330','All the Troubles of the World','all-the-troubles-of-the-world','Multivac, the gigantic computer that controls the entire world and can even predict the probabilities of potential crimes before they happen, suddenly announces that someone is plotting to destroy Multivac.',NULL,'2017-10-29 10:28:23.175121','2017-10-29 10:28:23.175196',1,NULL,1),(70,'standalone','9780595297634','Bugs','bugs','Ten. The memo began: to: T. J. Heller, Director NCDC from: Sheldon Byers,   Security Liaison re: Inventory of Federally Funded Research in Paranormal   Phenomena It had been delivered to Heller\'s office in a sealed envelope marked \'  Strictly ...',NULL,'2017-10-29 10:28:23.245436','2017-10-29 10:28:23.245514',1,NULL,1),(71,'standalone','9780395860014','Love','love','Spackle. Dialogue. Beck studied for MCATs and drank beer. It was Italian beers   that week, so he had a Raffo or a Poretti. While he worked, he watched that   Grundig portable he\'d rented with Grandma Beckett\'s latest check. He\'d just   picked it ...',NULL,'2017-10-29 10:28:23.310681','2017-10-29 10:28:23.310763',1,NULL,1),(72,'standalone','9780575061897','Hard Questions','hard-questions','When scientist Clare Conway travels to Arizona for a conference, she finds herself on the run from a religious cult, ruthless computer spies, and the government, of all whom think she knows the secrets of the Quantum computer, a device that ...',NULL,'2017-10-29 10:28:23.376194','2017-10-29 10:28:23.376270',1,NULL,1),(73,'standalone','9780345275172','The Two Faces of Tomorrow','the-two-faces-of-tomorrow','',NULL,'2017-10-29 10:28:23.443452','2017-10-29 10:28:23.443529',1,NULL,1),(74,'standalone','9780743421928','Look to Windward','look-to-windward','A Chelgrian emissary is sent to the Masaq\' Orbital to bring Ziller, a famous but reclusive Chelgrian composer, home, on a mission that also has a top-secret purpose that will take him on a haunting odyssey into his own past and into ...',NULL,'2017-10-29 10:28:23.510618','2017-10-29 10:28:23.510707',1,NULL,1),(75,'standalone','9780446361309','Queen of Angels','queen-of-angels','In twenty-first-century Los Angeles, three dissimilar sleuths--therapist Martin Burke, ambitious cop Mary Choy, and Richard Fettle, the killer\'s offbeat colleague--investigate diverse reasons why poet Emanuel Goldsmith would senselessly ...',NULL,'2017-10-29 10:28:23.577676','2017-10-29 10:28:23.577755',1,NULL,1),(76,'standalone','9780671559168','Valentina','valentina','Valentina, an artificial intelligence program come to life, and her creator, Celeste Hackett, a shy college student and computer genius, are menaced by an unscrupulous lawyer and two computer wizards hired to destroy Valentina',NULL,'2017-10-29 10:28:23.647663','2017-10-29 10:28:23.647739',1,NULL,1),(77,'standalone','9781935554158','Richard Yates','richard-yates','\"Richard Yates is named after real-life writer Richard Yates, but it has nothing to do with him.',NULL,'2017-10-29 10:28:23.713422','2017-10-29 10:28:23.713497',1,NULL,1),(78,'standalone','9780552088046','The age of the pussyfoot','the-age-of-the-pussyfoot','',NULL,'2017-10-29 10:28:23.786702','2017-10-29 10:28:23.786787',1,NULL,1),(79,'standalone','9781857988369','Stand on Zanzibar','stand-on-zanzibar','Two roommates-one a scientist and the other a potential killer-are the subject of this futuristic novel. Also use: Shockwave Rider (1984).',NULL,'2017-10-29 10:28:23.861403','2017-10-29 10:28:23.861483',1,NULL,1),(80,'standalone','9780575601604','Deathstalker','deathstalker','Owen Deathstalker, last of his line, is a quiet man, a historian, remote from the stench of corruption and intrigue surrounding the Iron Throne at the heat of the galaxy-spanning, tyrannical Empire.And then, inexplicably, Deathstalker is ...',NULL,'2017-10-29 10:28:23.927914','2017-10-29 10:28:23.928000',1,NULL,1),(81,'standalone','9781345004373','Pilgrimage to Earth','pilgrimage-to-earth','',NULL,'2017-10-29 10:28:23.995793','2017-10-29 10:28:23.995872',1,NULL,1),(82,'standalone','9780380816033','The Big U','the-big-u','Casimir Radon\'s first year at American Megaversity turns out completely different than he had imagined, with bizarre factions, cults, and feuds on campus, in a new edition of the satirical debut novel by the author of Cryptonomicon.',NULL,'2017-10-29 10:28:24.062879','2017-10-29 10:28:24.062963',1,NULL,1),(83,'standalone','9780671720735','Me','me','',NULL,'2017-10-29 10:28:24.128846','2017-10-29 10:28:24.128923',1,NULL,1),(84,'standalone','9781857987638','The City and the Stars','the-city-and-the-stars','Men had built cities before, but never such a city as Diaspar; for millennia its protective dome shutout the creeping decay and danger of the world outside.',NULL,'2017-10-29 10:28:24.196608','2017-10-29 10:28:24.196686',1,NULL,1),(85,'standalone','9780671559700','Adolescence of P-1 (R)','adolescence-of-p-1-r','Born to a rather beserk, if brilliant, programmer, a computer program has managed to escape its home computer, infiltrate others, and reach adolescence when the Pentagon finally realizes that something is upsetting their secret computer ...',NULL,'2017-10-29 10:28:24.264329','2017-10-29 10:28:24.264403',1,NULL,1),(86,'standalone','9780812580860','Ariel','ariel','Computer whiz kid Rusty Harrington establishes a very special relationship with ARIEL, his father\'s top-secret artificial intelligence project, in a story of romance, industrial espionage, friendship, and state-of-the-art computer ...',NULL,'2017-10-29 10:28:24.332002','2017-10-29 10:28:24.332080',1,NULL,1),(87,'standalone','9780131103627','The C Programming Language','the-c-programming-language','As we said in the first preface to the first edition, C \"wears well as one\'s experience with it grows.\" With a decade more experience, we still feel that way. We hope that this book will help you to learn C and use it well.',NULL,'2017-10-29 10:28:24.400801','2017-10-29 10:28:24.400877',1,NULL,1),(88,'standalone','9780201616224','Alfresco 3 Web Services','alfresco-3-web-services','... <id>urn:isbn:9780201616224</id><updated>20100114T14:20:24+0100</  updated> <title>ThePragmaticProgrammer</title><author><name>DavidThomas  </name></author> <author><name>Andrew Hunt</name></author> <category ...',NULL,'2017-10-29 10:28:24.484048','2017-10-29 10:28:24.484123',1,NULL,1),(89,'standalone','9780201633610','Design Patterns','design-patterns','With Design Patterns as your guide, you will learn how these important patterns fit into the software development process, and how you can leverage them to solve your own design problems most efficiently.',NULL,'2017-10-29 10:28:24.551977','2017-10-29 10:28:24.552052',1,NULL,1),(90,'standalone','9780262510875','Structure and Interpretation of Computer Programs','structure-and-interpretation-of-computer-programs','This long-awaited revision contains changesthroughout the text.There are new implementations of most of the major programming systems in thebook, including the interpreters and compilers, and the authors have incorporated many small ...',NULL,'2017-10-29 10:28:24.619852','2017-10-29 10:28:24.619928',1,NULL,1),(91,'standalone','9780201485677','Refactoring','refactoring','improving the design of existing code M. Fowler. Object Technology/Software   Engineering As the application of object technology— particularly the Java   programming language— has become commonplace, a new problem has   emerged to ...',NULL,'2017-10-29 10:28:24.685907','2017-10-29 10:28:24.685985',1,NULL,1),(92,'standalone','9780201485417','The Art of Computer Programming: Sorting and searching','the-art-of-computer-programming-sorting-and-searching','Check out the boxed set that brings together Volumes 1 - 4A in one elegant case, and offers the purchaser a $50 discount off the price of buying the four volumes individually.',NULL,'2017-10-29 10:28:24.754306','2017-10-29 10:28:24.754383',1,NULL,1),(93,'standalone','9780201835953','The mythical man-month','the-mythical-man-month','These essays draw from his experience as project manager for the IBM System/360 computer family and then for OS/360, its massive software system.',NULL,'2017-10-29 10:28:24.821300','2017-10-29 10:28:24.821392',1,NULL,1),(94,'standalone','9780735619678','Code Complete, Second Edition','code-complete-second-edition','Features the best practices in the art and science of constructing software--topics include design, applying good techniques to construction, eliminating errors, planning, managing construction activities, and relating personal character to ...',NULL,'2017-10-29 10:28:24.891754','2017-10-29 10:28:24.891830',1,NULL,1),(95,'standalone','9780132350884','Clean Code','clean-code','Looks at the principles and clean code, includes case studies showcasing the practices of writing clean code, and contains a list of heuristics and \"smells\" accumulated from the process of writing clean code.',NULL,'2017-10-29 10:28:24.962194','2017-10-29 10:28:24.962283',1,NULL,1),(96,'standalone','9780201700732','The C++ programming language','the-c-programming-language','More than three-quarters of a million programmers have benefited from this book in all of its editions Written by Bjarne Stroustrup, the creator of C++, this is the world\'s most trusted and widely read book on C++.',NULL,'2017-10-29 10:28:25.027747','2017-10-29 10:28:25.027823',1,NULL,1),(97,'standalone','9780596517748','JavaScript: The Good Parts','javascript-the-good-parts','If you develop sites or applications for the Web, this book is an absolute must.',NULL,'2017-10-29 10:28:25.095325','2017-10-29 10:28:25.095404',1,NULL,1),(98,'standalone','9780201100884','Compilers, principles, techniques, and tools','compilers-principles-techniques-and-tools','This book provides the foundation for understanding the theory and pracitce of compilers.',NULL,'2017-10-29 10:28:25.168747','2017-10-29 10:28:25.168829',1,NULL,1),(99,'standalone','9780130313584','Современные операционные системы','sovremennye-operatsionnye-sistemy','NEW-Over 200 references to books and papers published since the first edition. NEW-The Web site for this book contains PowerPoint slides, simulators, figures in various formats, and other teaching aids.',NULL,'2017-10-29 10:28:25.241636','2017-10-29 10:28:25.241729',1,NULL,1),(100,'standalone','9780137903955','Artificial Intelligence','artificial-intelligence','All of this is available at: \"aima.cs.berkeley.edu\"',NULL,'2017-10-29 10:28:25.312439','2017-10-29 10:28:25.312514',1,NULL,1),(101,'standalone','9780262011532','Structure and Interpretation of Computer Programs','structure-and-interpretation-of-computer-programs','Structure and Interpretation of Computer Programs has had a dramatic impact on computer science curricula over the past decade. This long-awaited revision contains changes throughout the text.',NULL,'2017-10-29 10:28:25.377115','2017-10-29 10:28:25.377192',1,NULL,1),(102,'standalone','9780139376818','The UNIX programming environment','the-unix-programming-environment','Most of the book is devoted to discussions of individual tools, but throughout run the themes of combining programs and of using programs to build programs--emphasizing how they fit in the environment.',NULL,'2017-10-29 10:28:25.443973','2017-10-29 10:28:25.444050',1,NULL,1),(103,'standalone','9780596514983','Real World Haskell','real-world-haskell','With this book, you will: Understand the differences between procedural and functional programming Learn the features of Haskell, and how to use it to develop useful programs Interact with filesystems, databases, and network services Write ...',NULL,'2017-10-29 10:28:25.511592','2017-10-29 10:28:25.511668',1,NULL,1),(104,'standalone','9780262560993','Little LISPer','little-lisper','Daniel Paul Friedman. True: as long as we use the names consistently, we are   just fine. And mk-length is a far more equal name than length. If we use a name   like mk-length, it is a constant reminder that the first argument to mk-length is ...',NULL,'2017-10-29 10:28:25.579574','2017-10-29 10:28:25.579651',1,NULL,1),(105,'standalone','9780596007126','Head First Design Patterns','head-first-design-patterns','Meanwhile,. back. at. the. PizzaStore. The design for the PizzaStore is really   shaping up: it\'s got a flexible framework and it does a good job of adhering to   design principles. Now, the key to Objectville Pizza\'s success has always been   fresh, ...',NULL,'2017-10-29 10:28:25.643903','2017-10-29 10:28:25.643976',1,NULL,1),(106,'standalone','9780131177055','Working Effectively With Legacy Code','working-effectively-with-legacy-code','In this book, Michael Feathers offers start-to-finish strategies for working more effectively with large, untested legacy code bases.',NULL,'2017-10-29 10:28:25.709285','2017-10-29 10:28:25.709361',1,NULL,1),(107,'standalone','9780262062183','How to design programs','how-to-design-programs','an introduction to programming and computing Matthias Felleisen. The   abstraction: Next we replace the contents of corresponding pairs of boxes with   new names and add these names to the parameter list. For example, if there are   three pairs ...',NULL,'2017-10-29 10:28:25.774297','2017-10-29 10:28:25.774388',1,NULL,1),(108,'standalone','9780201615869','La práctica de la programación','la-practica-de-la-programacion','Rob Pike. probably need to make changes to the main body of the code, and if   you edit a copy, before long you will have divergent versions. As much as   possible, there should only be a single source for a program; if you find you need   to ...',NULL,'2017-10-29 10:28:25.844748','2017-10-29 10:28:25.844825',1,NULL,1),(109,'standalone','9780974514055','Programming Ruby','programming-ruby','A tutorial and reference to the object-oriented programming language for beginning to experienced programmers, updated for version 1.8, describes the language\'s structure, syntax, and operation, and explains how to build applications.',NULL,'2017-10-29 10:28:25.914546','2017-10-29 10:28:25.914623',1,NULL,1),(110,'standalone','9780596002817','Learning Python','learning-python','This edition of Learning Python puts you in the hands of two expert teachers, Mark Lutz and David Ascher, whose friendly, well-structured prose has guided many a programmer to proficiency with the language.',NULL,'2017-10-29 10:28:25.980644','2017-10-29 10:28:25.980717',1,NULL,1),(111,'standalone','9780134900124','UNIX Network Programming','unix-network-programming','Interprocess Communications.',NULL,'2017-10-29 10:28:26.046293','2017-10-29 10:28:26.046370',1,NULL,1),(112,'standalone','9780321503626','Growing Object-Oriented Software, Guided by Tests','growing-object-oriented-software-guided-by-tests','Along the way, the book systematically addresses challenges that development teams encounter with TDD—from integrating TDD into your processes to testing your most difficult features.',NULL,'2017-10-29 10:28:26.112138','2017-10-29 10:28:26.112219',1,NULL,1),(113,'standalone','9780321146533','Test-Driven Development','test-driven-development','By Example. The Addison-Wesley Signature Series provides readers with   practical and authoritative information on the latest trends in modern technology   for computer professionals. The series is based on one simple premise: great   books ...',NULL,'2017-10-29 10:28:26.178153','2017-10-29 10:28:26.178232',1,NULL,1),(114,'standalone','9780974514048','Ship it!','ship-it','Experienced practitioners Richardson and Gwaltney give inside information on the practicalities of managing a development project, whether from the aforesaid garage or from the largest cube farm in th.',NULL,'2017-10-29 10:28:26.245676','2017-10-29 10:28:26.245752',1,NULL,1),(115,'standalone','9780133708752','ANSI Common Lisp','ansi-common-lisp','Consisting of three appendices, the summary half of the book gives source code for a selection of widely used Common Lisp operators, with definitions that offer a comprehensive explanation of the language and provide a rich source of real ...',NULL,'2017-10-29 10:28:26.310813','2017-10-29 10:28:26.310887',1,NULL,1),(116,'standalone','9780596000271','Programming Perl','programming-perl','On the other hand, the best managers also understand the job their employees   are trying to do. The same is true of pattern matching in Perl. The more   thoroughly you understand of how Perl goes about the task of matching any   particular ...',NULL,'2017-10-29 10:28:26.378796','2017-10-29 10:28:26.378871',1,NULL,1),(117,'standalone','9780321334879','Effective Java','effective-java','Each chapter in the book consists of several “items” presented in the form of a short, standalone essay that provides specific advice, insight into Java platform subtleties, and outstanding code examples.',NULL,'2017-10-29 10:28:26.446408','2017-10-29 10:28:26.446526',1,NULL,1),(118,'standalone','9780262033848','Algorithms','algorithms','A new edition of the essential text and professional reference, with substantial newmaterial on such topics as vEB trees, multithreaded algorithms, dynamic programming, and edge-baseflow.',NULL,'2017-10-29 10:28:26.511566','2017-10-29 10:28:26.511648',1,NULL,1),(119,'standalone','9780976694007','Agile Web Development Whit Rails','agile-web-development-whit-rails','Provides information on creating Web-based applications.',NULL,'2017-10-29 10:28:26.579112','2017-10-29 10:28:26.579190',1,NULL,1),(120,'standalone','9780131495050','Xunit Test Patterns','xunit-test-patterns','The definitive guide to writing tests for todays popular XUnit test automation frameworks, this guide by a renowned expert introduces more than 120 proven patterns for making tests easier to write, understand, and maintain.',NULL,'2017-10-29 10:28:26.643124','2017-10-29 10:28:26.643200',1,NULL,1),(121,'standalone','9780135974445','Agile software development','agile-software-development','Taking on a global orientation to software programming, this practical guide offers scores of tested methods for using the C++ programming language with object-oriented design techniques for creating a variety of applications and solving a ...',NULL,'2017-10-29 10:28:26.709359','2017-10-29 10:28:26.709435',1,NULL,1),(122,'standalone','9780596101053','Learning Perl','learning-perl','Shows how to write, debug, and run a Perl program, describes CGI scripting and data manipulation, and describes scalar values, basic operators, and associative arrays.',NULL,'2017-10-29 10:28:26.775506','2017-10-29 10:28:26.775583',1,NULL,1),(123,'standalone','9780201433074','Advanced programming in the Unix environment','advanced-programming-in-the-unix-environment','This book includes lots of realistic examples, and I find it quite helpful when I have systems programming tasks to do.\" -- RS/Magazine \"This is the definitive reference book for any serious or professional UNIX systems programmer.',NULL,'2017-10-29 10:28:26.845183','2017-10-29 10:28:26.845260',1,NULL,1),(124,'standalone','9780534950972','Introduction To The Theory Of Computation','introduction-to-the-theory-of-computation','This market leading text on computational theory provides a mathematical treatment of computer science theory designed around theorems and proofs.',NULL,'2017-10-29 10:28:26.912184','2017-10-29 10:28:26.912267',1,NULL,1),(125,'standalone','9781590593899','Joel on Software','joel-on-software','The Guerilla Guide to Interviewing Incentive Pay Considered Harmful Top Five (Wrong) Reasons You Don’t Have Testers Human Task Switches Considered Harmful Things You Should Never Do, Part One The Iceberg Secret, Revealed The Law of Leaky ...',NULL,'2017-10-29 10:28:26.978063','2017-10-29 10:28:26.978137',1,NULL,1),(126,'standalone','9780205313426','Elements of Style','elements-of-style','The Elements of Style is a classic work which is intended for use in English courses in which the practice of composition is combined with the study of literature.',NULL,'2017-10-29 10:28:27.043573','2017-10-29 10:28:27.043654',1,NULL,1),(127,'standalone','9781934356371','The Rspec Book','the-rspec-book','The RSpec Book will introduce you to RSpec, Cucumber, and a number of other tools that make up the Ruby BDD family.',NULL,'2017-10-29 10:28:27.107083','2017-10-29 10:28:27.107174',1,NULL,1),(128,'standalone','9780136291558','Object-oriented software construction','object-oriented-software-construction','This is, quite simply, the definitive reference on the most important development in software technology for the last 20 years: object-orientation.A whole generation was introduced to object technology through the first edition of this book ...',NULL,'2017-10-29 10:28:27.171080','2017-10-29 10:28:27.171162',1,NULL,1),(129,'standalone','9780201889543','The C++ programming language','the-c-programming-language','Written by the inventor of the language, this book is the defining text on the language that has become central to software development over the past five years.',NULL,'2017-10-29 10:28:27.236815','2017-10-29 10:28:27.236898',1,NULL,1),(130,'standalone','9780201342758','Haskell','haskell','The second edition of Haskell: The Craft of Functional Programmingis essential reading for beginners to functional programming and newcomers to the Haskell programming language.',NULL,'2017-10-29 10:28:27.306136','2017-10-29 10:28:27.306237',1,NULL,1),(131,'standalone','9780596529864','Learning Ruby','learning-ruby','You\'ll find examples on nearly every page of this book that you can imitate and hack. Briefly, this book: Outlines many of the most important features of Ruby Demonstrates how to use conditionals, and how to manipulate strings in Ruby.',NULL,'2017-10-29 10:28:27.373178','2017-10-29 10:28:27.373278',1,NULL,1),(132,'standalone','9780672328794','Sams Teach Yourself JavaScript in 24 Hours','sams-teach-yourself-javascript-in-24-hours','The book is written in a clear and personable style with an extensive use of practical, complete examples. It also includes material on the latest developments in JavaScript and web scripting.',NULL,'2017-10-29 10:28:27.440447','2017-10-29 10:28:27.440522',1,NULL,1),(133,'standalone','9780672326721','Php And Mysql Web Development','php-and-mysql-web-development','Explains how to access and create MySQL databases through PHP scripting, including authentication, network connectivity, session management, and content customization.',NULL,'2017-10-29 10:28:27.506126','2017-10-29 10:28:27.506205',1,NULL,1),(134,'standalone','9780672323492','Sams teach yourself MySQL in 24 hours','sams-teach-yourself-mysql-in-24-hours','Demonstrates the features of the SQL-based relational database system, covering configuration, integration with third-party tools, and Web page generation as well as column types, operators, functions, and syntax.',NULL,'2017-10-29 10:28:27.572072','2017-10-29 10:28:27.572153',1,NULL,1),(135,'standalone','9780201703535','Accelerated C++','accelerated-c','This book describes real problems and solutions, not just language features. It covers the language and standard library together. \"This is a first-rate introductory book that takes a practical approach to solving problems using C++.',NULL,'2017-10-29 10:28:27.636253','2017-10-29 10:28:27.636338',1,NULL,1),(136,'standalone','9780130810816','UNIX Network Programming: Interprocess communications','unix-network-programming-interprocess-communications','8108A-2 Don\'t miss the rest of the series! Vol. 1, Networking APIs: Sockets and XTI Vol. 3, Applications (forthcoming) The only guide to UNIX(r) interprocess communications you\'ll ever need!',NULL,'2017-10-29 10:28:27.703261','2017-10-29 10:28:27.703342',1,NULL,1),(137,'standalone','9780961392147','Library Resources & Technical Services','library-resources-technical-services','',NULL,'2017-10-29 10:28:27.770264','2017-10-29 10:28:27.770349',1,NULL,1),(138,'standalone','9780767907699','Slack','slack','Argues that the \"lean and mean\" corporate model of workaholism and downsizing is proving counterproductive, explaining how companies can implement downtime, promote flexibility, and foster creativity as part of realizing increased revenues.',NULL,'2017-10-29 10:28:27.841294','2017-10-29 10:28:27.841370',1,NULL,1),(139,'standalone','9780137081073','The Clean Coder','the-clean-coder','Readers will come away from this book understanding How to tell the difference between good and bad codeHow to write good code and how to transform bad code into good codeHow to create good names, good functions, good objects, and good ...',NULL,'2017-10-29 10:28:27.908928','2017-10-29 10:28:27.909004',1,NULL,1),(140,'standalone','9780978739218','Release It!','release-it','Provides information on ways to effectively design and release an application.',NULL,'2017-10-29 10:28:27.974495','2017-10-29 10:28:27.974654',1,NULL,1),(141,'standalone','9780471578147','Assembly Language','assembly-language','Destined to become a classic, this book weaves a careful, patient explanation of assembly language instructions and programming methods with descriptions of the CPU and memory.',NULL,'2017-10-29 10:28:28.040821','2017-10-29 10:28:28.040899',1,NULL,1),(142,'standalone','9781934356852','Lean from the Trenches','lean-from-the-trenches','From start to finish, readers will see what it takes to develop a successful agile project.',NULL,'2017-10-29 10:28:28.104929','2017-10-29 10:28:28.105009',1,NULL,1),(143,'standalone','9780557030798','Reviewing C++','reviewing-c','A simple C++ review book and your best guide to learning C++. This book covers the most seen topics in introductory programming courses such as conditions, loops, arrays, classes and pointers.',NULL,'2017-10-29 10:28:28.170935','2017-10-29 10:28:28.171016',1,NULL,1),(144,'standalone','9780764543654','Beginning Java 2 SDK 1.4 edition','beginning-java-2-sdk-14-edition','What this book will teach you This book will teach you all you need to know to start programming in Java. This latest edition of my series teaches Java with the Java 2 SDK 1.4; a free Software Development Kit for creating Java applications.',NULL,'2017-10-29 10:28:28.235830','2017-10-29 10:28:28.235911',1,NULL,1),(145,'standalone','9781848000698','The Algorithm Design Manual','the-algorithm-design-manual','Expanding on the highly successful formula of the first edition, the book now serves as the primary textbook of choice for any algorithm design course while maintaining its status as the premier practical reference guide to algorithms.NEW: ...',NULL,'2017-10-29 10:28:28.302560','2017-10-29 10:28:28.302645',1,NULL,1),(146,'standalone','9781934356586','The Agile Samurai','the-agile-samurai','Looks at the principles of agile software development, covering such topics as project inception, estimation, iteration management, unit testing, refactoring, test-driven development, and continuous integration.',NULL,'2017-10-29 10:28:28.367490','2017-10-29 10:28:28.367570',1,NULL,1),(147,'standalone','9780262062794','Essentials of programming languages','essentials-of-programming-languages','A new edition of a textbook that provides students with a deep, working understanding of the essential concepts of programming languages, completely revised, with significant new material.',NULL,'2017-10-29 10:28:28.432414','2017-10-29 10:28:28.432497',1,NULL,1),(148,'standalone','9780672327933','Sams teach yourself Perl in 24 hours','sams-teach-yourself-perl-in-24-hours','Offers a tutorial explaining how to use Perl scripts and modules to create such CGI Web applications as data collection, shopping cart, server push, and e-mail forms.',NULL,'2017-10-29 10:28:28.499305','2017-10-29 10:28:28.499383',1,NULL,1),(149,'standalone','9780133262247','C','c','This essential manual introduces the notion of \"Clean C\", writing C code that can be compiled as a C++ program, and incorporates the ISO C Amendment 1 (1994) which specifies new facilities for writing portable, international programs in C.',NULL,'2017-10-29 10:28:28.564547','2017-10-29 10:28:28.564630',1,NULL,1),(150,'standalone','9780201379235','STL tutorial and reference guide','stl-tutorial-and-reference-guide','The generic algorithms chapter with so many more examples than in the previous edition is delightful! The examples work cumulatively to give a sense of comfortable competence with the algorithms, containers, and iterators used.',NULL,'2017-10-29 10:28:28.632345','2017-10-29 10:28:28.632434',1,NULL,1),(151,'standalone','9780955683619','Bridging the Communication Gap','bridging-the-communication-gap','Bridging the Communication Gap is a book about improving communication between customers, business analysts, developers and testers on software projects, especially by using specification by example and agile acceptance testing.',NULL,'2017-10-29 10:28:28.697984','2017-10-29 10:28:28.698068',1,NULL,1),(152,'standalone','9780321437389','Implementing Lean Software Development','implementing-lean-software-development','\"This remarkable book combines practical advice, ready-to-use techniques, anda deep understanding of why this is the right way to develop software. I haveseen software teams transformed by the ideas in this book.',NULL,'2017-10-29 10:28:28.763780','2017-10-29 10:28:28.763865',1,NULL,1),(153,'standalone','9781934356296','Manage Your Project Portfolio','manage-your-project-portfolio','Introducing readers to different ways of ordering all of the projects they are working on, \"Manage Your Project Portfolio\" helps to define a team\'s, group\'s, or department\'s mission--whether the projects include of software or hardware ...',NULL,'2017-10-29 10:28:28.838148','2017-10-29 10:28:28.838223',1,NULL,1),(154,'standalone','9780201741575','Fearless Change','fearless-change','The co-authors reveal 48 patterns of behavior associated with successful change in knowledge-driven organizations, and show readers exactly how to use them in their own organization.',NULL,'2017-10-29 10:28:28.930400','2017-10-29 10:28:28.930479',1,NULL,1),(155,'standalone','9781430322641','Scrum and XP from the Trenches','scrum-and-xp-from-the-trenches','This book aims to give you a head start by providing a detailed down-to-earth account of how one Swedish company implemented Scrum and XP with a team of approximately 40 people and how they continuously improved their process over a year\'s ...',NULL,'2017-10-29 10:28:28.997414','2017-10-29 10:28:28.997488',1,NULL,1),(156,'standalone','9780321278654','Extreme Programming Explained.','extreme-programming-explained','You may love XP, or you may hate it, but \"Extreme Programming Explained\" will force you to take a fresh look at how you develop software. 0201616416B04062001',NULL,'2017-10-29 10:28:29.065299','2017-10-29 10:28:29.065380',1,NULL,1),(157,'standalone','9780977616640','Agile Retrospective','agile-retrospective','The tools and recipes in this book will help readers uncover and solve hidden and not-so-hidden problems with their technology and methodology. It offers tips to fix the problems faced on a software development project on an ongoing basis.',NULL,'2017-10-29 10:28:29.136284','2017-10-29 10:28:29.136360',1,NULL,1),(158,'standalone','9781591840565','The Art Of The Start','the-art-of-the-start','Explains how to transform ideas into action, offering a step-by-step approach to launching great products, services, and companies and demonstrating how managers can unleash a creative approach to business at established companies.',NULL,'2017-10-29 10:28:29.204327','2017-10-29 10:28:29.204405',1,NULL,1),(159,'standalone','9780884271789','The Goal','the-goal','Mr. Rogo, a plant manager, must improve his factory\'s efficiency or face its closing in just three months.',NULL,'2017-10-29 10:28:29.271473','2017-10-29 10:28:29.271547',1,NULL,1),(160,'standalone','9780262111898','Genetic Programming','genetic-programming','The lawnmower problem. The bumblebee problem. The increasing benefits of ADFs as problems are scaled up. Finding an impulse response function. Artificial ant on the San Mateo trail. Obstacle-avoiding robot. The minesweeper problem.',NULL,'2017-10-29 10:28:29.336478','2017-10-29 10:28:29.336567',1,NULL,1),(161,'standalone','9780976458708','Thinking Forth','thinking-forth','A Language and Philosophy for Solving Problems Leo Brodie. THREE   Preliminary Design/ Decomposition Assuming you have some idea of what your   program should. Justine Time.',NULL,'2017-10-29 10:28:29.407263','2017-10-29 10:28:29.407408',1,NULL,1),(162,'standalone','9780596809485','97 Things Every Programmer Should Know','97-things-every-programmer-should-know','With the 97 short and extremely useful tips for programmers in this book, you\'ll expand your skills by adopting new approaches to old problems, learning appropriate best practices, and honing your craft through sound advice.',NULL,'2017-10-29 10:28:29.473895','2017-10-29 10:28:29.473970',1,NULL,1),(163,'standalone','9781617290084','Specification by Example','specification-by-example','Describes a method of effectively specifying, testing, and delivering software, covering such topics as documentation, process patterns, and automation, along with case studies from a variety of firms.',NULL,'2017-10-29 10:28:29.540311','2017-10-29 10:28:29.540394',1,NULL,1),(164,'standalone','9780321213358','Refactoring to patterns','refactoring-to-patterns','This book introduces the theory and practice of pattern-directed refactorings: sequences of low-level refactorings that allow designers to safely move designs to, towards, or away from pattern implementations.',NULL,'2017-10-29 10:28:29.606421','2017-10-29 10:28:29.606496',1,NULL,1),(165,'standalone','9780201733860','Software craftsmanship','software-craftsmanship','Chapter. 19. Perpetual. Learning. Software developers need to have a good   memory, be very good at learning, and be great at forgetting. Forgetting is the   most important ability because it is the key to perpetual learning. Learning is   important ...',NULL,'2017-10-29 10:28:29.672512','2017-10-29 10:28:29.672587',1,NULL,1),(166,'standalone','9780557043552','Reviewing Java','reviewing-java','A simple Java review book and your best guide to learning Java programming. This book covers the most seen topics in introductory programming courses such as conditions, loops, arrays, classes and inheritance.',NULL,'2017-10-29 10:28:29.739793','2017-10-29 10:28:29.739872',1,NULL,1),(167,'standalone','9780596009205','深入浅出 Java','shen-ru-qian-chu-java','number formatting Number formatting InJava, formatting numbers and dates   doesn\'t have to be coupled with I/O. Think about it. One of the most typical ways   to display numbers to a user is through a GUI. You put Strings into a scrolling text ...',NULL,'2017-10-29 10:28:29.807641','2017-10-29 10:28:29.807721',1,NULL,1),(168,'standalone','9780131774292','Expert C Programming','expert-c-programming','Deep C Secrets Peter van der Linden. #include <setjmp.h> banana ( ) { printf ( \"   in banana ( ) n\" ) ; longjmp (buf, 1) ; /*NOTREACHED*/ printf ( \"you\' 11 never see   this, because I longjmp\'d\" ) ; main ( ) if (set jmp(buf ) ) printf (\"back in mainn\"); ...',NULL,'2017-10-29 10:28:29.893875','2017-10-29 10:28:29.893948',1,NULL,1),(169,'standalone','9780316037709','Ghost in the Wires','ghost-in-the-wires','Ghost in the Wires is a thrilling true story of intrigue, suspense, and unbelievable escape, and a portrait of a visionary whose creativity, skills, and persistence forced the authorities to rethink the way they pursued him, inspiring ...',NULL,'2017-10-29 10:28:30.046922','2017-10-29 10:28:30.046994',1,NULL,1),(170,'standalone','9780471782667','The Art of Intrusion','the-art-of-intrusion','Mitnick\'s reputation within the hacker community gave him unique credibility with the perpetrators of these crimes, who freely shared their stories with him-and whose exploits Mitnick now reveals in detail for the first time, including: A ...',NULL,'2017-10-29 10:28:30.116077','2017-10-29 10:28:30.116148',1,NULL,1),(171,'standalone','9781593270070','Hacking','hacking','the art of exploitation. More No-Nonsense Books from NO STARCH PRESS   WRITE GREAT CODE Understanding the Machine by randall hyde Today\'s   programmers are often narrowly trained because the industry moves too fast.   This book ...',NULL,'2017-10-29 10:28:30.185444','2017-10-29 10:28:30.185513',1,NULL,1),(172,'standalone','9780553563702','The Hacker Crackdown','the-hacker-crackdown','A journalist investigates the past, present, and future of computer crimes, as he attends a hacker convention, documents the extent of the computer crimes, and presents intriguing facts about hackers and their misdoings. Reprint.',NULL,'2017-10-29 10:28:30.251237','2017-10-29 10:28:30.251307',1,NULL,1),(173,'standalone','9780141000510','Hackers','hackers','Interviews with the unconventional computer geniuses who were responsible for the computer revolution reveal the inside story and the shared ideals that motivated them. Reprint.',NULL,'2017-10-29 10:28:30.317724','2017-10-29 10:28:30.317797',1,NULL,1),(174,'standalone','9780596006624','Hackers & painters','hackers-painters','The author examines issues such as the rightness of web-based applications, the programming language renaissance, spam filtering, the Open Source Movement, Internet startups and more.',NULL,'2017-10-29 10:28:30.383389','2017-10-29 10:28:30.383466',1,NULL,1),(175,'standalone','9780307588685','Kingpin','kingpin','Documents how a troubled young computer hacker seized control of a massive international computer fraud network in 2006, tracing the efforts of Non-FBI and Secret Service agents as well as an undercover operator to locate and arrest him.',NULL,'2017-10-29 10:28:30.450806','2017-10-29 10:28:30.450878',1,NULL,1),(176,'standalone','9780764542800','The Art of Deception','the-art-of-deception','But in his own eyes, Mitnick was simply a small-time con artist with an incredible memory [and] a knack for social engineering… This is Mitnick’s account, complete with advice for how to protect yourself from similar attacks.',NULL,'2017-10-29 10:28:30.518465','2017-10-29 10:28:30.518535',1,NULL,1),(177,'standalone','9780072260816','Hacking Exposed Non-Fifth Edition','hacking-exposed-non-fifth-edition','Should be required reading for anyone with a server or a network to secure.\" Bill Machrone, \"PC Magazine,\" \"With every edition this book keeps getting better and better.',NULL,'2017-10-29 10:28:30.589099','2017-10-29 10:28:30.589183',1,NULL,1),(178,'standalone','9780060926946','The Masters of Deception','the-masters-of-deception','Chronicles the cyberspace battle between rival gangs of hackers in Texas and New York, detailing the groups\' exploits and discussing the legal and ethical implications of new computer technology',NULL,'2017-10-29 10:28:30.662210','2017-10-29 10:28:30.662293',1,NULL,1),(179,'standalone','9780596001087','The Cathedral & the Bazaar','the-cathedral-the-bazaar','Argues that the development of Linux by thousands of programmers, in a coordinated effort without centralized management signals unprecedented power shifts in the computer industry.',NULL,'2017-10-29 10:28:30.729595','2017-10-29 10:28:30.729668',1,NULL,1),(180,'standalone','9780470639535','Social Engineering','social-engineering','... Published by Wiley Publishing, Inc.,Indianapolis, Indiana Published   simultaneously inCanada ISBN: 9780470639535 ISBN: 9781118028018 (ebk)   ISBN: 9781118029718(ebk) ISBN: 9781118029749 (ebk) Manufactured in the   United States ...',NULL,'2017-10-29 10:28:30.881498','2017-10-29 10:28:30.881575',1,NULL,1),(181,'standalone','9780316213547','We Are Anonymous','we-are-anonymous','WE ARE ANONYMOUS delves deep into the internet\'s underbelly to tell the incredible full story of the global cyber insurgency movement, and its implications for the future of computer security.',NULL,'2017-10-29 10:28:30.949626','2017-10-29 10:28:30.949697',1,NULL,1),(182,'standalone','9781593272883','Metasploit','metasploit','\"The Metasploit Non-Framework makes discovering, exploiting, and sharing vulnerabilities quick and relatively painless.',NULL,'2017-10-29 10:28:31.018266','2017-10-29 10:28:31.018337',1,NULL,1),(183,'standalone','9780307269751','The Girl with the Dragon Tattoo','the-girl-with-the-dragon-tattoo','Non-Forty years after the disappearance of Harriet Vanger from the secluded island owned and inhabited by the powerful Vanger family, her octogenarian uncle hires journalist Mikael Blomqvist and Lisbeth Salander, an unconventional young hacker, ...',NULL,'2017-10-29 10:28:31.085872','2017-10-29 10:28:31.085950',1,NULL,1),(184,'standalone','9781591843573','Hacking Work','hacking-work','In a fresh approach to work, the authors explain how professionals can: use their own tools and technologies instead of what the company mandates; cut through red tape; circumvent almost any company rule to work smarter, not harder; and ...',NULL,'2017-10-29 10:28:31.153706','2017-10-29 10:28:31.153777',1,NULL,1),(185,'standalone','9781593270469','Silence On The Wire','silence-on-the-wire','A Non-Field Guide To Passive Reconnaissance And Indirect Attacks Michal Zalewski.   have no way of telling what is stored in a cookie. A server can choose to assign a   unique identifier to a client using the Set-Cookie header and then read it back ...',NULL,'2017-10-29 10:28:31.220399','2017-10-29 10:28:31.220489',1,NULL,1),(186,'standalone','9781931836364','Google Hacking','google-hacking','*Author Johnny Long, the authority on Google hacking, will be speaking about \"Google Hacking\" at the Black Hat 2004 Briefing.',NULL,'2017-10-29 10:28:31.288236','2017-10-29 10:28:31.288309',1,NULL,1),(187,'standalone','9780201914658','Hacker\'s Delight','hackers-delight','\"This is the first book that promises to tell the deep, dark secrets of computer arithmetic, and it delivers in spades.',NULL,'2017-10-29 10:28:31.356172','2017-10-29 10:28:31.356240',1,NULL,1),(188,'standalone','9780307269997','The Girl Who Kicked the Hornet\'s Nest','the-girl-who-kicked-the-hornets-nest','While recovering in the hospital, Lisbeth Salander enlists the aid of journalist Mikael Blomkvist to prove her innocent of three murders and identify the corrupt politicians who have allowed her to suffer, and, on her own, Lisbeth plots ...',NULL,'2017-10-29 10:28:31.498214','2017-10-29 10:28:31.498291',1,NULL,1),(189,'standalone','9780471128458','Applied cryptography','applied-cryptography','. . . The book the National Security Agency wanted never to be published. . . .\" -Wired Magazine \". . .monumental . . . fascinating . . . comprehensive . . . the definitive work on cryptography for computer programmers . . .',NULL,'2017-10-29 10:28:31.566112','2017-10-29 10:28:31.566189',1,NULL,1),(190,'standalone','9780684818627','Cyberpunk','cyberpunk','Using the exploits of three international hackers, Cyberpunk provides a fascinating tour of a bizarre subculture populated by outlaws who penetrate even the most sensitive computer networks and wreak havoc on the information they find -- ...',NULL,'2017-10-29 10:28:31.633436','2017-10-29 10:28:31.633514',1,NULL,1),(191,'standalone','9780764574818','Reversing','reversing','That\'s exactly what this book shows you--how to deconstruct software in a way that reveals design and implementation details, sometimes even source code. Why? Because reversing reveals weak spots, so you can target your security efforts.',NULL,'2017-10-29 10:28:31.700923','2017-10-29 10:28:31.701002',1,NULL,1),(192,'standalone','9780307269980','The Girl Who Played with Non-Fire','the-girl-who-played-with-non-fire','Lisbeth Salander is a wanted woman. Two Millennium journalists about to expose the truth about sex trafficking in Sweden are murdered, and Salander\'s prints are on the weapon.',NULL,'2017-10-29 10:28:31.767703','2017-10-29 10:28:31.767782',1,NULL,1),(193,'standalone','9780072257090','Gray Hat Hacking','gray-hat-hacking','Malicious hackers are dedicated to bringing about mayhem and destruction--this book will teach you how to identify and stop them.',NULL,'2017-10-29 10:28:31.844724','2017-10-29 10:28:31.844798',1,NULL,1),(194,'standalone','9780131481046','Studyguide for Counter Hack Reloaded','studyguide-for-counter-hack-reloaded','Cram101 Textbook Outlines gives all of the outlines, highlights, notes for your textbook with optional online practice tests. Only Cram101 Outlines are Textbook Specific. Cram101 is NOT the Textbook. Accompanys: 9780131481046 .',NULL,'2017-10-29 10:28:31.913894','2017-10-29 10:28:31.913962',1,NULL,1),(195,'standalone','9780970978813','Visual Guide to Lock Picking','visual-guide-to-lock-picking','By reading this book, practicing, and applying the methods introduced, you can successfully master picking most modern locks. This book makes it easy and gives you the edge to quickly learn and start picking locks today.',NULL,'2017-10-29 10:28:31.979177','2017-10-29 10:28:31.979251',1,NULL,1),(196,'standalone','9781430219484','Coders at Work','coders-at-work','Reflections on the Craft of Programming Peter Seibel. and get working first that   will help you to do the next step and build stuff up from there. In these cases, it   was a matter of getting outside the box. That\'s a way of asserting that you\'ve ...',NULL,'2017-10-29 10:28:32.045382','2017-10-29 10:28:32.045460',1,NULL,1),(197,'standalone','9780072262582','Hacking Exposed Wireless','hacking-exposed-wireless','This is an invaluable resource for any IT professional who works with wireless technology.',NULL,'2017-10-29 10:28:32.111331','2017-10-29 10:28:32.111411',1,NULL,1),(198,'standalone','9780764544682','The shellcoder\'s handbook','the-shellcoders-handbook','\" The Shellcoder\'s Handbook shows you how to: Non-Find out where security holes come from and how to close them so they never occur againPinpoint vulnerabilities in popular operating systems (including Windows(R), Linux(R), and SolarisTM) and ...',NULL,'2017-10-29 10:28:32.175084','2017-10-29 10:28:32.175158',1,NULL,1),(199,'standalone','883049325293','Whirlpool Swash Dryer','whirlpool-swash-dryer','The SWASH system is the first in-home system that provides a convenient way to get clothes ready to wear on your schedule, in just 10 to 15 minutes. Say goodbye to excessive washing, drying, ironing and dry cleaning.',NULL,'2017-11-01 15:55:56.583316','2017-11-05 18:00:34.711953',1,NULL,2);
/*!40000 ALTER TABLE `catalogue_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_product_product_options`
--

DROP TABLE IF EXISTS `catalogue_product_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_product_product_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_product_produc_product_id_option_id_9b3abb31_uniq` (`product_id`,`option_id`),
  KEY `catalogue_product_pr_option_id_ff470e13_fk_catalogue` (`option_id`),
  CONSTRAINT `catalogue_product_pr_option_id_ff470e13_fk_catalogue` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `catalogue_product_pr_product_id_ad2b46bd_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_product_product_options`
--

LOCK TABLES `catalogue_product_product_options` WRITE;
/*!40000 ALTER TABLE `catalogue_product_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_product_product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattribute`
--

DROP TABLE IF EXISTS `catalogue_productattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `type` varchar(20) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `option_group_id` int(11) DEFAULT NULL,
  `product_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productattribute_code_9ffea293` (`code`),
  KEY `catalogue_productatt_product_class_id_7af808ec_fk_catalogue` (`product_class_id`),
  KEY `catalogue_productatt_option_group_id_6b422dc2_fk_catalogue` (`option_group_id`),
  CONSTRAINT `catalogue_productatt_option_group_id_6b422dc2_fk_catalogue` FOREIGN KEY (`option_group_id`) REFERENCES `catalogue_attributeoptiongroup` (`id`),
  CONSTRAINT `catalogue_productatt_product_class_id_7af808ec_fk_catalogue` FOREIGN KEY (`product_class_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattribute`
--

LOCK TABLES `catalogue_productattribute` WRITE;
/*!40000 ALTER TABLE `catalogue_productattribute` DISABLE KEYS */;
INSERT INTO `catalogue_productattribute` VALUES (1,'Size','size','option',1,1,1),(2,'Brand','brand','text',0,NULL,2),(3,'Model','model','text',0,NULL,2);
/*!40000 ALTER TABLE `catalogue_productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue`
--

DROP TABLE IF EXISTS `catalogue_productattributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_text` longtext,
  `value_integer` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_float` double DEFAULT NULL,
  `value_richtext` longtext,
  `value_date` date DEFAULT NULL,
  `value_file` varchar(255) DEFAULT NULL,
  `value_image` varchar(255) DEFAULT NULL,
  `entity_object_id` int(10) unsigned DEFAULT NULL,
  `attribute_id` int(11) NOT NULL,
  `entity_content_type_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `value_option_id` int(11) DEFAULT NULL,
  `value_datetime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattribu_attribute_id_product_id_1e8e7112_uniq` (`attribute_id`,`product_id`),
  KEY `catalogue_productatt_entity_content_type__f7186ab5_fk_django_co` (`entity_content_type_id`),
  KEY `catalogue_productatt_product_id_a03cd90e_fk_catalogue` (`product_id`),
  KEY `catalogue_productatt_value_option_id_21026066_fk_catalogue` (`value_option_id`),
  CONSTRAINT `catalogue_productatt_attribute_id_0287c1e7_fk_catalogue` FOREIGN KEY (`attribute_id`) REFERENCES `catalogue_productattribute` (`id`),
  CONSTRAINT `catalogue_productatt_entity_content_type__f7186ab5_fk_django_co` FOREIGN KEY (`entity_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `catalogue_productatt_product_id_a03cd90e_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productatt_value_option_id_21026066_fk_catalogue` FOREIGN KEY (`value_option_id`) REFERENCES `catalogue_attributeoption` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue`
--

LOCK TABLES `catalogue_productattributevalue` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue` DISABLE KEYS */;
INSERT INTO `catalogue_productattributevalue` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,2,1,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,3,2,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,4,3,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,6,1,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,7,2,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,9,1,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,10,2,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,1,NULL,11,3,NULL),(9,'Swash',NULL,NULL,NULL,'',NULL,'','',NULL,2,NULL,199,NULL,NULL),(10,'SFF1001CSA',NULL,NULL,NULL,'',NULL,'','',NULL,3,NULL,199,NULL,NULL);
/*!40000 ALTER TABLE `catalogue_productattributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productattributevalue_value_multi_option`
--

DROP TABLE IF EXISTS `catalogue_productattributevalue_value_multi_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productattributevalue_value_multi_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productattributevalue_id` int(11) NOT NULL,
  `attributeoption_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productattribu_productattributevalue_id_a1760824_uniq` (`productattributevalue_id`,`attributeoption_id`),
  KEY `catalogue_productatt_attributeoption_id_962b600b_fk_catalogue` (`attributeoption_id`),
  CONSTRAINT `catalogue_productatt_attributeoption_id_962b600b_fk_catalogue` FOREIGN KEY (`attributeoption_id`) REFERENCES `catalogue_attributeoption` (`id`),
  CONSTRAINT `catalogue_productatt_productattributevalu_9c7c031e_fk_catalogue` FOREIGN KEY (`productattributevalue_id`) REFERENCES `catalogue_productattributevalue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productattributevalue_value_multi_option`
--

LOCK TABLES `catalogue_productattributevalue_value_multi_option` WRITE;
/*!40000 ALTER TABLE `catalogue_productattributevalue_value_multi_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productattributevalue_value_multi_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productcategory`
--

DROP TABLE IF EXISTS `catalogue_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productcategory_product_id_category_id_8f0dbfe2_uniq` (`product_id`,`category_id`),
  KEY `catalogue_productcat_category_id_176db535_fk_catalogue` (`category_id`),
  CONSTRAINT `catalogue_productcat_category_id_176db535_fk_catalogue` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `catalogue_productcat_product_id_846a4061_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productcategory`
--

LOCK TABLES `catalogue_productcategory` WRITE;
/*!40000 ALTER TABLE `catalogue_productcategory` DISABLE KEYS */;
INSERT INTO `catalogue_productcategory` VALUES (1,1,1),(190,6,1),(4,3,4),(2,1,5),(5,3,5),(6,3,6),(7,3,7),(3,1,8),(8,3,8),(9,3,9),(10,3,10),(11,3,11),(12,3,12),(13,3,13),(14,3,14),(15,3,15),(16,3,16),(17,3,17),(18,3,18),(181,6,18),(19,3,19),(20,3,20),(21,3,21),(22,3,22),(23,3,23),(24,3,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,3,39),(40,3,40),(41,3,41),(42,3,42),(43,3,43),(44,3,44),(45,3,45),(46,3,46),(47,3,47),(48,3,48),(49,3,49),(50,3,50),(51,3,51),(52,3,52),(53,3,53),(54,3,54),(55,3,55),(56,3,56),(57,3,57),(58,3,58),(59,3,59),(60,3,60),(169,6,60),(61,3,61),(62,3,62),(63,3,63),(64,3,64),(65,3,65),(66,3,66),(67,3,67),(68,3,68),(69,3,69),(70,3,70),(71,3,71),(72,3,72),(73,3,73),(74,3,74),(75,3,75),(76,3,76),(77,3,77),(78,3,78),(79,3,79),(80,3,80),(81,3,81),(82,3,82),(83,3,83),(84,3,84),(85,3,85),(86,3,86),(87,5,87),(88,5,88),(89,5,89),(90,5,90),(91,5,91),(92,5,92),(93,5,93),(94,5,94),(95,5,95),(96,5,96),(97,5,97),(98,5,98),(99,5,99),(100,5,100),(101,5,101),(102,5,102),(103,5,103),(104,5,104),(105,5,105),(106,5,106),(107,5,107),(108,5,108),(109,5,109),(110,5,110),(111,5,111),(112,5,112),(113,5,113),(114,5,114),(115,5,115),(116,5,116),(117,5,117),(118,5,118),(119,5,119),(120,5,120),(121,5,121),(122,5,122),(123,5,123),(124,5,124),(125,5,125),(126,5,126),(127,5,127),(128,5,128),(129,5,129),(130,5,130),(131,5,131),(132,5,132),(133,5,133),(134,5,134),(135,5,135),(136,5,136),(137,5,137),(138,5,138),(139,5,139),(140,5,140),(141,5,141),(142,5,142),(143,5,143),(144,5,144),(145,5,145),(146,5,146),(147,5,147),(148,5,148),(149,5,149),(150,5,150),(151,5,151),(152,5,152),(153,5,153),(154,5,154),(155,5,155),(156,5,156),(157,5,157),(158,5,158),(159,5,159),(160,5,160),(161,5,161),(162,5,162),(163,5,163),(164,5,164),(165,5,165),(166,5,166),(167,5,167),(168,5,168),(170,6,169),(171,6,170),(172,6,171),(173,6,172),(174,6,173),(175,6,174),(176,6,175),(177,6,176),(178,6,177),(179,6,178),(180,6,179),(182,6,180),(183,6,181),(184,6,182),(185,6,183),(186,6,184),(187,6,185),(188,6,186),(189,6,187),(191,6,188),(192,6,189),(193,6,190),(194,6,191),(195,6,192),(196,6,193),(197,6,194),(198,6,195),(199,6,196),(200,6,197),(201,6,198),(202,8,199);
/*!40000 ALTER TABLE `catalogue_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass`
--

DROP TABLE IF EXISTS `catalogue_productclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `requires_shipping` tinyint(1) NOT NULL,
  `track_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass`
--

LOCK TABLES `catalogue_productclass` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass` DISABLE KEYS */;
INSERT INTO `catalogue_productclass` VALUES (1,'Book','book',1,1),(2,'Clothes Dryers','c',1,1);
/*!40000 ALTER TABLE `catalogue_productclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productclass_options`
--

DROP TABLE IF EXISTS `catalogue_productclass_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productclass_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productclass_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productclass_o_productclass_id_option_i_2266c635_uniq` (`productclass_id`,`option_id`),
  KEY `catalogue_productcla_option_id_b099542c_fk_catalogue` (`option_id`),
  CONSTRAINT `catalogue_productcla_option_id_b099542c_fk_catalogue` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`),
  CONSTRAINT `catalogue_productcla_productclass_id_732df4c8_fk_catalogue` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productclass_options`
--

LOCK TABLES `catalogue_productclass_options` WRITE;
/*!40000 ALTER TABLE `catalogue_productclass_options` DISABLE KEYS */;
INSERT INTO `catalogue_productclass_options` VALUES (1,2,1),(2,2,2);
/*!40000 ALTER TABLE `catalogue_productclass_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productimage`
--

DROP TABLE IF EXISTS `catalogue_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalogue_productimage_product_id_49474fe8` (`product_id`),
  CONSTRAINT `catalogue_productima_product_id_49474fe8_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productimage`
--

LOCK TABLES `catalogue_productimage` WRITE;
/*!40000 ALTER TABLE `catalogue_productimage` DISABLE KEYS */;
INSERT INTO `catalogue_productimage` VALUES (1,'images/products/2017/10/9780060512804.jpg','',0,'2017-10-29 10:29:51.365542',3),(2,'images/products/2017/10/9780072260816.jpg','',0,'2017-10-29 10:29:51.377117',177),(3,'images/products/2017/10/9780072262582.jpg','',0,'2017-10-29 10:29:51.390172',197),(4,'images/products/2017/10/9780130313584.jpg','',0,'2017-10-29 10:29:51.405944',99),(5,'images/products/2017/10/9780130810816.jpg','',0,'2017-10-29 10:29:51.415611',136),(6,'images/products/2017/10/9780131103627.jpg','',0,'2017-10-29 10:29:51.426111',87),(7,'images/products/2017/10/9780131481046.jpg','',0,'2017-10-29 10:29:51.437238',194),(8,'images/products/2017/10/9780131495050.jpg','',0,'2017-10-29 10:29:51.448257',120),(9,'images/products/2017/10/9780131774292.jpg','',0,'2017-10-29 10:29:51.461083',168),(10,'images/products/2017/10/9780132350884.jpg','',0,'2017-10-29 10:29:51.472338',95),(11,'images/products/2017/10/9780133708752.jpg','',0,'2017-10-29 10:29:51.484810',115),(12,'images/products/2017/10/9780134900124.jpg','',0,'2017-10-29 10:29:51.495471',111),(13,'images/products/2017/10/9780135974445.jpg','',0,'2017-10-29 10:29:51.507341',121),(14,'images/products/2017/10/9780136291558.jpg','',0,'2017-10-29 10:29:51.517463',128),(15,'images/products/2017/10/9780137081073.jpg','',0,'2017-10-29 10:29:51.531107',139),(16,'images/products/2017/10/9780137903955.jpg','',0,'2017-10-29 10:29:51.541636',100),(17,'images/products/2017/10/9780139376818.jpg','',0,'2017-10-29 10:29:51.551716',102),(18,'images/products/2017/10/9780141000510.jpg','',0,'2017-10-29 10:29:51.562122',173),(19,'images/products/2017/10/9780201100884.jpg','',0,'2017-10-29 10:29:51.574219',98),(20,'images/products/2017/10/9780201342758.jpg','',0,'2017-10-29 10:29:51.585891',130),(21,'images/products/2017/10/9780201379235.jpg','',0,'2017-10-29 10:29:51.596012',150),(22,'images/products/2017/10/9780201433074.jpg','',0,'2017-10-29 10:29:51.611494',123),(23,'images/products/2017/10/9780201485677.jpg','',0,'2017-10-29 10:29:51.623191',91),(24,'images/products/2017/10/9780201615869.jpg','',0,'2017-10-29 10:29:51.633707',108),(25,'images/products/2017/10/9780201616224.jpg','',0,'2017-10-29 10:29:51.644941',88),(26,'images/products/2017/10/9780201633610.jpg','',0,'2017-10-29 10:29:51.656156',89),(27,'images/products/2017/10/9780201700732.jpg','',0,'2017-10-29 10:29:51.665699',96),(28,'images/products/2017/10/9780201703535.jpg','',0,'2017-10-29 10:29:51.675719',135),(29,'images/products/2017/10/9780201733860.jpg','',0,'2017-10-29 10:29:51.685803',165),(30,'images/products/2017/10/9780201741575.jpg','',0,'2017-10-29 10:29:51.696069',154),(31,'images/products/2017/10/9780201835953.jpg','',0,'2017-10-29 10:29:51.708394',93),(32,'images/products/2017/10/9780201889543.jpg','',0,'2017-10-29 10:29:51.720338',129),(33,'images/products/2017/10/9780201914658.jpg','',0,'2017-10-29 10:29:51.732898',187),(34,'images/products/2017/10/9780205313426.jpg','',0,'2017-10-29 10:29:51.743415',126),(35,'images/products/2017/10/9780262011532.jpg','',0,'2017-10-29 10:29:51.753557',101),(36,'images/products/2017/10/9780262033848.jpg','',0,'2017-10-29 10:29:51.768676',118),(37,'images/products/2017/10/9780262062183.jpg','',0,'2017-10-29 10:29:51.779820',107),(38,'images/products/2017/10/9780262062794.jpg','',0,'2017-10-29 10:29:51.790637',147),(39,'images/products/2017/10/9780262111898.jpg','',0,'2017-10-29 10:29:51.800512',160),(40,'images/products/2017/10/9780262510875.jpg','',0,'2017-10-29 10:29:51.811161',90),(41,'images/products/2017/10/9780262560993.jpg','',0,'2017-10-29 10:29:51.823153',104),(42,'images/products/2017/10/9780307269751.jpg','',0,'2017-10-29 10:29:51.836174',183),(43,'images/products/2017/10/9780307269980.jpg','',0,'2017-10-29 10:29:51.848724',192),(44,'images/products/2017/10/9780307269997.jpg','',0,'2017-10-29 10:29:51.861337',188),(45,'images/products/2017/10/9780307430083.jpg','',0,'2017-10-29 10:29:51.871339',54),(46,'images/products/2017/10/9780307588685.jpg','',0,'2017-10-29 10:29:51.881410',175),(47,'images/products/2017/10/9780307887436.jpg','',0,'2017-10-29 10:29:51.891844',17),(48,'images/products/2017/10/9780316037709.jpg','',0,'2017-10-29 10:29:51.903482',169),(49,'images/products/2017/10/9780316213547.jpg','',0,'2017-10-29 10:29:51.914412',181),(50,'images/products/2017/10/9780321146533.jpg','',0,'2017-10-29 10:29:51.928021',113),(51,'images/products/2017/10/9780321213358.jpg','',0,'2017-10-29 10:29:51.937603',164),(52,'images/products/2017/10/9780321278654.jpg','',0,'2017-10-29 10:29:51.947460',156),(53,'images/products/2017/10/9780321334879.jpg','',0,'2017-10-29 10:29:51.959037',117),(54,'images/products/2017/10/9780321437389.jpg','',0,'2017-10-29 10:29:51.969572',152),(55,'images/products/2017/10/9780321503626.jpg','',0,'2017-10-29 10:29:51.985020',112),(56,'images/products/2017/10/9780340837948.jpg','',0,'2017-10-29 10:29:51.998615',6),(57,'images/products/2017/10/9780345391803.jpg','',0,'2017-10-29 10:29:52.008181',4),(58,'images/products/2017/10/9780345467171.jpg','',0,'2017-10-29 10:29:52.017981',24),(59,'images/products/2017/10/9780380816033.jpg','',0,'2017-10-29 10:29:52.028507',82),(60,'images/products/2017/10/9780385333788.jpg','',0,'2017-10-29 10:29:52.040843',10),(61,'images/products/2017/10/9780385533850.jpg','',0,'2017-10-29 10:29:52.052694',25),(62,'images/products/2017/10/9780395860014.jpg','',0,'2017-10-29 10:29:52.064591',71),(63,'images/products/2017/10/9780425198681.jpg','',0,'2017-10-29 10:29:52.075367',28),(64,'images/products/2017/10/9780441013678.jpg','',0,'2017-10-29 10:29:52.085509',22),(65,'images/products/2017/10/9780441016792.jpg','',0,'2017-10-29 10:29:52.096193',29),(66,'images/products/2017/10/9780446361309.jpg','',0,'2017-10-29 10:29:52.108644',75),(67,'images/products/2017/10/9780471128458.jpg','',0,'2017-10-29 10:29:52.121127',189),(68,'images/products/2017/10/9780471578147.jpg','',0,'2017-10-29 10:29:52.136512',141),(69,'images/products/2017/10/9780471782667.jpg','',0,'2017-10-29 10:29:52.146097',170),(70,'images/products/2017/10/9780525951117.jpg','',0,'2017-10-29 10:29:52.157427',7),(71,'images/products/2017/10/9780525951575.jpg','',0,'2017-10-29 10:29:52.168131',13),(72,'images/products/2017/10/9780534950972.jpg','',0,'2017-10-29 10:29:52.178991',124),(73,'images/products/2017/10/9780552151696.jpg','',0,'2017-10-29 10:29:52.189947',31),(74,'images/products/2017/10/9780553382563.jpg','',0,'2017-10-29 10:29:52.199474',5),(75,'images/products/2017/10/9780557030798.jpg','',0,'2017-10-29 10:29:52.209567',143),(76,'images/products/2017/10/9780557043552.jpg','',0,'2017-10-29 10:29:52.219745',166),(77,'images/products/2017/10/9780596000271.jpg','',0,'2017-10-29 10:29:52.230251',116),(78,'images/products/2017/10/9780596001087.jpg','',0,'2017-10-29 10:29:52.242432',179),(79,'images/products/2017/10/9780596002817.jpg','',0,'2017-10-29 10:29:52.255888',110),(80,'images/products/2017/10/9780596006624.jpg','',0,'2017-10-29 10:29:52.266800',174),(81,'images/products/2017/10/9780596007126.jpg','',0,'2017-10-29 10:29:52.276543',105),(82,'images/products/2017/10/9780596009205.jpg','',0,'2017-10-29 10:29:52.288112',167),(83,'images/products/2017/10/9780596101053.jpg','',0,'2017-10-29 10:29:52.298469',122),(84,'images/products/2017/10/9780596514983.jpg','',0,'2017-10-29 10:29:52.309526',103),(85,'images/products/2017/10/9780596517748.jpg','',0,'2017-10-29 10:29:52.320790',97),(86,'images/products/2017/10/9780596529864.jpg','',0,'2017-10-29 10:29:52.330965',131),(87,'images/products/2017/10/9780596809485.jpg','',0,'2017-10-29 10:29:52.340842',162),(88,'images/products/2017/10/9780672323492.jpg','',0,'2017-10-29 10:29:52.350996',134),(89,'images/products/2017/10/9780672326721.jpg','',0,'2017-10-29 10:29:52.361082',133),(90,'images/products/2017/10/9780672327933.jpg','',0,'2017-10-29 10:29:52.373285',148),(91,'images/products/2017/10/9780672328794.jpg','',0,'2017-10-29 10:29:52.383934',132),(92,'images/products/2017/10/9780684833392.jpg','',0,'2017-10-29 10:29:52.396669',15),(93,'images/products/2017/10/9780691147543.jpg','',0,'2017-10-29 10:29:52.407082',26),(94,'images/products/2017/10/9780714530338.jpg','',0,'2017-10-29 10:29:52.417384',58),(95,'images/products/2017/10/9780735619678.jpg','',0,'2017-10-29 10:29:52.427284',94),(96,'images/products/2017/10/9780743421928.jpg','',0,'2017-10-29 10:29:52.438623',74),(97,'images/products/2017/10/9780752837451.jpg','',0,'2017-10-29 10:29:52.449465',57),(98,'images/products/2017/10/9780764542800.jpg','',0,'2017-10-29 10:29:52.463199',176),(99,'images/products/2017/10/9780764543654.jpg','',0,'2017-10-29 10:29:52.472859',144),(100,'images/products/2017/10/9780764544682.jpg','',0,'2017-10-29 10:29:52.482628',198),(101,'images/products/2017/10/9780764574818.jpg','',0,'2017-10-29 10:29:52.494383',191),(102,'images/products/2017/10/9780765319852.jpg','',0,'2017-10-29 10:29:52.504787',18),(103,'images/products/2017/10/9780765348272.jpg','',0,'2017-10-29 10:29:52.516002',19),(104,'images/products/2017/10/9780767907699.jpg','',0,'2017-10-29 10:29:52.526779',138),(105,'images/products/2017/10/9780804115483.jpg','',0,'2017-10-29 10:29:52.536807',33),(106,'images/products/2017/10/9780812524826.jpg','',0,'2017-10-29 10:29:52.546856',41),(107,'images/products/2017/10/9780812536362.jpg','',0,'2017-10-29 10:29:52.556905',46),(108,'images/products/2017/10/9780955683619.jpg','',0,'2017-10-29 10:29:52.568100',151),(109,'images/products/2017/10/9780974514048.jpg','',0,'2017-10-29 10:29:52.579690',114),(110,'images/products/2017/10/9780974514055.jpg','',0,'2017-10-29 10:29:52.590685',109),(111,'images/products/2017/10/9780976458708.jpg','',0,'2017-10-29 10:29:52.600075',161),(112,'images/products/2017/10/9780976694007.jpg','',0,'2017-10-29 10:29:52.610750',119),(113,'images/products/2017/10/9780977616640.jpg','',0,'2017-10-29 10:29:52.621812',157),(114,'images/products/2017/10/9780978739218.jpg','',0,'2017-10-29 10:29:52.632586',140),(115,'images/products/2017/10/9780982792827.jpg','',0,'2017-10-29 10:29:52.643842',38),(116,'images/products/2017/10/9781416507789.jpg','',0,'2017-10-29 10:29:52.657449',60),(117,'images/products/2017/10/9781416533214.jpg','',0,'2017-10-29 10:29:52.667419',50),(118,'images/products/2017/10/9781429963947.jpg','',0,'2017-10-29 10:29:52.677750',20),(119,'images/products/2017/10/9781430219484.jpg','',0,'2017-10-29 10:29:52.687431',196),(120,'images/products/2017/10/9781430322641.jpg','',0,'2017-10-29 10:29:52.697449',155),(121,'images/products/2017/10/9781450556569.jpg','',0,'2017-10-29 10:29:52.710183',30),(122,'images/products/2017/10/9781466207608.jpg','',0,'2017-10-29 10:29:52.720836',66),(123,'images/products/2017/10/9781568582474.jpg','',0,'2017-10-29 10:29:52.730441',55),(124,'images/products/2017/10/9781590593899.jpg','',0,'2017-10-29 10:29:52.740781',125),(125,'images/products/2017/10/9781591840565.jpg','',0,'2017-10-29 10:29:52.752139',158),(126,'images/products/2017/10/9781591843573.jpg','',0,'2017-10-29 10:29:52.762217',184),(127,'images/products/2017/10/9781593270070.jpg','',0,'2017-10-29 10:29:52.774212',171),(128,'images/products/2017/10/9781593270469.jpg','',0,'2017-10-29 10:29:52.784320',185),(129,'images/products/2017/10/9781593272883.jpg','',0,'2017-10-29 10:29:52.797362',182),(130,'images/products/2017/10/9781607012115.jpg','',0,'2017-10-29 10:29:52.807070',56),(131,'images/products/2017/10/9781617290084.jpg','',0,'2017-10-29 10:29:52.818614',163),(132,'images/products/2017/10/9781848000698.jpg','',0,'2017-10-29 10:29:52.829064',145),(133,'images/products/2017/10/9781857987638.jpg','',0,'2017-10-29 10:29:52.843771',84),(134,'images/products/2017/10/9781857988369.jpg','',0,'2017-10-29 10:29:52.855857',79),(135,'images/products/2017/10/9781931836364.jpg','',0,'2017-10-29 10:29:52.865836',186),(136,'images/products/2017/10/9781934356296.jpg','',0,'2017-10-29 10:29:52.875924',153),(137,'images/products/2017/10/9781934356371.jpg','',0,'2017-10-29 10:29:52.886924',127),(138,'images/products/2017/10/9781934356586.jpg','',0,'2017-10-29 10:29:52.897102',146),(139,'images/products/2017/10/9781934356852.jpg','',0,'2017-10-29 10:29:52.910299',142),(140,'images/products/2017/10/9781935554158.jpg','',0,'2017-10-29 10:29:52.921229',77),(141,'images/products/2017/11/whirlpool_swash.jpg','Whirlpool Swash',0,'2017-11-01 16:13:04.133487',199),(142,'images/products/2017/11/whirlpool_swash_1.jpg','Whirlpool Swash demo',1,'2017-11-01 16:14:31.805293',199);
/*!40000 ALTER TABLE `catalogue_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogue_productrecommendation`
--

DROP TABLE IF EXISTS `catalogue_productrecommendation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogue_productrecommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ranking` smallint(5) unsigned NOT NULL,
  `primary_id` int(11) NOT NULL,
  `recommendation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalogue_productrecomme_primary_id_recommendatio_da1fdf43_uniq` (`primary_id`,`recommendation_id`),
  KEY `catalogue_productrec_recommendation_id_daf8ae95_fk_catalogue` (`recommendation_id`),
  CONSTRAINT `catalogue_productrec_primary_id_6e51a55c_fk_catalogue` FOREIGN KEY (`primary_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `catalogue_productrec_recommendation_id_daf8ae95_fk_catalogue` FOREIGN KEY (`recommendation_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogue_productrecommendation`
--

LOCK TABLES `catalogue_productrecommendation` WRITE;
/*!40000 ALTER TABLE `catalogue_productrecommendation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogue_productrecommendation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_communicationeventtype`
--

DROP TABLE IF EXISTS `customer_communicationeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_communicationeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `email_subject_template` varchar(255) DEFAULT NULL,
  `email_body_template` longtext,
  `email_body_html_template` longtext,
  `sms_template` varchar(170) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_communicationeventtype`
--

LOCK TABLES `customer_communicationeventtype` WRITE;
/*!40000 ALTER TABLE `customer_communicationeventtype` DISABLE KEYS */;
INSERT INTO `customer_communicationeventtype` VALUES (1,'REGISTRATION','Newly registered user','User related','Welcome to {{ site.name }}','Thank you for registering','Thank you for registering','','2012-10-11 15:09:56.317000','2012-10-16 15:09:55.813000'),(2,'PASSWORD_RESET','Forgotten password','User related','Resetting your password at {{ site.name }}','You\'re receiving this e-mail because you requested a password reset for your user account at {{ site.name }}.\r\n\r\nPlease go to the following page and choose a new password:\r\n{{ reset_url }} \r\n\r\nThanks for using our site!\r\nThe {{ site.name }} team','You\'re receiving this e-mail because you requested a password reset for your user account at {{ site.name }}.\r\n\r\n<br><br>Please go to the following page and choose a new password:\r\n{{ reset_url }} \r\n\r\n<br><br>Thanks for using our site!\r\nThe {{ site.name }} team','','2012-10-16 09:47:43.471000','2012-10-16 10:55:03.987000'),(3,'ORDER_PLACED','Order confirmation','Order related','Confirmation of order {{ order.number }}','{% load currency_filters %}Hello,\r\n\r\nWe are pleased to confirm your order {{ order.number }} has been received and will be processed shortly.\r\n\r\nYour order contains:\r\n\r\n{% for line in order.lines.all %}* {{ line.title }} - quantity: {{ line.quantity }} - price: {{ line.line_price_incl_tax|currency }}\r\n{% endfor %}\r\n\r\nBasket total: {{ order.basket_total_incl_tax|currency }}\r\nShipping: {{ order.shipping_incl_tax|currency }}\r\nOrder Total: {{ order.total_incl_tax|currency }}\r\n\r\nShipping address:\r\n\r\n{% for field in order.shipping_address.active_address_fields %}  {{ field }}\r\n{% endfor %}\r\n\r\nThe {{ site.name }} team.','{% load currency_filters %}Hello,<br><br>We are pleased to confirm your order {{ order.number }} has been received and will be processed shortly.<br><br>Your order contains:<br><br>{% for line in order.lines.all %}* {{ line.title }} - quantity: {{ line.quantity }} - price: {{ line.line_price_incl_tax|currency }}<br>{% endfor %}<br><br>Basket total: {{ order.basket_total_incl_tax|currency }}<br>Shipping: {{ order.shipping_incl_tax|currency }}<br>Order Total: {{ order.total_incl_tax|currency }}<br><br>Shipping address:<br><br>{% for field in order.shipping_address.active_address_fields %}&nbsp; {{ field }}<br>{% endfor %}<br><br>The {{ site.name }} team.<br>','','2012-10-16 11:02:13.297000','2012-10-16 11:27:09.349000');
/*!40000 ALTER TABLE `customer_communicationeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_email`
--

DROP TABLE IF EXISTS `customer_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` longtext NOT NULL,
  `body_text` longtext NOT NULL,
  `body_html` longtext NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_email_user_id_a69ad588_fk_auth_user_id` (`user_id`),
  CONSTRAINT `customer_email_user_id_a69ad588_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_email`
--

LOCK TABLES `customer_email` WRITE;
/*!40000 ALTER TABLE `customer_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notification`
--

DROP TABLE IF EXISTS `customer_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `date_sent` datetime(6) NOT NULL,
  `date_read` datetime(6) DEFAULT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notification_recipient_id_d99de5c8_fk_auth_user_id` (`recipient_id`),
  KEY `customer_notification_sender_id_affa1632_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `customer_notification_recipient_id_d99de5c8_fk_auth_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `customer_notification_sender_id_affa1632_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notification`
--

LOCK TABLES `customer_notification` WRITE;
/*!40000 ALTER TABLE `customer_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_productalert`
--

DROP TABLE IF EXISTS `customer_productalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_productalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `key` varchar(128) NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_confirmed` datetime(6) DEFAULT NULL,
  `date_cancelled` datetime(6) DEFAULT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_productaler_product_id_7e529a41_fk_catalogue` (`product_id`),
  KEY `customer_productalert_user_id_677ad6d6_fk_auth_user_id` (`user_id`),
  KEY `customer_productalert_email_e5f35f45` (`email`),
  KEY `customer_productalert_key_a26f3bdc` (`key`),
  CONSTRAINT `customer_productaler_product_id_7e529a41_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `customer_productalert_user_id_677ad6d6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_productalert`
--

LOCK TABLES `customer_productalert` WRITE;
/*!40000 ALTER TABLE `customer_productalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_productalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-30 02:36:57.996376','7','Appliances',1,'[{\"added\": {}}]',22,1),(2,'2017-10-30 02:53:45.654428','8','Appliances > Clothes Dryers',1,'[{\"added\": {}}]',22,1),(3,'2017-10-30 16:07:11.778461','8','Appliances > Household',2,'[{\"changed\": {\"fields\": [\"name\", \"slug\"]}}]',22,1),(4,'2017-10-30 16:13:21.435016','2','C',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Product attribute\", \"object\": \"Brand\"}}, {\"added\": {\"name\": \"Product attribute\", \"object\": \"Model\"}}, {\"added\": {\"name\": \"Product attribute\", \"object\": \"Capacity (KG)\"}}, {\"added\": {\"name\": \"Product attribute\", \"object\": \"Watt (W)\"}}]',28,1),(5,'2017-10-30 16:13:46.833321','2','Clothes Dryers',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',28,1),(6,'2017-11-01 15:55:56.965571','199','Whirlpool Swash',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Product attribute value\", \"object\": \"Brand: Swash\"}}, {\"added\": {\"name\": \"Product attribute value\", \"object\": \"Capacity (KG): 5.0\"}}, {\"added\": {\"name\": \"Product attribute value\", \"object\": \"Model: SFF1001CSA\"}}, {\"added\": {\"name\": \"Product attribute value\", \"object\": \"Watt (W): 1000\"}}, {\"added\": {\"name\": \"Product category\", \"object\": \"<productcategory for product \'Whirlpool Swash\'>\"}}]',24,1),(7,'2017-11-01 16:08:05.091641','1','partner_code',1,'[{\"added\": {}}]',23,1),(8,'2017-11-01 16:08:46.833255','2','serial_num',1,'[{\"added\": {}}]',23,1),(9,'2017-11-01 16:09:00.029433','199','Whirlpool Swash',2,'[{\"changed\": {\"fields\": [\"product_options\"]}}]',24,1),(10,'2017-11-01 16:13:04.160821','141','Image of \'Whirlpool Swash\'',1,'[{\"added\": {}}]',29,1),(11,'2017-11-01 16:14:31.833744','142','Image of \'Whirlpool Swash\'',1,'[{\"added\": {}}]',29,1),(12,'2017-11-01 16:16:49.854995','4','luck_is_coming',1,'[{\"added\": {}}]',33,1),(13,'2017-11-01 16:20:56.104531','199','Partner: luck_is_coming, product: Whirlpool Swash (GZTHHILTON06606)',1,'[{\"added\": {}}]',36,1),(14,'2017-11-01 16:21:36.355205','200','Partner: luck_is_coming, product: Whirlpool Swash (GZTHHILTON12606)',1,'[{\"added\": {}}]',36,1),(15,'2017-11-01 16:22:50.779441','201','Partner: luck_is_coming, product: Whirlpool Swash (GZTH4SEASONS06606)',1,'[{\"added\": {}}]',36,1),(16,'2017-11-01 16:25:50.322957','4','LuckIsComing',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',33,1),(17,'2017-11-01 17:01:49.817922','1','PartnerAsset object',1,'[{\"added\": {}}]',97,1),(18,'2017-11-01 17:03:05.134841','2','PartnerAsset object',1,'[{\"added\": {}}]',97,1),(19,'2017-11-01 17:04:12.618650','3','PartnerAsset object',1,'[{\"added\": {}}]',97,1),(20,'2017-11-01 17:08:29.580729','3','PartnerAsset object',2,'[{\"changed\": {\"fields\": [\"serial_num\"]}}]',97,1),(21,'2017-11-01 17:08:40.691288','2','LineAttribute object',2,'[{\"changed\": {\"fields\": [\"value\"]}}]',39,1),(22,'2017-11-05 13:42:35.016812','2','Clothes Dryers',2,'[{\"changed\": {\"name\": \"Product attribute\", \"object\": \"Model\", \"fields\": [\"name\", \"code\", \"type\"]}}, {\"changed\": {\"name\": \"Product attribute\", \"object\": \"Location\", \"fields\": [\"name\", \"code\"]}}, {\"deleted\": {\"name\": \"Product attribute\", \"object\": \"Watt (W)\"}}]',28,1),(23,'2017-11-05 14:03:26.549491','199','Whirlpool Swash Dryer',2,'[{\"changed\": {\"fields\": [\"structure\", \"title\", \"slug\"]}}, {\"changed\": {\"name\": \"Product attribute value\", \"object\": \"Model: SFF1001CSA\", \"fields\": [\"value_text\"]}}, {\"deleted\": {\"name\": \"Product attribute value\", \"object\": \"Address: \\u5e7f\\u5dde\\u5929\\u6cb3\\u56db\\u5b63\\u9152\\u5e97\"}}]',24,1),(24,'2017-11-05 14:26:33.749720','2','Clothes Dryers',2,'[{\"changed\": {\"name\": \"Product attribute\", \"object\": \"Address\", \"fields\": [\"required\"]}}]',28,1),(25,'2017-11-05 14:26:45.214576','200','Whirlpool Swash Dryer (Address: 广州天河希尔顿酒店)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Product attribute value\", \"object\": \"Address: \\u5e7f\\u5dde\\u5929\\u6cb3\\u5e0c\\u5c14\\u987f\\u9152\\u5e97\"}}, {\"added\": {\"name\": \"Product category\", \"object\": \"<productcategory for product \'Whirlpool Swash Dryer (Address: \\u5e7f\\u5dde\\u5929\\u6cb3\\u5e0c\\u5c14\\u987f\\u9152\\u5e97)\'>\"}}]',24,1),(26,'2017-11-05 16:38:27.049598','200','Whirlpool Swash Dryer (Address: 广州天河希尔顿酒店)',3,'',24,1),(27,'2017-11-05 16:39:10.480997','199','Whirlpool Swash Dryer',2,'[{\"changed\": {\"fields\": [\"structure\", \"product_options\"]}}]',24,1),(28,'2017-11-05 16:59:10.295755','1','广州天河希尔顿酒店06606',1,'[{\"added\": {}}]',98,1),(29,'2017-11-05 16:59:42.456733','2','广州天河希尔顿酒店12606',1,'[{\"added\": {}}]',98,1),(30,'2017-11-05 17:00:16.477423','3','广州天河四季酒店06606',1,'[{\"added\": {}}]',98,1),(31,'2017-11-05 17:21:20.896767','3','广州天河四季酒店06606',2,'[{\"changed\": {\"fields\": [\"code\"]}}]',98,1),(32,'2017-11-05 17:21:32.047397','2','广州天河希尔顿酒店12606',2,'[{\"changed\": {\"fields\": [\"code\"]}}]',98,1),(33,'2017-11-05 17:21:42.179449','1','广州天河希尔顿酒店06606',2,'[{\"changed\": {\"fields\": [\"code\"]}}]',98,1),(34,'2017-11-05 17:54:23.669635','2','code',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,1),(35,'2017-11-05 17:55:30.567223','1','unit_duration',2,'[{\"changed\": {\"fields\": [\"name\", \"type\"]}}]',23,1),(36,'2017-11-05 17:56:05.474516','1','unit_duration_min',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',23,1),(37,'2017-11-05 17:59:47.370366','2','Clothes Dryers',2,'[{\"changed\": {\"fields\": [\"options\"]}}, {\"deleted\": {\"name\": \"Product attribute\", \"object\": \"Address\"}}]',28,1),(38,'2017-11-05 18:00:34.962869','199','Whirlpool Swash Dryer',2,'[{\"changed\": {\"fields\": [\"product_options\"]}}]',24,1),(39,'2017-11-18 04:03:04.929868','202','Partner: LuckIsComing, product: Django T-shirt (Size: Large) (TEST PARENT CHILD STRUCTURE)',1,'[{\"added\": {}}]',36,1),(40,'2017-11-18 04:31:29.209801','202','Partner: LuckIsComing, product: Django T-shirt (Size: Large) (TEST PARENT CHILD STRUCTURE)',3,'',36,1),(41,'2017-11-19 12:04:06.469801','199','Partner: LuckIsComing, product: Whirlpool Swash Dryer (GZTHHILTON06606)',2,'[{\"changed\": {\"fields\": [\"partner_sku\", \"cost_price\", \"num_in_stock\"]}}]',36,1),(42,'2017-11-19 12:04:30.151647','203','Partner: LuckIsComing, product: Whirlpool Swash Dryer (GZTHHILTON12606)',1,'[{\"added\": {}}]',36,1),(43,'2017-11-19 12:06:06.554794','204','Partner: LuckIsComing, product: Whirlpool Swash Dryer (GZTH4SEASONS06606)',1,'[{\"added\": {}}]',36,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'account','profile'),(15,'address','country'),(16,'address','useraddress'),(10,'admin','logentry'),(11,'analytics','productrecord'),(12,'analytics','userproductview'),(13,'analytics','userrecord'),(14,'analytics','usersearch'),(2,'auth','group'),(1,'auth','permission'),(5,'authx','user'),(37,'basket','basket'),(38,'basket','line'),(39,'basket','lineattribute'),(20,'catalogue','attributeoption'),(21,'catalogue','attributeoptiongroup'),(22,'catalogue','category'),(23,'catalogue','option'),(24,'catalogue','product'),(25,'catalogue','productattribute'),(26,'catalogue','productattributevalue'),(27,'catalogue','productcategory'),(28,'catalogue','productclass'),(29,'catalogue','productimage'),(30,'catalogue','productrecommendation'),(3,'contenttypes','contenttype'),(76,'customer','communicationeventtype'),(77,'customer','email'),(78,'customer','notification'),(79,'customer','productalert'),(9,'flatpages','flatpage'),(50,'offer','absolutediscountbenefit'),(44,'offer','benefit'),(45,'offer','condition'),(46,'offer','conditionaloffer'),(51,'offer','countcondition'),(52,'offer','coveragecondition'),(53,'offer','fixedpricebenefit'),(54,'offer','multibuydiscountbenefit'),(55,'offer','percentagediscountbenefit'),(47,'offer','range'),(48,'offer','rangeproduct'),(49,'offer','rangeproductfileupload'),(57,'offer','shippingabsolutediscountbenefit'),(56,'offer','shippingbenefit'),(58,'offer','shippingfixedpricebenefit'),(59,'offer','shippingpercentagediscountbenefit'),(60,'offer','valuecondition'),(61,'order','billingaddress'),(62,'order','communicationevent'),(63,'order','line'),(64,'order','lineattribute'),(65,'order','lineprice'),(66,'order','order'),(67,'order','orderdiscount'),(68,'order','ordernote'),(69,'order','paymentevent'),(70,'order','paymenteventquantity'),(71,'order','paymenteventtype'),(72,'order','shippingaddress'),(73,'order','shippingevent'),(74,'order','shippingeventquantity'),(75,'order','shippingeventtype'),(96,'oscarapi','apikey'),(98,'partner','assetlocation'),(33,'partner','partner'),(34,'partner','partneraddress'),(97,'partner','partnerasset'),(35,'partner','stockalert'),(36,'partner','stockrecord'),(40,'payment','bankcard'),(41,'payment','source'),(42,'payment','sourcetype'),(43,'payment','transaction'),(80,'promotions','automaticproductlist'),(81,'promotions','handpickedproductlist'),(82,'promotions','image'),(83,'promotions','keywordpromotion'),(84,'promotions','multiimage'),(85,'promotions','orderedproduct'),(86,'promotions','orderedproductlist'),(87,'promotions','pagepromotion'),(88,'promotions','rawhtml'),(89,'promotions','singleproduct'),(90,'promotions','tabbedblock'),(31,'reviews','productreview'),(32,'reviews','vote'),(4,'sessions','session'),(17,'shipping','orderanditemcharges'),(18,'shipping','weightband'),(19,'shipping','weightbased'),(8,'sites','site'),(95,'thumbnail','kvstore'),(91,'voucher','voucher'),(92,'voucher','voucherapplication'),(93,'wishlists','line'),(94,'wishlists','wishlist');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_url_41612362` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
INSERT INTO `django_flatpage` VALUES (1,'/about/','About','Nisi thundercats fugiat, odio kale chips sapiente fap biodiesel polaroid bushwick duis before they sold out single-origin coffee pour-over. Gastropub scenester echo park messenger bag qui, sapiente sartorial pinterest quinoa american apparel odd future irony marfa. 3 wolf moon mixtape nulla VHS cupidatat blog jean shorts typewriter. Williamsburg cardigan terry richardson, wes anderson lomo PBR placeat ex ethnic in reprehenderit. Exercitation high life accusamus, id ut quis cred truffaut occupy ethical yr dreamcatcher godard occaecat cupidatat. American apparel cliche excepteur ullamco, twee umami id williamsburg vice bushwick. Hella vinyl mumblecore aliqua sartorial.\r\n\r\nKale chips pop-up echo park quinoa photo booth reprehenderit, odd future letterpress fap fugiat irure seitan 3 wolf moon DIY dreamcatcher. Fanny pack cupidatat street art sint aesthetic. Irony kale chips duis swag readymade cred. Mlkshk retro culpa sustainable tempor wes anderson, vinyl selvage esse gluten-free cliche Austin. Etsy kogi duis officia, excepteur wes anderson nulla. Delectus fixie chambray, swag you probably haven\'t heard of them qui gentrify veniam. Pork belly high life non, in shoreditch keffiyeh cosby sweater voluptate bushwick.\r\n\r\nSynth ex cardigan, fanny pack small batch vinyl DIY sartorial pork belly gentrify mumblecore godard irony. Twee blog forage, Austin placeat post-ironic pop-up williamsburg dolore chambray four loko culpa squid. Stumptown mumblecore aute, terry richardson nesciunt cardigan quinoa laborum letterpress. Est squid brooklyn placeat messenger bag, shoreditch williamsburg bushwick pour-over lo-fi post-ironic cray. Yr kale chips nihil brunch, culpa thundercats artisan. Organic aute flexitarian, do id blog ex banh mi cray carles craft beer messenger bag. Odio Austin sartorial bushwick aliqua sunt.\r\n\r\nAssumenda semiotics ut four loko cillum skateboard, lo-fi fanny pack sartorial non adipisicing carles ethnic narwhal elit. Aliqua tumblr readymade ennui terry richardson next level, fugiat placeat aesthetic 3 wolf moon bushwick. Qui retro godard hella odio, sapiente salvia ullamco eiusmod incididunt selvage. Organic bespoke eiusmod umami, farm-to-table fap beard food truck est forage. Banh mi pitchfork mcsweeney\'s elit, VHS duis irony williamsburg. Williamsburg voluptate synth bicycle rights, cardigan mixtape lomo pickled organic locavore. In seitan aliquip sriracha, id helvetica wolf thundercats viral ethical quinoa kogi.',0,'',0);
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` (`site_id`),
  CONSTRAINT `django_flatpage_sites_flatpage_id_078bbc8b_fk_django_flatpage_id` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
INSERT INTO `django_flatpage_sites` VALUES (3,1,1);
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-09-17 17:16:44.864893'),(2,'contenttypes','0002_remove_content_type_name','2017-09-17 17:16:44.919808'),(3,'auth','0001_initial','2017-09-17 17:16:45.046982'),(4,'auth','0002_alter_permission_name_max_length','2017-09-17 17:16:45.070621'),(5,'auth','0003_alter_user_email_max_length','2017-09-17 17:16:45.078741'),(6,'auth','0004_alter_user_username_opts','2017-09-17 17:16:45.084808'),(7,'auth','0005_alter_user_last_login_null','2017-09-17 17:16:45.091778'),(8,'auth','0006_require_contenttypes_0002','2017-09-17 17:16:45.096140'),(9,'auth','0007_alter_validators_add_error_messages','2017-09-17 17:16:45.102973'),(10,'auth','0008_alter_user_username_max_length','2017-09-17 17:16:45.110955'),(11,'authx','0001_initial','2017-09-17 17:16:45.235146'),(12,'sessions','0001_initial','2017-09-17 17:16:45.260771'),(13,'authx','0002_alter_user','2017-10-19 17:05:58.499324'),(14,'account','0001_initial','2017-10-22 06:49:06.977158'),(15,'address','0001_initial','2017-10-29 09:22:23.605193'),(16,'address','0002_auto_20150927_1547','2017-10-29 09:22:23.730768'),(17,'address','0003_auto_20150927_1551','2017-10-29 09:22:23.825803'),(18,'address','0004_auto_20170226_1122','2017-10-29 09:22:23.890065'),(19,'admin','0001_initial','2017-10-29 09:22:23.999267'),(20,'admin','0002_logentry_remove_auto_add','2017-10-29 09:22:24.060123'),(21,'catalogue','0001_initial','2017-10-29 09:22:25.895764'),(22,'analytics','0001_initial','2017-10-29 09:22:26.234768'),(23,'analytics','0002_auto_20140827_1705','2017-10-29 09:22:26.630411'),(24,'sites','0001_initial','2017-10-29 09:22:26.662798'),(25,'partner','0001_initial','2017-10-29 09:22:27.309178'),(26,'customer','0001_initial','2017-10-29 09:22:27.773789'),(27,'basket','0001_initial','2017-10-29 09:22:27.920318'),(28,'basket','0002_auto_20140827_1705','2017-10-29 09:22:28.744773'),(29,'order','0001_initial','2017-10-29 09:22:33.300120'),(30,'offer','0001_initial','2017-10-29 09:22:35.128251'),(31,'voucher','0001_initial','2017-10-29 09:22:35.618652'),(32,'basket','0003_basket_vouchers','2017-10-29 09:22:35.854260'),(33,'basket','0004_auto_20141007_2032','2017-10-29 09:22:35.969343'),(34,'basket','0005_auto_20150604_1450','2017-10-29 09:22:36.195357'),(35,'basket','0006_auto_20160111_1108','2017-10-29 09:22:36.300422'),(36,'basket','0007_slugfield_noop','2017-10-29 09:22:36.408963'),(37,'catalogue','0002_auto_20150217_1221','2017-10-29 09:22:36.515384'),(38,'catalogue','0003_data_migration_slugs','2017-10-29 09:22:36.775455'),(39,'catalogue','0004_auto_20150217_1710','2017-10-29 09:22:36.876762'),(40,'catalogue','0005_auto_20150604_1450','2017-10-29 09:22:37.056699'),(41,'catalogue','0006_auto_20150807_1725','2017-10-29 09:22:37.121463'),(42,'catalogue','0007_auto_20151207_1440','2017-10-29 09:22:37.175819'),(43,'catalogue','0008_auto_20160304_1652','2017-10-29 09:22:37.231464'),(44,'catalogue','0009_slugfield_noop','2017-10-29 09:22:37.284473'),(45,'catalogue','0010_auto_20170420_0439','2017-10-29 09:22:37.725387'),(46,'catalogue','0011_auto_20170422_1355','2017-10-29 09:22:37.818463'),(47,'catalogue','0012_auto_20170609_1902','2017-10-29 09:22:37.971728'),(48,'customer','0002_auto_20150807_1725','2017-10-29 09:22:38.016126'),(49,'customer','0003_update_email_length','2017-10-29 09:22:38.132330'),(50,'customer','0004_email_save','2017-10-29 09:22:38.392658'),(51,'flatpages','0001_initial','2017-10-29 09:22:38.725111'),(52,'offer','0002_auto_20151210_1053','2017-10-29 09:22:38.810053'),(53,'offer','0003_auto_20161120_1707','2017-10-29 09:22:38.888446'),(54,'offer','0004_auto_20170415_1518','2017-10-29 09:22:38.937858'),(55,'offer','0005_auto_20170423_1217','2017-10-29 09:22:39.248766'),(56,'offer','0006_auto_20170504_0616','2017-10-29 09:22:39.342879'),(57,'order','0002_auto_20141007_2032','2017-10-29 09:22:39.444930'),(58,'order','0003_auto_20150113_1629','2017-10-29 09:22:39.532043'),(59,'order','0004_auto_20160111_1108','2017-10-29 09:22:39.639328'),(60,'order','0005_update_email_length','2017-10-29 09:22:39.736076'),(61,'partner','0002_auto_20141007_2032','2017-10-29 09:22:39.835074'),(62,'partner','0003_auto_20150604_1450','2017-10-29 09:22:40.020134'),(63,'partner','0004_auto_20160107_1755','2017-10-29 09:22:40.086607'),(64,'payment','0001_initial','2017-10-29 09:22:40.864454'),(65,'payment','0002_auto_20141007_2032','2017-10-29 09:22:40.954874'),(66,'payment','0003_auto_20160323_1520','2017-10-29 09:22:41.033237'),(67,'promotions','0001_initial','2017-10-29 09:22:42.468425'),(68,'promotions','0002_auto_20150604_1450','2017-10-29 09:22:42.715527'),(69,'reviews','0001_initial','2017-10-29 09:22:43.422880'),(70,'reviews','0002_update_email_length','2017-10-29 09:22:43.530680'),(71,'reviews','0003_auto_20160802_1358','2017-10-29 09:22:43.611260'),(72,'reviews','0004_auto_20170429_0941','2017-10-29 09:22:43.773285'),(73,'shipping','0001_initial','2017-10-29 09:22:44.398505'),(74,'shipping','0002_auto_20150604_1450','2017-10-29 09:22:44.812214'),(75,'sites','0002_alter_domain_unique','2017-10-29 09:22:44.871296'),(76,'thumbnail','0001_initial','2017-10-29 09:22:44.923025'),(77,'voucher','0002_auto_20170418_2132','2017-10-29 09:22:45.260223'),(78,'wishlists','0001_initial','2017-10-29 09:22:45.849669'),(79,'wishlists','0002_auto_20160111_1108','2017-10-29 09:22:45.939440'),(80,'oscarapi','0001_initial','2017-10-30 09:30:31.442375'),(81,'partner','0005_auto_20171030_0938','2017-10-30 09:38:36.560492'),(83,'partner','0006_add_assetlocation','2017-11-05 16:53:28.932481');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00w9s68xkp607nu1vj0oknql5daub12d','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:10:27.888083'),('04wefhuvaeu1agfjlzloe9sc3nzvdpdx','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:44:04.205561'),('07irn87m7xu748i9l9xznp1nfow0zyl5','ZjMwZjA3NGM4ZjY2YTQwOTgxODk3OTY3Mzc4OGE3MDY2Njg5ZjU4ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo2NX0=','2017-12-11 17:08:20.033925'),('08n4lhssh9yozfkgezldapiki7jkhrfi','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:40:56.516409'),('09x07jqjdv79sq8xvuhktym0q5qm9tw7','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:08:38.898504'),('0a1ovyt6srf29w86o2ldyxcqr0u1abtx','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:35:33.095274'),('0bnn3jfvskmxa6apw1h4najaojl2fm66','NTU1MTM0Mjc2Yjc3ZTM3NGY1MTNlZDBhZjhkNmE0MGRkMGFhMWQxMzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MH0=','2017-12-11 17:25:59.538303'),('0g4ep7kr81tsl57dsbzsu36o0neqmyth','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:43:37.554586'),('0ij0stnzaf9z7vwjhrkk409n255qqx5s','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:29:44.770372'),('0j5kulms2c8vst6cnhbjfp5av2sw69ar','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:15:53.234348'),('0qe7pgs2rajzrammlqnpd10xiihx7mua','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:29:26.767256'),('0qriouhkrhlc6foghnwu13898d3r3acm','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 12:30:27.780881'),('0sndrryj7ff21xes54y7k67sadd8l8bi','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:13:45.590467'),('0tphml43uc0ihh6geqeb2khk1r66n7ft','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:03:27.794190'),('0ww2mot9pz4kk3wg3wopq4nac8ifahar','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:41:02.859472'),('0yqdrlg5w1cu7l9q98j1t0t7ag5v0ui8','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:28:25.166109'),('0yzefoprg7ar2qywd7n5tf3ie4gqh0gm','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:55:38.086597'),('0zhrxwo5vwt292zx4izuv58j0bb4erni','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:55:41.754760'),('12dfrdj6sx7a0ncsbu3fz27h98v17su8','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:16:12.708493'),('15zj53pr8zvbd2o0k90wxfmsfd9oicf0','ZTAzODFiZWViYWVmNjkxOTBlYzhmMmQwZTU5YWIxOWQ0OGIyM2Q5Njp7Im9zY2FyX29wZW5fYmFza2V0Ijo4fQ==','2017-11-22 17:28:15.082894'),('1cnxns5kdkkslbk4ygweh3gr54h1qnyk','MDMyOTI4Y2JhOWY1MGUwZmFhYjkyMmRhMDAxOGUwOGZhM2FjODc3YTp7Im9zY2FyX29wZW5fYmFza2V0IjoyNH0=','2017-12-04 18:25:08.070032'),('1d404n2m4wi3ox1vbqwstytr0qpfjf9y','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:05.392586'),('1ddwilcfuou3ttpkesas2jftbpk7yki8','YmRiY2MzOWZlOWY1MThjZTZkMTU1MzRhMGNkNTU5OGUzOTI3MTk2ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5N30=','2017-12-12 15:27:37.989002'),('1es0huhwsup7ogbu70x92sgk6f28rk3o','MjRhM2VkOTZiZDVhZjAyMTY1MjFlNDlmZjU3NGQ5ZmE3Yzc4YTNhYzp7Im9zY2FyX29wZW5fYmFza2V0Ijo3NH0=','2017-12-11 17:08:31.723253'),('1gag77slbw613obvct39cxthhpy0t7pj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:25:08.488375'),('1iitchdefyfx2nqxquccd0gw9v9uiznk','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:33.583438'),('1is0b78kjbwdy32huga4vcxrp6j62i56','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:56:42.475148'),('1kf0l5wxetcnxx1vthpol5b59vn786iy','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:06:03.419811'),('1lms0r5mezh22sne5o2oorz32aovnf5k','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:35:08.781278'),('1lvo1ds0h7jk4fosmcplo6mggx6lw6jm','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-04 17:03:43.240086'),('1pugt9wrvg319hgclj2xz3i19rb5fcj9','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:47:06.852310'),('1ul8tz14enphahegyp8g7ji8aqsdp5p2','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:01:06.799602'),('1v1lengwrasj0rudo91ye6zojc8wnwzr','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:49:05.035421'),('1vpxcytrm4f7jezpmpfvzdt45hw74xxv','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:52:06.403956'),('1yyhfewmmf7ps392u2tr78q2qb9vpvky','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:08:58.821966'),('1zmq8kupj7rq1m2fcnc50c7b87c5qdov','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:49:07.080473'),('21h6kl5f86ndzqsb0fi4pds5g5rnlpv9','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:55:55.407043'),('254mu3y2fjbrknlu1ied8whl8dl7vh6w','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:56:35.971661'),('2573e36mm9bi7iig3tqywnmx931y4o6d','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:01:59.876848'),('25gu4znf6fy3d68vu00nb9k3zspk7zwi','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:36:55.558336'),('25y8tilw4boqsr2ioed6byty0mmxi80j','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:23:21.407646'),('26supvle7cq96x6jjz3suthlfjb8tizd','OTYwODhjZjMwYzc2NTE1OWI1MjNkOGU1N2M0ZGE3ZTJiMzZjYjFmMjp7Im9zY2FyX29wZW5fYmFza2V0Ijo1NH0=','2017-12-11 17:08:06.043548'),('26xlwn9wigms590x0o7it4goyx0d1h4a','ZTEzN2UzMWZmMTAxMDQ2Zjg4YTJhM2U2M2MzMGQ5Y2I5Y2IxYTQ2Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoyNn0=','2017-12-04 18:34:31.029082'),('28ogimjq78p4lpkv020kn4cxl61jahpy','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 17:00:52.058612'),('2b9l1tejdzi3g3hdotjfbg131hpeq2ip','YmRiY2MzOWZlOWY1MThjZTZkMTU1MzRhMGNkNTU5OGUzOTI3MTk2ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5N30=','2017-12-12 15:27:36.877666'),('2ebh8tnm6p3n77sg0063mllvuqicsd14','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:53:29.954721'),('2fhnsmbyqs7f11qf5dar92s30gdmbohx','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:55:07.975320'),('2fp9r79ppyuaru7a100v4k67kns6d4en','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:19:15.954743'),('2gzivjxbdjucze6zeplvxgcu0xy9mqk7','N2UwNGJmYjgwOWYzN2RmM2RhZWZmMTY3ZDk2MWFkNjJkMDFhNTJlMTp7Im9zY2FyX29wZW5fYmFza2V0Ijo2OH0=','2017-12-11 17:08:23.989086'),('2ik03xkuiyqnbd4x5sna6gnrzgsii0jr','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:34:31.871956'),('2irbmubpvf03b65zwne6csyxhpkqmyo6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:54:08.506870'),('2jcokj2favtozo09xfqbkw07uixooyu0','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:01:07.208918'),('2k86m6b78u0ix8whk80863auyzwq6l84','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-04 18:38:34.278428'),('2kpa6pufit1b5ysxo305xp1hmmxa748g','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-04 17:13:20.980476'),('2lebt80ig30stnoz3rcvfjuttzks21ic','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:35:47.565525'),('2mlkf144ob2yc4t24axdytkzuatp6hw9','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 15:16:23.197305'),('2n04i2pn3xs86p1mvcbsjequl6oebnhr','YWNiMWQ4Yjk4N2UxNGJkN2JjZmI5MDVhMjQxZWY5ZjAzMzViZGQ3Mjp7Im9zY2FyX29wZW5fYmFza2V0Ijo0MH0=','2017-12-11 17:07:47.996564'),('2radbefaq839rfkt848e69ocgx26r36a','YWI1MWE0OWQ2M2U0ZGRlNzNkODc0ZTdlNDUxNzA0NDU3NTBiN2MzZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MX0=','2017-12-11 17:26:12.589543'),('2rxwskwwjfzphmuyzf4e6ln28zyfm925','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:27:27.138086'),('2t5c23qjyrg66yfb6wz04xkqallbxj3u','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:10:41.980478'),('2tarwz8acijq7rbss2k8fyeqt01vibuo','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:36:36.690477'),('2y7hx3uud0mbs7zqkx1rjqw20rnztwju','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:23:07.327407'),('2y7qjqxparyf6j8t6339ixxjdi88wz8o','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:16:37.550532'),('2yfgaxqpj3fmk3m81j6jw8aw0l0pgc4n','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:50:45.088980'),('33l098lsllg2arc3s4yzj5m467feal4r','N2FjZDQzMTAxMWNiMzc5MjgzZjI5Zjg1NTYyY2E3ZmVlMjA5ZjMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MDI2ODdlZTE4Y2M1NjExYTE5MmQ4NjMyZDNhMzY5MmYxYzJlMDVlIiwib3NjYXJfb3Blbl9iYXNrZXQiOjF9','2017-12-04 18:31:00.624845'),('34rxz9ksmgfafl4pmuhucuo2e9zwbzx1','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:02:55.049495'),('34slkt1s1qv7gfd3t6llh7susu6tsujv','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-22 19:08:01.071465'),('3549erdju6fsn9fjql5xewja70bu2xg9','YWI1MWE0OWQ2M2U0ZGRlNzNkODc0ZTdlNDUxNzA0NDU3NTBiN2MzZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MX0=','2017-12-11 17:39:35.132623'),('37w21cynlfttmvd562az1kzv7r890rhy','MDFlMjVmYTExOTc5OTgwNTFjNTBhMWJhOWJlZWVmMmI0MGU2YzVlYTp7Im9zY2FyX29wZW5fYmFza2V0Ijo1NX0=','2017-12-11 17:08:07.312964'),('3alhimbycgx96ib8ckk5ib7vwhrihvw3','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:25:03.793275'),('3ghpt2ewwvw4zrgy8cdhugcn0funap0e','ODU0NzI3NjllMWVkN2E4ZjgyZWRlMDRmNjdmZWQwN2NlZDVlZDhkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo4MX0=','2017-12-11 17:08:40.781007'),('3mwiv5oh0rljkh4jwvs0yd1o4o3r5yi9','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:48:07.551565'),('3nvl673saq82v4crwbkt44v1wczdq7vp','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:50:40.183205'),('3nwenb94gos8n3xp1pt14u3nrugg03vo','M2JlOTUyYzk4NjUyZjYwOTBjYjcwYzNhNmJjYTA4YTk4YjE2NjdjODp7Im9zY2FyX29wZW5fYmFza2V0Ijo1MX0=','2017-12-11 17:08:02.199424'),('3o29lzoabfnqwq9oej8f0qd95f0uopxp','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:44:15.052964'),('3p90f096hks766nl9jr9mkd45e4kpyg7','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-04 18:40:41.855946'),('3w54m81ityfbo80pgvnmxh9t9wyhtesl','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:36:29.040633'),('41aa9spojw8sdvsm75aohvvrbzniysg4','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:47:50.451572'),('41qprrpr1u6586c5obveuakn8bdwjmti','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:53:47.494858'),('42y3wnuhuvgxtvm4uzvftsoag0701864','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:44:50.988615'),('43vvnqlc50k7nrkqqnx160la7ufjxoaf','YTZmZTZiZDRmNTNhNTJmYzY0MjlhZTYxMTFkMDNlYWMyZmIyYzI2ZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyOH0=','2017-12-04 18:38:28.179880'),('4552prot6ijzftv4cg7ee40iwulatcq2','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:12:19.123787'),('48193d1jfakn02qbt0ldz3mnspzrx8yb','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:10:12.157330'),('48h01w7oqgbqp4h74yv6fgv99q5pjeyr','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:45.712992'),('493264jdcv1jazdznw4f0or9fqee765t','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:08:31.079972'),('49m0lykz92g9td6zv75j48lwr39i4cs8','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:34:22.522214'),('49t7udzgpe64nqw402xsbpq23964rjs5','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:06:43.372361'),('4ah39wy7g2wfcdij8utbvrmop4yrqyx4','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:57:52.474083'),('4apn2jgyr9gzxon59oe7esmtobgtuy8r','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:33:32.769755'),('4b0uwvczyg1oz6edvqb94lq6pfdox3bg','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:28:14.370445'),('4b4rhapimnbsjd1pu0hmnn8xh6l8iggp','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:29:47.490056'),('4hu2juwyxwdjgplnpkl4jynnhnyyepmz','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:39:41.439207'),('4i4rfc0cynpb4otpdatiaduugmxqbrua','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:57:07.219370'),('4j7i2x10qzr5agomhxc2qg1r7wadagh2','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:26:08.738507'),('4mipjnun1hwqi947oizbfqfhwianatlg','ZGY4MzFhOWFmMmQxOGE2NjQ3NDE2ZDllYmExNzM4MzE2M2MxMzk1Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoyMn0=','2017-12-03 15:12:33.116880'),('4ngztxmj3cr0s6cy7dud20klz2vlq390','NTU1MTM0Mjc2Yjc3ZTM3NGY1MTNlZDBhZjhkNmE0MGRkMGFhMWQxMzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MH0=','2017-12-11 17:16:51.198143'),('4r7nypsahc3z8s0m3o8oziodzpkrla6m','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:39:32.833529'),('4st3umt9wtwmu2wf62zx860efb3y85oi','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:25:49.298733'),('4tm5hxpum2it3jsoolka80dra9xob9t2','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:34:46.515525'),('4u6t0jii2jeq09jhbukbmjjpzndi64jw','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 09:28:42.999318'),('4v4qvdoa0e63k291k2bn7gn31jhi5jnv','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:02:10.644713'),('4ve5wy11aprhr8crgu9ixht2b9gefyb0','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-29 16:00:07.912251'),('4x2oiyhv9z37n2rs4grt1e6fzwmhepcv','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:31:10.846741'),('4x7eejmr4t0lc0sjo2g46bncm1nptbrv','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:09.036588'),('50u1en5z8kdf2cy3avblz1xlyo4u25oq','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:17:57.982528'),('525bdpc8wjx877nqigroudc86b1jrwbs','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:17:34.926512'),('52z3dhrcx8jy7a8uvrgbvce71i1ci5mm','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:16:32.901691'),('54yrualspxgrh8z1w03zwac3pcg5vq1c','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:09:07.623585'),('5br3963nnqn9dqvq5at4bfvvbk3qppab','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:23:37.801181'),('5cqt2isuuv08qwm93lhjkcvmis48bcoh','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:01:06.628847'),('5h2kaxmvybuxxmbu0qe6eg1fa1ujxx5m','ZTEzN2UzMWZmMTAxMDQ2Zjg4YTJhM2U2M2MzMGQ5Y2I5Y2IxYTQ2Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoyNn0=','2017-12-04 18:32:45.046896'),('5h74a0rtf93fcug73qrh9iu8yjd1juux','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:13:05.185817'),('5icaj2guxk6mexd6oifgwq8pj6sv1bsd','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:10:40.524032'),('5il2zz7cv3a2q9r716u0dif4qsvavniz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:33.432069'),('5m5gotok6u8ug594vs3ziociizdibc8e','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:13:39.206936'),('5n6dhngeyqgqksynllf5v8kv321rfdzx','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:56:55.117359'),('5o8s5ymp5imcuc6l6wew94k5inwtnf6m','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:41:38.896485'),('5siwgfvyxqk4crvespny2a4zdggabnq6','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:43:39.861271'),('5u5p78cp05qoc68tn6ref6nsu7xz807b','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:49:08.145195'),('5uwh2z2dqlodyks7sxhlypq0jgc3wcp3','ODE1OWI4MzA0ZmIwMTlhMGEyNzNjNGIyOTZjYzZhM2I2OTNlMmJiOTp7Im9zY2FyX29wZW5fYmFza2V0Ijo4Nn0=','2017-12-11 17:08:47.252326'),('5xjkodrgfn6fqxj551k5z3hqwzpzbmbo','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:40:38.912725'),('620cy798vrhy7r7jmz9xseiappx4366j','YmRiY2MzOWZlOWY1MThjZTZkMTU1MzRhMGNkNTU5OGUzOTI3MTk2ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5N30=','2017-12-12 15:31:23.355438'),('63skxquvxlqx9i93fe8qllxb530pu2vb','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:53:27.156134'),('68suq1pmdhkehsl5gkl2jtqxnjbzwdkt','YmRiY2MzOWZlOWY1MThjZTZkMTU1MzRhMGNkNTU5OGUzOTI3MTk2ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5N30=','2017-12-12 15:31:20.773136'),('696q4v1sgiw9mwmax2e33xg3gioisyny','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:54:05.600649'),('69g34o3sse6uru8u509oc3bdpj652ebl','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:24:49.947854'),('6b3wjbera354r2i0kdkipx0ibm5szaux','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-22 18:55:40.699285'),('6du356q4aqhz78f14xoalyjydeiooibn','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:46:30.822865'),('6eojldwlyxyqza0n1zccj0wk9b7626f5','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:25:16.799670'),('6i5a9dizjffxwjlfeizr306ox7h6yd01','MGI0NGY1NDA4YjFlZThkODJlNDE2OTg5Y2I4M2Q3NWMxN2YxNzQ5Mjp7Im9zY2FyX29wZW5fYmFza2V0IjozNH0=','2017-12-11 16:41:36.483286'),('6lhx80acptbk35eph08sfra5zca2r7pl','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:43:38.874559'),('6lxmx0k17j1wkpt38thalxj1y924dlpw','MGI0NGY1NDA4YjFlZThkODJlNDE2OTg5Y2I4M2Q3NWMxN2YxNzQ5Mjp7Im9zY2FyX29wZW5fYmFza2V0IjozNH0=','2017-12-11 16:41:38.873309'),('6m9f0uv695pdi5duis3ucj8y44c7e43g','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 17:03:59.482507'),('6mmblzfu8plo8vdchkop6b5dge0tx72m','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:04:11.043775'),('6stw2wxqgurwcc8seh29nt1j6o6nmglt','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:02:53.445030'),('6up8zfw2t1clfz5q59co6ujs1ewuvblx','OWM5MDY0NTQ5ZTVjZDYwZTJlY2E5NzNmMDZhMDljODlhY2IwYjJjZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Mn0=','2017-12-11 17:42:28.645174'),('6v4atj6hmcjk7jrld5syl73go3544had','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:51:06.322203'),('6wnv1h7zoygeohfzvt0wle8icv2bhyak','YzQ1OTcwMGRhNGE0MmJhZTQwOTJlYjI3ZmM5MzM5YjEwZWM5N2VkYzp7Im9zY2FyX29wZW5fYmFza2V0IjoyMH0=','2017-11-27 16:25:57.526981'),('6zd0nh4xntrkx9sm7j3pfe02l2tyl5y1','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:08:31.762876'),('70b3sbmtnky82fk28l3qcidz28ghm9ho','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:08:42.697441'),('72adyi1ec2xifrsyyjtsz2vkt5yt2e0l','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:29:35.833486'),('72ansm7h9aewk4r43viz6h509encirle','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:01:01.003389'),('75738pn36py55jhh66elnysuph9lywzr','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:11:27.848462'),('75l2dswguvabm88qi6od69qn3ar1cn43','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:33:37.565802'),('75wsppiskzl922bfhmohbcwks9scb9t5','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:12:22.889052'),('78guvwb7slqwarzroujcipg18tdvr2xd','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:36:41.958231'),('78tdzi1q637hbdfxatudk4y6l0bvkdn0','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:06:32.657121'),('79ole496k2p1iwgat0889xww5pvoloal','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:09:46.681122'),('7e1d4fvdcx94q7x5t51rz1f919sepdjr','MTI0MDE1ZmM0ZjU1NDMyZmY1NTRmMjAzOWI3NjUwMzBiMGY1NzgxZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyNX0=','2017-12-04 18:32:23.055067'),('7hv5a0ivpp0300u260ey7h22qs7uvicv','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:21:34.749663'),('7hx1on6d8nolhi8y4dnk538owh5uozw2','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:45:15.504136'),('7ix89or82sabdh6z5smm298ykwt2kmoc','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:57:50.908375'),('7mw9amnbznq3htal71mqwmpp25qdpdix','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:29:25.540402'),('7njn489fmhf9uvk2d9txkbg5hcptjnih','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:07:44.969427'),('7oez9ixhgaqe8acwnqxoelvrfuj0n3c9','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:01:57.286889'),('7pufluu1wb2awt1bftx8abjwxedikjsv','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:13:12.508079'),('7sqblh04klqzudxs2o5x8voiz9yybcp0','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:54:14.682654'),('7tlxnjb3s0rugwdjyreyf92r1lyll7y8','MzZjZGY5ZjNmNDhiMjdiNzVmYzQwMzRmYmFlNjJkNjExNWRmYjg5Mzp7Im9zY2FyX29wZW5fYmFza2V0IjozNn0=','2017-12-11 17:07:26.520630'),('7vav4qdgclqbdr5bn0i9zq5zton8p2xu','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:48:00.564715'),('823otdoyqk0kji4kwhw7uu7yu6aa27og','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:19:19.237371'),('82m5bq0g5jh8sk5vszj4zz5ay67gh93i','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:36:54.538647'),('843mj1wnq3jn5rkx77mxtj4gv15vtdt7','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:55:44.578925'),('84ar4bvsxom14hnw9imzr75buj1r0wmf','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:02:59.783512'),('86s91wxf86yv8mgltc51m11v2a671j6b','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:02.891964'),('86weiu1hk1iy1h2m4239tmnpedeggq0o','NzBiNzM4N2MyM2MyNzBhZTFlYzhjMDQ3ZThmN2YxODE3M2VlOWM1Mzp7Im9zY2FyX29wZW5fYmFza2V0Ijo1N30=','2017-12-11 17:08:09.942857'),('88rfuhi7fapzeg3zfeknmdutlrtwd6n1','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:37:49.027711'),('89s8bpe0aul7gqj9sr28owz5kcfemnkv','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:05:24.334743'),('8a7ywzbndv671r9xzt96pthksqkyh1pj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:42:19.513730'),('8aoslfleiufixalvpuy7vb6xgw9aotgi','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:10:59.231128'),('8bbrl4bs22fhntd06jm5eafxp5gc2coc','YWQyZGNhZjdhOTgxOTczNjY3NTdiOWM5NWNlZmI0NDk4ZTQ5M2IyYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo4NH0=','2017-12-11 17:08:44.710075'),('8bd8tdu4n5g5pctl0rdv7v4weg256gl2','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:23:22.873706'),('8cdl537l7vm70l1i1rt57rzv3uskpjx2','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:25:08.584781'),('8df2mf1pbiayz17e2dc4vv3gghlcavfh','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:05:21.956188'),('8dmnblbcm5hddgsmxtr8xeicufgfzo4m','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:08:04.677230'),('8ea5bo2f1e9g3uttn5hce4oeqbpckv6y','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:11:04.955237'),('8ecm07of3xjanvsg6hv0u3kpmqtjca27','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:39:50.415014'),('8hfpdvwjr7ol6vwxqga0katg9s7mjh25','NjczNGNkODUwNjE4MDlkYWUxY2U3NjU0Y2EyZTk2N2YzMGE2MjIyMjp7Im9zY2FyX29wZW5fYmFza2V0Ijo0NH0=','2017-12-11 17:07:53.087192'),('8iv5ubqra6px8fz7epvir9qbzlr6syv1','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:07:44.070744'),('8iztz22yrhiewkbwvwoellstwf8c23sz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:00:54.593958'),('8oycyduobxudtwfmbyj7huh5wf0lg1dr','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 17:07:19.228688'),('8ruuhzqtxnndmdbrmikzpwe7659rrjub','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:18:53.407748'),('8szxeev5h0xm8b1il6eucb9s9neiyd9q','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:22:31.125090'),('8ush5fkby0zgao1zkk8baubzoceovuw2','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:23:24.208149'),('8w0edtovonvyv7c1ennnl7ucy2fs1wn4','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:20:24.504168'),('8xhzw5rlvnetgiaja7kgmzm8xz2rr31p','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:10:51.681598'),('8yhnro3r48aez0lwhwb8ytwhju72qpjg','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:34:56.300861'),('8zc9ov8f8mm9ezejwvdtpg7obeoabylj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:08:00.583934'),('90y4bbelpnfhmw3j21lyb86ip4qer7jx','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:02:06.067646'),('90zgoo1i906uocbca0eb6ooom9c4jeo9','ZjMwYzJlNjAyODAzM2Q1NTJlZmM5ZTBmYzJmNDRmNDExOTc0Nzg1Nzp7Im9zY2FyX29wZW5fYmFza2V0Ijo3NX0=','2017-12-11 17:08:32.998351'),('93r3eia6mc50vwedgm4qtrkjrndd4oo9','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:42:18.128178'),('976j7x2t13p1ju98pghynoxqw78hlxe4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-22 19:07:08.699896'),('98iesjgc2lfwdq07d46ljevynbs1bkve','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:18:23.709494'),('98yh4s4gjatugxqwrdrx39s59xaa224v','MGI0NGY1NDA4YjFlZThkODJlNDE2OTg5Y2I4M2Q3NWMxN2YxNzQ5Mjp7Im9zY2FyX29wZW5fYmFza2V0IjozNH0=','2017-12-11 16:34:26.424685'),('99iak1hmtis3wmabghhgs5111i4rjydd','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:48:42.333667'),('9btyh22plto10k7hp9gcl1act3bkoup2','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:14:49.593546'),('9f2kwe28o1qnmhv4acle8slr4vt2chob','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:39:32.373824'),('9gkn9olzm64egijrlq3lufk437p0iimv','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:46:33.927501'),('9jyju31f4wlmxmvppqt4787i3fv5fssp','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:33:12.212808'),('9m71sf3afc902k7pxyd9pe7vpp9lvzrp','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:03:06.932101'),('9o5ltznmchy0skfjoj1fqjh1i8cyw2d0','NTdjNTVhOTBiYjk1ZTkyNmQyMTk0NGM0ZDU2NmM0YTk4ZTk3MGI1MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxNn0=','2017-11-22 18:17:29.789849'),('9o5nblobxmpej1qbmzzwvve3kw47s1k6','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:10:13.054128'),('9ovywu5pwgyvw4ehlddekzrv2kckep36','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:24:53.136446'),('9tpnh3nj0xse9kmsfvuzx898ettvfxh8','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:34:41.980111'),('9ty47zuefeitckweml040ah3nqscr4pt','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:29:39.909092'),('9w4l4d5ya1q6bs73y5dih3jknkj8ujj3','ZmFiNmMxMjI5MjQ0NWViODA5MDBhODRiNzUzNDFkYTlmN2U2MDJhMTp7Im9zY2FyX29wZW5fYmFza2V0Ijo2MX0=','2017-12-11 17:08:14.902178'),('9xd7x1xw4d0zfe2mv004nsuiydv5bd9f','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:51:09.007877'),('a2jzoedw9e8svcr32vty4rc6bsot1han','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:27:58.011591'),('a3c7fs1u7k5ubj9jdu13hoc3b2kn91c4','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:39:46.431707'),('a5cjb6m6lv2mmlpiu7dqmt5qma1if8oh','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:31:32.506949'),('a6fpcdz6l57yhcmx9l05tgf8omsilu36','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:47:40.573547'),('acj31t6b7aftni3rp8g5uu4tkgck6s5d','YTUzZmY0YjlmMDgyNzBmMGZkNzRhYzdlZWEyZTQ3ZWRlZDI2YTViYTp7Im9zY2FyX29wZW5fYmFza2V0Ijo3OH0=','2017-12-11 17:08:36.947941'),('adt5w7xv1y9lurdl03ppphru16kmjuye','NTU1MTM0Mjc2Yjc3ZTM3NGY1MTNlZDBhZjhkNmE0MGRkMGFhMWQxMzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MH0=','2017-12-11 17:16:52.175469'),('akgmp7i44bivkkx4c57pfe8ads7xkmek','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:25:12.010562'),('alyp4x77es0ft6s1nptfzjyvziscrywt','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:56:57.424191'),('amcix1rv8r9o5mlwk8p1uwxkejgf8re1','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:01:05.631497'),('aoro6dhkjpo02pif9s47jkfn5dek3ymh','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:04:50.873989'),('apjyxef4dzklfzmt1hausw7babcobdnq','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:41:51.612837'),('apycnhe69say914uxv4uxrbgop7c0po9','OGNkMGVlNzUwNmZkYjhmYTEzMzcyNGI4ODUyNGExODI5ODQ0MGQyNDp7Im9zY2FyX29wZW5fYmFza2V0Ijo1Mn0=','2017-12-11 17:08:03.485297'),('aq7rygxllz4yqupnb4e8dekn5ccab7ho','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:29:42.313040'),('ar0vz8qxe3o6g8q6g0fz0t9zdsxdvgbx','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:28:18.695798'),('aurgls7prtg6q291t289kb6uhnjj64ac','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:25:02.735338'),('awbrzihh5ey6euev8pig5io2skbdepv2','ZTFmZmU4MTIxYWMyNjBjNmIxNDY2MzhlNjJmM2YwNDA3Y2IzMjAwZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyN30=','2017-12-04 18:35:35.933991'),('awo3y5xk79kzi49cwsgdjix02dz3yh0f','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:20:52.775360'),('ay1uyz5mdlfljfcuawikpxambm0kwuxi','ZTFmZmU4MTIxYWMyNjBjNmIxNDY2MzhlNjJmM2YwNDA3Y2IzMjAwZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyN30=','2017-12-04 18:35:09.574889'),('b5q18ogn2kweqmf9tfck13ykr15ch3e0','OGNlZWRmNTViMWU5NDYyYTU4NDE4MWQxNzMyZWVjNmUwMmIyYjRmNzp7Im9zY2FyX29wZW5fYmFza2V0Ijo1M30=','2017-12-11 17:08:04.758475'),('b73cxjjqeup3glwzj80ofe7q0j50emb3','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:24:59.645037'),('bc28bd6ebf7a159ccf4f64ecd673a415c412c329','MzkxYjI3ODc5MDEyODBlNmRiMjA4YTE4NDY1OGJkOWQ3MzMyMTNmMDp7fQ==','2017-11-19 08:11:48.578942'),('bc5dyxrwrs85s8k1o5xuspc5cfdwpu3c','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:23:24.501422'),('bfhoac16ult74orvh13cwmwxvrlozt17','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-04 18:38:34.554497'),('bfll07mbqoeoaghxvxu5e2lpxnmnu3lq','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:17:59.509451'),('bga4vgxglcya9jizavwbwotm0jgon1cu','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:16:37.575940'),('bgsdi6kwmwk9vwa0ak45yc8b4fwtj8vf','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:34:25.520423'),('bh5k8d4ffcll608jsckrorujdx2ls3ey','YWI1MWE0OWQ2M2U0ZGRlNzNkODc0ZTdlNDUxNzA0NDU3NTBiN2MzZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MX0=','2017-12-11 17:39:32.754787'),('bhdhzzncgni22b2u76pqh2r0wo78vub4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:33:44.202564'),('bk2njgufbjp4q886lesuwsorap28ef60','MTI0MDE1ZmM0ZjU1NDMyZmY1NTRmMjAzOWI3NjUwMzBiMGY1NzgxZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyNX0=','2017-12-04 18:28:32.643174'),('blnuv1qrfk9vmvvgn7rnbv4ixsamwft4','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:25:04.089720'),('bnv1j3njmmoae2pa6fx5122rf247tesl','NTc0MmUyMzc1NDg5YjRlNWE4N2U1ZDBhODg5NGJkMTFlYWQ5NmMwMTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMH0=','2017-11-22 17:32:46.505323'),('bo9pu85jyu4dqdwtmarncdt7u43il7ca','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:09:58.981978'),('bsfq5su54zcnbs9tse3x87v30i4othak','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:03:48.783287'),('bt8eertb2vrvgr72g5l8fqfumgzkalm6','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:37:23.595704'),('bu23onx8k7o37145o2mg00k8bpzx9kaz','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:20:58.706671'),('bxu07mg8qx79juyr1bvh6f78ej3s2dhu','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:33:35.551531'),('bzwpy1g4cfm9q1y8hnwi16svx2qc25te','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:38:27.235593'),('c0dvstut37kor7orv4ygnkdz47i35wru','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-22 18:58:53.567916'),('c0yl5dommnvyyf8nltx1dbofa2ahj5zl','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:45:29.263668'),('c1kp8votk4o7l42q8da9zy6mcm1jtnuz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:47:33.689472'),('c298adyqhtk3i4hawv8jhl3v19d67kn7','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:24:25.453034'),('c4iiu8jz236eoajjxi06w88yjbpfilpo','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:16:25.192939'),('c4kytug6v8277re92n55ly91zj8118pt','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:49:43.001844'),('c4r1oq4ysp1e8oeu2a2bfkrwn7ll46yc','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 03:48:00.352886'),('c4z86c1kkt11okuq9y3knbdh2p8ibeuc','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:14:15.130446'),('c6xuzwowdxub9c118epjvdd8h9z8qcd4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:44:17.218333'),('c75e9gyhhn4nr79t8wu2odqtoageublm','ZWU3ZWFkNzJjMjVjYTBlNWEzOWEyMGNjYmEwZjRlMThlZTg3OTM3ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo2Mn0=','2017-12-11 17:08:16.162917'),('c8k91208894n6rftq47z7440qpnxr5zs','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:56:59.164984'),('cakn513du3ysczqy5393kkrxszxep1tk','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:59:14.391431'),('cccsio7w7wv37csmq55ymf5xa1o3d2ma','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:18:52.534487'),('cfcuoprr8ysct8ikd3itdgjebclq3g1j','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:40:57.309449'),('cfsztyq181n1xrt5obyqzfhp36jnjwfu','MTI0MDE1ZmM0ZjU1NDMyZmY1NTRmMjAzOWI3NjUwMzBiMGY1NzgxZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyNX0=','2017-12-04 18:32:22.514011'),('cgtq3a33pmcasv7rkeak8de5qzag5xwe','YTZmZTZiZDRmNTNhNTJmYzY0MjlhZTYxMTFkMDNlYWMyZmIyYzI2ZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyOH0=','2017-12-04 18:37:03.116661'),('cjaq81mfedbyunvypod8zf0dxguzalhl','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:23:51.091781'),('ck9h5ctoj7ys36mx8ovccp8ql8znwlq8','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 07:41:16.016291'),('cnduz1afxmqn6tw5onp2rb2er5uqacrq','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:19:10.037215'),('cq5zgcmzmdovdvur2yho2okcabx9ur8f','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:15:21.104500'),('cqh2ozvv2vwvdseyv0dm879yvfp84ev4','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:56:27.001390'),('cqi7exttfnw69k3zn44wpazt6gtw6dvs','YWI1MWE0OWQ2M2U0ZGRlNzNkODc0ZTdlNDUxNzA0NDU3NTBiN2MzZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MX0=','2017-12-11 17:26:09.052834'),('cwl8x3zym9amexky73nwwz17cy7w0d6i','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:27:55.836008'),('cwtx9ik1brcybanyxct4oyqe6k5ai94e','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:48:50.905374'),('cyx5r57pv7683yq58rfugwxljqlh0x0d','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:33:14.881704'),('cz75lkl8vkxv3l4ywk2g18cn19u0380a','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:07:10.581215'),('czq8xbcs5wvcyu8o1nf9exjtoprd71rs','ODhlZTM3MjIxZWQ2MjM3YTNlNGMyZTMwMTU2ZTI4YTEzYTZlYjU2YTp7Im9zY2FyX29wZW5fYmFza2V0Ijo0N30=','2017-12-11 17:07:56.865152'),('d1zge2yxluemea6qug8prhah9izpki4r','YTZmZTZiZDRmNTNhNTJmYzY0MjlhZTYxMTFkMDNlYWMyZmIyYzI2ZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyOH0=','2017-12-04 18:37:03.739768'),('d3lcd2xy97m4htssrweqnsde9iq4u0dd','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:13:28.016224'),('d3t388fxbxfevaf5hd08jbmqffnb67i1','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:53:58.859220'),('d5zogs5dqsolih0bkhppc2m58t5de2fl','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:10:11.560359'),('d65ubsyaligi3a0mvmznnu4h2wdy1kyg','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-04 17:03:40.383381'),('d6c5c0my9ntkl5ldtn0eu5aosu81y5am','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-29 16:02:06.270352'),('d6ze8ptuuakblt6567m9he0g3fsokrad','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:47:39.984991'),('d7ksx6a5d65oyi5axpdn6xcg6nbre8lv','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:05:19.967751'),('d7trp9gme10dqhoe8w2uzrk2thnupg5w','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:45:46.823412'),('d97b9zriyt5viuccdud38ztzrcxniqfc','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:43:31.479673'),('datuizc2sce4rdvfvzbifeix84rv53z6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 03:47:57.955966'),('dd5antcrbxp16xl7zamyrhbpoja4oabg','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:19:49.521683'),('denpknsd30ww8s6u93u80ogrpavrzf7y','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:14:59.113243'),('dfpe92skzdube2zest9cbxsnh7xfxs9f','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 05:48:20.227763'),('di75t20anw7ynd7fizm0pye3smd6a7t7','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:46:14.532653'),('dk06uw38tghofd7q23o9yufdzmya9rcd','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:17:29.322729'),('dlaumw1b39p93v0relpghnhpfojqqthp','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:13:34.584398'),('dmlxna1d7usd7jni2jo04q7fwb708toq','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:57:30.346475'),('dnacmvtl28r5x2gj2txsvdk8d1uwi8bz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:06:41.699223'),('do5m3vpfv8bus057wdsw78tbr8uislob','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:21:31.808944'),('dpm3whdfzfgk6mulwbggax5rexp7dif3','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:05:49.428214'),('dsikc0tke0ebyj2djgadbr2g5qbda25z','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:47:09.832949'),('dsx1x11agbuqoctycr4c7p2qabuz6civ','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:52:59.596154'),('dzmca6v133e9d4c9zj0ijobiy36vp18o','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:57:22.151360'),('e0081sy1u1njfxogoacvy2nlkue6192p','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:09:06.606834'),('e0qcqcv9go5im7ovblgaz8mn8x6mpj6z','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:21:44.628276'),('e531la1xoyay09sb3iug38b4vg6qcj8o','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:55:10.796243'),('e5qsp61qvvrqr97kwkxbxy07p3jgconz','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:57:13.350858'),('ea91u5txg8kc53osgtmv63kvp7c6mz4u','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:03:25.714899'),('ec9umg9239o3d9spfembvhxhvei9406c','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:15:27.841259'),('edjl10rz53qkkt6y7zmno05gsw32hhgy','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:26:35.355416'),('ee1ewlb89gblo3wcagxytcesngvidn22','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:22:14.829344'),('ehw5lrxv8zitmela95ltsegsl0mly7ki','ZTEzN2UzMWZmMTAxMDQ2Zjg4YTJhM2U2M2MzMGQ5Y2I5Y2IxYTQ2Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoyNn0=','2017-12-04 18:34:09.155322'),('ejew5gpcu5yxq1dgm2kdtyzqvo90xmi4','MzdhMzI2ZWQxMmY0ODBlMTRjZGYyOWI0M2E0ZTM0OGQ0ZTgyYzkxZjp7Im9zY2FyX29wZW5fYmFza2V0Ijo4Mn0=','2017-12-11 17:08:42.052527'),('el19rrwo00u02dj4r6w3tvkvcok9kxlb','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:05:47.091317'),('eqh9ezdbmo7zd2qtszz4d71jkjh68cx0','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:47:49.834559'),('ergmg2v3vqe4psii82j20ikg3b873wpu','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:31:37.634700'),('es2seidi9zyzay0x1ow3ksquhllm05x8','Y2IzZjcwYTdhYjVhODc2NjY5M2M2Y2FjNjYxMjBhMjQ2OTZjMTQ3ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo1fQ==','2017-11-22 17:13:10.935442'),('es74hol3mnesehq3dpzyvrifrm4io1d2','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:54:05.799958'),('esx3ubtzyyo2rkqxng6uvcq6qmarrot4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:44:03.610937'),('euvgm8e1n6xzbnukuhvcqxnqrin6o5s4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:52:15.430430'),('ewc9q00v23cpyr2fnx1bjjct71jb93de','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:09:29.667466'),('exon51wz8xv2199cw8qmzed9pn6jwkto','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:41:48.669437'),('ey1qvp9728iv8j41ip9w3uk9yfktdlly','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-11 16:32:09.267394'),('eyafy408wtdpv2sdzbls5h9k4fwx15t2','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:08:38.102093'),('eybqr4eh4bgx5b3nibba8dnqkwq3ksg2','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:13:07.530675'),('eyswor69ft75agpg0sfh2a7at0hlcs8c','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:18:29.797613'),('ezgjqsqto9wmapyznm7e76jyw8o4cmje','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:24:08.790567'),('f19x54xqfiv9mbow464n0quyunayhwng','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:05.990178'),('f2vai6x9ixlnr1rcc51tfwcopcat3q6y','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 16:47:37.018458'),('f7uvqu6t4xjrbiblzn3edjikglmw7hub','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:39:15.236940'),('f7zbzeoxn0lupmd7ycbtjlc40wljj95x','NTU1MTM0Mjc2Yjc3ZTM3NGY1MTNlZDBhZjhkNmE0MGRkMGFhMWQxMzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MH0=','2017-12-11 17:26:02.025082'),('f8o1ce5yiu4gugvzfbv5aengeg6pwafa','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:33:01.620658'),('f8onz1beiglwrvdzj49s5e6c85tafp1q','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:01.820552'),('fava0lma6bpoowzaip3l2k92so61v9iv','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:31:33.492510'),('fbq6ahubitnunbif3y8komwxx0kbuhp1','ZTEzN2UzMWZmMTAxMDQ2Zjg4YTJhM2U2M2MzMGQ5Y2I5Y2IxYTQ2Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoyNn0=','2017-12-04 18:34:09.708324'),('fc38v26d38k44x2or4vsyzdfrx6omoen','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:54:25.893832'),('fcwq6a9lk1w2ksq0rgqqy97hmlumrgvs','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:12:56.264075'),('fdemqxexptn3yot2fwjjegtjb7w1ztsf','NzM1YWU2YTZmY2ExOTY3NTk0MDA3Y2VkZmFhZjgwNGM1OTg1ZjY4Njp7Im9zY2FyX29wZW5fYmFza2V0Ijo0Mn0=','2017-12-11 17:07:50.541082'),('fdgjna8vm5jz7kdnte0x4hugtvs1feba','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:09:21.920255'),('fe1gyabykn5lha6cio4shidjbxx6tlc5','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:33:58.614387'),('ffh3uytp7s8xvt29erpn1ov0ri1z54yx','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:01:09.682732'),('fh645npo9rik70cjrcqfe2og1yzm5509','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:46:00.105544'),('fhwh3bjg0s2vxmdtz411oqjmbg7vp04w','Nzk2NDY4MTczMjQ4MzM2YmI5ZjI5ZGQ1MDA4ODI5ZDJhNTNkNDM4NTp7Im9zY2FyX29wZW5fYmFza2V0Ijo2fQ==','2017-11-22 17:14:01.234427'),('fjwyeybkb4rjjnrd91dmtuxk2n3hevyt','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:40:34.270188'),('flseithdum2pwi40ejnzv2am5glw96ts','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:27:52.163838'),('fmgprcaq8g6jg0ui86vy2z25ckvhaaj9','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 15:16:25.998270'),('fpv7i869gwqirzui2topv3dp0oid4fk1','MzZjZGY5ZjNmNDhiMjdiNzVmYzQwMzRmYmFlNjJkNjExNWRmYjg5Mzp7Im9zY2FyX29wZW5fYmFza2V0IjozNn0=','2017-12-11 17:15:56.130417'),('fri3uekptq7y1b0ovrkhaydqjypktnm1','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:02:27.217228'),('ft06akjgfrntyrbbsw42974qwi4320ss','OWM5MDY0NTQ5ZTVjZDYwZTJlY2E5NzNmMDZhMDljODlhY2IwYjJjZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Mn0=','2017-12-11 17:39:55.101286'),('ftw6pwj5kdc0vlgh3x4730hhs9kaxjv9','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:22.431622'),('fu2u8u24ic907ub3kvkozqvyohxjc1j7','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:34:38.848976'),('fv31gm9qq0p9sri915mk50j3xt81l6s6','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:33:25.837959'),('fv3prwotzz30orefpd4q8bm653iuhgzj','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:25:42.250820'),('fvz36wbgqot1cc9mv4y7vgwm6elpgiiw','MDMyOTI4Y2JhOWY1MGUwZmFhYjkyMmRhMDAxOGUwOGZhM2FjODc3YTp7Im9zY2FyX29wZW5fYmFza2V0IjoyNH0=','2017-12-04 18:28:28.463519'),('fy7ptd77nbf65o9dk37l1tlddwwby7pv','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:29.485073'),('g0h4bam2fhr7nng16ffgcn75wj1ybs4y','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:37:59.545201'),('g14538btm0ldgupsm36fhu2asb8vp4p3','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:57:11.723065'),('g36yfbnt5fc5j0ygp34c3dy8z9x040vz','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:16:30.365566'),('g480lrunrygtp56lgdq6py2pmkxv0hpi','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:33:41.359709'),('g67zpmy4b5i3xd69rom1h3d0kg93tvhl','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:08:06.126852'),('g9mp7vy3fvcwahi9blp0hpk67q7x2k8y','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:21:19.188991'),('ga3rpin25trirf92fnys90sbrj89ivyn','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:00:53.778580'),('gbcph78ac5t3dk46e1pw7b6ajqixhxi0','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:12:34.615796'),('gcmknemwxvwi9sz1qxsg4xgivnnylbb0','YmRhZTc0MTBkZGVmNTU4ZDEyMmNjOTMyYjM1OTI4OTcyMzZjZDE1YTp7Im9zY2FyX29wZW5fYmFza2V0IjoxM30=','2017-11-22 18:12:14.952192'),('gd8x3o1khj0io9cf17lyb5y62xkgcsjd','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:04:05.258935'),('ghurfp9q37o11pcis40wixn7axb366n7','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 15:14:58.257287'),('gjjabgwtdjw4dojlmw31tkrvxszihudd','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:56:58.701734'),('gl15i1n9e16raz1v5unrch39mfpqzddc','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:08:12.401119'),('gmd38ycp9b0gyqcaqwl07iaauhmn8rbu','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:03:02.029172'),('gt6tzomuyamx62ezy9mlwecshi5wo7rt','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:09:42.034231'),('gt7mtlr3jz1vfpt7ybj4rgdchc07tujl','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:25:05.755261'),('gui6do4gx658ieo6s99uo7b4q3gy751n','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:56:13.897137'),('gzz4nshepzyheh6ffnuca21lny68t3os','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:56:17.009196'),('h3c5xh0am18rxdyl3rf3uzffajz6lyme','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:48:38.795020'),('h3yq8i29ie2spjf4f4f8fso5mgor6h45','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:56:58.975144'),('h5lw169l2t27qdr557qvlyjbbt3yb2l6','MTQxNGRkNDI1MWJmZGJkMDA4YjBhODI3YWRlZDUzMDA5OGM0MzA3Yjp7Im9zY2FyX29wZW5fYmFza2V0Ijo0M30=','2017-12-11 17:07:51.818191'),('h5mwg6mm1j5h7kyp1hv38og6ul520dhh','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:09:44.838893'),('h5vvp00c2mdwwdzoo6k1il3ive4kxl9a','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:40:42.535302'),('h73xgnhg4tmlszs0h9xdfhaym951lvf3','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:56:59.554870'),('h7muz7pu8plckdmn91149guip27et3fi','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:45:32.390964'),('h8hyetoo1r4wegf9yq0doahrqx9kd1c4','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:49:04.075614'),('hage6lpbubc49wf6713ov4y58ippukum','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:31:35.579771'),('hai3qrtcszkyos31lm64sq1kpvvm87ta','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:08:59.783000'),('harwi179qzeyfrvgaq2humbvwivcjf8o','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:40:29.315538'),('hawt3mvgksvtg7f7sx3txky01b5aze15','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:51:08.596104'),('hd7907pxizxd63qgzsfv6oseijrrwulo','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:08:29.772059'),('hhvo97vmezijez9v6z2z49jykod7b3f1','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:07:37.602983'),('hi3sl7jrzuax5lgaxth83qwcxep1qb6z','ODVkMDFhZmY1YjgyZWRiNjVmZjIyMjlmZmE0NmY1M2JjZmM5ZDVhOTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDR9','2017-12-13 16:19:34.494880'),('hij3nox9u1cfzs7zc56qce8vruati814','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:09:32.385987'),('hjwldpi7yl6uqhr3u01r7o10tlxve1n2','MzZjZGY5ZjNmNDhiMjdiNzVmYzQwMzRmYmFlNjJkNjExNWRmYjg5Mzp7Im9zY2FyX29wZW5fYmFza2V0IjozNn0=','2017-12-11 17:15:58.445486'),('hk9ynpuxks40idzxbcxjmfy5tv8onqx4','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:57:51.994169'),('hkl2mbi78huxoocjta9jlw9nuyd1rtf3','MTI0MDE1ZmM0ZjU1NDMyZmY1NTRmMjAzOWI3NjUwMzBiMGY1NzgxZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyNX0=','2017-12-04 18:32:39.435965'),('hko7qjp1pyqw0d98ls4ww2ff0uyxu5p4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-22 18:52:57.833561'),('hrpf07j3c0t593krs5t6mp4m3wvvveg6','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:03:28.535023'),('hs6bm2pfldkh15k0f6sojm6ig84xf2hq','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 16:25:56.905443'),('hsd9bggnp3shagq2ge1wqu60izomdvzj','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:57:04.763779'),('hup5z5gxx4v5mxir1gs5hmuc1b2vbbni','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:07:08.240877'),('hv45ni3bj9qc8f3p5nwvc0i6r1x1cdsq','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:50.422728'),('hv5wb30jl6zmpo0hxf7es7jgay5u4y0k','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:30:39.239716'),('hvd2l48krpf85ke9d0l4971hnvlox77b','MGZjN2JkMTEyYTU2ZmIxZDYxY2MzMGFhNDczOTk3N2UzZWVkODdkNjp7Im9zY2FyX29wZW5fYmFza2V0Ijo4N30=','2017-12-11 17:08:48.538681'),('hxqel17vjnin7je3099mzflvqtb567qz','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 15:14:37.838289'),('hzpxo8hhjy0osglmhg6tupkgmbgiv8tc','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:48:09.900522'),('i16hl8qa0gxb67ytfz7pb3aaamynuwxl','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:53:50.370135'),('i1hjvacu0uxv8rjrvtldwkzt2xd9vlg8','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:16:31.291731'),('i1u4f3a5my7fb60el9xc20pyhurfygnb','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:21:27.675385'),('i28ijykimsf90b32y4wyrulssw1aoyy3','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:34:52.933844'),('i3334zyeiit5k0w3l6lx1q2xl0crrdrm','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:13:42.025125'),('i3mpvy7b3eygescf6logbpv91tez2hu8','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:04:05.825035'),('i6dp86spq5zpqqpzh20vef8zghks94ph','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:05:57.340667'),('i6t3nrolt6hjkggzj739wphxifms7210','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:36:42.430137'),('i7s9v60e200dzx9b10c9yi5ltcw5izfg','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:13:03.009588'),('i9kcv9a7rq6tickmex55aqvgja5goyzp','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 07:38:38.390837'),('iav3j7cvcki9rzws5gbo6oszi2t7d3ak','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:23:25.649440'),('ibev195i6fimk9lm0orq5aqwc4bkblss','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:45:14.636599'),('icn07lfx13x9xp7kc9kvwf22olbhz788','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:02:52.762588'),('iewn1m078ryznw1yrtmxyjcd3cyc6i5p','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:33:00.414674'),('if6mlvl3bzlkclpoq6jtky2f0y5pqd0m','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-29 16:02:05.548699'),('ijk9369plceb7jw9gho4r7kzoyqafsa2','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:12:38.762979'),('ile94hnt3sl6cbxb3gfz4lxzf5u8nxtf','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:07:26.252330'),('imhkkv4owth1mn1d6n48ckytx8t4wk2n','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:53:06.849110'),('ioi9ulhs0rnbv3zs82daxck2kdquyo5q','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:28:40.052979'),('iq7a0x4kpjwpm538lyescd4wkgkdufwj','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:27:29.353079'),('iwf9zq4glmj67dut15cfsxpfqn02rph3','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:20:58.138284'),('ix3826epticjoyyv6mtzo6q66kdlq7r1','MTI1YTgzODQwMGQyOTVkNDMxMDc2YzhlZTg5NjkzN2M2OTZhZjYzYTp7Im9zY2FyX29wZW5fYmFza2V0IjozfQ==','2017-11-22 16:24:57.162005'),('iza3zvakabdlg6fac3umgklenbn6d2p8','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:48:57.612030'),('izaoas7rn6a01nit0dc384e2uo3fzn6g','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:18:03.671403'),('j4rm4pelw7m4ik7b4py168k7gdp01uln','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:58:52.918844'),('j5ypxo0ut7f84izto472f4a013k5rm23','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:39:02.088264'),('jaax9dberdkdidz739s6d95nk48cp412','MGI0NGY1NDA4YjFlZThkODJlNDE2OTg5Y2I4M2Q3NWMxN2YxNzQ5Mjp7Im9zY2FyX29wZW5fYmFza2V0IjozNH0=','2017-12-11 16:37:25.607148'),('jd2xs2rcnfdetsx35i0puzxl8fxep5bs','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:49:51.434536'),('jfsti7qx8ds97tfhkxz6ulkkvsb3oeb3','MDMyOTI4Y2JhOWY1MGUwZmFhYjkyMmRhMDAxOGUwOGZhM2FjODc3YTp7Im9zY2FyX29wZW5fYmFza2V0IjoyNH0=','2017-12-04 18:28:26.206056'),('jgyrfy5gwpbab8m2x0heu1289wopnixz','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:34:51.972931'),('ji8uof5lu4v2uzj23m2kq8cxdqmjnbu8','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:24:40.999262'),('jo8lfdumt3itkk2z6jn8e44ym1h2bnuu','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:32:33.892655'),('ju57tqs74w4phxi7gkuxmo05p9qs3hsr','MzZjZGY5ZjNmNDhiMjdiNzVmYzQwMzRmYmFlNjJkNjExNWRmYjg5Mzp7Im9zY2FyX29wZW5fYmFza2V0IjozNn0=','2017-12-11 17:16:42.422643'),('jv5tart8qitud4juunjpufohwrxr8c54','ZDg4MTFmMjdmODBkOTIxZmJjNjYzNzRhMWY4MzI2YTQ3MzRkNGFmYzp7Im9zY2FyX29wZW5fYmFza2V0Ijo1OH0=','2017-12-11 17:08:11.154505'),('jvd6cjjg77rcv88o6szlwwxpmi3fs8ii','OWM5MDY0NTQ5ZTVjZDYwZTJlY2E5NzNmMDZhMDljODlhY2IwYjJjZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Mn0=','2017-12-11 17:39:52.550264'),('jvv4wc7mzt6rz2808vxi9ws3f1qihmwj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:35:02.712465'),('jxu6wtb92eyy6j95a51j1aqyldi3idx4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:17:44.920581'),('jz1vdrkvvkwclok5trtrz7mgtuo3podd','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:09:32.800394'),('k3r677jjjb5v8pbvnpwg3xlm3n8rz6ob','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:49:31.138924'),('k3xchjw85ct3beaso9i8yyn4f08kujr6','MGI0NGY1NDA4YjFlZThkODJlNDE2OTg5Y2I4M2Q3NWMxN2YxNzQ5Mjp7Im9zY2FyX29wZW5fYmFza2V0IjozNH0=','2017-12-11 16:32:23.688458'),('k694seut0y0fr6x7fzo8lgmciocqwt6s','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-11 16:32:06.254404'),('k7gikwt82egfoxqjce5kg4ku1ihs8q02','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:40:32.305145'),('k7itg79zi1hb6e0qnh7mtjyyaki8bp8q','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:04:44.933814'),('k7n8mjanrox39vjtbrvrwtylnw4ooewe','OTY0Y2IwODAwNDkyNGY4ODU5MDA4ZGQ2YjY3NDY0NjljMDM0MmI4ZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo3MH0=','2017-12-11 17:08:26.549332'),('k9v46qtm7e82zk9spsly2tg3nz0yo0xn','OWM5MDY0NTQ5ZTVjZDYwZTJlY2E5NzNmMDZhMDljODlhY2IwYjJjZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Mn0=','2017-12-11 17:45:14.797578'),('kapcxcpf6yuu8i2zj5ykdgappmv4wth6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:59:57.394276'),('ke01oprp92f9aegchp7uiwaji4gafo5y','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:36:45.816449'),('ke78bqp6u4z9trzquzan6tkx8qicbti1','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:49:35.700871'),('ke8tqgkd4cw80ugmidla3ko57jaqkdsw','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 13:58:06.372775'),('kfvjai322j8j7r7tzhuqj8hy30ygi3rs','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:15:56.091893'),('kfyrpfyluwtbbfel2m9wbc6c22w17a22','ZjEyOWRiYzEwNmIzZTEwZTljNmEwYjcwMDE2Mzk3Njk4NjhkMjlkODp7Im9zY2FyX29wZW5fYmFza2V0IjoxMX0=','2017-11-22 17:55:29.393347'),('kg13pz9che41ucy11h6b0btti4fv2hae','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:32:23.293161'),('ki2i48t64lxzvs4ba3vt8clfq4zv2nwx','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:18:25.373878'),('klqlmctip6nd3vn1npucigmzmybkly46','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:39.759004'),('knebb7752mlc0myxn7o7xmu2t85kmixu','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:13:31.309236'),('kp4h3ek6oy31su5uuxlf6qffmmo0a8rh','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 13:55:08.330680'),('kro5hzclr952pdwsjxou1vemun7a94mi','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:10:07.543067'),('krudhqy0hcpk72mfpjf6gpngh3yw2oij','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:48.615792'),('kw996vag6j0covqj2r75j1ywg0essp0s','OGRlZmI4YzNjNjNjMTRiZWJkNjllNzE1OTRkYjEzZmNmZWZmN2M4Zjp7Im9zY2FyX29wZW5fYmFza2V0IjoyMX0=','2017-11-27 16:26:24.329723'),('kxcuuadt6a4u3wa6tvbzvifyp87ip6k0','NTQ4OWY0YmUyNDhjZDU0ZDhlODEyOWZhNDkxMWI5MTliNzA3NzI5Mjp7Im9zY2FyX29wZW5fYmFza2V0Ijo0OX0=','2017-12-11 17:07:59.383267'),('kxwjgztrmh0c3btnict28rx6nhd1kdg9','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:26:09.309220'),('l34wmmj6v5d46bcr4kwm3uzjpwx9y9mp','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:57:01.933448'),('l3b487q3tym6i9rf0oge99p59rjle8pu','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:18:56.182935'),('l7hgjp1i0mjyg0u8ws7lxaj8hq39byuo','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:21:25.373619'),('l7hkp2remkmizeb6ehkxtfoihtwoiz9g','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:39:41.833842'),('l8ii5390znqz6f60gbt2mg0ykoztnyva','OTUyNTEwZWU2MDI2YTEzM2I3NDU2MTkyOTA1ZGNhNWMxMzcyNmYxYTp7Im9zY2FyX29wZW5fYmFza2V0Ijo3OX0=','2017-12-11 17:08:38.217166'),('l8piegh5219ct8gpm95bo5dbmrckli3e','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:21:25.670347'),('l93eag0vg3jjiai2ezfncj5w51txzxim','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:22:49.305516'),('l9ers69i3cf3edpig8qlv5ro61byo5vq','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:53:08.989142'),('lagp9ud7eyyr1k35gvqyuo1weoz0b9ce','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:28:14.787308'),('legrmo3t2r299kz0kytf1vb46p5vau4c','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 15:14:55.351810'),('lg40utdgu3o7ld6g17c5fhphu05tdj0k','NTU1MTM0Mjc2Yjc3ZTM3NGY1MTNlZDBhZjhkNmE0MGRkMGFhMWQxMzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MH0=','2017-12-11 17:17:02.049500'),('lhwmt4uxvl74mae7vz1ydg6mnx48fhzj','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:20:14.914074'),('lnkhjdndcx972kyzwh7h6u2futz5d6ky','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:37:56.737635'),('loje6nnfxrm67i80i89a7mjufwwgqyjk','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:37:21.555768'),('lpi590ujz1rm14bt2v3gmc1pj861pk7n','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:56:44.887053'),('lq4yyh7uu0xpv312ip9e211trvmp3rpm','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:21:43.562904'),('lqr9hxqcis8c7z1hl83eevn5mb2khj3b','ZDc3OWE2ODI2YTFkZTFkMTg2MjQ1N2RjYjRlMjBhYzI5NTA2YmUyYTp7Im9zY2FyX29wZW5fYmFza2V0Ijo4MH0=','2017-12-11 17:08:39.507126'),('ls528lybsn1nsraqn9qk39xt35jch3rx','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:07:05.656984'),('ltdxdam2he3nqojaza8js6j1km5wo1ed','MDA3N2E0NzZmMzdlNGRiOWY1N2E2NTg1NGQwZTU1ZGVjMzc5ZDRhOTp7Im9zY2FyX29wZW5fYmFza2V0Ijo3MX0=','2017-12-11 17:08:27.826971'),('lxnyz9egyztv4rxc6c2dt4uvzn4gvdk1','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:12:25.429102'),('lymrxits84h26dagxyzr6tuhc14xsbns','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:56:52.059061'),('lzznn8e23zyj588g9nxmdeww5qr0gl3w','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:02:00.194065'),('m2wn4vdcdo3nq4comf744hitp1q2ed41','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:19:28.121181'),('m3d980dmjwzjqx47cx6xq7orv8n7n9tb','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:21:35.342813'),('m3kf4jg6hfgs7ksyhznf2e3nwz28d0nz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:55:52.624058'),('m60bhctjx1kzr38iwa9hkn8ptobfssgb','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:49:00.108742'),('m65b0ne0l2ej9m9y0pm7vfby89f0x3qt','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:23:10.320113'),('m6o1fh1294wpot2e3hspc6e7q8goz8xy','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:15:37.685164'),('ma2yd5sjtlsit68sfv4agszffl3ve2gc','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:43:37.009040'),('mangdmzfv5yqx0xprdh7m043jfpo8hqt','YzA4NDNhNmEyNzk5NmEwMTQ3MzgzZWFmMzgyNWEwMzM1NmViYWFiMzp7Im9zY2FyX29wZW5fYmFza2V0IjoxOX0=','2017-11-27 08:53:00.130501'),('mekdefot3xmo9u6fbht99nk4cvasukbp','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:19:12.331633'),('mf10ttw6aosg0t1yev5uer1cweistx5o','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:15:53.365127'),('mfxbc82k2ukmwu3z4rgdna5rsvi6b93m','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:04:28.269215'),('mgq2vzttnpk4144s6nl1mx5bt24ibfjl','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:49:38.593229'),('mibcq1e827gzbzzd90nw4py9yl9jnqdz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:10:15.382842'),('mkb2tw9e0xn7bboo1i1iqw2y49zvrz9c','MGRjNmQyMTYxZTE1NzQ2YmQ4MDM3NDljZTFkMzFiZmU0Y2U1MjA1MDp7Im9zY2FyX29wZW5fYmFza2V0IjoyfQ==','2017-11-22 16:24:37.554240'),('mmou4p711z25bc13racaeocmst5xyipt','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:47:50.655457'),('mo02r5hbpxe9iz1qsb549gvmll00j2b1','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:33:38.196961'),('mokzag946po5xgvrrktv6oe8tdeqy93e','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:52:05.300534'),('mpcd3g49qd8e630frj7uk8e6wobu58zz','ZTdjM2Y0OThmNmU1ZDBkZmFiZDk2OTEyODdjNTliNWM0MThhYWE2ZDp7Im9zY2FyX29wZW5fYmFza2V0IjoxNH0=','2017-11-22 18:13:41.151698'),('mr6gnayj82k0kw0nqk7xje1khobhhmro','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:34:41.529232'),('mroaarc4a5l8bdmp06og8w1mznstsa2p','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:09:39.173477'),('mt5u2tg8jtia8sv41qq4l70pksnslk4r','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:29:34.902862'),('mwqihmutyhkzf0lm773sksyqbghwr5iv','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:24:50.020319'),('mxy1x8gei6u8u1r0k9x6zgfxw87m1b0x','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:34:36.188577'),('mypla0s7gzdc36fsortn7in5da0jbqd1','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:49:54.254991'),('myrjx6f2ym3nz0z8wkhh9ttjfdtime91','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:53:58.768584'),('n0qglh91tvflm6on4hlwrhunc9ncskx5','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:35.164920'),('n1surpx8codqxdmun8fozfz3zbd1k3ji','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:45:49.716986'),('n5cffwqtl9r3x9e8s210ivjgv82b4zcs','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:25:16.038941'),('n6gzd6mr5c2kst45u525qzvvym96zkgb','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:16:38.820207'),('n7r1z5jyfgyh1k034tjdfud2mmy15cg5','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:36:51.170397'),('n85v0to00e7qc9py40cjkmj3w1wrvl0v','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:25:48.973203'),('n9u3xurab5vdz6kiz8exuur93tjf603r','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:33:23.000271'),('naomw2q49qzudemtw72meqw137bp9gm8','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:22:14.896832'),('nbwh81yhr0tny8czr9tf4jmlzbc4dgsf','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:17:30.311726'),('ndr78h3pbx19cp7kq3pyqwh3i6hmhnfa','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:40:49.061102'),('ne4xtd1dpkobw99sziueyfd8b3z744p8','ZWUyMjcwNjMxYjZjMzFlMjVlNmFmMzIzOGNlYzdkYTZiMjMxYjM5NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OH0=','2017-12-12 15:36:43.461123'),('neac0qj9824rwntaixs2urrg3yipa69d','YTZmZTZiZDRmNTNhNTJmYzY0MjlhZTYxMTFkMDNlYWMyZmIyYzI2ZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyOH0=','2017-12-04 18:38:30.445849'),('nepg8ya37opa31h4tfq6qzo85ury0zpq','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:59:18.685401'),('nez5i5thm4airrffkzye1xm0f78yovf9','MzZjZGY5ZjNmNDhiMjdiNzVmYzQwMzRmYmFlNjJkNjExNWRmYjg5Mzp7Im9zY2FyX29wZW5fYmFza2V0IjozNn0=','2017-12-11 17:16:39.433487'),('nfd14m9gks8w4mauigqnqfqhdlpwct0y','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:55:12.799088'),('ngeakezl59dphlvx24smfnm1iaun93od','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:21:36.506343'),('ngq0nlxvwd4hbmhm4dx8v9yc98zvkace','ZTFmZmU4MTIxYWMyNjBjNmIxNDY2MzhlNjJmM2YwNDA3Y2IzMjAwZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyN30=','2017-12-04 18:34:38.608900'),('nhgkcvok0uxaosrrwe2psb3t7c41tbwq','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:33:15.936806'),('nii1voob3hp5rp893fyitn1qgrgl49lv','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:26:21.080913'),('nkf82jukglblcq0gezvjmrxmagllbyvw','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:17:09.743771'),('nm6rkoi917j7ri1cvrsja057nocttk2l','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:13:06.820493'),('nnpp725o5ja7p85ldfdoxp77soif8bjl','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-29 16:00:09.253098'),('no1rer78rmca9qlaf2n83jd8jqfs6qqv','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:56:24.903778'),('ntcnaxy50npsjjl231ftj76ojjvzyk0x','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:42:58.261262'),('nwyvgylqxx4cc1qec2s7hlnkgtiht68y','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:57:00.166048'),('nx9ax3s10y927k32jc6al4ry5ymzai8e','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:55:39.310268'),('nxl7o6x2pqgzt55vecbti0u5l8hfc2g4','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:23:08.848478'),('nyis9jguwj12u13qdcuk54x2ma8pr6l3','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:36.732219'),('nz914zvbjq2ab8godw1egjnzgv3zyc6t','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:39:20.401868'),('o3lo72e1v8b6i65wfxv3ba5klbb1x0hu','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:18:49.438449'),('o53kud82khid8zt22ekgcrh6n5u5wqqx','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:01:02.049965'),('o5d6d6cvqzesrp6m6n5s3xkkn7ffvsve','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:53:11.465769'),('o5o1zzrx20gcyz5yxwjpcgqxu7524hpg','ZjM3ZTA5NTA5NjFjMjQzNmUzMTk0ZGJjOWYwOWY0Zjg0NjgyMzcyMjp7Im9zY2FyX29wZW5fYmFza2V0Ijo3Nn0=','2017-12-11 17:08:34.348750'),('oa7esnlh1nsc8o37oyo1clzhnd4syhzv','ZmY3NjNkZjI1NTMwZWExN2RjZTQ4OTE5ZDNiZTJhMWZlZGY2YmU3ZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo2NH0=','2017-12-11 17:08:18.698491'),('oaoywlbfuyl6b24plvqsixt5ngdllp67','MTI0MDE1ZmM0ZjU1NDMyZmY1NTRmMjAzOWI3NjUwMzBiMGY1NzgxZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyNX0=','2017-12-04 18:32:41.661114'),('od2iqr06kjg6wjzsn4eyiydcq4redy6s','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:41:33.743557'),('odb096wqc1fc4ai778fw9i1b7i99s357','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:18:35.361211'),('odznktotj3ofgt2yeree0nu76aqgwohx','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:58:34.953674'),('of2nznund8v0zvq9sjathrlu7dz8i2co','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:45:16.395539'),('oin7lgkog1nz6sntcty3ru9zij5m4k4t','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:57:09.339904'),('oiwvn80euyr08gfkba721c5it5jizv6d','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:36:52.127319'),('olfaxrby6qjk6u9gde7z4nkxufxe9o0v','YmRiY2MzOWZlOWY1MThjZTZkMTU1MzRhMGNkNTU5OGUzOTI3MTk2ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5N30=','2017-12-12 15:27:34.156317'),('onzkd2acj3a77v6vsfwdacck0cl54jid','NzRlZWE0M2UyMDEwM2I3ZWFiNDA2YWJiMWU5ZDljOTc1MTFkYzAyMDp7Im9zY2FyX29wZW5fYmFza2V0Ijo0OH0=','2017-12-11 17:07:58.095931'),('ooyeuoiqcb273moqd7zmu0yfhnn9pff7','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:15:56.801581'),('ooym7rh8vng5crqo2nzze5d7p4jdktfd','ZTFmZmU4MTIxYWMyNjBjNmIxNDY2MzhlNjJmM2YwNDA3Y2IzMjAwZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyN30=','2017-12-04 18:35:08.998652'),('opy3e1sxd20m50tnu73mldjawq9ngl3k','MzY2NTM3YzdiZGEzYzU1MmJkNGZlYTkzMDlmM2M4N2ZkZGFmZjgwOTp7Im9zY2FyX29wZW5fYmFza2V0Ijo2OX0=','2017-12-11 17:08:25.259787'),('orrs779poin7tmq1it5k8n7xr2p8d6nn','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:17:15.125028'),('otzdzzpjhr030diehrttprll73qux12v','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:16:18.024691'),('oxphuneyxdss0m6ssns6eatpvkb9y818','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:32:13.868459'),('oxvrqjtfaihlbg4s85wz36plp3tdvgjq','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:20:38.072125'),('p0kg8eolbqzok6xqx15t6zvmzt869175','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:44:31.952177'),('p1e6dg9ahncg0orudfl492sun1m3kqxi','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:24:52.257351'),('p3pwfo1o9zk69hwt19kc0r6joeoguh28','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:25:30.601929'),('p4dt94jpmz2ju2ryrkwsnrjrwpgg4zmp','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:15:03.469539'),('p4hd6fik5bc97aetyo1zsmy6yq4j7btf','NTRiY2MwZWM5ZGFmNTYyMWQ0NGU2MTNmMTkwMDNlNWQ5ZjFiMTU5ODp7Im9zY2FyX29wZW5fYmFza2V0IjoxNX0=','2017-11-22 18:16:49.763289'),('p5nywao0opph9vlizu5rjzqkxlw0ae5v','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:47.638592'),('p5plpj5l8buw9vyyc94nxjkfhekslfqq','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-11 16:31:52.060315'),('p6vu3lctd6cepycj8vxyzasy1poo469r','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:59:53.341485'),('p729e3gzj8xkmb6rqu88hp3bn1u4iti6','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:16:40.598041'),('pa9lwzlxc7qtegr479934a4v38zw64m9','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:47:09.761863'),('pd3g9wjwb8db0668a4v8c010mwir5mtc','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 15:14:40.063030'),('pdpv5019js51uh5n8lp3uh02bozf5ain','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:48.115118'),('pemxrape844p2bl02rs0iph6vaanwl28','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:30.796531'),('pffn80yis0emd2la23ao8kz0fos05w4e','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:42:13.037132'),('pfnvun6ffvgslsr4x7npj8vaottexxf9','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:46:19.727065'),('pjodspo4jymxzxax625e4rel1ukrnmpb','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:06:04.516054'),('pk6p7wgma931v3g8qa1l6823ugao0xwi','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:25:44.690648'),('pkc0pq4dsja9siqo78fg2328yhge18rj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-04 17:13:58.044559'),('ps3v18qtioh06x04yyc4cy2iwb5qnhzl','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:46:00.698767'),('pvtwoumqx2dp36sb7ievyq255p97x4j2','NDBkMmU3NWM5MzI5YjljMzBhNDJkYzg4Y2E0MDJjZTgyODA3NjI0Yjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5fQ==','2017-11-22 17:32:29.005730'),('pxl2nmyqpmsbvrb4n3xepjmko8dck7fz','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 17:00:55.084450'),('pxnbjucbqan5onyu2mw0bihx32szjgx8','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:37:53.839024'),('pz1q50pjmd4hqz40hn9v0f9oohd6rjy3','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:03:51.551297'),('q0vuirkmzbwnw5s0rhrj7rwa0zopfqcm','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:26:18.358353'),('q1tw3nupvmyxqkyc3jol8pqmtzfcc72g','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:59:14.220392'),('q41ehfe07ql61acvtmzn7wzpav3tsvkr','NzMzMWUyZmZkOWM2OTBkYmM2ODEwMDk4ZTlmMzRlMzAyNTBkMTY1ZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo0fQ==','2017-11-22 16:31:23.228905'),('q51rmyatkxh7idbyjqh9s1fh5onkg46z','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:30:21.369209'),('q72f7ooue0oxkhutk3bqw0ybinbbf7xr','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:57:34.947458'),('q72oyr9461c8mowt53c6cmup52ntbckk','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:49:41.164867'),('qa9ugibrlp1tesqh0oyxm8jddblircte','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:06:43.365405'),('qbzzfpvlws7rdbi84rp220isx23cmnvc','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:24:39.983282'),('qgv7dlw87nati5kulq26139rbcm209xp','OWM5MDY0NTQ5ZTVjZDYwZTJlY2E5NzNmMDZhMDljODlhY2IwYjJjZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Mn0=','2017-12-11 17:39:50.634963'),('qhjymd7bma8rvlhi391d2dve3zmvw2s8','NzFjMmE5ZGE2OWI4M2YyMWE3YWE3MzkwMjRkNGFjNTZjOTQ1ZDk5Nzp7Im9zY2FyX29wZW5fYmFza2V0Ijo3N30=','2017-12-11 17:08:35.660383'),('qjveav8wn7n4s04phaw8d56c4ufxeuo1','YjdkZjE0NDUxM2M4ZTIxNTZkZjUyZDc4MjQwNTdmYTY5NTdjYWQyOTp7Im9zY2FyX29wZW5fYmFza2V0Ijo0MX0=','2017-12-11 17:07:49.263899'),('qmlk8rvoow66cjl17h9swes3g0o4u9mp','OWZjMzAzYTQ1NzVlZGU1YjQzYzM3ZmFhYWFjZWQ4ZjRkNmY1M2FlYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo2N30=','2017-12-11 17:08:22.756275'),('qqb6icy8dk7mq0y4mzgaz51pdjt6b7by','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:25:01.484263'),('qqh2uc2r11epmruz2vawz7thwcl9qc09','OWFiNWMzZWJhYzhhYThmZWQ2YzJkOWZiNTNmZGMxYTU3MGY2MDgyZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo4OX0=','2017-12-11 17:10:42.101269'),('qtzy7dc7d4qpz834rkrb1pm8hs60ubma','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:09:47.841380'),('qvfibdtf3rso32o0s998ys93grcsli3e','MGI0NGY1NDA4YjFlZThkODJlNDE2OTg5Y2I4M2Q3NWMxN2YxNzQ5Mjp7Im9zY2FyX29wZW5fYmFza2V0IjozNH0=','2017-12-11 16:32:24.069814'),('qyidap6pk8h9uvzx1bjvruy7fowzijwc','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:16:16.807580'),('r26x6f8oho0wxu6dnxjoq7wcmafoe653','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:04:50.368490'),('r2he2lmwmissw8108vm2jp1oxjxwcfjb','Nzc0Y2QyZDgyYzE0ZGQwZTBjODlkZDQxYTBlOGUzYTc2NzlkNGVlYTp7Im9zY2FyX29wZW5fYmFza2V0IjoyOX0=','2017-12-04 18:35:39.498210'),('r2tdjfoyo8wim1xsz5yxwhucr3xg1i8e','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:17:57.907261'),('r47xl9z0hthy6jckb31qk0kdfi4bx4mn','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:09:28.311096'),('r5kiz0684fomptpi6tev7337tncoeoac','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:24:56.678793'),('r5pjio5qc411d1k1h2hbnv8znaujg5vo','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:17:41.951703'),('r64k3enuxpltixlkiidcw5bxqbmmb216','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:37:58.815109'),('r7m16dux3zt9p790br7hiv4jb8bf184k','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:48:35.806384'),('r8fdl7scm2c2e85311jlyz86bpa36byg','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:26:34.668268'),('r8ud2dkqkch8ivkni1dwjo0mu1kwd4cy','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:27.725149'),('r97knpj8g7msqepb75hz8yukjxhb2rto','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:55:42.055252'),('r9n2g3k7bmnrn9trn7xl8klv5qpge96u','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 16:41:54.713262'),('raxvstil1fann8nn9k6206j88ocpn7bw','NGFlMTY1NjhlM2I3ZWY1NjE5Njk0NjIxNjAzYWQwMDg0YWM3ODQ2Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozN30=','2017-12-11 17:07:43.948536'),('rb5nxmzo8n7qarfzju85y5cd1fdkwk00','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:28:22.908540'),('rf8w7jvtbpda0fkxvo3mj3813z34mih2','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:22:12.104223'),('rhofhjz0tycnld8qtukl5lq255o9yilm','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:36:50.169058'),('rj8gx5vdypknqkrq7vs2k756jfr8p40z','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:50.915806'),('rjny8xltu52cvjc14nsk32h65ky2351r','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:57:12.890550'),('rk134upr0c5qrutwi8n26tr85q553dfc','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:36:33.725826'),('rlirrkcp1haun1byv8aeq1pgc0qlge5q','MWVjZDhjZWQ1ZTljZGIxZGI5M2E2NWUxOGZhY2RlODBjZDYxYjliMzp7Im9zY2FyX29wZW5fYmFza2V0Ijo2MH0=','2017-12-11 17:08:13.683872'),('rup7v3cfhe1utxhb7vouws7ewazjcbq6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:48:50.277844'),('ry0asdtrmdar2s9xo69qheadqdpfvso6','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:11:31.891020'),('ryahpncbs5pcc3htfj5l741qqf460tdy','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:51:16.985270'),('rylf8m6zi2cofx6e1x7482vyqylw6jgf','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:04:48.403416'),('rzz9ftykv68ia35pdovrvwl7rphlgxa6','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:34:50.099733'),('s07bqoxs96vo8x5k7g2h49v9gwdcnf8q','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:42:08.910634'),('s1lculkntwj2div39hhkuk56fw51ghpb','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:41:36.148725'),('s25f4sxxlpjf8fu4odltnnrjsncc9b6b','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:09:49.372325'),('s3lq6it9gncx1iw6gozx6u489mube6aq','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:21:52.808057'),('s6p5snim109wgwgjjnfmsf56oitrkzm3','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:53:50.657350'),('s6uzstrz8dkd1x6mdt4wxolfjtchl6pg','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:15:40.276563'),('s82qm78vibhbfq2h9ltccvheypm3lbpx','YzhhMzQyNTc2ZDc4MDE3NjRkMDE0MGYxYmIzMjRlZWVhZmE1NmQzNTp7Im9zY2FyX29wZW5fYmFza2V0IjoyM30=','2017-12-04 18:21:19.794736'),('sj5beh6cey2kpgc7qm7lx6ojhld0odmg','MDkyYzA5MGMxOWY3Njg1NDk5NjExMGM1MDczN2RiN2FmOWM5NzA1NDp7Im9zY2FyX29wZW5fYmFza2V0Ijo2Nn0=','2017-12-11 17:08:21.430377'),('sli3vyugjpyxwjkomjq7vpvgnrxbzwb9','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-04 17:14:01.028556'),('smwkfwm5tbix7ocgsbwrnq9l7ilf35nj','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:42:14.966296'),('so8n6yz3w7py4zcsr6x12sixme1v2t4s','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:57:08.312359'),('srv5nkvpdqylfu69ogb7g1qm4n37skuj','ZGY0NDdkM2E2YmRjNmIwMWNmZTc0MWE1MjYzODM0YzZjNmFlMzM3ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo0NX0=','2017-12-11 17:07:54.335779'),('sshmu0vqfixtbu2nh5ea88bkoobry8xn','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:26:20.111625'),('svg2a9c1x485agxm604pb3oa6c8w2tz6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:25:46.710277'),('sxkoln3yk4wqstkz1raobta1rhlh1x3e','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:13:46.572575'),('t0v1e9vz8goa4oazfc9nbs5yrl6hsgj0','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:44:51.582855'),('t1i3wokythnqkesm6nsc4yvadznifi2o','Yzg1NzAzNzE5YTZhMzZlZmQyODEyYWE4NThmZTFjYzI0NzUzMmUxNzp7Im9zY2FyX29wZW5fYmFza2V0Ijo2M30=','2017-12-11 17:08:17.438259'),('t3kyp4uqhfn1lde6iqsn98rlgc2z9noz','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:38:10.519934'),('t7pdd8ko8685hjzioofolimelk1209cp','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:47:26.740090'),('t8j0ct4c7ma6t5312sg15k06dzmdhclz','ODlkNjBhMTE5MmRlNWFmYjcwNzE5ZjlmMjMwYjU3YThlNWNmYmY0Mzp7Im9zY2FyX29wZW5fYmFza2V0Ijo3M30=','2017-12-11 17:08:30.384638'),('tbxlg53i6m7uzkd7co6ldrpipuyytbbr','MzZjZGY5ZjNmNDhiMjdiNzVmYzQwMzRmYmFlNjJkNjExNWRmYjg5Mzp7Im9zY2FyX29wZW5fYmFza2V0IjozNn0=','2017-12-11 17:07:27.657592'),('tcg6vttkhc5j4nk5rt6irps7qkro5ku8','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:04:45.526363'),('tff65tojyhmji27f76v5vdehsjzyvn5l','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:17:12.875107'),('tfv38nivlvusgkuosa5kp2lpygmmj1xu','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:19:05.677357'),('th5xd7897u0y973751m3jzb1qd8m12e0','MWMzNzVmZmU3Mjk2ZjExMmFmYzNhNzg3MmVjYmEzYjNkOGRhNjQ0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjozOX0=','2017-12-11 17:07:46.693507'),('thgidw9mua8wzcger3x03qhlwwo601da','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:56:52.986219'),('tjfvryrih6etkmbkvl680dzfpvwx531t','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 04:42:55.307537'),('tkn1t5p0jqiovagzehgqezydkamc89en','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:02:02.715691'),('tnweb9dzkw2aozeqpa6sx4ynhfqf3ebo','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:33:40.342688'),('tpziy4nhp0embrjxyifdstjlgra79u5t','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:02:55.583502'),('tq7ifkke4696fqryiuxa1zay8em1wy85','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:56:01.700395'),('tvuvik02vy8zkhakb221eylmmubf1gq5','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:15:42.947919'),('ty7gerszc7wjc7ayv569e3bby55qjcfx','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:01:15.160295'),('tytasxxa0jrjr4w0u8a6yqv9f2u28wc5','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:07:31.043686'),('tzh9vneyzn8f0ti30n805kpc00a6pc81','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:10:32.031322'),('u1kenk8m1wnywnsrezsbgp42y3w29i0n','YTZmZTZiZDRmNTNhNTJmYzY0MjlhZTYxMTFkMDNlYWMyZmIyYzI2ZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyOH0=','2017-12-04 18:35:39.016831'),('u6iki04j6qn5zn8zb0bv3719eraraqa6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 03:48:56.246434'),('u9qp3ep438s797kklmecepoc84sbd6ba','OTc3NTNjMTZmMGRjYjA2MDVlYjBlOTMxNjM1YjdmOWZhNTM0ZjNkNTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NH0=','2017-12-12 13:55:09.467188'),('ufqi41qhz56mktg7tu1pb203o631hnv4','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:34:49.389830'),('uj8eap5x72t2pa42ih7hxz1k3yhbt7hp','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:13:46.698381'),('ukg1e8l3xlk43gs3kva1idxom44cqisu','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:24:09.832833'),('ukrdjiipwr9qg39ktochpi96aushrysg','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 16:26:23.739909'),('uo7a2li47yzzsgx520chszwypwu67dtj','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-11 16:31:49.464808'),('urwvr3vucwikf6npbuzeofukrwzo1edr','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:47:09.716639'),('uug8w5wsy2stmmzqn6gm18k2dzo1bq33','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:27:09.577782'),('uuvpaz6ysuiimlm00tgimc4h2xh1dh18','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:28:32.127760'),('uw2ff0rjb2ex7vzju1elxnpjd0f1vbas','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-10 16:08:16.160758'),('uxwguqf9xm5axug0ysftlo3q03xjt1sg','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:52:14.007289'),('uzupfc0l0uwdvec50f5bwt9skofz35t9','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:56:29.835272'),('v06xo6840xcie7mq5yqd3snvh2kfyh0f','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:21:32.811763'),('v071mfxb8v4h5zidctg7sgilukj9lak8','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:20:12.079522'),('v3cyk5l2zv75znketk44n5zzksf8opsc','YWM2NmFlODBmNWEyNGI5OWZjOGFiMGMwN2VkOTU1MDQwMjM4MzFkMTp7Im9zY2FyX29wZW5fYmFza2V0Ijo4OH0=','2017-12-11 17:08:49.824334'),('v5451jwro47ftyikam4j7lv906s72e6v','YTFmYjY2ZmI0YzdmZTBhNzdjNzU5M2JlNjVjNzFmZTMyZjI3Yjc5ZDp7Im9zY2FyX29wZW5fYmFza2V0IjozM30=','2017-12-09 07:32:37.470579'),('vabyjgayg0ial55c3t3970y54c71qxez','NjczMjBkNTI2MTA5YWE2NjIwMjA3MzA3MTRjMmU2NDU0NGM5NGEwNDp7Im9zY2FyX29wZW5fYmFza2V0Ijo4M30=','2017-12-11 17:08:43.358141'),('vaswfofm891bnv7c46k9zxxavmlfkiwt','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:25:16.302412'),('vcat9v5ktsogwbj1ey7yjrp9kzeleahj','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:17:33.870915'),('vfaxxqrl1jy29w9ixs84nhvgqed322uv','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 05:48:19.935492'),('vhjppvw74bcxamz60ym0twav9wvp75g6','ZWUwNWU5NGE3MDUxYmJlZjY0MDNiMjc2M2I3YTgyZjNlNTBjZDY2OTp7Im9zY2FyX29wZW5fYmFza2V0Ijo4NX0=','2017-12-11 17:08:45.999244'),('vkbcgj6bvvoxmlbgka8b40ho07g06g25','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:15:02.012300'),('vl76drfqe6v90ah1gntnuwfnu3ay1tyd','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:07:12.285770'),('voybiqhmnu71eld8yf93ggpqxvf1wthf','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:59:05.390843'),('vqymnn0byhrj7pzj341yk9lw9rntyu5q','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:56:49.848705'),('vrimnqadb3xk4831xy5nbar9xrzqbrqa','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:51:01.058094'),('vuv9q21ac9a4hlfxa6govnz5f2h2x2w9','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:10:01.890045'),('vwky23fy1fqzpm1xr65frpb6vhip55rc','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:59:15.972093'),('vwl42fw0kmw6m6dy9jk8efe127fr4cnn','ZTEzN2UzMWZmMTAxMDQ2Zjg4YTJhM2U2M2MzMGQ5Y2I5Y2IxYTQ2Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoyNn0=','2017-12-04 18:34:33.246981'),('vxekj5cgpo8lgce95ixb33x0blfybel1','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 18:31:35.864076'),('vy449soi93p2w04utq5xj7p2trg3zv9m','YmRiY2MzOWZlOWY1MThjZTZkMTU1MzRhMGNkNTU5OGUzOTI3MTk2ODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5N30=','2017-12-12 15:27:33.242794'),('vya03vzuvwss7vyve7tist19qrig28fp','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 05:22:31.685490'),('vzz6rjgtpdrpygzdqu5dwxnllvwm6ous','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:48:05.561521'),('w0astecnccu0grnwdq79j6acbopl4pxd','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:40:57.071114'),('w0lxl47xg9e8eqkqachx4uh9szgycyh9','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-04 17:14:02.886710'),('w31sedlwhsc4s90os24ljbypojnavuwd','M2RlY2FkYjAyZjVhYTY2NTZiMDllZGZhN2Q0NGIzZDI4MTYwNWY4Mzp7Im9zY2FyX29wZW5fYmFza2V0IjoxOH0=','2017-11-27 08:52:16.552407'),('w4eik0jez7kg197xkmahhwue874cb4xv','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-04 18:40:42.497070'),('w8u0x766lavpt7nytze31m7xxqer7evw','ZjhiMzIwYjUwMWQ3NDcxMzk1MjEwN2FmOThiMzhjMzAxMGIxOWM2ZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo1Nn0=','2017-12-11 17:08:08.577034'),('walmt0gp0pe68u0ao5f3u30mie7ms7t8','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:15:53.962708'),('wbwc08l7ej4pne2jqpckzt27yf8p5ejj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:39:02.315053'),('wchd42x4ary1b5581udgy1gr145t7dwc','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:21:50.027957'),('wdloda7726410fc8d3t2g9elqqh2hm0f','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:30:23.383693'),('wds3jh9alzv1dj1q2ptjtgpv4wg7x65c','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:50:37.159157'),('wh7wm6scvzkkswp2ge8t1ck8r6st2xn9','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:18:33.560401'),('whs56nds4au1t2jb9lbzcbsy8isw19xn','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:02:26.678255'),('wjilvtm5fyugxb24gp4y1xqdsqkkigbk','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:50:46.882006'),('wn1asa9fcw4l9ipfbgi3ia5gmbo3z104','OWM5MDY0NTQ5ZTVjZDYwZTJlY2E5NzNmMDZhMDljODlhY2IwYjJjZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Mn0=','2017-12-11 17:45:17.018142'),('wn2y01laszazg3n18vax7n6f5bpkmktv','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:06:05.018265'),('wowpdnvz4rs4385ujlvof4ishtujmevw','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:39:33.146143'),('wr7ihhh6cds0ro4zdei8t3bp78mow2m0','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:56:26.270973'),('wsarepscq17mhefqwe0hdpkose42pbny','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 17:07:21.668284'),('wup0xh7cjfw2t3u412k6jbibiozo79m5','OWQwZWRjNGQ2OGQyM2I2NWU3MzhhMjFkZDRhMTExMmNjNTY2MmY3Nzp7Im9zY2FyX29wZW5fYmFza2V0Ijo1OX0=','2017-12-11 17:08:12.439429'),('wy702s7gr4tmrg2weu9x2z550x41r5q0','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:58:46.843451'),('wzyv8vqg9j3bg3sue1qjp01azb9rsz3p','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:18:22.503907'),('x3xeihxjlhxunvy9ylk9j945ea1xpg3w','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 17:09:15.413303'),('x4zf54ltagz9f0kgl1mrh9s2u0l4h2ep','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:52:18.055188'),('x5m0xto9nnl0996fwwo1sr1ztguzlrei','ZTFmZmU4MTIxYWMyNjBjNmIxNDY2MzhlNjJmM2YwNDA3Y2IzMjAwZDp7Im9zY2FyX29wZW5fYmFza2V0IjoyN30=','2017-12-04 18:35:33.738590'),('x7sj4wswhbjdqvz3kau1x4hn6dobp43d','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:10:43.606931'),('x9zrutyyjssqvuwb6todsczgsuiue6xg','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 16:42:59.877178'),('xam6ankhfus4asumebx6pcuiap97ujin','YzRkZDk2NDgxNjc5NDgwYmVmNWNiYTIxN2ZjNTJjMmNhMTg3MDM1MDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5NX0=','2017-12-12 15:16:33.761875'),('xbihmnlt1ozgmx92q83eslupj5ca3qjb','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:57:37.791658'),('xeiv44lhopk1mxo7gd6tl5bxifh2o5al','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:31:07.988322'),('xg2250l8roe6zgm7ikv7uk3xlfidqfcl','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 16:25:47.008917'),('xgbmt4u8a5h24d8g4xg3wvnmptjq4h21','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:39:09.134754'),('xgjsmvwps46mu4i31zj767tcamftpc9f','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:53:08.544080'),('xhxfoy3v4szesc5xgv8nd36evwrq1b41','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:25:27.860540'),('xje6eaf3tk6xfwb4xa28tguxoesya6an','NjZiY2Q4YjE0ZmMxNzQ4NDQwNGU3ZmRlMzVjZmYyNzA0YWU4NDU4Yzp7Im9zY2FyX29wZW5fYmFza2V0Ijo5Nn0=','2017-12-12 15:23:49.975768'),('xo36kvh6wlme0jywlcs5ki110boxkni6','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:25:14.373276'),('xowtcniqwtssf9sh327drelgxrl78ih9','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:48:08.604565'),('xrurxbnvzoz6tydiw4cdy8g6j8mcwece','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:30.478820'),('xtmx3p671fetj02rphqejbi39ohan260','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 16:10:55.599357'),('xuuj9lwwh7ohncncu42dsy02faasq8q8','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 07:18:19.628696'),('xvjuzvmys9dg0qutu280zf1wik1rl9zf','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 14:48:03.804477'),('xwg95b28d2t7qadn1ldwvw0or0f771uo','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:35:50.316332'),('xxoagfkb9s9sjxfsmmd84g2kq61ahsom','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:32:11.125520'),('xyb5w64lckghvmhyj9zboq6ku3dpd4tg','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 04:55:46.475764'),('y31wp5o2a9cfdw1o5op41o7kdz7uyfm8','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:54:16.929401'),('y4vjgg44l0ih6z6spxgdiro56diw86ci','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:03:48.623539'),('y6yr0s29zhs3bmk0f4yiq7nvu7rebvzy','YWI1MWE0OWQ2M2U0ZGRlNzNkODc0ZTdlNDUxNzA0NDU3NTBiN2MzZDp7Im9zY2FyX29wZW5fYmFza2V0Ijo5MX0=','2017-12-11 17:26:07.987688'),('y7zpehveznu9b8am30wz5rjv6lkospxy','MDEwZGI4NDA1NzNkY2M0YWQ2NGFmZjQ0OWU0YzFlODcxZWE2YmRmODp7Im9zY2FyX29wZW5fYmFza2V0Ijo0Nn0=','2017-12-11 17:07:55.572163'),('y96vdxuvzcwjzxql3op5qcsez5kqda0e','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:42:09.838569'),('y9hhhtkhu59xhwrrusv15lu900oi0123','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 18:38:59.118307'),('y9kyzcxfoxtnoy5lwnswbbh3azscq6hs','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 16:00:14.647954'),('yl9omcamg9v3hyixczkbvdrlraxyx08f','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:16:30.127381'),('youyq89au0u6fvu9xb7ipfy2jcckanev','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:56:55.194700'),('yqanzkvvcpbj2xrulc7w253napbjte94','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:12:31.979297'),('yt36kjrtjfh6c7p3qy5sya0qcx4psjd6','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-09 03:48:53.398529'),('yttzzf7hp76g73sxygwyzohlcqgfbd7g','MDRiZjYzMjUyNDU5OTFjOThkOTljNDRiODFkNzVmNWMxYTAyMDgxYTp7Im9zY2FyX29wZW5fYmFza2V0Ijo3fQ==','2017-11-22 17:27:52.911929'),('yvo0z06qtvyznyl6gmo6g6ljxzr5criw','Mzk0ZmU3YjdmMzEyOTFkOTliMThjOWY3MjA3ZDU4ZDczM2IxMDk0ZTp7Im9zY2FyX29wZW5fYmFza2V0Ijo1MH0=','2017-12-11 17:08:00.788787'),('ywmh4ubk5z7y03l9wbzikzyag9lvt5sx','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 17:02:53.996352'),('yx7645q5phklea2ozafj8s0x8vlpagau','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:18:00.744799'),('yxkaa8hpnzas0w7vq9w8u2upiduk21hp','NGRiOTc0ZWZlZjQ1MGExMjI4ZWQ0YmZhYzBhMzFhMzVmYmY1MGIwMjp7Im9zY2FyX29wZW5fYmFza2V0IjozOH0=','2017-12-11 17:07:45.382432'),('yya9n2j1cbmlxinj7ip37wv4befu22i6','YTcwMjZmNmY0OTU0YTVlMDA2YzNmZDg1M2ZkODRiM2VlZGFkMDk1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjozMn0=','2017-12-09 06:39:54.376337'),('yzjzh76jaerov6f54zzv4axih6dgh6bf','NzYxNTViYzZjNmIyYjNiNWZiNzQ5NWNjNTE3ZWRjZWE5ZjE4ODQxMjp7Im9zY2FyX29wZW5fYmFza2V0Ijo3Mn0=','2017-12-11 17:08:29.094134'),('z06fmbi786oaxfmkfo6axpjg67nxnsvk','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:37:26.542219'),('z497g9xyfw4sx0vd7al18lggn7ljca7b','NGEyZTE4ZDA3OWE0MjcyMzI5YTU4MjIxODFjNDA4MTUwNWUxMjA3MTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDZ9','2017-12-13 17:05:34.459272'),('z5ou4ypirphxw5l3phz17q5r9mwa4i23','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 17:58:32.214018'),('z6v4xlcmoeqm26vcm65wzzlq6ikmspdl','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 16:56:56.127152'),('z7ay0n5tqqvb2n0mlev411u3vrwksfr0','MzQ3NDNiOWNmOTYxNmRjN2E4MTU5MDkzYjAyYjEyNzUyYzM1NDdmYTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDB9','2017-12-12 15:42:11.980618'),('z7loi52boga0vjotm7eywaklxv48mmlj','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-30 16:43:53.658566'),('z8g8cfc99nk3yn8qho3yev1aw6eymf5c','MjBlNjUxODgzNjhjNzUyZWQ3NGQwOWE0ZjcyMDY3NzFjOGU5MWM3Yjp7Im9zY2FyX29wZW5fYmFza2V0IjozMX0=','2017-12-09 04:57:24.745307'),('zd2x0w5u3x7aic5yd5v45mq2ivfxfdsy','NDVmMjJmMTU0ZTU1YmMwNDI0OGNjMTg0MTI1YmUzYzc1NjBmOTg0MDp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDJ9','2017-12-12 15:58:13.782894'),('zexmobxjc2ql6fmgs3c1i099a656e52o','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 16:48:32.730934'),('zhppp12trdcvt9w4p6k6ts4f4i8f9m76','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 14:28:30.285125'),('zibf1f6nmm5yrlcc6olasl292a9dw0z2','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-12-03 15:22:46.542612'),('zibrhxdisliq5yd2zexbvsy5xuxh5wh3','MzMwMzA5OGQ2MTEyZjhmMGE2MjgxMzU2ZmM4NTJlMDY0ZmNhNGE0OTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDV9','2017-12-13 17:02:25.686199'),('zktamrxcrgfkrpfibzbn41tijeo9i77b','M2I4NDc0OWM4NmJiZjQ2ZGFiM2E2YmRhYjNhYjU1NjE0NDk3YzQwMDp7Im9zY2FyX29wZW5fYmFza2V0IjoxN30=','2017-11-27 08:38:26.045126'),('znqlrfkyjff5nrsbu3k6ingq0a5k73e4','OTU4N2JmNTk1OWFlYWRmNDNlMzhiYzE5MmQxNTNjMTk2Mzg4MjE2Nzp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDF9','2017-12-12 15:50:08.578880'),('znrszozqqjbymlo3do7fr2nimofnssbl','NDg5ZDVmMGI4ZTBlZTYxNTczN2Y3ZTA3OWUyNjM0ZjEyZDJkNWY1Zjp7Im9zY2FyX29wZW5fYmFza2V0IjoxMn0=','2017-11-22 17:55:33.360847'),('zoxesnhvl2ocsvp42mrrz0wzs4wrah80','YTM0Y2RhYWEwYjdiNzNmNzQ1YjA3Y2VmODUxNzE2YTZkYmRlZDM5YTp7Im9zY2FyX29wZW5fYmFza2V0IjozMH0=','2017-12-06 15:07:11.701457'),('zp7xh1k44o71i2fklnim1u4lr5u1fdh1','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-13 15:10:46.711381'),('zpdr5q1l8h0tgawkwyl7jfrr1gg2fk5u','ODU2MTg3YzAyNzYyYTVkN2I2MGFiNjMwZDM1YTFmYmNjYzRhODRkODp7Im9zY2FyX29wZW5fYmFza2V0Ijo5M30=','2017-12-12 13:54:19.522727'),('zuqsb4ma39a6djl8ytyn9ofduz9e8gcc','YjQzNmQwZmJmYmY4MDVmMzY0NGNkMjBkNmRiMmE4YzdjYzFlMzU0ZTp7Im9zY2FyX29wZW5fYmFza2V0IjoxMDN9','2017-12-12 17:06:36.463877'),('zvgck7l9rke55cz6yvc9ide79k9mkvex','Mzc1YzMxN2JlZjUzZmIzYjlmMjMzYWFmMDVjZTcxYzA0YTllMTVhMDp7Im9zY2FyX29wZW5fYmFza2V0IjozNX0=','2017-12-11 16:41:49.297601'),('zw4g2kkhio63redlnf3rj8t0syojgn1z','NWUxZjdiYjllZjU2NTUwZDYzNzUyMTkzZTAzY2E3Zjg3OTViZjVmYjp7Im9zY2FyX29wZW5fYmFza2V0Ijo5OX0=','2017-12-12 15:41:31.369723');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_benefit`
--

DROP TABLE IF EXISTS `offer_benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `max_affected_items` int(10) unsigned DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_benefit_range_id_ab19c5ab_fk_offer_range_id` (`range_id`),
  CONSTRAINT `offer_benefit_range_id_ab19c5ab_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_benefit`
--

LOCK TABLES `offer_benefit` WRITE;
/*!40000 ALTER TABLE `offer_benefit` DISABLE KEYS */;
INSERT INTO `offer_benefit` VALUES (1,'Multibuy',NULL,NULL,NULL,1),(2,'',NULL,NULL,'oscarx.offers.ChangesOwnerName',NULL),(3,'Shipping fixed price',1.99,NULL,NULL,NULL);
/*!40000 ALTER TABLE `offer_benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_condition`
--

DROP TABLE IF EXISTS `offer_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` decimal(12,2) DEFAULT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_condition_range_id_b023a2aa_fk_offer_range_id` (`range_id`),
  CONSTRAINT `offer_condition_range_id_b023a2aa_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_condition`
--

LOCK TABLES `offer_condition` WRITE;
/*!40000 ALTER TABLE `offer_condition` DISABLE KEYS */;
INSERT INTO `offer_condition` VALUES (1,'Count',3.00,NULL,1),(2,'Count',1.00,NULL,1),(3,'Count',1.00,NULL,1);
/*!40000 ALTER TABLE `offer_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_conditionaloffer`
--

DROP TABLE IF EXISTS `offer_conditionaloffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_conditionaloffer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `offer_type` varchar(128) NOT NULL,
  `status` varchar(64) NOT NULL,
  `priority` int(11) NOT NULL,
  `start_datetime` datetime(6) DEFAULT NULL,
  `end_datetime` datetime(6) DEFAULT NULL,
  `max_global_applications` int(10) unsigned DEFAULT NULL,
  `max_user_applications` int(10) unsigned DEFAULT NULL,
  `max_basket_applications` int(10) unsigned DEFAULT NULL,
  `max_discount` decimal(12,2) DEFAULT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `num_applications` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `redirect_url` varchar(200) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `benefit_id` int(11) NOT NULL,
  `condition_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` (`benefit_id`),
  KEY `offer_conditionaloff_condition_id_e6baa945_fk_offer_con` (`condition_id`),
  CONSTRAINT `offer_conditionaloff_condition_id_e6baa945_fk_offer_con` FOREIGN KEY (`condition_id`) REFERENCES `offer_condition` (`id`),
  CONSTRAINT `offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id` FOREIGN KEY (`benefit_id`) REFERENCES `offer_benefit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_conditionaloffer`
--

LOCK TABLES `offer_conditionaloffer` WRITE;
/*!40000 ALTER TABLE `offer_conditionaloffer` DISABLE KEYS */;
INSERT INTO `offer_conditionaloffer` VALUES (1,'Normal site offer','dave','This is a normal site offer.<br>','Site','Open',0,'2013-02-21 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,0.00,0,0,'','2013-02-21 15:50:56.701000',1,1),(2,'Deferred benefit offer','deferred-benefit-offer','This offer gives a deferred benefit.&nbsp; Eg, it does something once the offer has been placed.<br>','Site','Open',0,'2013-03-12 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,0.00,29,29,'','2013-03-12 15:42:51.662000',2,2),(3,'Shipping offer','shipping-offer','This gives a shipping discount<br>','Site','Open',0,'2013-03-12 00:00:00.000000',NULL,NULL,NULL,NULL,NULL,0.00,0,0,'','2013-03-12 15:43:43.839000',3,3);
/*!40000 ALTER TABLE `offer_conditionaloffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range`
--

DROP TABLE IF EXISTS `offer_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `includes_all_products` tinyint(1) NOT NULL,
  `proxy_class` varchar(255) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `proxy_class` (`proxy_class`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range`
--

LOCK TABLES `offer_range` WRITE;
/*!40000 ALTER TABLE `offer_range` DISABLE KEYS */;
INSERT INTO `offer_range` VALUES (1,'Whole site','whole-site','',0,1,NULL,'2013-02-21 16:25:27.633000'),(2,'Fiction books','fiction-books','',0,0,NULL,'2013-02-21 16:25:38.805000');
/*!40000 ALTER TABLE `offer_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_classes`
--

DROP TABLE IF EXISTS `offer_range_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `productclass_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_classes_range_id_productclass_id_28eeefae_uniq` (`range_id`,`productclass_id`),
  KEY `offer_range_classes_productclass_id_6f6de46d_fk_catalogue` (`productclass_id`),
  CONSTRAINT `offer_range_classes_productclass_id_6f6de46d_fk_catalogue` FOREIGN KEY (`productclass_id`) REFERENCES `catalogue_productclass` (`id`),
  CONSTRAINT `offer_range_classes_range_id_7d3e573e_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_classes`
--

LOCK TABLES `offer_range_classes` WRITE;
/*!40000 ALTER TABLE `offer_range_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_excluded_products`
--

DROP TABLE IF EXISTS `offer_range_excluded_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_excluded_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_excluded_products_range_id_product_id_eb1cfe87_uniq` (`range_id`,`product_id`),
  KEY `offer_range_excluded_product_id_78c49bfc_fk_catalogue` (`product_id`),
  CONSTRAINT `offer_range_excluded_product_id_78c49bfc_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_range_excluded_range_id_cce4a032_fk_offer_ran` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_excluded_products`
--

LOCK TABLES `offer_range_excluded_products` WRITE;
/*!40000 ALTER TABLE `offer_range_excluded_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_range_excluded_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_range_included_categories`
--

DROP TABLE IF EXISTS `offer_range_included_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_range_included_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_range_included_cat_range_id_category_id_a661d336_uniq` (`range_id`,`category_id`),
  KEY `offer_range_included_category_id_c61569a5_fk_catalogue` (`category_id`),
  CONSTRAINT `offer_range_included_category_id_c61569a5_fk_catalogue` FOREIGN KEY (`category_id`) REFERENCES `catalogue_category` (`id`),
  CONSTRAINT `offer_range_included_range_id_1b616138_fk_offer_ran` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_range_included_categories`
--

LOCK TABLES `offer_range_included_categories` WRITE;
/*!40000 ALTER TABLE `offer_range_included_categories` DISABLE KEYS */;
INSERT INTO `offer_range_included_categories` VALUES (3,2,2);
/*!40000 ALTER TABLE `offer_range_included_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_rangeproduct`
--

DROP TABLE IF EXISTS `offer_rangeproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_rangeproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_order` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `range_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offer_rangeproduct_range_id_product_id_c46b1be8_uniq` (`range_id`,`product_id`),
  KEY `offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `offer_rangeproduct_range_id_ee358495_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_rangeproduct`
--

LOCK TABLES `offer_rangeproduct` WRITE;
/*!40000 ALTER TABLE `offer_rangeproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_rangeproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_rangeproductfileupload`
--

DROP TABLE IF EXISTS `offer_rangeproductfileupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_rangeproductfileupload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `date_uploaded` datetime(6) NOT NULL,
  `status` varchar(32) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `date_processed` datetime(6) DEFAULT NULL,
  `num_new_skus` int(10) unsigned DEFAULT NULL,
  `num_unknown_skus` int(10) unsigned DEFAULT NULL,
  `num_duplicate_skus` int(10) unsigned DEFAULT NULL,
  `range_id` int(11) NOT NULL,
  `uploaded_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_rangeproductfileupload_range_id_c055ebf8_fk_offer_range_id` (`range_id`),
  KEY `offer_rangeproductfi_uploaded_by_id_c01a3250_fk_auth_user` (`uploaded_by_id`),
  CONSTRAINT `offer_rangeproductfi_uploaded_by_id_c01a3250_fk_auth_user` FOREIGN KEY (`uploaded_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `offer_rangeproductfileupload_range_id_c055ebf8_fk_offer_range_id` FOREIGN KEY (`range_id`) REFERENCES `offer_range` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_rangeproductfileupload`
--

LOCK TABLES `offer_rangeproductfileupload` WRITE;
/*!40000 ALTER TABLE `offer_rangeproductfileupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_rangeproductfileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_billingaddress`
--

DROP TABLE IF EXISTS `order_billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_billingaddress_country_id_17f57dca_fk_address_c` (`country_id`),
  CONSTRAINT `order_billingaddress_country_id_17f57dca_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_billingaddress`
--

LOCK TABLES `order_billingaddress` WRITE;
/*!40000 ALTER TABLE `order_billingaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_communicationevent`
--

DROP TABLE IF EXISTS `order_communicationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_communicationevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_communicatione_event_type_id_4bc9ee29_fk_customer_` (`event_type_id`),
  KEY `order_communicationevent_order_id_94e784ac_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_communicatione_event_type_id_4bc9ee29_fk_customer_` FOREIGN KEY (`event_type_id`) REFERENCES `customer_communicationeventtype` (`id`),
  CONSTRAINT `order_communicationevent_order_id_94e784ac_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_communicationevent`
--

LOCK TABLES `order_communicationevent` WRITE;
/*!40000 ALTER TABLE `order_communicationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_communicationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(128) NOT NULL,
  `partner_sku` varchar(128) NOT NULL,
  `partner_line_reference` varchar(128) NOT NULL,
  `partner_line_notes` longtext NOT NULL,
  `title` varchar(255) NOT NULL,
  `upc` varchar(128) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `line_price_incl_tax` decimal(12,2) NOT NULL,
  `line_price_excl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_incl_tax` decimal(12,2) NOT NULL,
  `line_price_before_discounts_excl_tax` decimal(12,2) NOT NULL,
  `unit_cost_price` decimal(12,2) DEFAULT NULL,
  `unit_price_incl_tax` decimal(12,2) DEFAULT NULL,
  `unit_price_excl_tax` decimal(12,2) DEFAULT NULL,
  `unit_retail_price` decimal(12,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `est_dispatch_date` date DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stockrecord_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_line_order_id_b9148391_fk_order_order_id` (`order_id`),
  KEY `order_line_partner_id_258a2fb9_fk_partner_partner_id` (`partner_id`),
  KEY `order_line_product_id_e620902d_fk_catalogue_product_id` (`product_id`),
  KEY `order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id` (`stockrecord_id`),
  CONSTRAINT `order_line_order_id_b9148391_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_line_partner_id_258a2fb9_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `order_line_product_id_e620902d_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,'Book partner','9780553380958','','','Snow Crash','9780553380958',1,7.99,7.99,7.99,7.99,NULL,7.99,7.99,NULL,'Pending',NULL,1,3,12,6),(3,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Pending',NULL,3,4,199,199),(4,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Pending',NULL,4,4,199,199),(5,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Pending',NULL,5,4,199,199),(6,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Pending',NULL,6,4,199,199),(7,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Pending',NULL,7,4,199,199),(8,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Timeout',NULL,8,4,199,199),(9,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Timeout',NULL,9,4,199,199),(10,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'Timeout',NULL,10,4,199,199),(11,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,11,4,199,199),(12,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'timeout',NULL,12,4,199,199),(13,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'timeout',NULL,13,4,199,199),(14,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,14,4,199,199),(15,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,15,4,199,199),(16,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,16,4,199,199),(17,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,17,4,199,199),(18,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,18,4,199,199),(19,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,19,4,199,199),(20,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,20,4,199,199),(21,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,21,4,199,199),(22,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,22,4,199,199),(23,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,23,4,199,199),(24,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,24,4,199,199),(25,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,25,4,199,199),(26,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,26,4,199,199),(27,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,27,4,199,199),(28,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,28,4,199,199),(29,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,29,4,199,199),(30,'LuckIsComing','GZTHHILTON-06606','','','Whirlpool Swash Dryer','883049325293',1,6.00,6.00,6.00,6.00,3.00,6.00,6.00,6.00,'shipped',NULL,30,4,199,199);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineattribute`
--

DROP TABLE IF EXISTS `order_lineattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineattribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineattribute_line_id_adf6dd87_fk_order_line_id` (`line_id`),
  KEY `order_lineattribute_option_id_b54d597c_fk_catalogue_option_id` (`option_id`),
  CONSTRAINT `order_lineattribute_line_id_adf6dd87_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_lineattribute_option_id_b54d597c_fk_catalogue_option_id` FOREIGN KEY (`option_id`) REFERENCES `catalogue_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineattribute`
--

LOCK TABLES `order_lineattribute` WRITE;
/*!40000 ALTER TABLE `order_lineattribute` DISABLE KEYS */;
INSERT INTO `order_lineattribute` VALUES (3,'sku_code','GZTHHILTON-06606',3,2),(4,'unit_duration_min','45',3,1),(5,'sku_code','GZTHHILTON-06606',4,2),(6,'unit_duration_min','45',4,1),(7,'sku_code','GZTHHILTON-06606',5,2),(8,'unit_duration_min','45',5,1),(9,'sku_code','GZTHHILTON-06606',6,2),(10,'unit_duration_min','45',6,1),(11,'sku_code','GZTHHILTON-06606',7,2),(12,'unit_duration_min','45',7,1),(13,'sku_code','GZTHHILTON-06606',8,2),(14,'unit_duration_min','45',8,1),(15,'sku_code','GZTHHILTON-06606',9,2),(16,'unit_duration_min','45',9,1),(17,'sku_code','GZTHHILTON-06606',10,2),(18,'unit_duration_min','45',10,1),(19,'sku_code','GZTHHILTON-06606',11,2),(20,'unit_duration_min','45',11,1),(21,'sku_code','GZTHHILTON-06606',12,2),(22,'unit_duration_min','45',12,1),(23,'sku_code','GZTHHILTON-06606',13,2),(24,'unit_duration_min','45',13,1),(25,'sku_code','GZTHHILTON-06606',14,2),(26,'unit_duration_min','45',14,1),(27,'sku_code','GZTHHILTON-06606',15,2),(28,'unit_duration_min','45',15,1),(29,'sku_code','GZTHHILTON-06606',16,2),(30,'unit_duration_min','45',16,1),(31,'sku_code','GZTHHILTON-06606',17,2),(32,'unit_duration_min','45',17,1),(33,'sku_code','GZTHHILTON-06606',18,2),(34,'unit_duration_min','45',18,1),(35,'sku_code','GZTHHILTON-06606',19,2),(36,'unit_duration_min','45',19,1),(37,'sku_code','GZTHHILTON-06606',20,2),(38,'unit_duration_min','45',20,1),(39,'sku_code','GZTHHILTON-06606',21,2),(40,'unit_duration_min','45',21,1),(41,'sku_code','GZTHHILTON-06606',22,2),(42,'unit_duration_min','45',22,1),(43,'sku_code','GZTHHILTON-06606',23,2),(44,'unit_duration_min','45',23,1),(45,'sku_code','GZTHHILTON-06606',24,2),(46,'unit_duration_min','45',24,1),(47,'sku_code','GZTHHILTON-06606',25,2),(48,'unit_duration_min','45',25,1),(49,'sku_code','GZTHHILTON-06606',26,2),(50,'unit_duration_min','45',26,1),(51,'sku_code','GZTHHILTON-06606',27,2),(52,'unit_duration_min','45',27,1),(53,'sku_code','GZTHHILTON-06606',28,2),(54,'unit_duration_min','45',28,1),(55,'sku_code','GZTHHILTON-06606',29,2),(56,'unit_duration_min','45',29,1),(57,'sku_code','GZTHHILTON-06606',30,2),(58,'unit_duration_min','45',30,1);
/*!40000 ALTER TABLE `order_lineattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_lineprice`
--

DROP TABLE IF EXISTS `order_lineprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_lineprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `price_incl_tax` decimal(12,2) NOT NULL,
  `price_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `line_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_lineprice_line_id_2de52446_fk_order_line_id` (`line_id`),
  KEY `order_lineprice_order_id_66792e56_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_lineprice_line_id_2de52446_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `order_lineprice_order_id_66792e56_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_lineprice`
--

LOCK TABLES `order_lineprice` WRITE;
/*!40000 ALTER TABLE `order_lineprice` DISABLE KEYS */;
INSERT INTO `order_lineprice` VALUES (1,1,7.99,7.99,0.00,0.00,1,1),(3,1,6.00,6.00,0.00,0.00,3,3),(4,1,6.00,6.00,0.00,0.00,4,4),(5,1,6.00,6.00,0.00,0.00,5,5),(6,1,6.00,6.00,0.00,0.00,6,6),(7,1,6.00,6.00,0.00,0.00,7,7),(8,1,6.00,6.00,0.00,0.00,8,8),(9,1,6.00,6.00,0.00,0.00,9,9),(10,1,6.00,6.00,0.00,0.00,10,10),(11,1,6.00,6.00,0.00,0.00,11,11),(12,1,6.00,6.00,0.00,0.00,12,12),(13,1,6.00,6.00,0.00,0.00,13,13),(14,1,6.00,6.00,0.00,0.00,14,14),(15,1,6.00,6.00,0.00,0.00,15,15),(16,1,6.00,6.00,0.00,0.00,16,16),(17,1,6.00,6.00,0.00,0.00,17,17),(18,1,6.00,6.00,0.00,0.00,18,18),(19,1,6.00,6.00,0.00,0.00,19,19),(20,1,6.00,6.00,0.00,0.00,20,20),(21,1,6.00,6.00,0.00,0.00,21,21),(22,1,6.00,6.00,0.00,0.00,22,22),(23,1,6.00,6.00,0.00,0.00,23,23),(24,1,6.00,6.00,0.00,0.00,24,24),(25,1,6.00,6.00,0.00,0.00,25,25),(26,1,6.00,6.00,0.00,0.00,26,26),(27,1,6.00,6.00,0.00,0.00,27,27),(28,1,6.00,6.00,0.00,0.00,28,28),(29,1,6.00,6.00,0.00,0.00,29,29),(30,1,6.00,6.00,0.00,0.00,30,30);
/*!40000 ALTER TABLE `order_lineprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(128) NOT NULL,
  `currency` varchar(12) NOT NULL,
  `total_incl_tax` decimal(12,2) NOT NULL,
  `total_excl_tax` decimal(12,2) NOT NULL,
  `shipping_incl_tax` decimal(12,2) NOT NULL,
  `shipping_excl_tax` decimal(12,2) NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `status` varchar(100) NOT NULL,
  `guest_email` varchar(254) NOT NULL,
  `date_placed` datetime(6) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `order_order_basket_id_8b0acbb2_fk_basket_basket_id` (`basket_id`),
  KEY `order_order_billing_address_id_8fe537cf_fk_order_bil` (`billing_address_id`),
  KEY `order_order_date_placed_506a9365` (`date_placed`),
  KEY `order_order_shipping_address_id_57e64931_fk_order_shi` (`shipping_address_id`),
  KEY `order_order_site_id_e27f3526_fk_django_site_id` (`site_id`),
  KEY `order_order_user_id_7cf9bc2b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `order_order_basket_id_8b0acbb2_fk_basket_basket_id` FOREIGN KEY (`basket_id`) REFERENCES `basket_basket` (`id`),
  CONSTRAINT `order_order_billing_address_id_8fe537cf_fk_order_bil` FOREIGN KEY (`billing_address_id`) REFERENCES `order_billingaddress` (`id`),
  CONSTRAINT `order_order_shipping_address_id_57e64931_fk_order_shi` FOREIGN KEY (`shipping_address_id`) REFERENCES `order_shippingaddress` (`id`),
  CONSTRAINT `order_order_site_id_e27f3526_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `order_order_user_id_7cf9bc2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,'100099','GBP',7.99,7.99,0.00,0.00,'Free shipping','free-shipping','timeout','','2014-10-10 13:07:36.499000',NULL,NULL,1,1,1),(3,'100023','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-20 18:25:06.388257',23,NULL,NULL,1,2),(4,'100024','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-20 18:28:30.985766',24,NULL,NULL,1,2),(5,'100025','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-20 18:32:43.907637',25,NULL,NULL,1,2),(6,'100026','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-20 18:34:37.534650',26,NULL,NULL,1,2),(7,'100027','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-20 18:35:37.839960',27,NULL,NULL,1,2),(8,'100028','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-20 18:38:33.185903',28,NULL,NULL,1,2),(9,'100030','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-25 04:55:44.413537',30,NULL,NULL,1,2),(10,'2017112505481831','CNY',6.00,6.00,0.00,0.00,'Commence Down','commence-down','timeout','','2017-11-25 05:48:18.103417',31,NULL,NULL,1,2),(11,'2017112507254732','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-27 00:15:47.594656',32,NULL,NULL,1,2),(12,'2017112716322133','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','timeout','','2017-11-27 16:32:21.735864',33,NULL,NULL,1,2),(13,'2017112716414234','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','timeout','','2017-11-27 16:41:47.458084',34,NULL,NULL,1,2),(14,'2017112717072435','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-27 17:07:24.574034',35,NULL,NULL,1,2),(15,'2017112717164936','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-27 17:16:49.835704',36,NULL,NULL,1,2),(16,'2017112717260590','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-27 17:26:06.054797',90,NULL,NULL,1,2),(17,'2017112717394991','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-27 17:39:49.197972',91,NULL,NULL,1,2),(18,'2017112813433792','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 13:43:37.551587',92,NULL,NULL,1,2),(19,'2017112813550693','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 13:55:06.372445',93,NULL,NULL,1,2),(20,'2017112815162894','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:16:28.947001',94,NULL,NULL,1,2),(21,'2017112815213095','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:21:30.368458',95,NULL,NULL,1,2),(22,'2017112815273196','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:27:31.865384',96,NULL,NULL,1,2),(23,'2017112815313197','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:31:31.054295',97,NULL,NULL,1,2),(24,'2017112815364998','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:36:49.746747',98,NULL,NULL,1,2),(25,'2017112815420799','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:42:07.504755',99,NULL,NULL,1,2),(26,'20171128154902100','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:49:02.580655',100,NULL,NULL,1,2),(27,'20171128155706101','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 15:57:06.856997',101,NULL,NULL,1,2),(28,'20171128165653102','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-28 16:56:53.784020',102,NULL,NULL,1,2),(29,'20171129170058103','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-29 17:00:58.876065',103,NULL,NULL,1,2),(30,'20171129170527105','CNY',6.00,6.00,0.00,0.00,'Count Down','count-down','complete','','2017-11-29 17:05:27.985115',105,NULL,NULL,1,2);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdiscount`
--

DROP TABLE IF EXISTS `order_orderdiscount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdiscount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL,
  `offer_id` int(10) unsigned DEFAULT NULL,
  `offer_name` varchar(128) NOT NULL,
  `voucher_id` int(10) unsigned DEFAULT NULL,
  `voucher_code` varchar(128) NOT NULL,
  `frequency` int(10) unsigned DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `message` longtext NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdiscount_order_id_bc91e123_fk_order_order_id` (`order_id`),
  KEY `order_orderdiscount_offer_name_706d6119` (`offer_name`),
  KEY `order_orderdiscount_voucher_code_6ee4f360` (`voucher_code`),
  CONSTRAINT `order_orderdiscount_order_id_bc91e123_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdiscount`
--

LOCK TABLES `order_orderdiscount` WRITE;
/*!40000 ALTER TABLE `order_orderdiscount` DISABLE KEYS */;
INSERT INTO `order_orderdiscount` VALUES (1,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',1),(3,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',3),(4,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',4),(5,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',5),(6,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',6),(7,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',7),(8,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',8),(9,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',9),(10,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',10),(11,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',11),(12,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',12),(13,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',13),(14,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',14),(15,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',15),(16,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',16),(17,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',17),(18,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',18),(19,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',19),(20,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',20),(21,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',21),(22,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',22),(23,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',23),(24,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',24),(25,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',25),(26,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',26),(27,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',27),(28,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',28),(29,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',29),(30,'Deferred',2,'Deferred benefit offer',NULL,'',1,0.00,'Your name has been changed to Barry!',30);
/*!40000 ALTER TABLE `order_orderdiscount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordernote`
--

DROP TABLE IF EXISTS `order_ordernote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ordernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_type` varchar(128) NOT NULL,
  `message` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_ordernote_order_id_7d97583d_fk_order_order_id` (`order_id`),
  KEY `order_ordernote_user_id_48d7a672_fk_auth_user_id` (`user_id`),
  CONSTRAINT `order_ordernote_order_id_7d97583d_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_ordernote_user_id_48d7a672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordernote`
--

LOCK TABLES `order_ordernote` WRITE;
/*!40000 ALTER TABLE `order_ordernote` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_ordernote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymentevent`
--

DROP TABLE IF EXISTS `order_paymentevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymentevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipping_event_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_paymentevent_event_type_id_568c7161_fk_order_pay` (`event_type_id`),
  KEY `order_paymentevent_order_id_395b3e82_fk_order_order_id` (`order_id`),
  KEY `order_paymentevent_shipping_event_id_213dcfb8_fk_order_shi` (`shipping_event_id`),
  CONSTRAINT `order_paymentevent_event_type_id_568c7161_fk_order_pay` FOREIGN KEY (`event_type_id`) REFERENCES `order_paymenteventtype` (`id`),
  CONSTRAINT `order_paymentevent_order_id_395b3e82_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `order_paymentevent_shipping_event_id_213dcfb8_fk_order_shi` FOREIGN KEY (`shipping_event_id`) REFERENCES `order_shippingevent` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymentevent`
--

LOCK TABLES `order_paymentevent` WRITE;
/*!40000 ALTER TABLE `order_paymentevent` DISABLE KEYS */;
INSERT INTO `order_paymentevent` VALUES (2,6.00,'2017112507254732','2017-11-26 16:40:38.415340',1,11,2),(3,6.00,'2017112717072435','2017-11-27 17:07:27.213679',1,14,5),(4,6.00,'2017112717164936','2017-11-27 17:16:51.754832',1,15,7),(5,6.00,'2017112717260590','2017-11-27 17:26:08.543234',1,16,9),(6,6.00,'2017112717394991','2017-11-27 17:39:52.119335',1,17,11),(7,6.00,'2017112813433792','2017-11-28 13:43:39.443885',1,18,13),(8,6.00,'2017112813550693','2017-11-28 13:55:08.894416',1,19,15),(9,6.00,'2017112815162894','2017-11-28 15:16:30.884116',1,20,17),(10,6.00,'2017112815213095','2017-11-28 15:21:32.324782',1,21,19),(11,6.00,'2017112815273196','2017-11-28 15:27:33.755055',1,22,21),(12,6.00,'2017112815313197','2017-11-28 15:31:33.038303',1,23,23),(13,6.00,'2017112815364998','2017-11-28 15:36:51.678185',1,24,25),(14,6.00,'2017112815420799','2017-11-28 15:42:09.432330',1,25,27),(15,6.00,'20171128154902100','2017-11-28 15:49:04.579366',1,26,29),(16,6.00,'20171128155706101','2017-11-28 15:57:08.903280',1,27,31),(17,6.00,'20171128165653102','2017-11-28 16:56:55.727654',1,28,33),(18,6.00,'20171129170058103','2017-11-29 17:01:01.574959',1,29,35),(19,6.00,'20171129170527105','2017-11-29 17:05:30.042684',1,30,37);
/*!40000 ALTER TABLE `order_paymentevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventquantity`
--

DROP TABLE IF EXISTS `order_paymenteventquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_paymenteventquantity_event_id_line_id_765c5209_uniq` (`event_id`,`line_id`),
  KEY `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_paymenteventqu_event_id_a540165a_fk_order_pay` FOREIGN KEY (`event_id`) REFERENCES `order_paymentevent` (`id`),
  CONSTRAINT `order_paymenteventquantity_line_id_df44b021_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventquantity`
--

LOCK TABLES `order_paymenteventquantity` WRITE;
/*!40000 ALTER TABLE `order_paymenteventquantity` DISABLE KEYS */;
INSERT INTO `order_paymenteventquantity` VALUES (2,1,2,11),(3,1,3,14),(4,1,4,15),(5,1,5,16),(6,1,6,17),(7,1,7,18),(8,1,8,19),(9,1,9,20),(10,1,10,21),(11,1,11,22),(12,1,12,23),(13,1,13,24),(14,1,14,25),(15,1,15,26),(16,1,16,27),(17,1,17,28),(18,1,18,29),(19,1,19,30);
/*!40000 ALTER TABLE `order_paymenteventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_paymenteventtype`
--

DROP TABLE IF EXISTS `order_paymenteventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_paymenteventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_paymenteventtype`
--

LOCK TABLES `order_paymenteventtype` WRITE;
/*!40000 ALTER TABLE `order_paymenteventtype` DISABLE KEYS */;
INSERT INTO `order_paymenteventtype` VALUES (1,'Pre-authorised','pre-authorised'),(2,'Settled','settled'),(3,'Refunded','refunded'),(4,'Failed','failed');
/*!40000 ALTER TABLE `order_paymenteventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingaddress`
--

DROP TABLE IF EXISTS `order_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `phone_number` varchar(128) NOT NULL,
  `notes` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippingaddres_country_id_29abf9a0_fk_address_c` (`country_id`),
  CONSTRAINT `order_shippingaddres_country_id_29abf9a0_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingaddress`
--

LOCK TABLES `order_shippingaddress` WRITE;
/*!40000 ALTER TABLE `order_shippingaddress` DISABLE KEYS */;
INSERT INTO `order_shippingaddress` VALUES (1,'Ms','Emery','Martin','Iusto ut rem doloribus irure non architecto tempor rerum ex et ut','Earum id magnam et libero voluptas sed et et','Voluptas illum alias facilis recusandae Laudantium','Velit non aut repellendus Sint ut incididunt eiusmod aliqua Et','Excepteur eos distinctio Ut eu','EN1 9EL','Emery Martin Iusto ut rem doloribus irure non architecto tempor rerum ex et ut Earum id magnam et libero voluptas sed et et Voluptas illum alias facilis recusandae Laudantium Velit non aut repellendus Sint ut incididunt eiusmod aliqua Et Excepteur eos distinctio Ut eu EN1 9EL United Kingdom of Great Britain and Northern Ireland','+NoneNone','Velit enim eos, asperiores architecto nesciunt, non ad dolor ullam esse, in et eum qui in recusandae.','GB');
/*!40000 ALTER TABLE `order_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingevent`
--

DROP TABLE IF EXISTS `order_shippingevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_shippingevent_event_type_id_9f1efb20_fk_order_shi` (`event_type_id`),
  KEY `order_shippingevent_order_id_8c031fb6_fk_order_order_id` (`order_id`),
  CONSTRAINT `order_shippingevent_event_type_id_9f1efb20_fk_order_shi` FOREIGN KEY (`event_type_id`) REFERENCES `order_shippingeventtype` (`id`),
  CONSTRAINT `order_shippingevent_order_id_8c031fb6_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingevent`
--

LOCK TABLES `order_shippingevent` WRITE;
/*!40000 ALTER TABLE `order_shippingevent` DISABLE KEYS */;
INSERT INTO `order_shippingevent` VALUES (2,'','2017-11-26 16:40:38.603955',1,11),(3,'','2017-11-26 19:26:19.343211',4,11),(4,'','2017-11-27 15:19:00.085347',4,11),(5,'','2017-11-27 17:07:27.368015',1,14),(6,'','2017-11-27 17:09:00.070516',4,14),(7,'','2017-11-27 17:16:51.898141',1,15),(8,'','2017-11-27 17:18:00.067791',4,15),(9,'','2017-11-27 17:26:08.695331',1,16),(10,'','2017-11-27 17:30:00.079113',4,16),(11,'','2017-11-27 17:39:52.273343',1,17),(12,'','2017-11-27 17:43:00.073329',4,17),(13,'','2017-11-28 13:43:39.579127',1,18),(14,'','2017-11-28 13:47:00.205952',4,18),(15,'','2017-11-28 13:55:09.110228',1,19),(16,'','2017-11-28 13:59:00.160651',4,19),(17,'','2017-11-28 15:16:31.015276',1,20),(18,'','2017-11-28 15:20:00.068971',4,20),(19,'','2017-11-28 15:21:32.460130',1,21),(20,'','2017-11-28 15:25:00.126421',4,21),(21,'','2017-11-28 15:27:33.893471',1,22),(22,'','2017-11-28 15:31:00.058863',4,22),(23,'','2017-11-28 15:31:33.172154',1,23),(24,'','2017-11-28 15:35:00.074702',4,23),(25,'','2017-11-28 15:36:51.829155',1,24),(26,'','2017-11-28 15:40:00.116094',4,24),(27,'','2017-11-28 15:42:09.567542',1,25),(28,'','2017-11-28 15:46:00.074879',4,25),(29,'','2017-11-28 15:49:04.724702',1,26),(30,'','2017-11-28 15:53:00.129130',4,26),(31,'','2017-11-28 15:57:09.052471',1,27),(32,'','2017-11-28 16:01:00.065918',4,27),(33,'','2017-11-28 16:56:55.862714',1,28),(34,'','2017-11-28 17:00:00.068129',4,28),(35,'','2017-11-29 17:01:01.714531',1,29),(36,'','2017-11-29 17:05:00.073999',4,29),(37,'','2017-11-29 17:05:30.184490',1,30),(38,'','2017-11-29 17:09:00.065452',4,30);
/*!40000 ALTER TABLE `order_shippingevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventquantity`
--

DROP TABLE IF EXISTS `order_shippingeventquantity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventquantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `event_id` int(11) NOT NULL,
  `line_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_shippingeventquantity_event_id_line_id_91687107_uniq` (`event_id`,`line_id`),
  KEY `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` (`line_id`),
  CONSTRAINT `order_shippingeventq_event_id_1c7fb9c7_fk_order_shi` FOREIGN KEY (`event_id`) REFERENCES `order_shippingevent` (`id`),
  CONSTRAINT `order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id` FOREIGN KEY (`line_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventquantity`
--

LOCK TABLES `order_shippingeventquantity` WRITE;
/*!40000 ALTER TABLE `order_shippingeventquantity` DISABLE KEYS */;
INSERT INTO `order_shippingeventquantity` VALUES (1,1,2,11),(2,1,3,11),(3,1,5,14),(4,1,6,14),(5,1,7,15),(6,1,8,15),(7,1,9,16),(8,1,10,16),(9,1,11,17),(10,1,12,17),(11,1,13,18),(12,1,14,18),(13,1,15,19),(14,1,16,19),(15,1,17,20),(16,1,18,20),(17,1,19,21),(18,1,20,21),(19,1,21,22),(20,1,22,22),(21,1,23,23),(22,1,24,23),(23,1,25,24),(24,1,26,24),(25,1,27,25),(26,1,28,25),(27,1,29,26),(28,1,30,26),(29,1,31,27),(30,1,32,27),(31,1,33,28),(32,1,34,28),(33,1,35,29),(34,1,36,29),(35,1,37,30),(36,1,38,30);
/*!40000 ALTER TABLE `order_shippingeventquantity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shippingeventtype`
--

DROP TABLE IF EXISTS `order_shippingeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shippingeventtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shippingeventtype`
--

LOCK TABLES `order_shippingeventtype` WRITE;
/*!40000 ALTER TABLE `order_shippingeventtype` DISABLE KEYS */;
INSERT INTO `order_shippingeventtype` VALUES (1,'Shipped','shipped'),(2,'Cancelled','cancelled'),(3,'Returned','returned'),(4,'Delivered','delivered');
/*!40000 ALTER TABLE `order_shippingeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oscarapi_apikey`
--

DROP TABLE IF EXISTS `oscarapi_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oscarapi_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oscarapi_apikey`
--

LOCK TABLES `oscarapi_apikey` WRITE;
/*!40000 ALTER TABLE `oscarapi_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `oscarapi_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_assetlocation`
--

DROP TABLE IF EXISTS `partner_assetlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_assetlocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_assetlocation_code_6fdac98b_uniq` (`code`),
  KEY `partner_assetlocatio_asset_id_8f76c8aa_fk_partner_p` (`asset_id`),
  CONSTRAINT `partner_assetlocatio_asset_id_8f76c8aa_fk_partner_p` FOREIGN KEY (`asset_id`) REFERENCES `partner_partnerasset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_assetlocation`
--

LOCK TABLES `partner_assetlocation` WRITE;
/*!40000 ALTER TABLE `partner_assetlocation` DISABLE KEYS */;
INSERT INTO `partner_assetlocation` VALUES (1,'GZTHHILTON-06606','广州天河希尔顿酒店06606','广州天河希尔顿酒店',1),(2,'GZTHHILTON-12606','广州天河希尔顿酒店12606','广州天河希尔顿酒店',2),(3,'GZTH4SEASONS-06606','广州天河四季酒店06606','广州天河四季酒店',3);
/*!40000 ALTER TABLE `partner_assetlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner`
--

DROP TABLE IF EXISTS `partner_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner`
--

LOCK TABLES `partner_partner` WRITE;
/*!40000 ALTER TABLE `partner_partner` DISABLE KEYS */;
INSERT INTO `partner_partner` VALUES (1,'book-partner','Book partner'),(2,'book-partner2','Book partner2'),(3,'book-partner3','Book partner3'),(4,'luck_is_coming','LuckIsComing');
/*!40000 ALTER TABLE `partner_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partner_users`
--

DROP TABLE IF EXISTS `partner_partner_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partner_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_partner_users_partner_id_user_id_9e5c0517_uniq` (`partner_id`,`user_id`),
  KEY `partner_partner_users_user_id_d75d6e40_fk_auth_user_id` (`user_id`),
  CONSTRAINT `partner_partner_users_partner_id_1883dfd9_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_partner_users_user_id_d75d6e40_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partner_users`
--

LOCK TABLES `partner_partner_users` WRITE;
/*!40000 ALTER TABLE `partner_partner_users` DISABLE KEYS */;
INSERT INTO `partner_partner_users` VALUES (1,4,1);
/*!40000 ALTER TABLE `partner_partner_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partneraddress`
--

DROP TABLE IF EXISTS `partner_partneraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partneraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `line3` varchar(255) NOT NULL,
  `line4` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postcode` varchar(64) NOT NULL,
  `search_text` longtext NOT NULL,
  `country_id` varchar(2) NOT NULL,
  `partner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_partneraddre_country_id_02c4f979_fk_address_c` (`country_id`),
  KEY `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` (`partner_id`),
  CONSTRAINT `partner_partneraddre_country_id_02c4f979_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `partner_partneraddress_partner_id_59551b0a_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partneraddress`
--

LOCK TABLES `partner_partneraddress` WRITE;
/*!40000 ALTER TABLE `partner_partneraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_partneraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_partnerasset`
--

DROP TABLE IF EXISTS `partner_partnerasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_partnerasset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_num` varchar(128) NOT NULL,
  `state` varchar(8) NOT NULL,
  `cost` double NOT NULL,
  `purchased_at` datetime(6) DEFAULT NULL,
  `expiring_at` datetime(6) DEFAULT NULL,
  `maintainer` varchar(64) NOT NULL,
  `maintainer_phone` varchar(32) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `stockrecord_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_partnerasset_partner_id_serial_num_5504a9d2_uniq` (`partner_id`,`serial_num`),
  KEY `partner_partnerasset_stockrecord_id_30e22661_fk_partner_s` (`stockrecord_id`),
  CONSTRAINT `partner_partnerasset_partner_id_15a81410_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_partnerasset_stockrecord_id_30e22661_fk_partner_s` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_partnerasset`
--

LOCK TABLES `partner_partnerasset` WRITE;
/*!40000 ALTER TABLE `partner_partnerasset` DISABLE KEYS */;
INSERT INTO `partner_partnerasset` VALUES (1,'SWASHDRYER000001','in_use',4500,'2017-11-01 00:00:00.000000','2020-11-01 00:00:00.000000','Ace','1234567890',4,199),(2,'SWASHDRYER000002','in_use',4500,'2017-11-01 00:00:00.000000','2020-11-01 00:00:00.000000','Ace','1234567890',4,200),(3,'SWASHDRYER000003','in_use',4500,'2017-11-01 00:00:00.000000','2020-11-01 00:00:00.000000','Ace','1234567890',4,201);
/*!40000 ALTER TABLE `partner_partnerasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockalert`
--

DROP TABLE IF EXISTS `partner_stockalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockalert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threshold` int(10) unsigned NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_closed` datetime(6) DEFAULT NULL,
  `stockrecord_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_stockalert_stockrecord_id_68ad503a_fk_partner_s` (`stockrecord_id`),
  CONSTRAINT `partner_stockalert_stockrecord_id_68ad503a_fk_partner_s` FOREIGN KEY (`stockrecord_id`) REFERENCES `partner_stockrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockalert`
--

LOCK TABLES `partner_stockalert` WRITE;
/*!40000 ALTER TABLE `partner_stockalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_stockalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_stockrecord`
--

DROP TABLE IF EXISTS `partner_stockrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partner_stockrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_sku` varchar(128) NOT NULL,
  `price_currency` varchar(12) NOT NULL,
  `price_excl_tax` decimal(12,2) DEFAULT NULL,
  `price_retail` decimal(12,2) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `num_in_stock` int(10) unsigned DEFAULT NULL,
  `num_allocated` int(11) DEFAULT NULL,
  `low_stock_threshold` int(10) unsigned DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partner_stockrecord_partner_id_partner_sku_8441e010_uniq` (`partner_id`,`partner_sku`),
  KEY `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` (`product_id`),
  KEY `partner_stockrecord_date_updated_e6ae5f14` (`date_updated`),
  CONSTRAINT `partner_stockrecord_partner_id_4155a586_fk_partner_partner_id` FOREIGN KEY (`partner_id`) REFERENCES `partner_partner` (`id`),
  CONSTRAINT `partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_stockrecord`
--

LOCK TABLES `partner_stockrecord` WRITE;
/*!40000 ALTER TABLE `partner_stockrecord` DISABLE KEYS */;
INSERT INTO `partner_stockrecord` VALUES (1,'a1','GBP',20.00,NULL,NULL,5,NULL,NULL,'2013-07-18 12:25:41.107000','2013-07-18 12:25:41.107000',1,1),(2,'a2','GBP',10.00,NULL,NULL,15,NULL,NULL,'2013-07-18 12:25:49.939000','2013-07-18 12:25:49.939000',1,1),(3,'tng-small','GBP',15.00,NULL,NULL,100,NULL,NULL,'2013-12-13 11:38:49.858000','2013-12-13 11:38:49.858000',2,9),(4,'tng-med','GBP',15.00,NULL,NULL,200,NULL,NULL,'2013-12-13 11:39:12.947000','2013-12-13 11:39:12.947000',2,10),(5,'tng-large','GBP',15.00,NULL,NULL,1,NULL,NULL,'2013-12-13 11:39:53.162000','2013-12-13 11:39:53.162000',2,11),(6,'9780340837948','CNY',2.99,NULL,NULL,52,NULL,NULL,'2017-10-29 10:28:18.967638','2017-10-29 10:28:18.967721',1,6),(7,'9780525951117','CNY',22.99,NULL,NULL,64,NULL,NULL,'2017-10-29 10:28:19.032940','2017-10-29 10:28:19.033021',1,7),(8,'9780451457998','CNY',7.99,NULL,NULL,36,NULL,NULL,'2017-10-29 10:28:19.098086','2017-10-29 10:28:19.098181',1,8),(9,'9780905712826','CNY',14.99,NULL,NULL,30,NULL,NULL,'2017-10-29 10:28:19.163988','2017-10-29 10:28:19.164072',1,9),(10,'9780385333788','CNY',2.99,NULL,NULL,94,NULL,NULL,'2017-10-29 10:28:19.229848','2017-10-29 10:28:19.229934',1,10),(11,'9780553294613','CNY',5.99,NULL,NULL,85,NULL,NULL,'2017-10-29 10:28:19.295777','2017-10-29 10:28:19.295864',1,11),(12,'9780060987046','CNY',2.99,NULL,NULL,61,NULL,NULL,'2017-10-29 10:28:19.360430','2017-10-29 10:28:19.360503',1,12),(13,'9780525951575','CNY',25.99,NULL,NULL,43,NULL,NULL,'2017-10-29 10:28:19.427940','2017-10-29 10:28:19.428026',1,13),(14,'9780345331199','CNY',20.99,NULL,NULL,15,NULL,NULL,'2017-10-29 10:28:19.494685','2017-10-29 10:28:19.494766',1,14),(15,'9780684833392','CNY',0.99,NULL,NULL,34,NULL,NULL,'2017-10-29 10:28:19.560765','2017-10-29 10:28:19.560881',1,15),(16,'9780450055508','CNY',26.99,NULL,NULL,13,NULL,NULL,'2017-10-29 10:28:19.629287','2017-10-29 10:28:19.629364',1,16),(17,'9780307887436','CNY',8.99,NULL,NULL,4,NULL,NULL,'2017-10-29 10:28:19.696001','2017-10-29 10:28:19.696075',1,17),(18,'9780765319852','CNY',2.99,NULL,NULL,92,NULL,NULL,'2017-10-29 10:28:19.762957','2017-10-29 10:28:30.832104',1,18),(19,'9780765348272','CNY',17.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:19.830960','2017-10-29 10:28:19.831126',1,19),(20,'9781429963947','CNY',22.99,NULL,NULL,74,NULL,NULL,'2017-10-29 10:28:19.901115','2017-10-29 10:28:19.901198',1,20),(21,'9781409903291','CNY',11.99,NULL,NULL,19,NULL,NULL,'2017-10-29 10:28:19.967878','2017-10-29 10:28:19.967959',1,21),(22,'9780441013678','CNY',21.99,NULL,NULL,68,NULL,NULL,'2017-10-29 10:28:20.032083','2017-10-29 10:28:20.032165',1,22),(23,'9780553380965','CNY',5.99,NULL,NULL,85,NULL,NULL,'2017-10-29 10:28:20.099917','2017-10-29 10:28:20.099996',1,23),(24,'9780345467171','CNY',20.99,NULL,NULL,81,NULL,NULL,'2017-10-29 10:28:20.165382','2017-10-29 10:28:20.165463',1,24),(25,'9780385533850','CNY',16.99,NULL,NULL,7,NULL,NULL,'2017-10-29 10:28:20.231128','2017-10-29 10:28:20.231213',1,25),(26,'9780691147543','CNY',7.99,NULL,NULL,35,NULL,NULL,'2017-10-29 10:28:20.301068','2017-10-29 10:28:20.301175',1,26),(27,'9780307594778','CNY',20.99,NULL,NULL,58,NULL,NULL,'2017-10-29 10:28:20.370033','2017-10-29 10:28:20.370107',1,27),(28,'9780425198681','CNY',16.99,NULL,NULL,85,NULL,NULL,'2017-10-29 10:28:20.434562','2017-10-29 10:28:20.434646',1,28),(29,'9780441016792','CNY',5.99,NULL,NULL,50,NULL,NULL,'2017-10-29 10:28:20.502745','2017-10-29 10:28:20.502829',1,29),(30,'9781450556569','CNY',6.99,NULL,NULL,48,NULL,NULL,'2017-10-29 10:28:20.569137','2017-10-29 10:28:20.569219',1,30),(31,'9780552151696','CNY',9.99,NULL,NULL,33,NULL,NULL,'2017-10-29 10:28:20.636238','2017-10-29 10:28:20.636318',1,31),(32,'9780763622596','CNY',2.99,NULL,NULL,78,NULL,NULL,'2017-10-29 10:28:20.701492','2017-10-29 10:28:20.701576',1,32),(33,'9780804115483','CNY',1.99,NULL,NULL,37,NULL,NULL,'2017-10-29 10:28:20.766659','2017-10-29 10:28:20.766746',1,33),(34,'9780441363957','CNY',8.99,NULL,NULL,47,NULL,NULL,'2017-10-29 10:28:20.836756','2017-10-29 10:28:20.836904',1,34),(35,'9780553264654','CNY',28.99,NULL,NULL,68,NULL,NULL,'2017-10-29 10:28:20.905553','2017-10-29 10:28:20.905641',1,35),(36,'9780446364966','CNY',3.99,NULL,NULL,4,NULL,NULL,'2017-10-29 10:28:20.971013','2017-10-29 10:28:20.971095',1,36),(37,'9780312423131','CNY',17.99,NULL,NULL,71,NULL,NULL,'2017-10-29 10:28:21.038002','2017-10-29 10:28:21.038083',1,37),(38,'9780982792827','CNY',2.99,NULL,NULL,74,NULL,NULL,'2017-10-29 10:28:21.104646','2017-10-29 10:28:21.104728',1,38),(39,'9780156032971','CNY',8.99,NULL,NULL,93,NULL,NULL,'2017-10-29 10:28:21.171261','2017-10-29 10:28:21.171343',1,39),(40,'9780553575378','CNY',16.99,NULL,NULL,16,NULL,NULL,'2017-10-29 10:28:21.238985','2017-10-29 10:28:21.239095',1,40),(41,'9780812524826','CNY',12.99,NULL,NULL,9,NULL,NULL,'2017-10-29 10:28:21.308164','2017-10-29 10:28:21.308269',1,41),(42,'9780425074657','CNY',23.99,NULL,NULL,31,NULL,NULL,'2017-10-29 10:28:21.375432','2017-10-29 10:28:21.375515',1,42),(43,'9780425074671','CNY',19.99,NULL,NULL,97,NULL,NULL,'2017-10-29 10:28:21.442387','2017-10-29 10:28:21.442462',1,43),(44,'9781425470890','CNY',14.99,NULL,NULL,43,NULL,NULL,'2017-10-29 10:28:21.507783','2017-10-29 10:28:21.507856',1,44),(45,'9780375724503','CNY',1.99,NULL,NULL,3,NULL,NULL,'2017-10-29 10:28:21.576230','2017-10-29 10:28:21.576304',1,45),(46,'9780812536362','CNY',7.99,NULL,NULL,37,NULL,NULL,'2017-10-29 10:28:21.642217','2017-10-29 10:28:21.642291',1,46),(47,'9780452286511','CNY',11.99,NULL,NULL,37,NULL,NULL,'2017-10-29 10:28:21.709291','2017-10-29 10:28:21.709368',1,47),(48,'9780881848120','CNY',24.99,NULL,NULL,94,NULL,NULL,'2017-10-29 10:28:21.776701','2017-10-29 10:28:21.776777',1,48),(49,'9780345475824','CNY',14.99,NULL,NULL,39,NULL,NULL,'2017-10-29 10:28:21.846798','2017-10-29 10:28:21.846874',1,49),(50,'9781416533214','CNY',5.99,NULL,NULL,58,NULL,NULL,'2017-10-29 10:28:21.914294','2017-10-29 10:28:21.914369',1,50),(51,'9781419669972','CNY',21.99,NULL,NULL,21,NULL,NULL,'2017-10-29 10:28:21.984413','2017-10-29 10:28:21.984502',1,51),(52,'9780375700514','CNY',23.99,NULL,NULL,52,NULL,NULL,'2017-10-29 10:28:22.051219','2017-10-29 10:28:22.051298',1,52),(53,'9781575660813','CNY',13.99,NULL,NULL,20,NULL,NULL,'2017-10-29 10:28:22.118182','2017-10-29 10:28:22.118265',1,53),(54,'9780307430083','CNY',0.99,NULL,NULL,13,NULL,NULL,'2017-10-29 10:28:22.189509','2017-10-29 10:28:22.189735',1,54),(55,'9781568582474','CNY',11.99,NULL,NULL,26,NULL,NULL,'2017-10-29 10:28:22.256622','2017-10-29 10:28:22.256818',1,55),(56,'9781607012115','CNY',7.99,NULL,NULL,89,NULL,NULL,'2017-10-29 10:28:22.324235','2017-10-29 10:28:22.324311',1,56),(57,'9780752837451','CNY',12.99,NULL,NULL,81,NULL,NULL,'2017-10-29 10:28:22.393879','2017-10-29 10:28:22.393957',1,57),(58,'9780714530338','CNY',1.99,NULL,NULL,85,NULL,NULL,'2017-10-29 10:28:22.459615','2017-10-29 10:28:22.459701',1,58),(59,'9780593018958','CNY',25.99,NULL,NULL,11,NULL,NULL,'2017-10-29 10:28:22.525404','2017-10-29 10:28:22.525508',1,59),(60,'9781416507789','CNY',9.99,NULL,NULL,14,NULL,NULL,'2017-10-29 10:28:22.591388','2017-10-29 10:28:30.007662',1,60),(61,'9780425137482','CNY',19.99,NULL,NULL,96,NULL,NULL,'2017-10-29 10:28:22.660388','2017-10-29 10:28:22.660466',1,61),(62,'9780486419268','CNY',22.99,NULL,NULL,86,NULL,NULL,'2017-10-29 10:28:22.726151','2017-10-29 10:28:22.726305',1,62),(63,'9780786123322','CNY',17.99,NULL,NULL,77,NULL,NULL,'2017-10-29 10:28:22.791945','2017-10-29 10:28:22.792040',1,63),(64,'9780812531930','CNY',17.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:22.867702','2017-10-29 10:28:22.867781',1,64),(65,'9781556342332','CNY',22.99,NULL,NULL,10,NULL,NULL,'2017-10-29 10:28:22.934490','2017-10-29 10:28:22.934567',1,65),(66,'9781466207608','CNY',22.99,NULL,NULL,19,NULL,NULL,'2017-10-29 10:28:22.999348','2017-10-29 10:28:22.999426',1,66),(67,'9780553290028','CNY',25.99,NULL,NULL,92,NULL,NULL,'2017-10-29 10:28:23.066664','2017-10-29 10:28:23.066744',1,67),(68,'9780252072239','CNY',3.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:23.137549','2017-10-29 10:28:23.137623',1,68),(69,'9780886822330','CNY',19.99,NULL,NULL,46,NULL,NULL,'2017-10-29 10:28:23.208078','2017-10-29 10:28:23.208153',1,69),(70,'9780595297634','CNY',25.99,NULL,NULL,40,NULL,NULL,'2017-10-29 10:28:23.274572','2017-10-29 10:28:23.274645',1,70),(71,'9780395860014','CNY',24.99,NULL,NULL,0,NULL,NULL,'2017-10-29 10:28:23.341943','2017-10-29 10:28:23.342019',1,71),(72,'9780575061897','CNY',24.99,NULL,NULL,32,NULL,NULL,'2017-10-29 10:28:23.407939','2017-10-29 10:28:23.408037',1,72),(73,'9780345275172','CNY',6.99,NULL,NULL,13,NULL,NULL,'2017-10-29 10:28:23.475579','2017-10-29 10:28:23.475656',1,73),(74,'9780743421928','CNY',1.99,NULL,NULL,76,NULL,NULL,'2017-10-29 10:28:23.542570','2017-10-29 10:28:23.542653',1,74),(75,'9780446361309','CNY',26.99,NULL,NULL,57,NULL,NULL,'2017-10-29 10:28:23.609592','2017-10-29 10:28:23.609666',1,75),(76,'9780671559168','CNY',4.99,NULL,NULL,36,NULL,NULL,'2017-10-29 10:28:23.679151','2017-10-29 10:28:23.679225',1,76),(77,'9781935554158','CNY',1.99,NULL,NULL,54,NULL,NULL,'2017-10-29 10:28:23.752408','2017-10-29 10:28:23.752488',1,77),(78,'9780552088046','CNY',26.99,NULL,NULL,27,NULL,NULL,'2017-10-29 10:28:23.820105','2017-10-29 10:28:23.820184',1,78),(79,'9781857988369','CNY',7.99,NULL,NULL,9,NULL,NULL,'2017-10-29 10:28:23.891602','2017-10-29 10:28:23.891679',1,79),(80,'9780575601604','CNY',10.99,NULL,NULL,48,NULL,NULL,'2017-10-29 10:28:23.959272','2017-10-29 10:28:23.959350',1,80),(81,'9781345004373','CNY',18.99,NULL,NULL,31,NULL,NULL,'2017-10-29 10:28:24.025993','2017-10-29 10:28:24.026075',1,81),(82,'9780380816033','CNY',5.99,NULL,NULL,62,NULL,NULL,'2017-10-29 10:28:24.093334','2017-10-29 10:28:24.093412',1,82),(83,'9780671720735','CNY',28.99,NULL,NULL,87,NULL,NULL,'2017-10-29 10:28:24.161258','2017-10-29 10:28:24.161343',1,83),(84,'9781857987638','CNY',16.99,NULL,NULL,74,NULL,NULL,'2017-10-29 10:28:24.227680','2017-10-29 10:28:24.227756',1,84),(85,'9780671559700','CNY',18.99,NULL,NULL,97,NULL,NULL,'2017-10-29 10:28:24.295399','2017-10-29 10:28:24.295476',1,85),(86,'9780812580860','CNY',26.99,NULL,NULL,96,NULL,NULL,'2017-10-29 10:28:24.361999','2017-10-29 10:28:24.362075',1,86),(87,'9780131103627','CNY',9.99,NULL,NULL,20,NULL,NULL,'2017-10-29 10:28:24.449536','2017-10-29 10:28:24.449613',1,87),(88,'9780201616224','CNY',3.99,NULL,NULL,82,NULL,NULL,'2017-10-29 10:28:24.515662','2017-10-29 10:28:24.515741',1,88),(89,'9780201633610','CNY',23.99,NULL,NULL,74,NULL,NULL,'2017-10-29 10:28:24.585772','2017-10-29 10:28:24.585850',1,89),(90,'9780262510875','CNY',23.99,NULL,NULL,54,NULL,NULL,'2017-10-29 10:28:24.653160','2017-10-29 10:28:24.653237',1,90),(91,'9780201485677','CNY',1.99,NULL,NULL,9,NULL,NULL,'2017-10-29 10:28:24.718559','2017-10-29 10:28:24.718644',1,91),(92,'9780201485417','CNY',18.99,NULL,NULL,37,NULL,NULL,'2017-10-29 10:28:24.785644','2017-10-29 10:28:24.785719',1,92),(93,'9780201835953','CNY',8.99,NULL,NULL,90,NULL,NULL,'2017-10-29 10:28:24.856749','2017-10-29 10:28:24.857363',1,93),(94,'9780735619678','CNY',27.99,NULL,NULL,88,NULL,NULL,'2017-10-29 10:28:24.924392','2017-10-29 10:28:24.924486',1,94),(95,'9780132350884','CNY',1.99,NULL,NULL,91,NULL,NULL,'2017-10-29 10:28:24.994321','2017-10-29 10:28:24.994390',1,95),(96,'9780201700732','CNY',11.99,NULL,NULL,88,NULL,NULL,'2017-10-29 10:28:25.059464','2017-10-29 10:28:25.059541',1,96),(97,'9780596517748','CNY',21.99,NULL,NULL,49,NULL,NULL,'2017-10-29 10:28:25.131567','2017-10-29 10:28:25.131644',1,97),(98,'9780201100884','CNY',15.99,NULL,NULL,2,NULL,NULL,'2017-10-29 10:28:25.203017','2017-10-29 10:28:25.203091',1,98),(99,'9780130313584','CNY',16.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:25.274744','2017-10-29 10:28:25.274819',1,99),(100,'9780137903955','CNY',9.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:25.342850','2017-10-29 10:28:25.342925',1,100),(101,'9780262011532','CNY',28.99,NULL,NULL,5,NULL,NULL,'2017-10-29 10:28:25.408423','2017-10-29 10:28:25.408496',1,101),(102,'9780139376818','CNY',24.99,NULL,NULL,44,NULL,NULL,'2017-10-29 10:28:25.475127','2017-10-29 10:28:25.475212',1,102),(103,'9780596514983','CNY',11.99,NULL,NULL,18,NULL,NULL,'2017-10-29 10:28:25.542678','2017-10-29 10:28:25.542753',1,103),(104,'9780262560993','CNY',21.99,NULL,NULL,31,NULL,NULL,'2017-10-29 10:28:25.608667','2017-10-29 10:28:25.608740',1,104),(105,'9780596007126','CNY',23.99,NULL,NULL,12,NULL,NULL,'2017-10-29 10:28:25.675409','2017-10-29 10:28:25.675483',1,105),(106,'9780131177055','CNY',24.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:25.740448','2017-10-29 10:28:25.740529',1,106),(107,'9780262062183','CNY',15.99,NULL,NULL,4,NULL,NULL,'2017-10-29 10:28:25.805644','2017-10-29 10:28:25.805718',1,107),(108,'9780201615869','CNY',15.99,NULL,NULL,63,NULL,NULL,'2017-10-29 10:28:25.879478','2017-10-29 10:28:25.879561',1,108),(109,'9780974514055','CNY',1.99,NULL,NULL,61,NULL,NULL,'2017-10-29 10:28:25.946363','2017-10-29 10:28:25.946441',1,109),(110,'9780596002817','CNY',18.99,NULL,NULL,7,NULL,NULL,'2017-10-29 10:28:26.011717','2017-10-29 10:28:26.011798',1,110),(111,'9780134900124','CNY',2.99,NULL,NULL,21,NULL,NULL,'2017-10-29 10:28:26.077230','2017-10-29 10:28:26.077312',1,111),(112,'9780321503626','CNY',17.99,NULL,NULL,49,NULL,NULL,'2017-10-29 10:28:26.142369','2017-10-29 10:28:26.142447',1,112),(113,'9780321146533','CNY',19.99,NULL,NULL,39,NULL,NULL,'2017-10-29 10:28:26.208620','2017-10-29 10:28:26.208698',1,113),(114,'9780974514048','CNY',20.99,NULL,NULL,94,NULL,NULL,'2017-10-29 10:28:26.276946','2017-10-29 10:28:26.277020',1,114),(115,'9780133708752','CNY',24.99,NULL,NULL,93,NULL,NULL,'2017-10-29 10:28:26.342722','2017-10-29 10:28:26.342799',1,115),(116,'9780596000271','CNY',21.99,NULL,NULL,48,NULL,NULL,'2017-10-29 10:28:26.410033','2017-10-29 10:28:26.410107',1,116),(117,'9780321334879','CNY',1.99,NULL,NULL,34,NULL,NULL,'2017-10-29 10:28:26.477226','2017-10-29 10:28:26.477300',1,117),(118,'9780262033848','CNY',0.99,NULL,NULL,49,NULL,NULL,'2017-10-29 10:28:26.543357','2017-10-29 10:28:26.543433',1,118),(119,'9780976694007','CNY',8.99,NULL,NULL,18,NULL,NULL,'2017-10-29 10:28:26.609270','2017-10-29 10:28:26.609346',1,119),(120,'9780131495050','CNY',2.99,NULL,NULL,30,NULL,NULL,'2017-10-29 10:28:26.675153','2017-10-29 10:28:26.675228',1,120),(121,'9780135974445','CNY',2.99,NULL,NULL,40,NULL,NULL,'2017-10-29 10:28:26.741200','2017-10-29 10:28:26.741276',1,121),(122,'9780596101053','CNY',11.99,NULL,NULL,84,NULL,NULL,'2017-10-29 10:28:26.806715','2017-10-29 10:28:26.806791',1,122),(123,'9780201433074','CNY',3.99,NULL,NULL,29,NULL,NULL,'2017-10-29 10:28:26.876555','2017-10-29 10:28:26.876638',1,123),(124,'9780534950972','CNY',26.99,NULL,NULL,7,NULL,NULL,'2017-10-29 10:28:26.944095','2017-10-29 10:28:26.944171',1,124),(125,'9781590593899','CNY',20.99,NULL,NULL,44,NULL,NULL,'2017-10-29 10:28:27.008480','2017-10-29 10:28:27.008558',1,125),(126,'9780205313426','CNY',23.99,NULL,NULL,80,NULL,NULL,'2017-10-29 10:28:27.072107','2017-10-29 10:28:27.072184',1,126),(127,'9781934356371','CNY',19.99,NULL,NULL,93,NULL,NULL,'2017-10-29 10:28:27.138097','2017-10-29 10:28:27.138171',1,127),(128,'9780136291558','CNY',11.99,NULL,NULL,9,NULL,NULL,'2017-10-29 10:28:27.202674','2017-10-29 10:28:27.202765',1,128),(129,'9780201889543','CNY',6.99,NULL,NULL,14,NULL,NULL,'2017-10-29 10:28:27.269603','2017-10-29 10:28:27.269721',1,129),(130,'9780201342758','CNY',8.99,NULL,NULL,57,NULL,NULL,'2017-10-29 10:28:27.338015','2017-10-29 10:28:27.338092',1,130),(131,'9780596529864','CNY',9.99,NULL,NULL,58,NULL,NULL,'2017-10-29 10:28:27.403970','2017-10-29 10:28:27.404045',1,131),(132,'9780672328794','CNY',14.99,NULL,NULL,7,NULL,NULL,'2017-10-29 10:28:27.472267','2017-10-29 10:28:27.472343',1,132),(133,'9780672326721','CNY',6.99,NULL,NULL,41,NULL,NULL,'2017-10-29 10:28:27.537648','2017-10-29 10:28:27.537724',1,133),(134,'9780672323492','CNY',26.99,NULL,NULL,54,NULL,NULL,'2017-10-29 10:28:27.602495','2017-10-29 10:28:27.602571',1,134),(135,'9780201703535','CNY',0.99,NULL,NULL,2,NULL,NULL,'2017-10-29 10:28:27.668786','2017-10-29 10:28:27.668862',1,135),(136,'9780130810816','CNY',4.99,NULL,NULL,39,NULL,NULL,'2017-10-29 10:28:27.736856','2017-10-29 10:28:27.736944',1,136),(137,'9780961392147','CNY',13.99,NULL,NULL,85,NULL,NULL,'2017-10-29 10:28:27.802972','2017-10-29 10:28:27.803048',1,137),(138,'9780767907699','CNY',7.99,NULL,NULL,5,NULL,NULL,'2017-10-29 10:28:27.873223','2017-10-29 10:28:27.873301',1,138),(139,'9780137081073','CNY',28.99,NULL,NULL,66,NULL,NULL,'2017-10-29 10:28:27.938753','2017-10-29 10:28:27.938828',1,139),(140,'9780978739218','CNY',27.99,NULL,NULL,90,NULL,NULL,'2017-10-29 10:28:28.005417','2017-10-29 10:28:28.005493',1,140),(141,'9780471578147','CNY',14.99,NULL,NULL,81,NULL,NULL,'2017-10-29 10:28:28.070121','2017-10-29 10:28:28.070198',1,141),(142,'9781934356852','CNY',0.99,NULL,NULL,42,NULL,NULL,'2017-10-29 10:28:28.137258','2017-10-29 10:28:28.137336',1,142),(143,'9780557030798','CNY',15.99,NULL,NULL,84,NULL,NULL,'2017-10-29 10:28:28.202560','2017-10-29 10:28:28.202633',1,143),(144,'9780764543654','CNY',21.99,NULL,NULL,19,NULL,NULL,'2017-10-29 10:28:28.268149','2017-10-29 10:28:28.268225',1,144),(145,'9781848000698','CNY',5.99,NULL,NULL,73,NULL,NULL,'2017-10-29 10:28:28.333876','2017-10-29 10:28:28.333954',1,145),(146,'9781934356586','CNY',9.99,NULL,NULL,65,NULL,NULL,'2017-10-29 10:28:28.398459','2017-10-29 10:28:28.398536',1,146),(147,'9780262062794','CNY',14.99,NULL,NULL,97,NULL,NULL,'2017-10-29 10:28:28.464532','2017-10-29 10:28:28.464608',1,147),(148,'9780672327933','CNY',2.99,NULL,NULL,64,NULL,NULL,'2017-10-29 10:28:28.531704','2017-10-29 10:28:28.531790',1,148),(149,'9780133262247','CNY',4.99,NULL,NULL,40,NULL,NULL,'2017-10-29 10:28:28.598805','2017-10-29 10:28:28.598883',1,149),(150,'9780201379235','CNY',6.99,NULL,NULL,51,NULL,NULL,'2017-10-29 10:28:28.664435','2017-10-29 10:28:28.664510',1,150),(151,'9780955683619','CNY',20.99,NULL,NULL,77,NULL,NULL,'2017-10-29 10:28:28.730721','2017-10-29 10:28:28.730797',1,151),(152,'9780321437389','CNY',0.99,NULL,NULL,9,NULL,NULL,'2017-10-29 10:28:28.796574','2017-10-29 10:28:28.796653',1,152),(153,'9781934356296','CNY',26.99,NULL,NULL,33,NULL,NULL,'2017-10-29 10:28:28.895081','2017-10-29 10:28:28.895157',1,153),(154,'9780201741575','CNY',20.99,NULL,NULL,95,NULL,NULL,'2017-10-29 10:28:28.961185','2017-10-29 10:28:28.961268',1,154),(155,'9781430322641','CNY',13.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:29.027104','2017-10-29 10:28:29.027178',1,155),(156,'9780321278654','CNY',6.99,NULL,NULL,62,NULL,NULL,'2017-10-29 10:28:29.095443','2017-10-29 10:28:29.095520',1,156),(157,'9780977616640','CNY',9.99,NULL,NULL,1,NULL,NULL,'2017-10-29 10:28:29.168675','2017-10-29 10:28:29.168759',1,157),(158,'9781591840565','CNY',10.99,NULL,NULL,43,NULL,NULL,'2017-10-29 10:28:29.235283','2017-10-29 10:28:29.235368',1,158),(159,'9780884271789','CNY',3.99,NULL,NULL,5,NULL,NULL,'2017-10-29 10:28:29.302242','2017-10-29 10:28:29.302332',1,159),(160,'9780262111898','CNY',24.99,NULL,NULL,81,NULL,NULL,'2017-10-29 10:28:29.368939','2017-10-29 10:28:29.369020',1,160),(161,'9780976458708','CNY',11.99,NULL,NULL,35,NULL,NULL,'2017-10-29 10:28:29.439453','2017-10-29 10:28:29.439541',1,161),(162,'9780596809485','CNY',3.99,NULL,NULL,84,NULL,NULL,'2017-10-29 10:28:29.506525','2017-10-29 10:28:29.506614',1,162),(163,'9781617290084','CNY',0.99,NULL,NULL,23,NULL,NULL,'2017-10-29 10:28:29.571379','2017-10-29 10:28:29.571462',1,163),(164,'9780321213358','CNY',28.99,NULL,NULL,6,NULL,NULL,'2017-10-29 10:28:29.637364','2017-10-29 10:28:29.637447',1,164),(165,'9780201733860','CNY',11.99,NULL,NULL,63,NULL,NULL,'2017-10-29 10:28:29.703526','2017-10-29 10:28:29.703616',1,165),(166,'9780557043552','CNY',1.99,NULL,NULL,30,NULL,NULL,'2017-10-29 10:28:29.769867','2017-10-29 10:28:29.769947',1,166),(167,'9780596009205','CNY',15.99,NULL,NULL,86,NULL,NULL,'2017-10-29 10:28:29.847287','2017-10-29 10:28:29.847416',1,167),(168,'9780131774292','CNY',2.99,NULL,NULL,45,NULL,NULL,'2017-10-29 10:28:29.926807','2017-10-29 10:28:29.926877',1,168),(169,'9780316037709','CNY',10.99,NULL,NULL,56,NULL,NULL,'2017-10-29 10:28:30.080654','2017-10-29 10:28:30.080724',1,169),(170,'9780471782667','CNY',24.99,NULL,NULL,57,NULL,NULL,'2017-10-29 10:28:30.147296','2017-10-29 10:28:30.147375',1,170),(171,'9781593270070','CNY',9.99,NULL,NULL,90,NULL,NULL,'2017-10-29 10:28:30.216188','2017-10-29 10:28:30.216258',1,171),(172,'9780553563702','CNY',28.99,NULL,NULL,35,NULL,NULL,'2017-10-29 10:28:30.282510','2017-10-29 10:28:30.282582',1,172),(173,'9780141000510','CNY',16.99,NULL,NULL,45,NULL,NULL,'2017-10-29 10:28:30.348616','2017-10-29 10:28:30.348686',1,173),(174,'9780596006624','CNY',9.99,NULL,NULL,0,NULL,NULL,'2017-10-29 10:28:30.416055','2017-10-29 10:28:30.416132',1,174),(175,'9780307588685','CNY',27.99,NULL,NULL,83,NULL,NULL,'2017-10-29 10:28:30.482655','2017-10-29 10:28:30.482727',1,175),(176,'9780764542800','CNY',17.99,NULL,NULL,6,NULL,NULL,'2017-10-29 10:28:30.551415','2017-10-29 10:28:30.551496',1,176),(177,'9780072260816','CNY',2.99,NULL,NULL,92,NULL,NULL,'2017-10-29 10:28:30.625259','2017-10-29 10:28:30.625340',1,177),(178,'9780060926946','CNY',27.99,NULL,NULL,18,NULL,NULL,'2017-10-29 10:28:30.693672','2017-10-29 10:28:30.693745',1,178),(179,'9780596001087','CNY',10.99,NULL,NULL,12,NULL,NULL,'2017-10-29 10:28:30.760964','2017-10-29 10:28:30.761037',1,179),(180,'9780470639535','CNY',9.99,NULL,NULL,55,NULL,NULL,'2017-10-29 10:28:30.914496','2017-10-29 10:28:30.914570',1,180),(181,'9780316213547','CNY',27.99,NULL,NULL,47,NULL,NULL,'2017-10-29 10:28:30.983304','2017-10-29 10:28:30.983373',1,181),(182,'9781593272883','CNY',18.99,NULL,NULL,22,NULL,NULL,'2017-10-29 10:28:31.051019','2017-10-29 10:28:31.051092',1,182),(183,'9780307269751','CNY',24.99,NULL,NULL,7,NULL,NULL,'2017-10-29 10:28:31.119378','2017-10-29 10:28:31.119450',1,183),(184,'9781591843573','CNY',6.99,NULL,NULL,3,NULL,NULL,'2017-10-29 10:28:31.185999','2017-10-29 10:28:31.186068',1,184),(185,'9781593270469','CNY',4.99,NULL,NULL,54,NULL,NULL,'2017-10-29 10:28:31.253612','2017-10-29 10:28:31.253685',1,185),(186,'9781931836364','CNY',0.99,NULL,NULL,19,NULL,NULL,'2017-10-29 10:28:31.322359','2017-10-29 10:28:31.322431',1,186),(187,'9780201914658','CNY',13.99,NULL,NULL,83,NULL,NULL,'2017-10-29 10:28:31.388916','2017-10-29 10:28:31.388986',1,187),(188,'9780307269997','CNY',15.99,NULL,NULL,55,NULL,NULL,'2017-10-29 10:28:31.531617','2017-10-29 10:28:31.531687',1,188),(189,'9780471128458','CNY',3.99,NULL,NULL,73,NULL,NULL,'2017-10-29 10:28:31.599542','2017-10-29 10:28:31.599615',1,189),(190,'9780684818627','CNY',22.99,NULL,NULL,36,NULL,NULL,'2017-10-29 10:28:31.667123','2017-10-29 10:28:31.667196',1,190),(191,'9780764574818','CNY',3.99,NULL,NULL,56,NULL,NULL,'2017-10-29 10:28:31.733307','2017-10-29 10:28:31.733378',1,191),(192,'9780307269980','CNY',12.99,NULL,NULL,81,NULL,NULL,'2017-10-29 10:28:31.805493','2017-10-29 10:28:31.805572',1,192),(193,'9780072257090','CNY',12.99,NULL,NULL,94,NULL,NULL,'2017-10-29 10:28:31.878409','2017-10-29 10:28:31.878482',1,193),(194,'9780131481046','CNY',15.99,NULL,NULL,7,NULL,NULL,'2017-10-29 10:28:31.944689','2017-10-29 10:28:31.944767',1,194),(195,'9780970978813','CNY',24.99,NULL,NULL,94,NULL,NULL,'2017-10-29 10:28:32.010740','2017-10-29 10:28:32.010820',1,195),(196,'9781430219484','CNY',19.99,NULL,NULL,86,NULL,NULL,'2017-10-29 10:28:32.076127','2017-10-29 10:28:32.076213',1,196),(197,'9780072262582','CNY',23.99,NULL,NULL,97,NULL,NULL,'2017-10-29 10:28:32.140843','2017-10-29 10:28:32.140920',1,197),(198,'9780764544682','CNY',9.99,NULL,NULL,42,NULL,NULL,'2017-10-29 10:28:32.205995','2017-10-29 10:28:32.206071',1,198),(199,'GZTHHILTON-06606','CNY',6.00,6.00,3.00,1,0,NULL,'2017-11-01 16:20:55.907216','2017-11-29 17:09:00.048970',4,199),(203,'GZTHHILTON-12606','CNY',6.00,6.00,3.00,1,NULL,NULL,'2017-11-19 12:04:29.962639','2017-11-19 12:04:29.962722',4,199),(204,'GZTH4SEASON-S06606','CNY',6.00,6.00,3.00,1,NULL,NULL,'2017-11-19 12:06:06.364337','2017-11-19 12:06:06.364428',4,199);
/*!40000 ALTER TABLE `partner_stockrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_bankcard`
--

DROP TABLE IF EXISTS `payment_bankcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_bankcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(32) NOT NULL,
  `expiry_date` date NOT NULL,
  `partner_reference` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_bankcard_user_id_08e1d04c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `payment_bankcard_user_id_08e1d04c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_bankcard`
--

LOCK TABLES `payment_bankcard` WRITE;
/*!40000 ALTER TABLE `payment_bankcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_bankcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_source`
--

DROP TABLE IF EXISTS `payment_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(12) NOT NULL,
  `amount_allocated` decimal(12,2) NOT NULL,
  `amount_debited` decimal(12,2) NOT NULL,
  `amount_refunded` decimal(12,2) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `label` varchar(128) NOT NULL,
  `order_id` int(11) NOT NULL,
  `source_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_source_order_id_6b7f2215_fk_order_order_id` (`order_id`),
  KEY `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` (`source_type_id`),
  CONSTRAINT `payment_source_order_id_6b7f2215_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `payment_source_source_type_id_700828fe_fk_payment_sourcetype_id` FOREIGN KEY (`source_type_id`) REFERENCES `payment_sourcetype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_source`
--

LOCK TABLES `payment_source` WRITE;
/*!40000 ALTER TABLE `payment_source` DISABLE KEYS */;
INSERT INTO `payment_source` VALUES (6,'CNY',6.00,6.00,0.00,'2017112507254732','',11,3),(7,'CNY',6.00,6.00,0.00,'2017112717072435','',14,3),(8,'CNY',6.00,6.00,0.00,'2017112717164936','',15,3),(9,'CNY',6.00,6.00,0.00,'2017112717260590','',16,3),(10,'CNY',6.00,6.00,0.00,'2017112717394991','',17,3),(11,'CNY',6.00,6.00,0.00,'2017112813433792','',18,3),(12,'CNY',6.00,6.00,0.00,'2017112813550693','',19,3),(13,'CNY',6.00,6.00,0.00,'2017112815162894','',20,3),(14,'CNY',6.00,6.00,0.00,'2017112815213095','',21,3),(15,'CNY',6.00,6.00,0.00,'2017112815273196','',22,3),(16,'CNY',6.00,6.00,0.00,'2017112815313197','',23,3),(17,'CNY',6.00,6.00,0.00,'2017112815364998','',24,3),(18,'CNY',6.00,6.00,0.00,'2017112815420799','',25,3),(19,'CNY',6.00,6.00,0.00,'20171128154902100','',26,3),(20,'CNY',6.00,6.00,0.00,'20171128155706101','',27,3),(21,'CNY',6.00,6.00,0.00,'20171128165653102','',28,3),(22,'CNY',6.00,6.00,0.00,'20171129170058103','',29,3),(23,'CNY',6.00,6.00,0.00,'20171129170527105','',30,3);
/*!40000 ALTER TABLE `payment_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_sourcetype`
--

DROP TABLE IF EXISTS `payment_sourcetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_sourcetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_sourcetype`
--

LOCK TABLES `payment_sourcetype` WRITE;
/*!40000 ALTER TABLE `payment_sourcetype` DISABLE KEYS */;
INSERT INTO `payment_sourcetype` VALUES (1,'WX','wx'),(2,'ALI','ali'),(3,'TEST','test');
/*!40000 ALTER TABLE `payment_sourcetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_type` varchar(128) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_transaction_source_id_c5ac31e8_fk_payment_source_id` (`source_id`),
  CONSTRAINT `payment_transaction_source_id_c5ac31e8_fk_payment_source_id` FOREIGN KEY (`source_id`) REFERENCES `payment_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
INSERT INTO `payment_transaction` VALUES (2,'Authorise',6.00,'2017112507254732','','2017-11-26 16:40:38.342594',6),(3,'Authorise',6.00,'2017112717072435','','2017-11-27 17:07:27.154954',7),(4,'Authorise',6.00,'2017112717164936','','2017-11-27 17:16:51.700430',8),(5,'Authorise',6.00,'2017112717260590','','2017-11-27 17:26:08.489835',9),(6,'Authorise',6.00,'2017112717394991','','2017-11-27 17:39:52.039445',10),(7,'Authorise',6.00,'2017112813433792','','2017-11-28 13:43:39.389789',11),(8,'Authorise',6.00,'2017112813550693','','2017-11-28 13:55:08.837439',12),(9,'Authorise',6.00,'2017112815162894','','2017-11-28 15:16:30.827391',13),(10,'Authorise',6.00,'2017112815213095','','2017-11-28 15:21:32.273663',14),(11,'Authorise',6.00,'2017112815273196','','2017-11-28 15:27:33.705118',15),(12,'Authorise',6.00,'2017112815313197','','2017-11-28 15:31:32.979606',16),(13,'Authorise',6.00,'2017112815364998','','2017-11-28 15:36:51.626520',17),(14,'Authorise',6.00,'2017112815420799','','2017-11-28 15:42:09.376308',18),(15,'Authorise',6.00,'20171128154902100','','2017-11-28 15:49:04.526401',19),(16,'Authorise',6.00,'20171128155706101','','2017-11-28 15:57:08.848682',20),(17,'Authorise',6.00,'20171128165653102','','2017-11-28 16:56:55.672297',21),(18,'Authorise',6.00,'20171129170058103','','2017-11-29 17:01:01.514518',22),(19,'Authorise',6.00,'20171129170527105','','2017-11-29 17:05:29.984114',23);
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_automaticproductlist`
--

DROP TABLE IF EXISTS `promotions_automaticproductlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_automaticproductlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `link_text` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `method` varchar(128) NOT NULL,
  `num_products` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_automaticproductlist`
--

LOCK TABLES `promotions_automaticproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_automaticproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_automaticproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_handpickedproductlist`
--

DROP TABLE IF EXISTS `promotions_handpickedproductlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_handpickedproductlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `link_text` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_handpickedproductlist`
--

LOCK TABLES `promotions_handpickedproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_handpickedproductlist` DISABLE KEYS */;
INSERT INTO `promotions_handpickedproductlist` VALUES (1,'Other good books','Commodo sed artisan before they sold out veniam aute sint you probably haven\'t heard of them pour-over, +1 delectus street art direct trade. Enim craft beer odd future single-origin coffee gluten-free artisan, salvia consectetur master cleanse vegan eiusmod carles. Yr proident ennui VHS, art party direct trade veniam est try-hard voluptate. Authentic irure aliqua, pariatur ad whatever sunt banjo esse letterpress plaid bicycle rights mollit quinoa you probably haven\'t heard of them. Farm-to-table keytar duis, craft beer carles lomo est accusamus single-origin coffee. Swag twee magna, literally meh cred cray. Aute deserunt ullamco, you probably haven\'t heard of them nisi synth DIY food truck.<br><br>','','','2013-01-08 17:19:57.759000');
/*!40000 ALTER TABLE `promotions_handpickedproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_image`
--

DROP TABLE IF EXISTS `promotions_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_image`
--

LOCK TABLES `promotions_image` WRITE;
/*!40000 ALTER TABLE `promotions_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_keywordpromotion`
--

DROP TABLE IF EXISTS `promotions_keywordpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_keywordpromotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `filter` varchar(200) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_keywordpr_content_type_id_91959aa4_fk_django_co` (`content_type_id`),
  CONSTRAINT `promotions_keywordpr_content_type_id_91959aa4_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_keywordpromotion`
--

LOCK TABLES `promotions_keywordpromotion` WRITE;
/*!40000 ALTER TABLE `promotions_keywordpromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_keywordpromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_multiimage`
--

DROP TABLE IF EXISTS `promotions_multiimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_multiimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_multiimage`
--

LOCK TABLES `promotions_multiimage` WRITE;
/*!40000 ALTER TABLE `promotions_multiimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_multiimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_multiimage_images`
--

DROP TABLE IF EXISTS `promotions_multiimage_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_multiimage_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `multiimage_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotions_multiimage_im_multiimage_id_image_id_29363bca_uniq` (`multiimage_id`,`image_id`),
  KEY `promotions_multiimag_image_id_bb6eca34_fk_promotion` (`image_id`),
  CONSTRAINT `promotions_multiimag_image_id_bb6eca34_fk_promotion` FOREIGN KEY (`image_id`) REFERENCES `promotions_image` (`id`),
  CONSTRAINT `promotions_multiimag_multiimage_id_62ed9a9f_fk_promotion` FOREIGN KEY (`multiimage_id`) REFERENCES `promotions_multiimage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_multiimage_images`
--

LOCK TABLES `promotions_multiimage_images` WRITE;
/*!40000 ALTER TABLE `promotions_multiimage_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_multiimage_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_orderedproduct`
--

DROP TABLE IF EXISTS `promotions_orderedproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_orderedproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_order` int(10) unsigned NOT NULL,
  `list_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promotions_orderedproduct_list_id_product_id_1e22874a_uniq` (`list_id`,`product_id`),
  KEY `promotions_orderedpr_product_id_94dede36_fk_catalogue` (`product_id`),
  CONSTRAINT `promotions_orderedpr_list_id_94f390b0_fk_promotion` FOREIGN KEY (`list_id`) REFERENCES `promotions_handpickedproductlist` (`id`),
  CONSTRAINT `promotions_orderedpr_product_id_94dede36_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_orderedproduct`
--

LOCK TABLES `promotions_orderedproduct` WRITE;
/*!40000 ALTER TABLE `promotions_orderedproduct` DISABLE KEYS */;
INSERT INTO `promotions_orderedproduct` VALUES (1,0,1,25),(2,0,1,51),(3,0,1,95),(4,0,1,13);
/*!40000 ALTER TABLE `promotions_orderedproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_orderedproductlist`
--

DROP TABLE IF EXISTS `promotions_orderedproductlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_orderedproductlist` (
  `handpickedproductlist_ptr_id` int(11) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `tabbed_block_id` int(11) NOT NULL,
  PRIMARY KEY (`handpickedproductlist_ptr_id`),
  KEY `promotions_orderedpr_tabbed_block_id_a018e8d5_fk_promotion` (`tabbed_block_id`),
  CONSTRAINT `promotions_orderedpr_handpickedproductlis_107cf763_fk_promotion` FOREIGN KEY (`handpickedproductlist_ptr_id`) REFERENCES `promotions_handpickedproductlist` (`id`),
  CONSTRAINT `promotions_orderedpr_tabbed_block_id_a018e8d5_fk_promotion` FOREIGN KEY (`tabbed_block_id`) REFERENCES `promotions_tabbedblock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_orderedproductlist`
--

LOCK TABLES `promotions_orderedproductlist` WRITE;
/*!40000 ALTER TABLE `promotions_orderedproductlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_orderedproductlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_pagepromotion`
--

DROP TABLE IF EXISTS `promotions_pagepromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_pagepromotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `position` varchar(100) NOT NULL,
  `display_order` int(10) unsigned NOT NULL,
  `clicks` int(10) unsigned NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `page_url` varchar(128) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_pagepromo_content_type_id_00707bff_fk_django_co` (`content_type_id`),
  KEY `promotions_pagepromotion_page_url_eee0cc4e` (`page_url`),
  CONSTRAINT `promotions_pagepromo_content_type_id_00707bff_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_pagepromotion`
--

LOCK TABLES `promotions_pagepromotion` WRITE;
/*!40000 ALTER TABLE `promotions_pagepromotion` DISABLE KEYS */;
INSERT INTO `promotions_pagepromotion` VALUES (4,1,'page',0,0,'2014-05-06 10:31:06.444000','/en-gb/',88),(5,1,'page',0,0,'2014-05-06 10:31:23.577000','/en-gb/',89),(6,1,'page',0,0,'2014-05-06 10:31:55.034000','/en-gb/',81);
/*!40000 ALTER TABLE `promotions_pagepromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_rawhtml`
--

DROP TABLE IF EXISTS `promotions_rawhtml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_rawhtml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `display_type` varchar(128) NOT NULL,
  `body` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_rawhtml`
--

LOCK TABLES `promotions_rawhtml` WRITE;
/*!40000 ALTER TABLE `promotions_rawhtml` DISABLE KEYS */;
INSERT INTO `promotions_rawhtml` VALUES (1,'Welcome!','','Welcome to Oscar\'s sandbox site.&nbsp; This is a example install of Oscar, making very few customisations to the core.&nbsp; It is intended as a playground for experimenting with Oscar\'s features.<br><br>You can get access to the dashboard <a href=\"http://latest.oscarcommerce.com/gateway/\" rel=\"nofollow\">using this form</a>.','2013-01-08 17:12:09.526000');
/*!40000 ALTER TABLE `promotions_rawhtml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_singleproduct`
--

DROP TABLE IF EXISTS `promotions_singleproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_singleproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_singlepro_product_id_d7ad5e03_fk_catalogue` (`product_id`),
  CONSTRAINT `promotions_singlepro_product_id_d7ad5e03_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_singleproduct`
--

LOCK TABLES `promotions_singleproduct` WRITE;
/*!40000 ALTER TABLE `promotions_singleproduct` DISABLE KEYS */;
INSERT INTO `promotions_singleproduct` VALUES (1,'Recommended reading','Commodo sed artisan before they sold out veniam aute sint you probably haven\'t heard of them pour-over, +1 delectus street art direct trade. Enim craft beer odd future single-origin coffee gluten-free artisan, salvia consectetur master cleanse vegan eiusmod carles. Yr proident ennui VHS, art party direct trade veniam est try-hard voluptate. Authentic irure aliqua, pariatur ad whatever sunt banjo esse letterpress plaid bicycle rights mollit quinoa you probably haven\'t heard of them. Farm-to-table keytar duis, craft beer carles lomo est accusamus single-origin coffee. Swag twee magna, literally meh cred cray. Aute deserunt ullamco, you probably haven\'t heard of them nisi synth DIY food truck.<br>','2013-01-08 17:14:56.664000',89);
/*!40000 ALTER TABLE `promotions_singleproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions_tabbedblock`
--

DROP TABLE IF EXISTS `promotions_tabbedblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions_tabbedblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions_tabbedblock`
--

LOCK TABLES `promotions_tabbedblock` WRITE;
/*!40000 ALTER TABLE `promotions_tabbedblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions_tabbedblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_productreview`
--

DROP TABLE IF EXISTS `reviews_productreview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_productreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `homepage` varchar(200) NOT NULL,
  `status` smallint(6) NOT NULL,
  `total_votes` int(11) NOT NULL,
  `delta_votes` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_productreview_product_id_user_id_c4fdc4cd_uniq` (`product_id`,`user_id`),
  KEY `reviews_productreview_user_id_8acb5ddd_fk_auth_user_id` (`user_id`),
  KEY `reviews_productreview_delta_votes_bd8ffc87` (`delta_votes`),
  CONSTRAINT `reviews_productrevie_product_id_52e52a32_fk_catalogue` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `reviews_productreview_user_id_8acb5ddd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_productreview`
--

LOCK TABLES `reviews_productreview` WRITE;
/*!40000 ALTER TABLE `reviews_productreview` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_productreview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_vote`
--

DROP TABLE IF EXISTS `reviews_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delta` smallint(6) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_vote_user_id_review_id_bb858939_uniq` (`user_id`,`review_id`),
  KEY `reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id` (`review_id`),
  CONSTRAINT `reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id` FOREIGN KEY (`review_id`) REFERENCES `reviews_productreview` (`id`),
  CONSTRAINT `reviews_vote_user_id_5fb87b53_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_vote`
--

LOCK TABLES `reviews_vote` WRITE;
/*!40000 ALTER TABLE `reviews_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges`
--

DROP TABLE IF EXISTS `shipping_orderanditemcharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `price_per_order` decimal(12,2) NOT NULL,
  `price_per_item` decimal(12,2) NOT NULL,
  `free_shipping_threshold` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges`
--

LOCK TABLES `shipping_orderanditemcharges` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_orderanditemcharges_countries`
--

DROP TABLE IF EXISTS `shipping_orderanditemcharges_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_orderanditemcharges_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderanditemcharges_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_orderanditemcha_orderanditemcharges_id_c_9f0c9c8f_uniq` (`orderanditemcharges_id`,`country_id`),
  KEY `shipping_orderandite_country_id_30387f2e_fk_address_c` (`country_id`),
  CONSTRAINT `shipping_orderandite_country_id_30387f2e_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_orderandite_orderanditemcharges__bf5bfee9_fk_shipping_` FOREIGN KEY (`orderanditemcharges_id`) REFERENCES `shipping_orderanditemcharges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_orderanditemcharges_countries`
--

LOCK TABLES `shipping_orderanditemcharges_countries` WRITE;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_orderanditemcharges_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightband`
--

DROP TABLE IF EXISTS `shipping_weightband`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightband` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upper_limit` decimal(12,3) NOT NULL,
  `charge` decimal(12,2) NOT NULL,
  `method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_weightband_method_id_b699a1ba_fk_shipping_` (`method_id`),
  CONSTRAINT `shipping_weightband_method_id_b699a1ba_fk_shipping_` FOREIGN KEY (`method_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightband`
--

LOCK TABLES `shipping_weightband` WRITE;
/*!40000 ALTER TABLE `shipping_weightband` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightband` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased`
--

DROP TABLE IF EXISTS `shipping_weightbased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext NOT NULL,
  `default_weight` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased`
--

LOCK TABLES `shipping_weightbased` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_weightbased_countries`
--

DROP TABLE IF EXISTS `shipping_weightbased_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_weightbased_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weightbased_id` int(11) NOT NULL,
  `country_id` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shipping_weightbased_cou_weightbased_id_country_i_de8c5e42_uniq` (`weightbased_id`,`country_id`),
  KEY `shipping_weightbased_country_id_06117384_fk_address_c` (`country_id`),
  CONSTRAINT `shipping_weightbased_country_id_06117384_fk_address_c` FOREIGN KEY (`country_id`) REFERENCES `address_country` (`iso_3166_1_a2`),
  CONSTRAINT `shipping_weightbased_weightbased_id_93e3132f_fk_shipping_` FOREIGN KEY (`weightbased_id`) REFERENCES `shipping_weightbased` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_weightbased_countries`
--

LOCK TABLES `shipping_weightbased_countries` WRITE;
/*!40000 ALTER TABLE `shipping_weightbased_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_weightbased_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thumbnail_kvstore`
--

DROP TABLE IF EXISTS `thumbnail_kvstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thumbnail_kvstore` (
  `key` varchar(200) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thumbnail_kvstore`
--

LOCK TABLES `thumbnail_kvstore` WRITE;
/*!40000 ALTER TABLE `thumbnail_kvstore` DISABLE KEYS */;
INSERT INTO `thumbnail_kvstore` VALUES ('oscar-sandbox||image||01bb2dd5929483d5aa229a22980217bb','{\"name\": \"images/products/2017/10/9780955683619.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [266, 400]}'),('oscar-sandbox||image||03970c6e31354531b3c88bd75eae63d2','{\"name\": \"images/products/2017/10/9780553382563.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||0ab581be68c56a7f25a3b3bdb50c3bbd','{\"name\": \"cache/e3/61/e3613b002d691957473b5ec1ab3f829c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [125, 155]}'),('oscar-sandbox||image||0b9fcb0623dbd6195a9dc60c00f8ab11','{\"name\": \"cache/2b/ec/2bec204764ca34aa5442962342c693de.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 155]}'),('oscar-sandbox||image||0c5e6989e99666a0442ddf350878dc0c','{\"name\": \"images/products/2017/10/9780201733860.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [317, 400]}'),('oscar-sandbox||image||10c4638114f7322033145f8c9eb2ffc9','{\"name\": \"cache/44/58/4458a4550bf068364789fa0546076479.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [129, 155]}'),('oscar-sandbox||image||123d147a64db42659038ca2904109dec','{\"name\": \"cache/df/3d/df3d8e0890311e9b5bddce6e74bb80f6.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [123, 155]}'),('oscar-sandbox||image||125fea248464979b51863a5dca2600be','{\"name\": \"images/products/2017/10/9780201914658.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [256, 400]}'),('oscar-sandbox||image||12644edec41ffe2980ad2122363cfee0','{\"name\": \"images/products/2017/10/9780525951575.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [265, 400]}'),('oscar-sandbox||image||139345ba5b0e15e9458f0a1a34278019','{\"name\": \"cache/55/ce/55cee5c65a79c8dbf157a89434ae681b.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [75, 100]}'),('oscar-sandbox||image||15335b6d40aab5ab0cde0024ceb5b3c7','{\"name\": \"cache/27/6e/276ecd25204714b43e25dac33e5bef33.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||16c2b894302bd80d67c311eb90748c9e','{\"name\": \"cache/2e/db/2edb6a67d57f7b23e9b42725f77908f7.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [119, 155]}'),('oscar-sandbox||image||174ac8a598c04f6d403448f6371ed203','{\"name\": \"images/products/2017/10/9780307887436.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [264, 400]}'),('oscar-sandbox||image||17fe797082c5c487468972bf7154d775','{\"name\": \"images/products/2017/10/9780141000510.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [260, 400]}'),('oscar-sandbox||image||1954b1c3e10ac51c43786cc7b19a33bc','{\"name\": \"images/products/2017/10/9780764542800.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [266, 400]}'),('oscar-sandbox||image||1dc095fdc075c8daa7fb6a101e5f73e1','{\"name\": \"images/products/2017/10/9780672327933.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [307, 400]}'),('oscar-sandbox||image||1f2c687da446f08c730f24373ec3bf0d','{\"name\": \"cache/e9/b7/e9b754286bfe7a05f643486489c1517c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [155, 155]}'),('oscar-sandbox||image||1ffd298855758487c36fda752e3df595','{\"name\": \"cache/76/75/7675aca030491af4801a88babbb282ed.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [126, 155]}'),('oscar-sandbox||image||212d0cee1080f929dd46f7bcb9952907','{\"name\": \"cache/2b/d9/2bd9118559c22e648f4bce9c05d8daaf.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 154]}'),('oscar-sandbox||image||2277e12665b0d9efd4c94e2e297c2a95','{\"name\": \"cache/c4/c8/c4c8b001a2b27971c3370a0166f86e53.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [343, 400]}'),('oscar-sandbox||image||24f47523c04034b93f49ba985fa7be68','{\"name\": \"cache/fb/32/fb326282df70f3b91c9ff78a0ae32509.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [111, 155]}'),('oscar-sandbox||image||27c8b81848342e509b888161f1fcebda','{\"name\": \"cache/37/05/3705a360c0b59afb0be5a03c9aa7c7ce.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [117, 154]}'),('oscar-sandbox||image||28388906768df7998aaafe558e5627fa','{\"name\": \"images/products/2017/10/9780764544682.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [324, 400]}'),('oscar-sandbox||image||297600d56a55daa16109b68ce6b8f0f6','{\"name\": \"images/products/2017/10/9780131774292.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [328, 400]}'),('oscar-sandbox||image||30de4c390cb3ad3c67d6f573d3acab53','{\"name\": \"cache/18/12/181245e67cdb6e74e2cea85c48680d01.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||333d9bc5d06398a67bb04eb910e0936c','{\"name\": \"image_not_found.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [400, 300]}'),('oscar-sandbox||image||3434370ed507d6bfbf25a39c78cdad05','{\"name\": \"images/products/2017/10/9781593270469.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [303, 400]}'),('oscar-sandbox||image||35671c5fca1b67fa04c26dd75d7ec3b3','{\"name\": \"cache/f3/19/f31996724379dd67b5892455ab596aae.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 100]}'),('oscar-sandbox||image||390d15c5aef623f3a4351584b2e4cf95','{\"name\": \"cache/53/17/53171da69048932a7f1fa9c93e37bf8d.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||3a14798b47f2ce9bed54012f949add64','{\"name\": \"images/products/2017/10/9780262111898.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [285, 400]}'),('oscar-sandbox||image||3a7bbe8716f9becdfe78eb9a15946b7f','{\"name\": \"cache/01/c4/01c465f1e64f18690c7c19dae7e76714.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [81, 100]}'),('oscar-sandbox||image||3fac0d199a7ba0d179d790a3d33f6da8','{\"name\": \"images/products/2017/10/9780596009205.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [346, 400]}'),('oscar-sandbox||image||40e9b6a01f1a89d0fa6d4acbcedb50cd','{\"name\": \"images/products/2017/10/9780557030798.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [305, 400]}'),('oscar-sandbox||image||4334c41a7116d0cc567cea1c7772ef8f','{\"name\": \"images/products/2017/10/9781617290084.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [320, 400]}'),('oscar-sandbox||image||44c6168c05847735e0bdc7b9c1a3aa65','{\"name\": \"cache/ee/c2/eec22afb152591872caa3fe9eb477a1c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [117, 155]}'),('oscar-sandbox||image||4a33d73b7c3b55ea72cd3049fffd7279','{\"name\": \"cache/6f/27/6f27416937986e6f7b952b22cb917d1e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [101, 155]}'),('oscar-sandbox||image||513eab1725e4ba6246dff01b7cf55347','{\"name\": \"images/products/2017/10/9781593272883.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [303, 400]}'),('oscar-sandbox||image||5287953d59582b96d1a322ab4b708fa5','{\"name\": \"cache/4c/eb/4ceb33961ad23168c857ef5bd8a939b0.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 155]}'),('oscar-sandbox||image||55c8822c477b3153bab697a083329494','{\"name\": \"images/products/2017/10/9780307269751.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [269, 400]}'),('oscar-sandbox||image||55e6ff90ce1df1849f01c05d25899c3c','{\"name\": \"cache/81/0d/810df30d3352649abeb3b3ea20845c1a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [107, 155]}'),('oscar-sandbox||image||55fa434912066cff681e4708ec5122e3','{\"name\": \"cache/81/21/812122fd5ab0549a8a52a7a8143658c3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [119, 155]}'),('oscar-sandbox||image||5a5f83cca73bf6d85320951da5440a27','{\"name\": \"cache/b0/67/b06774c2279b61a39408213adfcdea96.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||5c2f297596413287d6a062dbd620dd5f','{\"name\": \"cache/e1/69/e16986ff8aaace67653e5f6963386051.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 155]}'),('oscar-sandbox||image||5daffbd12c7d702079e3de40d9dae147','{\"name\": \"cache/cf/47/cf47e84df50795822627d0b5a54f21e7.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||5deb8f383a894c80c598f01999682a6f','{\"name\": \"cache/21/4b/214b3d7e297297c75c40759a039051a2.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [126, 155]}'),('oscar-sandbox||image||622905a1300b7e58e3b3eb72e172dd15','{\"name\": \"cache/6a/8f/6a8fe7e491ec4589ec022a1cf0abc0b2.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [104, 155]}'),('oscar-sandbox||image||63102154013ce74d7bf0c019d7536c98','{\"name\": \"cache/1c/c5/1cc583ed4288dacc9904088e39ac26ab.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [120, 155]}'),('oscar-sandbox||image||639e718b4afff99dc046f869904224f3','{\"name\": \"cache/cb/b3/cbb365ae7f8d639c870d3af4490d18c1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [119, 155]}'),('oscar-sandbox||image||63a8d4901af5e23665d145276ead5593','{\"name\": \"images/products/2017/11/whirlpool_swash.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [1500, 1500]}'),('oscar-sandbox||image||66c5bd371f5ffcf404eb54f12f9ca06a','{\"name\": \"cache/b5/94/b594e2beaa4b61b5ffe0a074c13b8fb3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [118, 155]}'),('oscar-sandbox||image||66c71657ddf42a88ee118b6a652c281d','{\"name\": \"cache/11/5b/115b02e91c479164fdc34d6aa411ffcd.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [99, 155]}'),('oscar-sandbox||image||69ea0c117d006c027c014ee4ac5ef6ec','{\"name\": \"images/products/2017/10/9780764574818.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [320, 400]}'),('oscar-sandbox||image||6a5995bd7cab85027910613cf412e586','{\"name\": \"cache/7d/da/7dda5f8e7a6313ce63465511be7c3bf5.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [301, 400]}'),('oscar-sandbox||image||6cf6acd7f7c66a6467a3e1393b95d3c9','{\"name\": \"cache/70/8c/708cccece4f534cb2a8ebabd1f67d0dd.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [127, 155]}'),('oscar-sandbox||image||6d4d7975a49c3ac32eaccdc640608b79','{\"name\": \"cache/7c/94/7c94de6f6cffe15b6de4c7efcb03dd6e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 155]}'),('oscar-sandbox||image||703902d69ceadbcc077fe481ec2060f4','{\"name\": \"cache/17/d5/17d59725435216b0e455fcb9659a84f3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [100, 75]}'),('oscar-sandbox||image||71a36f0b655bc09430596094e15d1ff7','{\"name\": \"cache/a3/f5/a3f52e6c24c650911a106e2dae388a5e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [76, 100]}'),('oscar-sandbox||image||72f93d4640ca2f2086bf878a11fde0a3','{\"name\": \"cache/6c/62/6c627d153668798bfcfd9ed1e63087cb.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [65, 55]}'),('oscar-sandbox||image||7af9f096a650c98a4d6475b19cacb43e','{\"name\": \"images/products/2017/10/9780072260816.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [314, 400]}'),('oscar-sandbox||image||7b0f9cebb55cf844246f70210ecf4e03','{\"name\": \"images/products/2017/10/9780316037709.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [258, 400]}'),('oscar-sandbox||image||7c0ca8dabf4bab5a6f05bcea972a6f3c','{\"name\": \"cache/fb/10/fb10bbf022cca020f34787b6d19779d3.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [129, 155]}'),('oscar-sandbox||image||7c54c59a2d02dfbd997fcf6f15de5824','{\"name\": \"cache/92/1b/921bb5469f8a489f5b728fa3540c0e58.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [105, 154]}'),('oscar-sandbox||image||7ca7d9dd0b993aa20fbfee928aa477b0','{\"name\": \"cache/aa/f0/aaf03cc13d22c2179577cb6cf8aabc99.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [65, 55]}'),('oscar-sandbox||image||7d665144ef050cdc876040395927c556','{\"name\": \"cache/1d/4d/1d4d943c01bf0eed4008fb989a17a124.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [110, 154]}'),('oscar-sandbox||image||8035dd6d36c8681275066a1dbf3dd650','{\"name\": \"images/products/2017/10/9780596001087.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [258, 400]}'),('oscar-sandbox||image||80e7cb943535cc7ec7029c602c1e52e8','{\"name\": \"cache/52/8e/528e58c4a800d0ba48075889441a8b76.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 154]}'),('oscar-sandbox||image||81d0e83a4b686238f722111251730ea8','{\"name\": \"cache/7c/1f/7c1fa40fc426dc44a900c8d4516f29e2.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [124, 155]}'),('oscar-sandbox||image||82575c67f152b727ebfb11e20032ea9d','{\"name\": \"images/products/2017/10/9780307269997.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [272, 400]}'),('oscar-sandbox||image||82d86649c337485d7ce16762750e524c','{\"name\": \"cache/ee/d6/eed6bcfd8732ca981f2d25a20233226c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [207, 155]}'),('oscar-sandbox||image||82f0e66fcef30862335d3a70dbb12d83','{\"name\": \"images/products/2017/10/9780976458708.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [266, 400]}'),('oscar-sandbox||image||836fee3f45f154fb41fa1c6638d00619','{\"name\": \"cache/ab/36/ab369f1bb40a63749f1ba9d37f6d8b13.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [162, 200]}'),('oscar-sandbox||image||859e5ca7a1657a5482f2d7face5f6613','{\"name\": \"images/products/2017/10/9780765319852.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [266, 400]}'),('oscar-sandbox||image||86aa757170d39352deb330dc4349b018','{\"name\": \"images/products/2017/10/9780321437389.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [302, 400]}'),('oscar-sandbox||image||8a81e38b91bdfe3d582a7e37d391f520','{\"name\": \"images/products/2017/10/9781934356852.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [333, 400]}'),('oscar-sandbox||image||8bd69f594dd3cab8a7d43e489481db22','{\"name\": \"images/products/2017/11/whirlpool_swash_1.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [429, 500]}'),('oscar-sandbox||image||8c49628853bc32a76a137c9ee14e9593','{\"name\": \"cache/59/d3/59d3d8c74e03cbba3aed4051c18d6a8c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [400, 300]}'),('oscar-sandbox||image||90e0ec691501185a5ddfcc14d575e4e7','{\"name\": \"cache/6a/16/6a16adcd8b876b480048c35298426c9d.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [122, 155]}'),('oscar-sandbox||image||917043360b4c610ec4e07bc175eedc23','{\"name\": \"cache/9b/30/9b30262b27652c325c746d98eaaf7d74.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||92b632eb061d34efd9cde4bd932a375a','{\"name\": \"images/products/2017/10/9780307269980.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [269, 400]}'),('oscar-sandbox||image||92d314ca9999e7298243b70790088d99','{\"name\": \"cache/58/ec/58ece17df0d427a0b4235583940c2ef4.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [138, 155]}'),('oscar-sandbox||image||9354632fd85ffc6054ac36de99012c5b','{\"name\": \"cache/3d/ae/3dae4679f5bd4378e572db0aceb75f38.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [81, 100]}'),('oscar-sandbox||image||935e97043d8bac427949399cf8568f32','{\"name\": \"images/products/2017/10/9781591843573.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [265, 400]}'),('oscar-sandbox||image||94b6f3a9b493f98e3fee798fd37893ac','{\"name\": \"images/products/2017/10/9780471578147.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [315, 400]}'),('oscar-sandbox||image||951077e69a373a48a136e28ee59a9e7c','{\"name\": \"images/products/2017/10/9780471128458.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [324, 400]}'),('oscar-sandbox||image||95d9580bdc7059e6cb71134e49825a75','{\"name\": \"images/products/2017/10/9780471782667.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||962d2f6715fe919291dbb21608c56980','{\"name\": \"images/products/2017/10/9780131481046.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [301, 400]}'),('oscar-sandbox||image||9681940715da0e8017a1d500b0f4a739','{\"name\": \"images/products/2017/10/9780557043552.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [306, 400]}'),('oscar-sandbox||image||98ae8ebfa186008003f77be7d1b3b64f','{\"name\": \"images/products/2017/10/9780201379235.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [310, 400]}'),('oscar-sandbox||image||9945de18552d3ac25f8137923fa46223','{\"name\": \"cache/29/6f/296fc5964b21fb2dd42b67fcef391327.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 154]}'),('oscar-sandbox||image||9b3bf8bfe637b8bc36203a4b27765118','{\"name\": \"images/products/2017/10/9780201741575.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||9d713a2de7e525550227e1394d286292','{\"name\": \"cache/48/a0/48a0c01cae2ea48310176f4a27642520.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 154]}'),('oscar-sandbox||image||a1a98f825901156c6515bccc3b53a7d3','{\"name\": \"images/products/2017/10/9780684833392.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [261, 400]}'),('oscar-sandbox||image||a30aeb48d405f6e5a8dce8053f55085b','{\"name\": \"cache/5f/19/5f19b5da2f6c3fc944ee11b1510a9e3e.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [104, 155]}'),('oscar-sandbox||image||a44cf7eeeb6a7173f4db710410b61c5e','{\"name\": \"images/products/2017/10/9780321213358.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [293, 400]}'),('oscar-sandbox||image||a592081c3c5d7f93c2e0f342905ffe7a','{\"name\": \"images/products/2017/10/9781934356586.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [333, 400]}'),('oscar-sandbox||image||a9a6b15216ca2cfcd0d355799532d42b','{\"name\": \"cache/f6/ee/f6ee9b38d67c85fef8005f4a73b7c21a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [125, 155]}'),('oscar-sandbox||image||abaf2032fd1e70ee15ca3f1a89a14521','{\"name\": \"images/products/2017/10/9781931836364.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [304, 400]}'),('oscar-sandbox||image||adc68058466b14364075615a414b56d4','{\"name\": \"cache/57/0b/570b16d5d6ae937d185aa8f808610750.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [126, 155]}'),('oscar-sandbox||image||af22ebfb3952deb725dc2097fe646584','{\"name\": \"cache/30/8a/308af01c1d42c2a9cc34b9044d60bb7d.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [124, 155]}'),('oscar-sandbox||image||b61a2180fd6a50a4de427b3b07fe1dad','{\"name\": \"cache/82/3b/823b9a0f65ddc2c836d1ce852c7019b6.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [124, 155]}'),('oscar-sandbox||image||b6221236f9faba0da8123c4ba2fde718','{\"name\": \"cache/94/dd/94ddcba5af00bc3500d273b7c5597dff.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [122, 155]}'),('oscar-sandbox||image||b7744146ae03306ba3603c8dee498a8e','{\"name\": \"cache/59/3c/593c2bb3501c0ffe43323cf629e29cbb.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [134, 155]}'),('oscar-sandbox||image||b88aba9fc07070255ad5be8ba9b741fd','{\"name\": \"cache/91/10/911044671c9bfc8e2fa8b4122945f0db.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [114, 155]}'),('oscar-sandbox||image||b8d7afb97104663faf94ec842688de38','{\"name\": \"cache/01/ce/01ce836676343d85265164c3c77f66da.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||be466e1f038f590318402aa52d4081e8','{\"name\": \"images/products/2017/10/9780596809485.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||c2ab44cdf66e643c2cd8535f19703dc4','{\"name\": \"cache/18/76/1876b9eff549043572636e3aae8bbc7a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 154]}'),('oscar-sandbox||image||c5d595c26c79fa0cd3c9d59760e16b2a','{\"name\": \"cache/c8/39/c839d890578ef1a439fa971d8a4c8403.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [117, 155]}'),('oscar-sandbox||image||c91ae786e857b1b6f01ca1c99f46ed00','{\"name\": \"cache/34/18/3418f7a83a29d323a383d4dbc058ed73.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [98, 155]}'),('oscar-sandbox||image||cb812e30854262ad95cccf74ad9fd1b9','{\"name\": \"images/products/2017/10/9781430322641.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [265, 400]}'),('oscar-sandbox||image||cbd4be752fd00530e4e85930258c13e9','{\"name\": \"cache/c3/8c/c38cc2ef9d2f05268d58922dc9c64f22.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [129, 155]}'),('oscar-sandbox||image||cc0648d46c9390706b30f957d34a1635','{\"name\": \"cache/3c/c3/3cc3c394b4ed410224d56999819bcbde.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [101, 155]}'),('oscar-sandbox||image||ce234cd2b08fc968675b056cbc4d2570','{\"name\": \"images/products/2017/10/9780764543654.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [323, 400]}'),('oscar-sandbox||image||d01aaf0aecd951974af2ca2895f42d7b','{\"name\": \"images/products/2017/10/9780321278654.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [319, 400]}'),('oscar-sandbox||image||d72dfae3b39a270049ec39c2e65b85d2','{\"name\": \"images/products/2017/10/9780072262582.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [323, 400]}'),('oscar-sandbox||image||d9ac45e4a9159fc6982adf5b3ed34714','{\"name\": \"images/products/2017/10/9781430219484.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||dd233385f553e7d209a679f92158cbbe','{\"name\": \"cache/93/fb/93fbfaa2ec11d6368ff6b7f66c3ec24c.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [400, 400]}'),('oscar-sandbox||image||dd81126b3b79ae6b66f9b25e81e2ddbd','{\"name\": \"images/products/2017/10/9781934356296.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [333, 400]}'),('oscar-sandbox||image||ddf535d46c60e1a2e35b8db8e78513be','{\"name\": \"images/products/2017/10/9780316213547.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [252, 400]}'),('oscar-sandbox||image||dee8fab1347d4441555c89bac380ae1e','{\"name\": \"images/products/2017/10/9780978739218.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [333, 400]}'),('oscar-sandbox||image||e17971cb189fb3b1eeafd1caaf30d1bb','{\"name\": \"cache/fd/a9/fda981e99f5b88f8538f0f3d134c4097.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [102, 155]}'),('oscar-sandbox||image||e1c7483ea822c982882de46cc73905f0','{\"name\": \"images/products/2017/10/9780977616640.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [333, 400]}'),('oscar-sandbox||image||e5c075e7b8955773c7feb3243dc14d74','{\"name\": \"cache/3d/4c/3d4c142b269efad83d98435fe913c000.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [103, 155]}'),('oscar-sandbox||image||e7c2e868ca77a242b5b99b6a1a8147f7','{\"name\": \"cache/73/e9/73e99604858fa26e1c8b784062aaf34d.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [117, 154]}'),('oscar-sandbox||image||e8b8de998dbebcee80f69f9fed3ef9f5','{\"name\": \"images/products/2017/10/9780307588685.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [277, 400]}'),('oscar-sandbox||image||f027efbbe928d0f2dd4dd27e35c4585c','{\"name\": \"images/products/2017/10/9780137081073.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [308, 400]}'),('oscar-sandbox||image||f053f1217aca2f05fdabc0bd3b7e07f6','{\"name\": \"images/products/2017/10/9781416507789.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [257, 400]}'),('oscar-sandbox||image||f09295d159ef16691aa709829c9909c9','{\"name\": \"images/products/2017/10/9781848000698.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [287, 400]}'),('oscar-sandbox||image||f60faa74b8f23910d91b4c4637edb0d7','{\"name\": \"images/products/2017/10/9780262062794.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [355, 400]}'),('oscar-sandbox||image||f87b63eeafcbe6363859f2a1eb738850','{\"name\": \"images/products/2017/10/9780596006624.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [258, 400]}'),('oscar-sandbox||image||f894e6d694654e6dc7a95f27f7cabbd6','{\"name\": \"cache/bd/64/bd6448ae613dc0969e9ddf05d59d3d6f.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [129, 155]}'),('oscar-sandbox||image||fb11e36244fb10295b48a289706992ca','{\"name\": \"images/products/2017/10/9781593270070.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [325, 400]}'),('oscar-sandbox||image||fb5821a60e28d137950e1c1eab9b9e22','{\"name\": \"cache/c7/f2/c7f2c865d321b02e389dce255e0ccd2a.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [267, 400]}'),('oscar-sandbox||image||fba1290a34d56bf694b67c11f6005225','{\"name\": \"cache/01/15/011512d917abda4500cbe2f47342c0f0.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [101, 155]}'),('oscar-sandbox||image||fcc884d5b2b6dd48483ff160c111bc52','{\"name\": \"cache/b6/8d/b68da64ef89adf01603aa9725892e166.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [118, 155]}'),('oscar-sandbox||image||fe5cc29e9b8763f5ec955685b11c4ed2','{\"name\": \"images/products/2017/10/9781591840565.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [261, 400]}'),('oscar-sandbox||image||fea540e9184cd0cb98783e1cc291af9b','{\"name\": \"cache/9d/fd/9dfd23f4cf2db357a4510136c896fc2f.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [129, 155]}'),('oscar-sandbox||image||fff2119256cac68f3fb9f3d8637388f9','{\"name\": \"cache/57/5a/575a94c6168c39332f5018e992da0eec.jpg\", \"storage\": \"django.core.files.storage.FileSystemStorage\", \"size\": [324, 400]}'),('oscar-sandbox||thumbnails||01bb2dd5929483d5aa229a22980217bb','[\"b8d7afb97104663faf94ec842688de38\"]'),('oscar-sandbox||thumbnails||03970c6e31354531b3c88bd75eae63d2','[\"9d713a2de7e525550227e1394d286292\"]'),('oscar-sandbox||thumbnails||0c5e6989e99666a0442ddf350878dc0c','[\"123d147a64db42659038ca2904109dec\"]'),('oscar-sandbox||thumbnails||125fea248464979b51863a5dca2600be','[\"66c71657ddf42a88ee118b6a652c281d\"]'),('oscar-sandbox||thumbnails||12644edec41ffe2980ad2122363cfee0','[\"917043360b4c610ec4e07bc175eedc23\"]'),('oscar-sandbox||thumbnails||174ac8a598c04f6d403448f6371ed203','[\"e17971cb189fb3b1eeafd1caaf30d1bb\"]'),('oscar-sandbox||thumbnails||17fe797082c5c487468972bf7154d775','[\"fba1290a34d56bf694b67c11f6005225\"]'),('oscar-sandbox||thumbnails||1954b1c3e10ac51c43786cc7b19a33bc','[\"e5c075e7b8955773c7feb3243dc14d74\"]'),('oscar-sandbox||thumbnails||1dc095fdc075c8daa7fb6a101e5f73e1','[\"639e718b4afff99dc046f869904224f3\"]'),('oscar-sandbox||thumbnails||28388906768df7998aaafe558e5627fa','[\"adc68058466b14364075615a414b56d4\"]'),('oscar-sandbox||thumbnails||297600d56a55daa16109b68ce6b8f0f6','[\"6cf6acd7f7c66a6467a3e1393b95d3c9\"]'),('oscar-sandbox||thumbnails||333d9bc5d06398a67bb04eb910e0936c','[\"82d86649c337485d7ce16762750e524c\"]'),('oscar-sandbox||thumbnails||3434370ed507d6bfbf25a39c78cdad05','[\"27c8b81848342e509b888161f1fcebda\"]'),('oscar-sandbox||thumbnails||3a14798b47f2ce9bed54012f949add64','[\"7d665144ef050cdc876040395927c556\"]'),('oscar-sandbox||thumbnails||3fac0d199a7ba0d179d790a3d33f6da8','[\"b7744146ae03306ba3603c8dee498a8e\"]'),('oscar-sandbox||thumbnails||40e9b6a01f1a89d0fa6d4acbcedb50cd','[\"fcc884d5b2b6dd48483ff160c111bc52\"]'),('oscar-sandbox||thumbnails||4334c41a7116d0cc567cea1c7772ef8f','[\"81d0e83a4b686238f722111251730ea8\"]'),('oscar-sandbox||thumbnails||513eab1725e4ba6246dff01b7cf55347','[\"e7c2e868ca77a242b5b99b6a1a8147f7\"]'),('oscar-sandbox||thumbnails||55c8822c477b3153bab697a083329494','[\"622905a1300b7e58e3b3eb72e172dd15\"]'),('oscar-sandbox||thumbnails||63a8d4901af5e23665d145276ead5593','[\"1f2c687da446f08c730f24373ec3bf0d\"]'),('oscar-sandbox||thumbnails||69ea0c117d006c027c014ee4ac5ef6ec','[\"b61a2180fd6a50a4de427b3b07fe1dad\"]'),('oscar-sandbox||thumbnails||7af9f096a650c98a4d6475b19cacb43e','[\"90e0ec691501185a5ddfcc14d575e4e7\"]'),('oscar-sandbox||thumbnails||7b0f9cebb55cf844246f70210ecf4e03','[\"5287953d59582b96d1a322ab4b708fa5\"]'),('oscar-sandbox||thumbnails||8035dd6d36c8681275066a1dbf3dd650','[\"0b9fcb0623dbd6195a9dc60c00f8ab11\"]'),('oscar-sandbox||thumbnails||82575c67f152b727ebfb11e20032ea9d','[\"7c54c59a2d02dfbd997fcf6f15de5824\"]'),('oscar-sandbox||thumbnails||82f0e66fcef30862335d3a70dbb12d83','[\"15335b6d40aab5ab0cde0024ceb5b3c7\"]'),('oscar-sandbox||thumbnails||859e5ca7a1657a5482f2d7face5f6613','[\"30de4c390cb3ad3c67d6f573d3acab53\"]'),('oscar-sandbox||thumbnails||86aa757170d39352deb330dc4349b018','[\"44c6168c05847735e0bdc7b9c1a3aa65\"]'),('oscar-sandbox||thumbnails||8a81e38b91bdfe3d582a7e37d391f520','[\"7c0ca8dabf4bab5a6f05bcea972a6f3c\"]'),('oscar-sandbox||thumbnails||8bd69f594dd3cab8a7d43e489481db22','[\"2277e12665b0d9efd4c94e2e297c2a95\"]'),('oscar-sandbox||thumbnails||92b632eb061d34efd9cde4bd932a375a','[\"a30aeb48d405f6e5a8dce8053f55085b\"]'),('oscar-sandbox||thumbnails||935e97043d8bac427949399cf8568f32','[\"390d15c5aef623f3a4351584b2e4cf95\"]'),('oscar-sandbox||thumbnails||94b6f3a9b493f98e3fee798fd37893ac','[\"b6221236f9faba0da8123c4ba2fde718\"]'),('oscar-sandbox||thumbnails||951077e69a373a48a136e28ee59a9e7c','[\"1ffd298855758487c36fda752e3df595\"]'),('oscar-sandbox||thumbnails||95d9580bdc7059e6cb71134e49825a75','[\"212d0cee1080f929dd46f7bcb9952907\"]'),('oscar-sandbox||thumbnails||962d2f6715fe919291dbb21608c56980','[\"c5d595c26c79fa0cd3c9d59760e16b2a\"]'),('oscar-sandbox||thumbnails||9681940715da0e8017a1d500b0f4a739','[\"55fa434912066cff681e4708ec5122e3\"]'),('oscar-sandbox||thumbnails||98ae8ebfa186008003f77be7d1b3b64f','[\"63102154013ce74d7bf0c019d7536c98\"]'),('oscar-sandbox||thumbnails||9b3bf8bfe637b8bc36203a4b27765118','[\"80e7cb943535cc7ec7029c602c1e52e8\"]'),('oscar-sandbox||thumbnails||a1a98f825901156c6515bccc3b53a7d3','[\"cc0648d46c9390706b30f957d34a1635\"]'),('oscar-sandbox||thumbnails||a44cf7eeeb6a7173f4db710410b61c5e','[\"b88aba9fc07070255ad5be8ba9b741fd\"]'),('oscar-sandbox||thumbnails||a592081c3c5d7f93c2e0f342905ffe7a','[\"10c4638114f7322033145f8c9eb2ffc9\"]'),('oscar-sandbox||thumbnails||abaf2032fd1e70ee15ca3f1a89a14521','[\"66c5bd371f5ffcf404eb54f12f9ca06a\"]'),('oscar-sandbox||thumbnails||be466e1f038f590318402aa52d4081e8','[\"9945de18552d3ac25f8137923fa46223\"]'),('oscar-sandbox||thumbnails||cb812e30854262ad95cccf74ad9fd1b9','[\"5daffbd12c7d702079e3de40d9dae147\"]'),('oscar-sandbox||thumbnails||ce234cd2b08fc968675b056cbc4d2570','[\"a9a6b15216ca2cfcd0d355799532d42b\"]'),('oscar-sandbox||thumbnails||d01aaf0aecd951974af2ca2895f42d7b','[\"af22ebfb3952deb725dc2097fe646584\"]'),('oscar-sandbox||thumbnails||d72dfae3b39a270049ec39c2e65b85d2','[\"0ab581be68c56a7f25a3b3bdb50c3bbd\"]'),('oscar-sandbox||thumbnails||d9ac45e4a9159fc6982adf5b3ed34714','[\"c2ab44cdf66e643c2cd8535f19703dc4\"]'),('oscar-sandbox||thumbnails||dd81126b3b79ae6b66f9b25e81e2ddbd','[\"f894e6d694654e6dc7a95f27f7cabbd6\"]'),('oscar-sandbox||thumbnails||ddf535d46c60e1a2e35b8db8e78513be','[\"c91ae786e857b1b6f01ca1c99f46ed00\"]'),('oscar-sandbox||thumbnails||dee8fab1347d4441555c89bac380ae1e','[\"cbd4be752fd00530e4e85930258c13e9\"]'),('oscar-sandbox||thumbnails||e1c7483ea822c982882de46cc73905f0','[\"fea540e9184cd0cb98783e1cc291af9b\"]'),('oscar-sandbox||thumbnails||e8b8de998dbebcee80f69f9fed3ef9f5','[\"55e6ff90ce1df1849f01c05d25899c3c\"]'),('oscar-sandbox||thumbnails||f027efbbe928d0f2dd4dd27e35c4585c','[\"16c2b894302bd80d67c311eb90748c9e\"]'),('oscar-sandbox||thumbnails||f053f1217aca2f05fdabc0bd3b7e07f6','[\"5c2f297596413287d6a062dbd620dd5f\"]'),('oscar-sandbox||thumbnails||f09295d159ef16691aa709829c9909c9','[\"24f47523c04034b93f49ba985fa7be68\"]'),('oscar-sandbox||thumbnails||f60faa74b8f23910d91b4c4637edb0d7','[\"92d314ca9999e7298243b70790088d99\"]'),('oscar-sandbox||thumbnails||f87b63eeafcbe6363859f2a1eb738850','[\"6d4d7975a49c3ac32eaccdc640608b79\"]'),('oscar-sandbox||thumbnails||fb11e36244fb10295b48a289706992ca','[\"5deb8f383a894c80c598f01999682a6f\"]'),('oscar-sandbox||thumbnails||fe5cc29e9b8763f5ec955685b11c4ed2','[\"4a33d73b7c3b55ea72cd3049fffd7279\"]');
/*!40000 ALTER TABLE `thumbnail_kvstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher`
--

DROP TABLE IF EXISTS `voucher_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `usage` varchar(128) NOT NULL,
  `start_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `num_basket_additions` int(10) unsigned NOT NULL,
  `num_orders` int(10) unsigned NOT NULL,
  `total_discount` decimal(12,2) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher`
--

LOCK TABLES `voucher_voucher` WRITE;
/*!40000 ALTER TABLE `voucher_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher_offers`
--

DROP TABLE IF EXISTS `voucher_voucher_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `conditionaloffer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voucher_voucher_offers_voucher_id_conditionalof_01628a7f_uniq` (`voucher_id`,`conditionaloffer_id`),
  KEY `voucher_voucher_offe_conditionaloffer_id_f9682bfb_fk_offer_con` (`conditionaloffer_id`),
  CONSTRAINT `voucher_voucher_offe_conditionaloffer_id_f9682bfb_fk_offer_con` FOREIGN KEY (`conditionaloffer_id`) REFERENCES `offer_conditionaloffer` (`id`),
  CONSTRAINT `voucher_voucher_offers_voucher_id_7f9c575d_fk_voucher_voucher_id` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher_offers`
--

LOCK TABLES `voucher_voucher_offers` WRITE;
/*!40000 ALTER TABLE `voucher_voucher_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucher_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucherapplication`
--

DROP TABLE IF EXISTS `voucher_voucherapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucherapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `voucher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` (`order_id`),
  KEY `voucher_voucherapplication_user_id_df53a393_fk_auth_user_id` (`user_id`),
  KEY `voucher_voucherappli_voucher_id_5204edb7_fk_voucher_v` (`voucher_id`),
  CONSTRAINT `voucher_voucherappli_voucher_id_5204edb7_fk_voucher_v` FOREIGN KEY (`voucher_id`) REFERENCES `voucher_voucher` (`id`),
  CONSTRAINT `voucher_voucherapplication_order_id_30248a05_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `voucher_voucherapplication_user_id_df53a393_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucherapplication`
--

LOCK TABLES `voucher_voucherapplication` WRITE;
/*!40000 ALTER TABLE `voucher_voucherapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_voucherapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_line`
--

DROP TABLE IF EXISTS `wishlists_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `wishlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wishlists_line_wishlist_id_product_id_78f04673_uniq` (`wishlist_id`,`product_id`),
  KEY `wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id` (`product_id`),
  CONSTRAINT `wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalogue_product` (`id`),
  CONSTRAINT `wishlists_line_wishlist_id_4cffe302_fk_wishlists_wishlist_id` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists_wishlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_line`
--

LOCK TABLES `wishlists_line` WRITE;
/*!40000 ALTER TABLE `wishlists_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists_wishlist`
--

DROP TABLE IF EXISTS `wishlists_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(6) NOT NULL,
  `visibility` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `wishlists_wishlist_owner_id_d5464c62_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `wishlists_wishlist_owner_id_d5464c62_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists_wishlist`
--

LOCK TABLES `wishlists_wishlist` WRITE;
/*!40000 ALTER TABLE `wishlists_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30 22:55:36
