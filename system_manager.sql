-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: system_manager
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environment` (
  `id_environment` int(11) NOT NULL AUTO_INCREMENT,
  `browser` varchar(45) NOT NULL,
  PRIMARY KEY (`id_environment`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` VALUES (1,'Google Chrome'),(2,'Firefox'),(3,'Yandex');
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link_tests`
--

DROP TABLE IF EXISTS `link_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `link_tests` (
  `id_link_tests` int(11) NOT NULL AUTO_INCREMENT,
  `id_test` int(11) NOT NULL,
  `id_test_suite` int(11) NOT NULL,
  PRIMARY KEY (`id_link_tests`),
  KEY `id_test_idx` (`id_test`),
  KEY `id_test_suite_idx` (`id_test_suite`),
  CONSTRAINT `id_test` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`),
  CONSTRAINT `id_test_suite` FOREIGN KEY (`id_test_suite`) REFERENCES `test_suite` (`id_test_suite`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link_tests`
--

LOCK TABLES `link_tests` WRITE;
/*!40000 ALTER TABLE `link_tests` DISABLE KEYS */;
INSERT INTO `link_tests` VALUES (1,1,1),(2,3,1),(3,1,2),(4,2,2);
/*!40000 ALTER TABLE `link_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id_results` int(11) NOT NULL AUTO_INCREMENT,
  `id_tester` int(11) NOT NULL,
  `id_link_tests` int(11) NOT NULL,
  `id_environment` int(11) NOT NULL,
  `№ver` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_results`),
  KEY `id_tester_idx` (`id_tester`),
  KEY `id_link_tests_idx` (`id_link_tests`),
  KEY `id_environment_idx` (`id_environment`),
  KEY `№ver_idx` (`№ver`),
  KEY `id_status_idx` (`id_status`),
  CONSTRAINT `id_environment` FOREIGN KEY (`id_environment`) REFERENCES `environment` (`id_environment`),
  CONSTRAINT `id_link_tests` FOREIGN KEY (`id_link_tests`) REFERENCES `link_tests` (`id_link_tests`),
  CONSTRAINT `id_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `id_tester` FOREIGN KEY (`id_tester`) REFERENCES `tester` (`id_tester`),
  CONSTRAINT `№ver` FOREIGN KEY (`№ver`) REFERENCES `version` (`id_version`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,1,1,1,1,'2020-01-11'),(2,1,2,1,1,3,'2020-01-11'),(3,3,3,2,2,1,'2020-01-13'),(4,3,4,2,2,2,'2020-01-13'),(5,4,3,3,3,1,'2020-01-15'),(6,4,4,3,3,1,'2020-01-15');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'ok'),(2,'error'),(3,'in the process');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_under_test`
--

DROP TABLE IF EXISTS `system_under_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_under_test` (
  `id_system_under_test` int(11) NOT NULL AUTO_INCREMENT,
  `name_system` varchar(45) NOT NULL,
  PRIMARY KEY (`id_system_under_test`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_under_test`
--

LOCK TABLES `system_under_test` WRITE;
/*!40000 ALTER TABLE `system_under_test` DISABLE KEYS */;
INSERT INTO `system_under_test` VALUES (1,'internet-shop');
/*!40000 ALTER TABLE `system_under_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `name_test` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id_test`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'knopka','proverka nazhatia'),(2,'registration','perehod on registration'),(3,'login to account','proverka vhoda');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_suite`
--

DROP TABLE IF EXISTS `test_suite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_suite` (
  `id_test_suite` int(11) NOT NULL AUTO_INCREMENT,
  `name_test_suite` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_test_suite`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_suite`
--

LOCK TABLES `test_suite` WRITE;
/*!40000 ALTER TABLE `test_suite` DISABLE KEYS */;
INSERT INTO `test_suite` VALUES (1,'proverka account'),(2,'proverka registration');
/*!40000 ALTER TABLE `test_suite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tester`
--

DROP TABLE IF EXISTS `tester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tester` (
  `id_tester` int(11) NOT NULL AUTO_INCREMENT,
  `name_tester` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tester`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tester`
--

LOCK TABLES `tester` WRITE;
/*!40000 ALTER TABLE `tester` DISABLE KEYS */;
INSERT INTO `tester` VALUES (1,'Vasya Pupkin'),(2,'Seva Potapov'),(3,'Hariton Gusev'),(4,'Galina Ermak'),(5,'KarpovSS'),(6,'KarpovSS'),(7,'KarpovSS'),(8,'KarpovSS'),(9,'KarpovSS'),(10,'Volodya'),(11,'KarpovSS');
/*!40000 ALTER TABLE `tester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `id_version` int(11) NOT NULL,
  `id_system` int(11) NOT NULL,
  PRIMARY KEY (`id_version`),
  KEY `id_system_idx` (`id_system`),
  CONSTRAINT `id_system` FOREIGN KEY (`id_system`) REFERENCES `system_under_test` (`id_system_under_test`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-24 15:57:14
