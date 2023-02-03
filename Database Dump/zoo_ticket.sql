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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Price` double NOT NULL,
  `Date` date NOT NULL,
  `Ticket Booth_BoothID` int(11) NOT NULL,
  `Member_Email` varchar(80) NOT NULL,
  PRIMARY KEY (`TicketID`,`Ticket Booth_BoothID`),
  KEY `fk_Ticket_Ticket Booth1_idx` (`Ticket Booth_BoothID`),
  KEY `fk_Ticket_Member1_idx` (`Member_Email`),
  CONSTRAINT `fk_Ticket_Member1` FOREIGN KEY (`Member_Email`) REFERENCES `member` (`Email`) ON DELETE CASCADE,
  CONSTRAINT `fk_Ticket_Ticket Booth1` FOREIGN KEY (`Ticket Booth_BoothID`) REFERENCES `ticket booth` (`BoothID`)
) ENGINE=InnoDB AUTO_INCREMENT=12369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (12348,20,'2021-04-20',1,'testing@gmail.com'),(12349,20,'2021-04-20',1,'testing@gmail.com'),(12350,20,'2021-04-20',1,'testing@gmail.com'),(12352,20,'2021-04-20',1,'testing@gmail.com'),(12353,20,'2021-04-20',1,'testing@gmail.com'),(12356,20,'2021-04-20',1,'testing@gmail.com'),(12362,15,'0000-00-00',5,'testing@gmail.com'),(12363,15,'2020-08-21',5,'testing@gmail.com'),(12364,15,'0000-00-00',5,'testing@gmail.com'),(12365,10,'2020-12-18',5,'testing@gmail.com'),(12366,15,'0000-00-00',5,'testing@gmail.com'),(12367,30,'2021-01-20',5,'testing@gmail.com'),(12368,20,'2021-04-20',1,'testing@gmail.com');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Team4`@`%`*/ /*!50003 TRIGGER `zoo`.`ticket_AFTER_INSERT` AFTER INSERT ON `ticket` FOR EACH ROW
BEGIN
	IF NEW.Member_Email IS NOT NULL THEN
		INSERT INTO notifications(sent, name, type) VALUES (0, NEW.Member_Email, 'Receipt');
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 16:40:16
