-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: team4zoodb.mysql.database.azure.com    Database: zoo
-- ------------------------------------------------------
-- Server version	5.6.47.0

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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` tinyint(4) DEFAULT NULL,
  `Name` varchar(45) NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,0,'Stuffed Lion','Low Stock Notice','2021-04-18 01:12:50'),(2,0,'Teddy Bear','Low Stock Notice','2021-04-18 01:17:47'),(3,0,'testing@gmail.com','Receipt','2021-04-18 01:12:50'),(4,0,'Stuffed Lion','Low Stock Notice','2021-04-18 01:12:50'),(5,0,'Teddy Bear','Low Stock Notice','2021-04-18 01:12:50'),(6,0,'testing@gmail.com','Receipt','2021-04-18 01:12:50'),(7,0,'testing@gmail.com','Receipt','2021-04-18 01:13:15'),(8,0,'testing@gmail.com','Receipt','2021-04-18 01:13:27'),(9,0,'1534','Role Change','2021-04-18 23:54:25'),(10,0,'Stuffed Lion','Low Stock Notice','2021-04-19 02:25:48'),(11,0,'Stuffed Lion','Low Stock Notice','2021-04-19 02:29:43'),(12,0,'Stuffed Lion','Low Stock Notice','2021-04-19 02:34:50'),(13,0,'Stuffed Lion','Low Stock Notice','2021-04-19 02:34:55'),(14,0,'10','Role Change','2021-04-20 01:52:58'),(15,0,'Stuffed Lion','Low Stock Notice','2021-04-20 03:51:58'),(16,0,'testing@gmail.com','Receipt','2021-04-20 04:59:35'),(17,0,'testing@gmail.com','Receipt','2021-04-20 20:50:20'),(18,0,'testing@gmail.com','Receipt','2021-04-20 20:55:17'),(19,0,'testing@gmail.com','Receipt','2021-04-20 20:55:27'),(20,0,'testing@gmail.com','Receipt','2021-04-20 20:55:35'),(21,0,'testing@gmail.com','Receipt','2021-04-20 20:55:48'),(22,0,'Stuffed Lion','Low Stock Notice','2021-04-20 21:01:57'),(23,0,'testing@gmail.com','Receipt','2021-04-20 21:09:43'),(24,0,'testing@gmail.com','Receipt','2021-04-20 21:09:53'),(25,0,'testing@gmail.com','Receipt','2021-04-20 21:10:02'),(26,0,'testing@gmail.com','Receipt','2021-04-20 21:14:13'),(27,0,'testing@gmail.com','Receipt','2021-04-20 21:14:18'),(28,0,'Doggo Toy','Low Stock Notice','2021-04-20 22:28:24'),(29,0,'testing@gmail.com','Receipt','2021-04-20 22:57:52'),(30,0,'Doggo Toy','Low Stock Notice','2021-04-20 23:24:45'),(31,0,'Doggo Toy','Low Stock Notice','2021-04-20 23:24:45'),(32,0,'Happy Kangaroo','Low Stock Notice','2021-04-20 23:48:08'),(33,0,'Stuffed Lion','Low Stock Notice','2021-04-21 00:51:30'),(34,0,'testing@gmail.com','Receipt','2021-04-21 00:53:47'),(35,0,'Stuffed Lion','Low Stock Notice','2021-04-21 01:05:22');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 16:40:18
