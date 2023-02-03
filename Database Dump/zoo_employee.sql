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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `FName` varchar(45) NOT NULL,
  `MInitial` varchar(1) DEFAULT NULL,
  `LName` varchar(45) NOT NULL,
  `ID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `Addr` tinytext NOT NULL,
  `Phone` tinytext NOT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Doggo','C','Goodboi',5,'1990-09-01','1234 Doggo Road','12345543210','M','1990-09-01','doggo@gmail.com','b863c1b4fae5e476d6ca4ba5f8172dab','Supervisor'),('John','M','Smith',10,'2014-10-10','1010 Road Rd','832-544-1010','M','2014-10-10','John@gmail.com','3bffe7a2bc163d273184e8902afe66b7','Employee'),('Eric','','Garcia',70,'2021-04-19','9115A Prairie Dr','123-456-7891','M','0000-00-00','garcia1999eric@gmail.com','f30aa7a662c728b7407c54ae6bfd27d1','Employee'),('Tim','T','Timmy',99,'1999-09-09','9999 Timmy Rd','1234567890','M','1965-08-09','Tim@gmail.com','a922b18efe9f3267cd99df1ca3eddc40','Employee'),('LoginTest','L','LoginTest',284,'2012-09-03','Login Rd','11284931251','F','1994-12-12','Login@gmail.com','99dea78007133396a7b8ed70578ac6ae','Supervisor'),('Will','P','Smalt',1532,'2000-04-16','1753 Cherry Ln','','M','1989-07-11','willpsmalthy@gmail.com','d41d8cd98f00b204e9800998ecf8427e','Employee'),('Jane','M','Doe',2212,'2021-04-20','123 example','281 555 2121','F','1999-01-01','example@gmail.com','b863c1b4fae5e476d6ca4ba5f8172dab','Supervisor');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Team4`@`%`*/ /*!50003 TRIGGER `zoo`.`employee_BEFORE_UPDATE` BEFORE UPDATE ON `employee` FOR EACH ROW
BEGIN
	IF NEW.ID <> OLD.ID THEN
		SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT = 'You cannot change a employee ID';
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
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Team4`@`%`*/ /*!50003 TRIGGER `zoo`.`employee_AFTER_UPDATE` AFTER UPDATE ON `employee` FOR EACH ROW
BEGIN
	IF NEW.ROLE <=> OLD.ROLE THEN
		INSERT INTO notifications(sent, name, type) VALUES (0, NEW.ID, 'Role Change');
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

-- Dump completed on 2021-04-25 16:40:13
