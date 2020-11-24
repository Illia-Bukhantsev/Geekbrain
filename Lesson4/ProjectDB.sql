-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: tundish
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `cleaning`
--

DROP TABLE IF EXISTS `cleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cleaned_by` bigint unsigned NOT NULL,
  `Comments` text,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `done_by` (`cleaned_by`),
  CONSTRAINT `cleaning_ibfk_1` FOREIGN KEY (`cleaned_by`) REFERENCES `tundish_operators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning`
--

LOCK TABLES `cleaning` WRITE;
/*!40000 ALTER TABLE `cleaning` DISABLE KEYS */;
/*!40000 ALTER TABLE `cleaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raw_materails`
--

DROP TABLE IF EXISTS `raw_materails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raw_materails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `done_by` bigint unsigned NOT NULL,
  `material_supplier` varchar(20) DEFAULT NULL,
  `Comments` text,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `done_by` (`done_by`),
  CONSTRAINT `raw_materails_ibfk_1` FOREIGN KEY (`done_by`) REFERENCES `tundish_operators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_materails`
--

LOCK TABLES `raw_materails` WRITE;
/*!40000 ALTER TABLE `raw_materails` DISABLE KEYS */;
/*!40000 ALTER TABLE `raw_materails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skull_evacuation`
--

DROP TABLE IF EXISTS `skull_evacuation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skull_evacuation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `done_by` bigint unsigned NOT NULL,
  `Comments` text,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `done_by` (`done_by`),
  CONSTRAINT `skull_evacuation_ibfk_1` FOREIGN KEY (`done_by`) REFERENCES `tundish_operators` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skull_evacuation`
--

LOCK TABLES `skull_evacuation` WRITE;
/*!40000 ALTER TABLE `skull_evacuation` DISABLE KEYS */;
/*!40000 ALTER TABLE `skull_evacuation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tundish_operators`
--

DROP TABLE IF EXISTS `tundish_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tundish_operators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `Shift` enum('A','B','C','D') DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `password` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `Shift` (`Shift`),
  KEY `tundish_operators_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tundish_operators`
--

LOCK TABLES `tundish_operators` WRITE;
/*!40000 ALTER TABLE `tundish_operators` DISABLE KEYS */;
/*!40000 ALTER TABLE `tundish_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tundish'
--

--
-- Dumping routines for database 'tundish'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-24 18:00:00
