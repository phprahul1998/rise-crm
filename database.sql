-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_activity_logs`
--

DROP TABLE IF EXISTS `_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_activity_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `action` enum('created','updated','deleted','bitbucket_notification_received','github_notification_received') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_type_title` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `log_type_id` int NOT NULL DEFAULT '0',
  `changes` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `log_for` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int NOT NULL DEFAULT '0',
  `log_for2` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `log_for_id2` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `log_for` (`log_for`,`log_for_id`),
  KEY `log_for2` (`log_for2`,`log_for_id2`),
  KEY `log_type` (`log_type`,`log_type_id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_activity_logs`
--

LOCK TABLES `_activity_logs` WRITE;
/*!40000 ALTER TABLE `_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_announcements`
--

DROP TABLE IF EXISTS `_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` int NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` datetime NOT NULL,
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_announcements`
--

LOCK TABLES `_announcements` WRITE;
/*!40000 ALTER TABLE `_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_article_helpful_status`
--

DROP TABLE IF EXISTS `_article_helpful_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_article_helpful_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `status` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_article_helpful_status`
--

LOCK TABLES `_article_helpful_status` WRITE;
/*!40000 ALTER TABLE `_article_helpful_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `_article_helpful_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_attendance`
--

DROP TABLE IF EXISTS `_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` enum('incomplete','pending','approved','rejected','deleted') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'incomplete',
  `user_id` int NOT NULL,
  `in_time` datetime NOT NULL,
  `out_time` datetime DEFAULT NULL,
  `checked_by` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `checked_at` datetime DEFAULT NULL,
  `reject_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `checked_by` (`checked_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_attendance`
--

LOCK TABLES `_attendance` WRITE;
/*!40000 ALTER TABLE `_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_automation_settings`
--

DROP TABLE IF EXISTS `_automation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_automation_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `matching_type` enum('match_any','match_all') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `event_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `conditions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `actions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_to` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_automation_settings`
--

LOCK TABLES `_automation_settings` WRITE;
/*!40000 ALTER TABLE `_automation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `_automation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_checklist_groups`
--

DROP TABLE IF EXISTS `_checklist_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_checklist_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `checklists` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_checklist_groups`
--

LOCK TABLES `_checklist_groups` WRITE;
/*!40000 ALTER TABLE `_checklist_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `_checklist_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_checklist_items`
--

DROP TABLE IF EXISTS `_checklist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_checklist_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_checked` int NOT NULL DEFAULT '0',
  `task_id` int NOT NULL DEFAULT '0',
  `sort` double NOT NULL DEFAULT '1',
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_checklist_items`
--

LOCK TABLES `_checklist_items` WRITE;
/*!40000 ALTER TABLE `_checklist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_checklist_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_checklist_template`
--

DROP TABLE IF EXISTS `_checklist_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_checklist_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_checklist_template`
--

LOCK TABLES `_checklist_template` WRITE;
/*!40000 ALTER TABLE `_checklist_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `_checklist_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ci_sessions`
--

DROP TABLE IF EXISTS `_ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ci_sessions`
--

LOCK TABLES `_ci_sessions` WRITE;
/*!40000 ALTER TABLE `_ci_sessions` DISABLE KEYS */;
INSERT INTO `_ci_sessions` VALUES ('ci_session:e6191b66c70b6e59ce2dad3df486876d','::1','2025-09-02 16:07:12',_binary '__ci_last_regenerate|i:1756829011;_ci_previous_url|s:40:\"http://crm.localhost/index.php/dashboard\";user_id|s:1:\"1\";'),('ci_session:cd7e9e852dc1158c19c83e8a3acd9709','::1','2025-09-02 16:03:32',_binary '__ci_last_regenerate|i:1756829012;'),('ci_session:2cab32e1010228caa5f34fc6082a89aa','::1','2025-09-02 16:03:44',_binary '__ci_last_regenerate|i:1756829023;'),('ci_session:6aacb45cb3a25e103a35e661bf5cd16e','::1','2025-09-02 16:04:08',_binary '__ci_last_regenerate|i:1756829048;'),('ci_session:3b6fcdedec70259e3932695962007bf6','::1','2025-09-02 16:04:09',_binary '__ci_last_regenerate|i:1756829049;'),('ci_session:af0809f5ae9ac2c5e456bf327f61c879','::1','2025-09-02 16:04:10',_binary '__ci_last_regenerate|i:1756829050;'),('ci_session:7a9d8ea747cb89ba6647047fb54664d4','::1','2025-09-02 16:04:12',_binary '__ci_last_regenerate|i:1756829052;'),('ci_session:780daf39fdd0fc128b8c19c5ad6baead','::1','2025-09-02 16:06:42',_binary '__ci_last_regenerate|i:1756829202;');
/*!40000 ALTER TABLE `_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_client_groups`
--

DROP TABLE IF EXISTS `_client_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_client_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_client_groups`
--

LOCK TABLES `_client_groups` WRITE;
/*!40000 ALTER TABLE `_client_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `_client_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_client_wallet`
--

DROP TABLE IF EXISTS `_client_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_client_wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `client_id` int NOT NULL,
  `created_by` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_client_wallet`
--

LOCK TABLES `_client_wallet` WRITE;
/*!40000 ALTER TABLE `_client_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `_client_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_clients`
--

DROP TABLE IF EXISTS `_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('organization','person') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'organization',
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `website` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `starred_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `group_ids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_lead` tinyint(1) NOT NULL DEFAULT '0',
  `lead_status_id` int NOT NULL,
  `owner_id` int NOT NULL,
  `created_by` int NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `lead_source_id` int NOT NULL,
  `last_lead_status` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_migration_date` date DEFAULT NULL,
  `vat_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `gst_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `stripe_customer_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `stripe_card_ending_digit` int NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `disable_online_payment` tinyint(1) NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `managers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `created_by` (`created_by`),
  KEY `lead_source_id` (`lead_source_id`),
  KEY `is_lead` (`is_lead`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_clients`
--

LOCK TABLES `_clients` WRITE;
/*!40000 ALTER TABLE `_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_company`
--

DROP TABLE IF EXISTS `_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `website` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vat_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gst_number` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `logo` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_company`
--

LOCK TABLES `_company` WRITE;
/*!40000 ALTER TABLE `_company` DISABLE KEYS */;
INSERT INTO `_company` VALUES (1,'Company Name','','','','','','',1,'',0);
/*!40000 ALTER TABLE `_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_contract_items`
--

DROP TABLE IF EXISTS `_contract_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_contract_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `contract_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_contract_items`
--

LOCK TABLES `_contract_items` WRITE;
/*!40000 ALTER TABLE `_contract_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_contract_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_contract_templates`
--

DROP TABLE IF EXISTS `_contract_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_contract_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_contract_templates`
--

LOCK TABLES `_contract_templates` WRITE;
/*!40000 ALTER TABLE `_contract_templates` DISABLE KEYS */;
INSERT INTO `_contract_templates` VALUES (1,'Template 3.7','<p>&nbsp;</p>\r\n<table class=\"table\" style=\"background-color: #3d3d3d; color: #ffffff; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"text-align: center; width: 100%;\">\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<div><span style=\"font-size: 40px;\"><strong>{CONTRACT_TITLE}</strong></span></div>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">This contract states the terms and conditions that shall govern the contractual agreement between {COMPANY_NAME} (the Service Provider) and {CONTRACT_TO_COMPANY_NAME} (the Client) who agrees to be bound by the terms of the contract.</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">{CONTRACT_ID}</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div>Contract Date: {CONTRACT_DATE}<br>Expiry Date: {CONTRACT_EXPIRY_DATE}</div>\r\n<table style=\"width: 100%; padding-top: 30px; margin-top: 0px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 50%; padding-left: 0; padding-right: 10px;\">\r\n<p>Client</p>\r\n{CONTRACT_TO_INFO}</td>\r\n<td style=\"width: 50%; padding-left: 10px;\">\r\n<p>Service Provider</p>\r\n{COMPANY_INFO}</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">Service Details</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.4239%;\">&nbsp;</td>\r\n<td style=\"width: 14.4239%;\">&nbsp;</td>\r\n<td style=\"width: 14.4239%;\">&nbsp;</td>\r\n<td style=\"width: 14.4239%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.4239%;\">&nbsp;</td>\r\n<td style=\"width: 14.4239%;\">&nbsp;</td>\r\n<td style=\"width: 12.8504%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">The specific scope, timeline, and any additional requirements related to the services shall be detailed in a separate document or statement of work, which shall form an integral part of this contract.</p>\r\n<p>&nbsp;</p>\r\n<p>{CONTRACT_ITEMS}</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">1. Service Policy</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">The Service Policy outlines the terms and conditions governing the provision of services by Service Provider to the Client. It encompasses guidelines regarding service delivery, quality standards, support mechanisms, and dispute resolution procedures. The Service Provider is committed to upholding the highest level of professionalism, responsiveness, and customer satisfaction in delivering the agreed upon services.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Any deviations from the Service Policy shall be communicated promptly and resolved in a timely manner to ensure seamless collaboration and adherence to the mutual objectives outlined in the contract.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">2. Delivery</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">The Service Provider will commence delivery of services upon receipt of a signed contract and any necessary initial payments as specified. Delivery timelines and milestones will be outlined in the project schedule or statement of work provided to the Client. The Service Provider will make reasonable efforts to meet agreed-upon deadlines and milestones, keeping the Client informed of any delays or changes to the delivery schedule. Delivery methods may vary depending on the nature of the services and may include in-person meetings, electronic communication, or physical shipment of goods.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Upon completion of the services, the Client will be provided with deliverables as outlined in the project scope or statement of work, with any necessary documentation or training materials included as specified.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">3. Intellectual property rights</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">All intellectual property rights, including but not limited to copyrights, patents, trademarks, and trade secrets, associated with the services provided under this contract shall remain the exclusive property of the originating party unless otherwise agreed upon in writing. The Service Provider retains ownership of any proprietary methodologies, technologies, or materials utilized in delivering the services, and the Client agrees not to reproduce, distribute, or disclose such intellectual property without prior written consent.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Any intellectual property created or developed during the course of providing the services shall be jointly owned by both parties unless otherwise specified in a separate agreement. Any use or exploitation of intellectual property rights beyond the scope of this contract requires the express written consent of the owning party.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">4. Confidentiality</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">Both parties agree to maintain strict confidentiality regarding any proprietary or sensitive information disclosed during the course of this contract. This includes but is not limited to trade secrets, business strategies, financial information, and client data. The Service Provider shall take all necessary precautions to prevent unauthorized access or disclosure of confidential information and shall only share such information with authorized personnel directly involved in fulfilling the obligations of this contract.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">The Client agrees not to disclose any confidential information obtained from the Service Provider to any third parties without prior written consent. This confidentiality obligation shall survive the termination of this contract and continue indefinitely thereafter.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<table style=\"margin-top: 0px; margin-bottom: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding: 0px; width: 100%;\">\r\n<div style=\"margin-top: 20px;\">\r\n<div style=\"text-align: center;\">\r\n<div style=\"font-size: 30px;\">5. Support</div>\r\n<table style=\"margin-top: 10px; width: 100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">\r\n<div style=\"border-bottom: 5px solid #ff9800;\">&nbsp;</div>\r\n</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n<td style=\"width: 14.5125%;\">&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"text-align: justify;\">The Service Provider agrees to provide reasonable support and assistance to the Client during the term of this contract. Support may include but is not limited to troubleshooting, technical assistance, and guidance related to the services provided. The Service Provider will make commercially reasonable efforts to respond promptly to inquiries and requests for support from the Client, within the parameters specified in the service level agreement (SLA) or support agreement. Support will be provided during normal business hours unless otherwise agreed upon. Any additional support beyond the scope outlined in this contract may be subject to additional fees or terms as mutually agreed upon by both parties.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">{CONTRACT_NOTE}</p>',0);
/*!40000 ALTER TABLE `_contract_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_contracts`
--

DROP TABLE IF EXISTS `_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL,
  `contract_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accepted_by` int NOT NULL DEFAULT '0',
  `staff_signed_by` int NOT NULL DEFAULT '0',
  `meta_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_contracts`
--

LOCK TABLES `_contracts` WRITE;
/*!40000 ALTER TABLE `_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_custom_field_values`
--

DROP TABLE IF EXISTS `_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_custom_field_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `related_to_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_to_id` int NOT NULL,
  `custom_field_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `related_to_type` (`related_to_type`),
  KEY `related_to_id` (`related_to_id`),
  KEY `custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_custom_field_values`
--

LOCK TABLES `_custom_field_values` WRITE;
/*!40000 ALTER TABLE `_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_custom_fields`
--

DROP TABLE IF EXISTS `_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_custom_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title_language_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `placeholder_language_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `show_in_embedded_form` tinyint NOT NULL DEFAULT '0',
  `placeholder` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template_variable_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `options` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `field_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `related_to` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `add_filter` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_estimate` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_contract` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_order` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_proposal` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT '0',
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT '0',
  `disable_editing_by_clients` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_kanban_card` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_subscription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `related_to` (`related_to`),
  KEY `field_type` (`field_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_custom_fields`
--

LOCK TABLES `_custom_fields` WRITE;
/*!40000 ALTER TABLE `_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_custom_widgets`
--

DROP TABLE IF EXISTS `_custom_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_custom_widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `show_title` tinyint(1) NOT NULL DEFAULT '0',
  `show_border` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_custom_widgets`
--

LOCK TABLES `_custom_widgets` WRITE;
/*!40000 ALTER TABLE `_custom_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `_custom_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_dashboards`
--

DROP TABLE IF EXISTS `_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_dashboards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `color` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_dashboards`
--

LOCK TABLES `_dashboards` WRITE;
/*!40000 ALTER TABLE `_dashboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_e_invoice_templates`
--

DROP TABLE IF EXISTS `_e_invoice_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_e_invoice_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_e_invoice_templates`
--

LOCK TABLES `_e_invoice_templates` WRITE;
/*!40000 ALTER TABLE `_e_invoice_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `_e_invoice_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_email_templates`
--

DROP TABLE IF EXISTS `_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_email_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_subject` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `default_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `custom_message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `template_type` enum('default','custom') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'default',
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_email_templates`
--

LOCK TABLES `_email_templates` WRITE;
/*!40000 ALTER TABLE `_email_templates` DISABLE KEYS */;
INSERT INTO `_email_templates` VALUES (1,'login_info','Login details','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME} {USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','','default','',0),(2,'reset_password','Reset password','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Reset Password</h1>\n </div>\n <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\">                    <p style=\"font-size: 14px;\"> Hello {ACCOUNT_HOLDER_NAME},<br><br>A password reset request has been created for your account.&nbsp;</p>\n                    <p style=\"font-size: 14px;\"> To initiate the password reset process, please click on the following link:</p>\n                    <p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Reset Password</a></p>\n                    <p style=\"font-size: 14px;\"></p>\n                    <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you\'ve received this mail in error, it\'s likely that another user entered your email address by mistake while trying to reset a password.</span><br></p>\n<p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">If you didn\'t initiate the request, you don\'t need to take any further action and can safely disregard this email.</span><br></p>\n<p style=\"font-size: 14px;\"><br></p>\n<p style=\"font-size: 14px;\">{SIGNATURE}</p>\n                </div>\n            </div>\n        </div>','','default','',0),(3,'team_member_invitation','You are invited','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don not want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','','default','',0),(4,'send_invoice','New invoice','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>INVOICE</h1>\n<h3>&nbsp;{INVOICE_FULL_ID}</h3>\n</div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello {CONTACT_FIRST_NAME},</p>\n<p>Thank you for your business cooperation.</p>\n<p>Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</p>\n<p>&nbsp;</p>\n<p><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">Show Invoice</a></p>\n<p>&nbsp;</p>\n<p>Invoice balance due is {BALANCE_DUE}</p>\n<p>Please pay this invoice within {DUE_DATE}.&nbsp;</p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(5,'signature','Signature','Powered By: <a href=\"https://fairsketch.com/\" target=\"_blank\">fairsketch </a>','','default','',0),(6,'client_contact_invitation','You are invited','<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don not want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','','default','',0),(7,'ticket_created','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>','','default','',0),(8,'ticket_commented','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>','','default','',0),(9,'ticket_closed','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>','','default','',0),(10,'ticket_reopened','Ticket  #{TICKET_ID} - {TICKET_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>','','default','',0),(11,'general_notification','{EVENT_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>','','default','',0),(12,'invoice_payment_confirmation','Payment received','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>Payment Confirmation</h1>\n</div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello,<br>We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_FULL_ID} <br>Thank you for your business cooperation.</p>\n<p>&nbsp;</p>\n<p><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">View Invoice</a></p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(13,'message_received','{SUBJECT}','<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"> <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\"> <style type=\"text/css\"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id=\"message-container\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;\"> <tbody> <tr> <td valign=\"top\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"50\" width=\"600\">&nbsp;</td> </tr> <tr> <td style=\"background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; \" width=\"600\"><h2 style=\"color:#fff; text-align:center;\">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor=\"whitesmoke\" style=\"background:#fff; font-family:Helvetica,Arial,sans-serif\" valign=\"top\" width=\"600\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> <tr> <td width=\"560\"><p><span style=\"background-color: transparent;\">{MESSAGE_CONTENT}</span></p> <p style=\"display:inline-block; padding: 10px 15px; background-color: #00b393;\"><a href=\"{MESSAGE_URL}\" style=\"text-decoration: none; color:#fff;\" target=\"_blank\">Reply Message</a></p> </td> </tr> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height=\"60\" width=\"600\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(14,'invoice_due_reminder_before_due_date','Invoice due reminder','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>Invoice Due Reminder</h1></div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello,<br>We would like to remind you that invoice {INVOICE_FULL_ID} is due on {DUE_DATE}. Please pay the invoice within due date.&nbsp;</p>\n<p><span>If you have already submitted the payment, please ignore this email.</span></p><p><span><br></span></p>\n<p><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">Show Invoice</a></p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(15,'invoice_overdue_reminder','Invoice overdue reminder','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>Invoice Overdue Reminder</h1></div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello,<br>We would like to remind you that you have an unpaid invoice {INVOICE_FULL_ID}. We kindly request you to pay the invoice as soon as possible.&nbsp;</p>\n<p><span>If you have already submitted the payment, please ignore this email.</span></p><p><span><br></span></p>\n<p><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">Show Invoice</a></p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(16,'recurring_invoice_creation_reminder','Recurring invoice creation reminder','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>Invoice Creation Reminder</h1></div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello,<br>We would like to remind you that a recurring invoice will be created on {NEXT_RECURRING_DATE}.&nbsp;</p>\n<p><span><br></span></p>\n<p><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">Show Invoice</a></p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(17,'project_task_deadline_reminder','Project task deadline reminder','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">This is to remind you that there are some tasks which deadline is {DEADLINE}.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">{TASKS_LIST}</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>','','default','',0),(18,'estimate_sent','New estimate','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is the estimate. Please check the attachment.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(19,'estimate_request_received','Estimate request received','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE REQUEST #{ESTIMATE_REQUEST_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"><span style=\"background-color: transparent;\">A new estimate request has been received from {CONTACT_FIRST_NAME}.</span><br></p><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_REQUEST_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate Request</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(20,'estimate_rejected','Estimate rejected','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"><p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">The estimate #{ESTIMATE_ID} has been rejected.</span></font><br></p><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(21,'estimate_accepted','Estimate accepted','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>ESTIMATE #{ESTIMATE_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"><p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">The estimate #{ESTIMATE_ID} has been accepted.</span></font><br></p><p style=\"color: rgb(96, 96, 96); font-family: Arial; font-size: 15px;\"></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{ESTIMATE_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Estimate</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(22,'new_client_greetings','Welcome!','<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Welcome to {COMPANY_NAME}</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Thank you for creating your account. </span></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">We are happy to see you here.<br></span></p><hr><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {CONTACT_LOGIN_EMAIL}</span><br></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{CONTACT_LOGIN_PASSWORD}</span></p><p style=\"color: rgb(85, 85, 85);\"><br></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>','','default','',0),(23,'verify_email','Please verify your email','<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"><div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account verification</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\"><p style=\"font-size: 14px;\">To initiate the signup process, please click on the following link:<br></p><p style=\"font-size: 14px;\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{VERIFY_EMAIL_URL}\" target=\"_blank\">Verify Email</a></span></p>  <p style=\"font-size: 14px;\"><br></p><p style=\"\"><span style=\"font-size: 14px;\">If you did not initiate the request, you do not need to take any further action and can safely disregard this email.</span></p><p style=\"\"><span style=\"font-size: 14px;\"><br></span></p><p style=\"font-size: 14px;\">{SIGNATURE}</p></div></div></div>','','default','',0),(24,'new_order_received','New order received','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>ORDER #{ORDER_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">A new order has been received from&nbsp;</span><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">{CONTACT_FIRST_NAME} and is attached here.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ORDER_URL}\" target=\"_blank\">Show Order</a></span></p><p style=\"\"><br></p>  </div> </div></div>','','default','',0),(25,'order_status_updated','Order status updated','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>ORDER #{ORDER_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your order&nbsp;</span><font color=\"#555555\"><span style=\"font-size: 14px;\">has been updated&nbsp;</span></font><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ORDER_URL}\" target=\"_blank\">Show Order</a></span></p><p style=\"\"><br></p>  </div> </div></div>','','default','',0),(26,'proposal_sent','Proposal sent','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>PROPOSAL #{PROPOSAL_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is a proposal for you.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{PROPOSAL_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Proposal</a></td></tr></tbody></table></td></tr></tbody></table> <p></p></td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> </p><p>Public URL: {PUBLIC_PROPOSAL_URL}</p><p><br></p><p>{SIGNATURE} </p></td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(27,'project_completed','Project completed','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Project #{PROJECT_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Project #{PROJECT_ID}&nbsp;has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">Title:&nbsp;</span>{PROJECT_TITLE}</p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROJECT_URL}\" target=\"_blank\">Show Project</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"color: rgb(78, 94, 106); font-size: 13.5px;\">{SIGNATURE}</span><br></span></p>   </div>  </div> </div>','','default','',0),(28,'proposal_accepted','Proposal accepted','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>PROPOSAL #{PROPOSAL_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The proposal #{PROPOSAL_ID} has been accepted.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROPOSAL_URL}\" target=\"_blank\">Show Proposal</a></span></p><p style=\"\"><br></p>  </div> </div></div>','','default','',0),(29,'proposal_rejected','Proposal rejected','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>PROPOSAL #{PROPOSAL_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The proposal #{PROPOSAL_ID} has been rejected.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROPOSAL_URL}\" target=\"_blank\">Show Proposal</a></span></p><p style=\"\"><br></p>  </div> </div></div>','','default','',0),(30,'estimate_commented','Estimate  #{ESTIMATE_ID}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Estimate #{ESTIMATE_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{COMMENT_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ESTIMATE_URL}\" target=\"_blank\">Show Estimate</a></span></p></div></div></div>','','default','',0),(31,'contract_sent','Contract sent','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody><tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody><tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding: 40px 18px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <h2 style=\"display: block; margin: 0px; padding: 0px; line-height: 100%; text-align: center;\"><font color=\"#ffffff\" face=\"Arial\"><span style=\"letter-spacing: -1px;\"><b>CONTRACT #{CONTRACT_ID}</b></span></font><br></h2></td></tr></tbody></table></td></tr></tbody></table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody><tr> <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p> Hello {CONTACT_FIRST_NAME},<br></p><p>Here is a contract for you.</p><p></p></td></tr><tr><td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%; text-size-adjust: 100%;\"><tbody><tr><td style=\"padding-top: 15px; padding-bottom: 15px; text-size-adjust: 100%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"><tbody><tr><td align=\"center\" valign=\"middle\" style=\"font-size: 16px; padding: 10px; text-size-adjust: 100%;\"><a href=\"{CONTRACT_URL}\" target=\"_blank\" style=\"font-weight: bold; line-height: 100%; color: rgb(255, 255, 255); text-size-adjust: 100%; display: block;\">Show Contract</a></td></tr></tbody></table></td></tr></tbody></table></td></tr><tr><td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"><p>Public URL: {PUBLIC_CONTRACT_URL}<br></p><p><br></p><p>{SIGNATURE}<br></p></td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0),(32,'contract_accepted','Contract accepted','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>CONTRACT #{CONTRACT_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The contract #{CONTRACT_ID} has been accepted.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{CONTRACT_URL}\" target=\"_blank\">Show Contract</a></span></p><p style=\"\"><br></p>  </div> </div></div>','','default','',0),(33,'contract_rejected','Contract rejected','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>CONTRACT #{CONTRACT_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px;\">The contract #{CONTRACT_ID} has been rejected.</span><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{CONTRACT_URL}\" target=\"_blank\">Show Contract</a></span></p><p style=\"\"><br></p>  </div> </div></div>','','default','',0),(34,'invoice_manual_payment_added','Manual payment added','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>Payment Added</h1></div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello,<br>A new payment has been added to {INVOICE_FULL_ID}.&nbsp;</p>\n<p>Payment amount: {PAYMENT_AMOUNT}&nbsp;</p>\n<p><span><br></span></p>\n<p><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">Show Invoice</a></p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(35,'subscription_request_sent','New subscription request','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h2>{SUBSCRIPTION_TITLE}</h2></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px;\">You have a new subscription request. Please click here to see the subscription.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{SUBSCRIPTION_URL}\" target=\"_blank\">Show Subscription</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>','','default','',0),(36,'announcement_created','{ANNOUNCEMENT_TITLE}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Announcement: {ANNOUNCEMENT_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">A new announcement has been created by {USER_NAME}.</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{ANNOUNCEMENT_URL}\" target=\"_blank\">Show Announcement</a></span></p></div></div></div>','','default','',0),(37,'task_general','{TASK_TITLE} (Task #{TASK_ID})','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{EVENT_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>Task:</b> #</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">{TASK_ID} -&nbsp;</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">{TASK_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>{CONTEXT_LABEL}:</b>&nbsp;</span>{CONTEXT_TITLE}</p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TASK_URL}\" target=\"_blank\">Show Task&nbsp;</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"color: rgb(78, 94, 106); font-size: 13.5px;\">{SIGNATURE}</span><br></span></p>   </div>  </div> </div>','','default','',0),(38,'task_assigned','{TASK_TITLE} (Task #{TASK_ID})','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Task assigned</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>{USER_NAME}</b>  Assigned a task to <b>{ASSIGNED_TO_USER_NAME}</b></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>Task:</b> #</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">{TASK_ID} -&nbsp;</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">{TASK_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>{CONTEXT_LABEL}:</b>&nbsp;</span>{CONTEXT_TITLE}</p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TASK_URL}\" target=\"_blank\">Show Task&nbsp;</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"color: rgb(78, 94, 106); font-size: 13.5px;\">{SIGNATURE}</span><br></span></p>   </div>  </div> </div>','','default','',0),(39,'task_commented','{TASK_TITLE} (Task #{TASK_ID})','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Task commented</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>{USER_NAME}</b>  Commented on a task.</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>Task:</b> #</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">{TASK_ID} -&nbsp;</span><span style=\"font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);\">{TASK_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><b>{CONTEXT_LABEL}:</b>&nbsp;</span>{CONTEXT_TITLE}</p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TASK_URL}\" target=\"_blank\">Show Task&nbsp;</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"color: rgb(78, 94, 106); font-size: 13.5px;\">{SIGNATURE}</span><br></span></p>   </div>  </div> </div>','','default','',0),(40,'subscription_started','Started a subscription','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h2>{SUBSCRIPTION_TITLE}</h2></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px;\">A new subscription has been started.&nbsp;</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{SUBSCRIPTION_URL}\" target=\"_blank\">Show Subscription</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>','','default','',0),(41,'subscription_invoice_created_via_cron_job','New invoice generated from subscription','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the subscription {SUBSCRIPTION_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>','','default','',0),(42,'send_credit_note','New credit note','<div style=\"background-color: #eeeeef; padding: 50px 0;\">\n<div style=\"max-width: 640px; margin: 0 auto;\">\n<div style=\"color: #fff; text-align: center; background-color: #33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n<h1>CREDIT NOTE #{CREDIT_NOTE_FULL_ID}</h1></div>\n<div style=\"padding: 20px; background-color: #ffffff; font-size: 14px;\">\n<p>Hello {CONTACT_FIRST_NAME},&nbsp;</p>\n<p>Your invoice {INVOICE_FULL_ID} has been credited.&nbsp;</p>\n<p>Here is the credit note.&nbsp;&nbsp;</p>\n<p><span><br></span></p>\n<p><span style=\"color: #555555; font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{CREDIT_NOTE_URL}\" target=\"_blank\" rel=\"noopener\" aria-invalid=\"true\">Show Credit Note</a></span></p>\n<p>&nbsp;</p>\n<p>{SIGNATURE}</p>\n</div>\n</div>\n</div>','','default','',0),(43,'subscription_cancelled','Subscription cancelled','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h2>{SUBSCRIPTION_TITLE}</h2></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">The subscription {SUBSCRIPTION_TITLE} has been cancelled by {CANCELLED_BY}.</span></font><br></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{SUBSCRIPTION_URL}\" target=\"_blank\">Show Subscription</a></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>','','default','',0),(44,'proposal_commented','Proposal #{PROPOSAL_ID}','<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Proposal #{PROPOSAL_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{COMMENT_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{PROPOSAL_URL}\" target=\"_blank\">Show Proposal</a></span></p></div></div></div>','','default','',0),(45,'subscription_renewal_reminder','Subscription Renewal Reminder','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\"> <tbody> <tr> <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody> <tr> <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Subscription Renewal Reminder</h2> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\"> <tbody> <tr> <td valign=\"top\" style=\"padding: 20px 18px 0px; text-size-adjust: 100%; word-break: break-word; line-height: 150%; text-align: left;\"> <p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">This is a reminder that your subscription:&nbsp;<b>{SUBSCRIPTION_TITLE}</b></span></font><font color=\"#606060\" face=\"Arial\" style=\"font-weight: var(--bs-body-font-weight);\"><span style=\"font-size: 15px;\">&nbsp;</span></font><font color=\"#606060\" face=\"Arial\" style=\"font-weight: var(--bs-body-font-weight);\"><span style=\"font-size: 15px;\">will renew soon. Please ensure that your payment details are up to date to avoid any interruptions in your service.</span></font></p> <p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\"><br></span></font></p> <p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">If you have already renewed your subscription, please ignore this email. </span></font></p> <p style=\"\"><font color=\"#606060\" face=\"Arial\"><span style=\"font-size: 15px;\">Thank you for your continued support.</span></font><br></p> </td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <tbody> <tr> <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\"> <a href=\"{SUBSCRIPTION_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Subscription</a> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <p></p> </td> </tr> <tr> <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> {SIGNATURE} </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>','','default','',0);
/*!40000 ALTER TABLE `_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_estimate_comments`
--

DROP TABLE IF EXISTS `_estimate_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_estimate_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `estimate_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_estimate_comments`
--

LOCK TABLES `_estimate_comments` WRITE;
/*!40000 ALTER TABLE `_estimate_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `_estimate_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_estimate_forms`
--

DROP TABLE IF EXISTS `_estimate_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_estimate_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `assigned_to` int NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `enable_attachment` tinyint NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_estimate_forms`
--

LOCK TABLES `_estimate_forms` WRITE;
/*!40000 ALTER TABLE `_estimate_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `_estimate_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_estimate_items`
--

DROP TABLE IF EXISTS `_estimate_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_estimate_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `estimate_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_estimate_items`
--

LOCK TABLES `_estimate_items` WRITE;
/*!40000 ALTER TABLE `_estimate_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_estimate_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_estimate_requests`
--

DROP TABLE IF EXISTS `_estimate_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_estimate_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estimate_form_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int NOT NULL,
  `lead_id` int NOT NULL,
  `assigned_to` int NOT NULL,
  `status` enum('new','processing','hold','canceled','estimated') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'new',
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_estimate_requests`
--

LOCK TABLES `_estimate_requests` WRITE;
/*!40000 ALTER TABLE `_estimate_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `_estimate_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_estimates`
--

DROP TABLE IF EXISTS `_estimates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_estimates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `estimate_request_id` int NOT NULL DEFAULT '0',
  `estimate_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `accepted_by` int NOT NULL DEFAULT '0',
  `meta_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `signature` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_estimates`
--

LOCK TABLES `_estimates` WRITE;
/*!40000 ALTER TABLE `_estimates` DISABLE KEYS */;
/*!40000 ALTER TABLE `_estimates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_event_tracker`
--

DROP TABLE IF EXISTS `_event_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_event_tracker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context_id` int NOT NULL,
  `read_count` int DEFAULT NULL,
  `status` enum('new','read') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'new',
  `last_read_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `logs` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `random_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_event_tracker`
--

LOCK TABLES `_event_tracker` WRITE;
/*!40000 ALTER TABLE `_event_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `_event_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_events`
--

DROP TABLE IF EXISTS `_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int NOT NULL,
  `location` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `client_id` int NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `share_with` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `editable_google_event` tinyint(1) NOT NULL DEFAULT '0',
  `google_event_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `ticket_id` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `task_id` int NOT NULL DEFAULT '0',
  `proposal_id` int NOT NULL DEFAULT '0',
  `contract_id` int NOT NULL DEFAULT '0',
  `subscription_id` int NOT NULL DEFAULT '0',
  `invoice_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `estimate_id` int NOT NULL DEFAULT '0',
  `related_user_id` int NOT NULL DEFAULT '0',
  `next_recurring_time` datetime DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `snoozing_time` datetime DEFAULT NULL,
  `reminder_status` enum('new','shown','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'new',
  `type` enum('event','reminder') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'event',
  `color` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `recurring` int NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `last_start_date` date DEFAULT NULL,
  `recurring_dates` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `confirmed_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `rejected_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  KEY `project_id` (`project_id`),
  KEY `task_id` (`task_id`),
  KEY `recurring` (`recurring`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_events`
--

LOCK TABLES `_events` WRITE;
/*!40000 ALTER TABLE `_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_expense_categories`
--

DROP TABLE IF EXISTS `_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_expense_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_expense_categories`
--

LOCK TABLES `_expense_categories` WRITE;
/*!40000 ALTER TABLE `_expense_categories` DISABLE KEYS */;
INSERT INTO `_expense_categories` VALUES (1,'Miscellaneous expense',0);
/*!40000 ALTER TABLE `_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_expenses`
--

DROP TABLE IF EXISTS `_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_expenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expense_date` date NOT NULL,
  `category_id` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `amount` double NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `client_id` int NOT NULL DEFAULT '0',
  `recurring` tinyint NOT NULL DEFAULT '0',
  `recurring_expense_id` tinyint NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `next_recurring_date` date DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_expenses`
--

LOCK TABLES `_expenses` WRITE;
/*!40000 ALTER TABLE `_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_file_category`
--

DROP TABLE IF EXISTS `_file_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_file_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `type` enum('project') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'project',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_file_category`
--

LOCK TABLES `_file_category` WRITE;
/*!40000 ALTER TABLE `_file_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `_file_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_folders`
--

DROP TABLE IF EXISTS `_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_folders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `folder_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `level` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context_id` int NOT NULL,
  `starred_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_folders`
--

LOCK TABLES `_folders` WRITE;
/*!40000 ALTER TABLE `_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_general_files`
--

DROP TABLE IF EXISTS `_general_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_general_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `service_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `uploaded_by` int NOT NULL,
  `folder_id` int DEFAULT '0',
  `context` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context_id` int DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_general_files`
--

LOCK TABLES `_general_files` WRITE;
/*!40000 ALTER TABLE `_general_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `_general_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_help_articles`
--

DROP TABLE IF EXISTS `_help_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_help_articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_views` int NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_help_articles`
--

LOCK TABLES `_help_articles` WRITE;
/*!40000 ALTER TABLE `_help_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `_help_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_help_categories`
--

DROP TABLE IF EXISTS `_help_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_help_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('help','knowledge_base') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `articles_order` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `related_articles` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `banner_image` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `banner_url` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_help_categories`
--

LOCK TABLES `_help_categories` WRITE;
/*!40000 ALTER TABLE `_help_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `_help_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_invoice_items`
--

DROP TABLE IF EXISTS `_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_invoice_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `invoice_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `taxable` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_invoice_items`
--

LOCK TABLES `_invoice_items` WRITE;
/*!40000 ALTER TABLE `_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_invoice_payments`
--

DROP TABLE IF EXISTS `_invoice_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_invoice_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method_id` int NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `invoice_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_by` int DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_invoice_payments`
--

LOCK TABLES `_invoice_payments` WRITE;
/*!40000 ALTER TABLE `_invoice_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `_invoice_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_invoices`
--

DROP TABLE IF EXISTS `_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('invoice','credit_note') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'invoice',
  `client_id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','not_paid','cancelled','credited') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `tax_id3` int NOT NULL DEFAULT '0',
  `recurring` tinyint NOT NULL DEFAULT '0',
  `recurring_invoice_id` int NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `next_recurring_date` date DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `due_reminder_date` date DEFAULT NULL,
  `recurring_reminder_date` date DEFAULT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `estimate_id` int NOT NULL DEFAULT '0',
  `main_invoice_id` int NOT NULL DEFAULT '0',
  `subscription_id` int NOT NULL DEFAULT '0',
  `invoice_total` double NOT NULL,
  `invoice_subtotal` double NOT NULL,
  `discount_total` double NOT NULL,
  `tax` double NOT NULL,
  `tax2` double NOT NULL,
  `tax3` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `display_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `number_year` int DEFAULT NULL,
  `number_sequence` int DEFAULT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `due_date` (`due_date`),
  KEY `client_id` (`client_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_invoices`
--

LOCK TABLES `_invoices` WRITE;
/*!40000 ALTER TABLE `_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_item_categories`
--

DROP TABLE IF EXISTS `_item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_item_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_item_categories`
--

LOCK TABLES `_item_categories` WRITE;
/*!40000 ALTER TABLE `_item_categories` DISABLE KEYS */;
INSERT INTO `_item_categories` VALUES (1,'General item',0);
/*!40000 ALTER TABLE `_item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_items`
--

DROP TABLE IF EXISTS `_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `show_in_client_portal` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_items`
--

LOCK TABLES `_items` WRITE;
/*!40000 ALTER TABLE `_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_labels`
--

DROP TABLE IF EXISTS `_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_labels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` enum('event','invoice','note','project','task','ticket','to_do','subscription','client','help','knowledge_base') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `context` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_labels`
--

LOCK TABLES `_labels` WRITE;
/*!40000 ALTER TABLE `_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_lead_source`
--

DROP TABLE IF EXISTS `_lead_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_lead_source` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_lead_source`
--

LOCK TABLES `_lead_source` WRITE;
/*!40000 ALTER TABLE `_lead_source` DISABLE KEYS */;
INSERT INTO `_lead_source` VALUES (1,'Google',1,0),(2,'Facebook',2,0),(3,'Twitter',3,0),(4,'Youtube',4,0),(5,'Elsewhere',5,0);
/*!40000 ALTER TABLE `_lead_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_lead_status`
--

DROP TABLE IF EXISTS `_lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_lead_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_lead_status`
--

LOCK TABLES `_lead_status` WRITE;
/*!40000 ALTER TABLE `_lead_status` DISABLE KEYS */;
INSERT INTO `_lead_status` VALUES (1,'New','#f1c40f',0,0),(2,'Qualified','#2d9cdb',1,0),(3,'Discussion','#29c2c2',2,0),(4,'Negotiation','#2d9cdb',3,0),(5,'Won','#83c340',4,0),(6,'Lost','#e74c3c',5,0);
/*!40000 ALTER TABLE `_lead_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_leave_applications`
--

DROP TABLE IF EXISTS `_leave_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_leave_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leave_type_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_hours` decimal(7,2) NOT NULL,
  `total_days` decimal(5,2) NOT NULL,
  `applicant_id` int NOT NULL,
  `reason` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('pending','approved','rejected','canceled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `created_by` int NOT NULL,
  `checked_at` datetime DEFAULT NULL,
  `checked_by` int NOT NULL DEFAULT '0',
  `files` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `leave_type_id` (`leave_type_id`),
  KEY `user_id` (`applicant_id`),
  KEY `checked_by` (`checked_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_leave_applications`
--

LOCK TABLES `_leave_applications` WRITE;
/*!40000 ALTER TABLE `_leave_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `_leave_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_leave_types`
--

DROP TABLE IF EXISTS `_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_leave_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_leave_types`
--

LOCK TABLES `_leave_types` WRITE;
/*!40000 ALTER TABLE `_leave_types` DISABLE KEYS */;
INSERT INTO `_leave_types` VALUES (1,'Casual Leave','active','#83c340','',0);
/*!40000 ALTER TABLE `_leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_likes`
--

DROP TABLE IF EXISTS `_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_comment_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_likes`
--

LOCK TABLES `_likes` WRITE;
/*!40000 ALTER TABLE `_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_messages`
--

DROP TABLE IF EXISTS `_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Untitled',
  `message` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `status` enum('unread','read') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unread',
  `message_id` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_by_users` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_from` (`from_user_id`),
  KEY `message_to` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_messages`
--

LOCK TABLES `_messages` WRITE;
/*!40000 ALTER TABLE `_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_milestones`
--

DROP TABLE IF EXISTS `_milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_milestones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `due_date` date NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_milestones`
--

LOCK TABLES `_milestones` WRITE;
/*!40000 ALTER TABLE `_milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `_milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_note_category`
--

DROP TABLE IF EXISTS `_note_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_note_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `user_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_note_category`
--

LOCK TABLES `_note_category` WRITE;
/*!40000 ALTER TABLE `_note_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `_note_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_notes`
--

DROP TABLE IF EXISTS `_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `project_id` int NOT NULL DEFAULT '0',
  `client_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int DEFAULT '0',
  `color` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_notes`
--

LOCK TABLES `_notes` WRITE;
/*!40000 ALTER TABLE `_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_notification_settings`
--

DROP TABLE IF EXISTS `_notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_notification_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enable_email` int NOT NULL DEFAULT '0',
  `enable_web` int NOT NULL DEFAULT '0',
  `enable_slack` int NOT NULL DEFAULT '0',
  `notify_to_team` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify_to_team_members` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `notify_to_terms` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event` (`event`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_notification_settings`
--

LOCK TABLES `_notification_settings` WRITE;
/*!40000 ALTER TABLE `_notification_settings` DISABLE KEYS */;
INSERT INTO `_notification_settings` VALUES (1,'project_created','project',0,0,0,'','','',1,0),(2,'project_deleted','project',0,0,0,'','','',2,0),(3,'project_task_created','project',0,1,0,'','','task_assignee,task_collaborators',3,0),(4,'project_task_updated','project',0,1,0,'','','task_assignee,task_collaborators',4,0),(5,'project_task_assigned','project',0,1,0,'','','task_assignee,task_collaborators',5,0),(7,'project_task_started','project',0,0,0,'','','',7,0),(8,'project_task_finished','project',0,0,0,'','','',8,0),(9,'project_task_reopened','project',0,0,0,'','','',9,0),(10,'project_task_deleted','project',0,1,0,'','','task_assignee,task_collaborators',10,0),(11,'project_task_commented','project',0,1,0,'','','task_assignee,task_collaborators,mentioned_members',11,0),(12,'project_member_added','project',0,1,0,'','','project_members',12,0),(13,'project_member_deleted','project',0,1,0,'','','project_members',13,0),(14,'project_file_added','project',0,1,0,'','','project_members',14,0),(15,'project_file_deleted','project',0,1,0,'','','project_members',15,0),(16,'project_file_commented','project',0,1,0,'','','project_members,mentioned_members',16,0),(17,'project_comment_added','project',0,1,0,'','','project_members,mentioned_members',17,0),(18,'project_comment_replied','project',0,1,0,'','','project_members,comment_creator,mentioned_members',18,0),(19,'project_customer_feedback_added','project',0,1,0,'','','project_members,mentioned_members',19,0),(20,'project_customer_feedback_replied','project',0,1,0,'','','project_members,client_primary_contact,comment_creator,mentioned_members',20,0),(21,'client_signup','client',0,0,0,'','','',21,0),(22,'invoice_online_payment_received','invoice',0,0,0,'','','',22,0),(23,'leave_application_submitted','leave',0,0,0,'','','',23,0),(24,'leave_approved','leave',0,1,0,'','','leave_applicant',24,0),(25,'leave_assigned','leave',0,1,0,'','','leave_applicant',25,0),(26,'leave_rejected','leave',0,1,0,'','','leave_applicant',26,0),(27,'leave_canceled','leave',0,0,0,'','','',27,0),(28,'ticket_created','ticket',0,0,0,'','','ticket_assignee',28,0),(29,'ticket_commented','ticket',0,1,0,'','','client_primary_contact,ticket_creator,ticket_assignee',29,0),(30,'ticket_closed','ticket',0,1,0,'','','client_primary_contact,ticket_creator,ticket_assignee',30,0),(31,'ticket_reopened','ticket',0,1,0,'','','client_primary_contact,ticket_creator,ticket_assignee',31,0),(32,'estimate_request_received','estimate',0,0,0,'','','',32,0),(34,'estimate_accepted','estimate',0,0,0,'','','',34,0),(35,'estimate_rejected','estimate',0,0,0,'','','',35,0),(36,'new_message_sent','message',0,0,0,'','','',36,0),(37,'message_reply_sent','message',0,0,0,'','','',37,0),(38,'invoice_payment_confirmation','invoice',0,0,0,'','','',22,0),(39,'new_event_added_in_calendar','event',0,1,0,'','','recipient',39,0),(40,'recurring_invoice_created_vai_cron_job','invoice',0,0,0,'','','client_primary_contact',22,0),(41,'new_announcement_created','announcement',0,1,0,'','','recipient',41,0),(42,'invoice_due_reminder_before_due_date','invoice',0,1,0,'','','client_primary_contact',22,0),(43,'invoice_overdue_reminder','invoice',0,1,0,'','','client_primary_contact',22,0),(44,'recurring_invoice_creation_reminder','invoice',0,0,0,'','','',22,0),(45,'project_completed','project',0,0,0,'','','',2,0),(46,'lead_created','lead',0,0,0,'','','',21,0),(47,'client_created_from_lead','lead',0,0,0,'','','',21,0),(48,'project_task_deadline_pre_reminder','project',0,1,0,'','','task_assignee',20,0),(49,'project_task_reminder_on_the_day_of_deadline','project',0,1,0,'','','task_assignee',20,0),(50,'project_task_deadline_overdue_reminder','project',0,1,0,'','','task_assignee',20,0),(51,'recurring_task_created_via_cron_job','project',0,1,0,'','','project_members,task_assignee',20,0),(52,'calendar_event_modified','event',0,0,0,'','','',39,0),(53,'client_contact_requested_account_removal','client',0,0,0,'','','',21,0),(54,'bitbucket_push_received','project',0,0,0,'','','',45,0),(55,'github_push_received','project',0,0,0,'','','',45,0),(56,'invited_client_contact_signed_up','client',0,0,0,'','','',21,0),(57,'created_a_new_post','timeline',0,0,0,'','','',52,0),(58,'timeline_post_commented','timeline',0,1,0,'','','post_creator',52,0),(59,'ticket_assigned','ticket',0,1,0,'','','ticket_assignee',31,0),(60,'new_order_received','order',0,0,0,'','','',1,0),(61,'order_status_updated','order',0,0,0,'','','',2,0),(62,'proposal_accepted','proposal',0,0,0,'','','',34,0),(63,'proposal_rejected','proposal',0,0,0,'','','',35,0),(64,'estimate_commented','estimate',0,0,0,'','','',35,0),(65,'invoice_manual_payment_added','invoice',0,0,0,'','','',22,0),(66,'contract_accepted','contract',0,0,0,'','','',66,0),(67,'contract_rejected','contract',0,0,0,'','','',67,0),(68,'subscription_request_sent','subscription',0,1,0,'','','client_primary_contact',68,0),(69,'subscription_started','subscription',0,1,0,'','','client_primary_contact',68,0),(70,'subscription_invoice_created_via_cron_job','subscription',0,1,0,'','','client_primary_contact',68,0),(71,'general_task_created','general_task',0,1,0,'','','task_assignee,task_collaborators',69,0),(72,'general_task_updated','general_task',0,1,0,'','','task_assignee,task_collaborators',70,0),(73,'general_task_assigned','general_task',0,1,0,'','','task_assignee,task_collaborators',71,0),(74,'general_task_started','general_task',0,0,0,'','','',72,0),(75,'general_task_finished','general_task',0,0,0,'','','',73,0),(76,'general_task_reopened','general_task',0,0,0,'','','',74,0),(77,'general_task_deleted','general_task',0,1,0,'','','task_assignee,task_collaborators',75,0),(78,'general_task_commented','general_task',0,1,0,'','','task_assignee,task_collaborators,mentioned_members',76,0),(79,'proposal_commented','proposal',0,0,0,'','','',77,0),(80,'subscription_cancelled','subscription',0,0,0,'','','',68,0),(81,'proposal_preview_opened','proposal',0,0,0,'','','',77,0),(82,'proposal_email_opened','proposal',0,0,0,'','','',77,0),(83,'subscription_renewal_reminder','subscription',0,0,0,'','','',68,0);
/*!40000 ALTER TABLE `_notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_notifications`
--

DROP TABLE IF EXISTS `_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `notify_to` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `event` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL,
  `task_id` int NOT NULL,
  `project_comment_id` int NOT NULL,
  `ticket_id` int NOT NULL,
  `ticket_comment_id` int NOT NULL,
  `project_file_id` int NOT NULL,
  `leave_id` int NOT NULL,
  `post_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `activity_log_id` int NOT NULL,
  `client_id` int NOT NULL,
  `lead_id` int NOT NULL,
  `invoice_payment_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  `estimate_id` int NOT NULL,
  `contract_id` int NOT NULL,
  `order_id` int NOT NULL,
  `estimate_request_id` int NOT NULL,
  `actual_message_id` int NOT NULL,
  `parent_message_id` int NOT NULL,
  `event_id` int NOT NULL,
  `announcement_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `estimate_comment_id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `expense_id` int NOT NULL,
  `proposal_comment_id` int NOT NULL,
  `reminder_log_id` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_notifications`
--

LOCK TABLES `_notifications` WRITE;
/*!40000 ALTER TABLE `_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_order_items`
--

DROP TABLE IF EXISTS `_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `order_id` int NOT NULL,
  `created_by` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_hash` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_order_items`
--

LOCK TABLES `_order_items` WRITE;
/*!40000 ALTER TABLE `_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_order_status`
--

DROP TABLE IF EXISTS `_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_order_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_order_status`
--

LOCK TABLES `_order_status` WRITE;
/*!40000 ALTER TABLE `_order_status` DISABLE KEYS */;
INSERT INTO `_order_status` VALUES (1,'New','#f1c40f',0,0),(2,'Processing','#29c2c2',1,0),(3,'Confirmed','#83c340',2,0);
/*!40000 ALTER TABLE `_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_orders`
--

DROP TABLE IF EXISTS `_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `order_date` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status_id` int NOT NULL,
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `project_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_by_hash` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_orders`
--

LOCK TABLES `_orders` WRITE;
/*!40000 ALTER TABLE `_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_pages`
--

DROP TABLE IF EXISTS `_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `slug` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `internal_use_only` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_team_members_only` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_clients_only` tinyint(1) NOT NULL DEFAULT '0',
  `full_width` tinyint(1) NOT NULL DEFAULT '0',
  `hide_topbar` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_pages`
--

LOCK TABLES `_pages` WRITE;
/*!40000 ALTER TABLE `_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_payment_methods`
--

DROP TABLE IF EXISTS `_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_payment_methods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'custom',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `online_payable` tinyint(1) NOT NULL DEFAULT '0',
  `available_on_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_payment_amount` double NOT NULL DEFAULT '0',
  `settings` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_payment_methods`
--

LOCK TABLES `_payment_methods` WRITE;
/*!40000 ALTER TABLE `_payment_methods` DISABLE KEYS */;
INSERT INTO `_payment_methods` VALUES (1,'Cash','custom','Cash payments',0,0,0,'',0,0),(2,'Stripe','stripe','Stripe online payments',1,0,0,'a:3:{s:15:\"pay_button_text\";s:6:\"Stripe\";s:10:\"secret_key\";s:6:\"\";s:15:\"publishable_key\";s:6:\"\";}',0,0),(3,'PayPal Payments Standard','paypal_payments_standard','PayPal Payments Standard Online Payments',1,0,0,'a:4:{s:15:\"pay_button_text\";s:6:\"PayPal\";s:5:\"email\";s:4:\"\";s:11:\"paypal_live\";s:1:\"0\";s:5:\"debug\";s:1:\"0\";}',0,0),(4,'Paytm','paytm','Paytm online payments',1,0,0,'',0,0),(5,'Client Wallet','client_wallet','Client wallet to store and allocate funds to invoices',0,0,0,'',0,0);
/*!40000 ALTER TABLE `_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_paypal_ipn`
--

DROP TABLE IF EXISTS `_paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_paypal_ipn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `verification_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_verification_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_id` int NOT NULL,
  `contact_user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_paypal_ipn`
--

LOCK TABLES `_paypal_ipn` WRITE;
/*!40000 ALTER TABLE `_paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `_paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_pin_comments`
--

DROP TABLE IF EXISTS `_pin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_pin_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_comment_id` int NOT NULL DEFAULT '0',
  `ticket_comment_id` int NOT NULL DEFAULT '0',
  `pinned_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_pin_comments`
--

LOCK TABLES `_pin_comments` WRITE;
/*!40000 ALTER TABLE `_pin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `_pin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_posts`
--

DROP TABLE IF EXISTS `_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `post_id` int NOT NULL,
  `share_with` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_posts`
--

LOCK TABLES `_posts` WRITE;
/*!40000 ALTER TABLE `_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_project_comments`
--

DROP TABLE IF EXISTS `_project_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_project_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `comment_id` int NOT NULL DEFAULT '0',
  `task_id` int NOT NULL DEFAULT '0',
  `file_id` int NOT NULL DEFAULT '0',
  `customer_feedback_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_project_comments`
--

LOCK TABLES `_project_comments` WRITE;
/*!40000 ALTER TABLE `_project_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `_project_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_project_files`
--

DROP TABLE IF EXISTS `_project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_project_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `file_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `service_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `project_id` int NOT NULL,
  `uploaded_by` int NOT NULL,
  `category_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `folder_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_project_files`
--

LOCK TABLES `_project_files` WRITE;
/*!40000 ALTER TABLE `_project_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `_project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_project_members`
--

DROP TABLE IF EXISTS `_project_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_project_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `project_id` int NOT NULL,
  `is_leader` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_project_members`
--

LOCK TABLES `_project_members` WRITE;
/*!40000 ALTER TABLE `_project_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `_project_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_project_settings`
--

DROP TABLE IF EXISTS `_project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_project_settings` (
  `project_id` int NOT NULL,
  `setting_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `unique_index` (`project_id`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_project_settings`
--

LOCK TABLES `_project_settings` WRITE;
/*!40000 ALTER TABLE `_project_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `_project_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_project_status`
--

DROP TABLE IF EXISTS `_project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_project_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `title_language_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `key_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_project_status`
--

LOCK TABLES `_project_status` WRITE;
/*!40000 ALTER TABLE `_project_status` DISABLE KEYS */;
INSERT INTO `_project_status` VALUES (1,'Open','open','open','grid',0),(2,'Completed','completed','completed','check-circle',0),(3,'Hold','hold','','pause-circle',0),(4,'Canceled','canceled','','x-circle',0);
/*!40000 ALTER TABLE `_project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_project_time`
--

DROP TABLE IF EXISTS `_project_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_project_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL,
  `user_id` int NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `hours` float NOT NULL,
  `status` enum('open','logged','approved') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'logged',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `task_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_project_time`
--

LOCK TABLES `_project_time` WRITE;
/*!40000 ALTER TABLE `_project_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `_project_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_projects`
--

DROP TABLE IF EXISTS `_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `project_type` enum('client_project','internal_project') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'client_project',
  `start_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `client_id` int NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `status` enum('open','completed','hold','canceled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'open',
  `status_id` int NOT NULL DEFAULT '1',
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `starred_by` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `estimate_id` int NOT NULL,
  `order_id` int NOT NULL,
  `proposal_id` int DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_projects`
--

LOCK TABLES `_projects` WRITE;
/*!40000 ALTER TABLE `_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_proposal_comments`
--

DROP TABLE IF EXISTS `_proposal_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_proposal_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `proposal_id` int NOT NULL DEFAULT '0',
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_proposal_comments`
--

LOCK TABLES `_proposal_comments` WRITE;
/*!40000 ALTER TABLE `_proposal_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `_proposal_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_proposal_items`
--

DROP TABLE IF EXISTS `_proposal_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_proposal_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `proposal_id` int NOT NULL,
  `item_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_proposal_items`
--

LOCK TABLES `_proposal_items` WRITE;
/*!40000 ALTER TABLE `_proposal_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_proposal_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_proposal_templates`
--

DROP TABLE IF EXISTS `_proposal_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_proposal_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `template` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_proposal_templates`
--

LOCK TABLES `_proposal_templates` WRITE;
/*!40000 ALTER TABLE `_proposal_templates` DISABLE KEYS */;
INSERT INTO `_proposal_templates` VALUES (1,'Template 3.9','<p><br></p>\r\n<p><br></p>\r\n<p><br></p>\r\n<h1 style=\"text-align: center;\">Web Design Proposal</h1>\r\n<p style=\"text-align: center;\"><br></p>\r\n\r\n\r\n<p><img src=\"/assets/images/image_preview.png\" style=\"width: 100%;\"><br>\r\n</p>\r\n<p><br></p>\r\n<p style=\"text-align: justify;\">In response to the growing demands and opportunities within the industry, we propose to develop a comprehensive solution tailored to address key challenges and capitalize on emerging trends. Our proposal aims to deliver tangible value by leveraging our expertise, innovative approaches, and commitment to excellence.</p>\r\n<p style=\"text-align: justify;\"><br></p>\r\n<p><br></p>\r\n<h3 style=\"text-align: left;\">{PROPOSAL_ID}</h3>\r\n<p style=\"text-align: left;\">Issued on {PROPOSAL_DATE}. Please note: this proposal expires on {PROPOSAL_EXPIRY_DATE}.</p>\r\n<p style=\"text-align: left;\"><br></p>\r\n<p style=\"text-align: left;\">To:</p>\r\n<p style=\"text-align: left;\">{PROPOSAL_TO_INFO}</p>\r\n<p style=\"text-align: left;\"><br></p>\r\n<p style=\"text-align: left;\">Proposal from:&nbsp;</p>\r\n<p style=\"text-align: left;\">{COMPANY_INFO}</p>\r\n<p><br></p>\r\n<p><br></p>\r\n<h3>Our Best Offer</h3>\r\n<p>In consideration of your unique needs and aspirations, we are pleased to present our best offer, crafted with meticulous attention to detail and driven by a commitment to delivering exceptional value.</p>\r\n<p>{PROPOSAL_ITEMS}</p>\r\n<p><br></p>\r\n<h3><br></h3>\r\n<h3><br></h3>\r\n<h3>Our Objective</h3>\r\n<p>Our objective is to align seamlessly with your business goals, leveraging our expertise and resources to drive tangible results and foster long-term success. Through a collaborative partnership, we aim to understand your unique challenges, opportunities, and aspirations, enabling us to tailor our approach to meet your specific needs. By focusing on measurable outcomes, continuous improvement, and proactive communication, we are committed to exceeding your expectations and establishing a foundation for sustained growth and competitiveness in a dynamic business environment.</p>\r\n<p><img src=\"/assets/images/image_preview.png\" style=\"width: 100%;\"><br>\r\n</p>\r\n<p><br></p>\r\n<p><br></p>\r\n<p><br></p>\r\n<p><br></p>\r\n<p><br></p>\r\n<p><br></p>\r\n<h3>Our Portfolio</h3>\r\n<p>Some of our recent work here:</p>\r\n<table class=\"table table-bordered\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p>\r\n<span class=\"timeline-images inline-block\"><img class=\"pasted-image\" src=\"/assets/images/image_preview.png\"></span><br>\r\n</p>\r\n</td>\r\n<td>\r\n<p>\r\n<span class=\"timeline-images inline-block\"><img class=\"pasted-image\" src=\"/assets/images/image_preview.png\"></span>\r\n</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>\r\n<span class=\"timeline-images inline-block\"><img class=\"pasted-image\" src=\"/assets/images/image_preview.png\"></span>\r\n</p>\r\n</td>\r\n<td>\r\n<p>\r\n<span class=\"timeline-images inline-block\"><img class=\"pasted-image\" src=\"/assets/images/image_preview.png\"></span>\r\n\r\n</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br></p>\r\n<h3>Let’s Connect</h3>\r\n<p>We are excited about the chance to collaborate. Drop us a line at {COMPANY_EMAIL} or give us a call at {COMPANY_PHONE} — we would love to hear from you.</p>',0);
/*!40000 ALTER TABLE `_proposal_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_proposals`
--

DROP TABLE IF EXISTS `_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_proposals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `proposal_date` date NOT NULL,
  `valid_until` date NOT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `last_email_sent_date` date DEFAULT NULL,
  `status` enum('draft','sent','accepted','declined') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `discount_type` enum('before_tax','after_tax') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `discount_amount` double NOT NULL,
  `discount_amount_type` enum('percentage','fixed_amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `public_key` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accepted_by` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL DEFAULT '0',
  `total_views` int NOT NULL DEFAULT '0',
  `last_preview_seen` datetime DEFAULT NULL,
  `meta_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `project_id` int DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_proposals`
--

LOCK TABLES `_proposals` WRITE;
/*!40000 ALTER TABLE `_proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_reminder_logs`
--

DROP TABLE IF EXISTS `_reminder_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_reminder_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `context_id` int NOT NULL,
  `reminder_event` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `notification_status` enum('draft','completed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `reminder_date` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_reminder_logs`
--

LOCK TABLES `_reminder_logs` WRITE;
/*!40000 ALTER TABLE `_reminder_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `_reminder_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_reminder_settings`
--

DROP TABLE IF EXISTS `_reminder_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_reminder_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'app',
  `context` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reminder_event` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `reminder1` int DEFAULT NULL,
  `reminder2` int DEFAULT NULL,
  `reminder3` int DEFAULT NULL,
  `reminder4` int DEFAULT NULL,
  `reminder5` int DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_reminder_settings`
--

LOCK TABLES `_reminder_settings` WRITE;
/*!40000 ALTER TABLE `_reminder_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `_reminder_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_roles`
--

DROP TABLE IF EXISTS `_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `permissions` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_roles`
--

LOCK TABLES `_roles` WRITE;
/*!40000 ALTER TABLE `_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_settings`
--

DROP TABLE IF EXISTS `_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_settings` (
  `setting_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'app',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_settings`
--

LOCK TABLES `_settings` WRITE;
/*!40000 ALTER TABLE `_settings` DISABLE KEYS */;
INSERT INTO `_settings` VALUES ('accepted_file_formats','jpg,jpeg,png,doc,xlsx,txt,pdf,zip,webm','app',0),('allowed_ip_addresses','','app',0),('app_title','RISE - Ultimate Project Manager and CRM','app',0),('contract_color','#000000','app',0),('currency_symbol','$','app',0),('date_format','Y-m-d','app',0),('decimal_separator','.','app',0),('default_contract_template','1','app',0),('default_currency','USD','app',0),('default_due_date_after_billing_date','14','app',0),('default_permissions_for_non_primary_contact','projects','app',0),('default_proposal_template','1','app',0),('default_theme_color','F2F2F2','app',0),('email_sent_from_address','rahul@gmail.com','app',0),('email_sent_from_name','Rahul ','app',0),('enable_audio_recording','1','app',0),('estimate_color','#000000','app',0),('first_day_of_week','0','app',0),('invoice_color','#000000','app',0),('invoice_item_list_background','#f4f4f4','app',0),('invoice_logo','default-invoice-logo.png','app',0),('invoice_number_format','{SERIAL}','app',0),('invoice_prefix','INVOICE #','app',0),('item_purchase_code','1','app',0),('module_announcement','1','app',0),('module_attendance','1','app',0),('module_chat','1','app',0),('module_contract','1','app',0),('module_estimate','1','app',0),('module_estimate_request','1','app',0),('module_event','1','app',0),('module_expense','1','app',0),('module_file_manager','1','app',0),('module_gantt','1','app',0),('module_help','1','app',0),('module_invoice','1','app',0),('module_knowledge_base','1','app',0),('module_lead','1','app',0),('module_leave','1','app',0),('module_message','1','app',0),('module_note','1','app',0),('module_order','1','app',0),('module_project_timesheet','1','app',0),('module_proposal','1','app',0),('module_reminder','1','app',0),('module_subscription','1','app',0),('module_ticket','1','app',0),('module_timeline','1','app',0),('module_todo','1','app',0),('order_color','#000000','app',0),('proposal_color','#000000','app',0),('show_the_status_checkbox_in_tasks_list','1','app',0),('show_theme_color_changer','yes','app',0),('signin_page_background','sigin-background-image.jpg','app',0),('site_logo','default-stie-logo.png','app',0),('task_point_range','5','app',0),('time_format','small','app',0),('timezone','UTC','app',0),('user_1_dashboard','','user',0);
/*!40000 ALTER TABLE `_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_social_links`
--

DROP TABLE IF EXISTS `_social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_social_links` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `facebook` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `twitter` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `linkedin` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `googleplus` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `digg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `youtube` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `pinterest` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `instagram` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `github` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `tumblr` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `vine` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `whatsapp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_social_links`
--

LOCK TABLES `_social_links` WRITE;
/*!40000 ALTER TABLE `_social_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `_social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_stripe_ipn`
--

DROP TABLE IF EXISTS `_stripe_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_stripe_ipn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `verification_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payment_verification_code` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `invoice_id` int NOT NULL,
  `contact_user_id` int NOT NULL,
  `client_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `setup_intent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `subscription_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_stripe_ipn`
--

LOCK TABLES `_stripe_ipn` WRITE;
/*!40000 ALTER TABLE `_stripe_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `_stripe_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_subscription_items`
--

DROP TABLE IF EXISTS `_subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_subscription_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `quantity` double NOT NULL,
  `unit_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rate` double NOT NULL,
  `total` double NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `subscription_id` int NOT NULL,
  `item_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_subscription_items`
--

LOCK TABLES `_subscription_items` WRITE;
/*!40000 ALTER TABLE `_subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `_subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_subscriptions`
--

DROP TABLE IF EXISTS `_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `client_id` int NOT NULL,
  `bill_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('draft','pending','active','cancelled') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'draft',
  `payment_status` enum('success','failed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'success',
  `tax_id` int NOT NULL DEFAULT '0',
  `tax_id2` int NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '1',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `next_recurring_date` date DEFAULT NULL,
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `cancelled_at` datetime DEFAULT NULL,
  `cancelled_by` int NOT NULL,
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `company_id` int NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('app','stripe') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'app',
  `stripe_subscription_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `stripe_product_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `stripe_product_price_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_subscriptions`
--

LOCK TABLES `_subscriptions` WRITE;
/*!40000 ALTER TABLE `_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_task_priority`
--

DROP TABLE IF EXISTS `_task_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_task_priority` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_task_priority`
--

LOCK TABLES `_task_priority` WRITE;
/*!40000 ALTER TABLE `_task_priority` DISABLE KEYS */;
INSERT INTO `_task_priority` VALUES (1,'Minor','arrow-down','#aab7b7',0),(2,'Major','arrow-up','#e18a00',0),(3,'Critical ','alert-circle','#ad159e',0),(4,'Blocker ','alert-octagon','#e74c3c',0);
/*!40000 ALTER TABLE `_task_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_task_status`
--

DROP TABLE IF EXISTS `_task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_task_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `key_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL,
  `hide_from_kanban` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `hide_from_non_project_related_tasks` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_task_status`
--

LOCK TABLES `_task_status` WRITE;
/*!40000 ALTER TABLE `_task_status` DISABLE KEYS */;
INSERT INTO `_task_status` VALUES (1,'To Do','to_do','#F9A52D',0,0,0,0),(2,'In progress','in_progress','#1672B9',1,0,0,0),(3,'Done','done','#00B393',2,0,0,0);
/*!40000 ALTER TABLE `_task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tasks`
--

DROP TABLE IF EXISTS `_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `project_id` int NOT NULL,
  `milestone_id` int NOT NULL DEFAULT '0',
  `assigned_to` int NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `points` tinyint NOT NULL DEFAULT '1',
  `status` enum('to_do','in_progress','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'to_do',
  `status_id` int NOT NULL,
  `priority_id` int NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `collaborators` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `recurring` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_every` int NOT NULL DEFAULT '0',
  `repeat_type` enum('days','weeks','months','years') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `no_of_cycles` int NOT NULL DEFAULT '0',
  `recurring_task_id` int NOT NULL DEFAULT '0',
  `no_of_cycles_completed` int NOT NULL DEFAULT '0',
  `created_date` date DEFAULT NULL,
  `blocking` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `blocked_by` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `parent_task_id` int NOT NULL,
  `next_recurring_date` date DEFAULT NULL,
  `reminder_date` date DEFAULT NULL,
  `ticket_id` int NOT NULL,
  `status_changed_at` datetime DEFAULT NULL,
  `deleted` tinyint NOT NULL DEFAULT '0',
  `expense_id` int NOT NULL DEFAULT '0',
  `subscription_id` int NOT NULL DEFAULT '0',
  `proposal_id` int NOT NULL DEFAULT '0',
  `contract_id` int NOT NULL DEFAULT '0',
  `order_id` int NOT NULL DEFAULT '0',
  `estimate_id` int NOT NULL DEFAULT '0',
  `invoice_id` int NOT NULL DEFAULT '0',
  `lead_id` int NOT NULL DEFAULT '0',
  `client_id` int NOT NULL DEFAULT '0',
  `context` enum('project','client','lead','invoice','estimate','order','contract','proposal','subscription','ticket','expense','general') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'general',
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `priority_id` (`priority_id`),
  KEY `sort` (`sort`),
  KEY `project_id` (`project_id`),
  KEY `milestone_id` (`milestone_id`),
  KEY `assigned_to` (`assigned_to`),
  KEY `ticket_id` (`ticket_id`),
  KEY `client_id` (`client_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `estimate_id` (`estimate_id`),
  KEY `order_id` (`order_id`),
  KEY `contract_id` (`contract_id`),
  KEY `proposal_id` (`proposal_id`),
  KEY `subscription_id` (`subscription_id`),
  KEY `expense_id` (`expense_id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tasks`
--

LOCK TABLES `_tasks` WRITE;
/*!40000 ALTER TABLE `_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_taxes`
--

DROP TABLE IF EXISTS `_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_taxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `percentage` double NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_tax_id` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_taxes`
--

LOCK TABLES `_taxes` WRITE;
/*!40000 ALTER TABLE `_taxes` DISABLE KEYS */;
INSERT INTO `_taxes` VALUES (1,'Tax (10%)',10,0,'');
/*!40000 ALTER TABLE `_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_team`
--

DROP TABLE IF EXISTS `_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `members` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_team`
--

LOCK TABLES `_team` WRITE;
/*!40000 ALTER TABLE `_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_team_member_job_info`
--

DROP TABLE IF EXISTS `_team_member_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_team_member_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date_of_hire` date DEFAULT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `salary` double NOT NULL DEFAULT '0',
  `salary_term` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_team_member_job_info`
--

LOCK TABLES `_team_member_job_info` WRITE;
/*!40000 ALTER TABLE `_team_member_job_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `_team_member_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ticket_comments`
--

DROP TABLE IF EXISTS `_ticket_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ticket_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ticket_id` int NOT NULL,
  `files` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `is_note` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ticket_comments`
--

LOCK TABLES `_ticket_comments` WRITE;
/*!40000 ALTER TABLE `_ticket_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `_ticket_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ticket_templates`
--

DROP TABLE IF EXISTS `_ticket_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ticket_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ticket_type_id` int NOT NULL,
  `private` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ticket_templates`
--

LOCK TABLES `_ticket_templates` WRITE;
/*!40000 ALTER TABLE `_ticket_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `_ticket_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ticket_types`
--

DROP TABLE IF EXISTS `_ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ticket_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ticket_types`
--

LOCK TABLES `_ticket_types` WRITE;
/*!40000 ALTER TABLE `_ticket_types` DISABLE KEYS */;
INSERT INTO `_ticket_types` VALUES (1,'General Support',0);
/*!40000 ALTER TABLE `_ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_tickets`
--

DROP TABLE IF EXISTS `_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `project_id` int NOT NULL DEFAULT '0',
  `ticket_type_id` int NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `requested_by` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `status` enum('new','client_replied','open','closed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'new',
  `last_activity_at` datetime DEFAULT NULL,
  `assigned_to` int NOT NULL DEFAULT '0',
  `creator_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `creator_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `task_id` int NOT NULL,
  `closed_at` datetime NOT NULL,
  `merged_with_ticket_id` int NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `cc_contacts_and_emails` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `client_last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `ticket_type_id` (`ticket_type_id`),
  KEY `assigned_to` (`assigned_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_tickets`
--

LOCK TABLES `_tickets` WRITE;
/*!40000 ALTER TABLE `_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_to_do`
--

DROP TABLE IF EXISTS `_to_do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_to_do` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by` int NOT NULL,
  `created_at` datetime NOT NULL,
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `labels` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('to_do','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'to_do',
  `start_date` date DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `files` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `sort` double NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_to_do`
--

LOCK TABLES `_to_do` WRITE;
/*!40000 ALTER TABLE `_to_do` DISABLE KEYS */;
/*!40000 ALTER TABLE `_to_do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_users`
--

DROP TABLE IF EXISTS `_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_type` enum('staff','client','lead') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` enum('active','inactive') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'active',
  `message_checked_at` datetime DEFAULT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `notification_checked_at` datetime DEFAULT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `job_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Untitled',
  `disable_login` tinyint(1) NOT NULL DEFAULT '0',
  `note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `alternative_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sticky_note` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `skype` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `language` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `enable_web_notification` tinyint(1) NOT NULL DEFAULT '1',
  `enable_email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `last_online` datetime DEFAULT NULL,
  `requested_account_removal` tinyint(1) NOT NULL DEFAULT '0',
  `client_permissions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_type` (`user_type`),
  KEY `email` (`email`),
  KEY `client_id` (`client_id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_users`
--

LOCK TABLES `_users` WRITE;
/*!40000 ALTER TABLE `_users` DISABLE KEYS */;
INSERT INTO `_users` VALUES (1,'Rahul ','kumar','staff',1,0,'rahul@gmail.com','$2y$10$tnc.vcuAog1q/BWd3nNoPu.MVjMtRlQiKwwB5AbJjez3yn2AhCsze',NULL,'active',NULL,0,NULL,0,'Admin',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'male',NULL,NULL,'',1,1,'0000-00-00 00:00:00','2025-09-02 16:06:53',0,NULL,0);
/*!40000 ALTER TABLE `_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_verification`
--

DROP TABLE IF EXISTS `_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_verification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` enum('invoice_payment','reset_password','verify_email','invitation') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `params` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_verification`
--

LOCK TABLES `_verification` WRITE;
/*!40000 ALTER TABLE `_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `_verification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02 21:37:13
