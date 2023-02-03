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
-- Table structure for table `employee_works_in`
--

DROP TABLE IF EXISTS `employee_works_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_works_in` (
  `GiftShop_ShopID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Ticket Booth_BoothID` int(11) NOT NULL,
  `Attraction_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `fk_GiftShop_has_Employee_Employee1_idx` (`Employee_ID`),
  KEY `fk_GiftShop_has_Employee_GiftShop1_idx` (`GiftShop_ShopID`),
  KEY `fk_GiftShop_has_Employee_Ticket Booth1_idx` (`Ticket Booth_BoothID`),
  KEY `fk_GiftShop_has_Employee_Attraction1_idx` (`Attraction_Name`),
  CONSTRAINT `fk_GiftShop_has_Employee_Attraction1` FOREIGN KEY (`Attraction_Name`) REFERENCES `attraction` (`Name`),
  CONSTRAINT `fk_GiftShop_has_Employee_Employee1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `fk_GiftShop_has_Employee_GiftShop1` FOREIGN KEY (`GiftShop_ShopID`) REFERENCES `giftshop` (`ShopID`),
  CONSTRAINT `fk_GiftShop_has_Employee_Ticket Booth1` FOREIGN KEY (`Ticket Booth_BoothID`) REFERENCES `ticket booth` (`BoothID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_works_in`
--

LOCK TABLES `employee_works_in` WRITE;
/*!40000 ALTER TABLE `employee_works_in` DISABLE KEYS */;
INSERT INTO `employee_works_in` VALUES (1,10,0,'None'),(0,70,0,'Bear Enclosure');
/*!40000 ALTER TABLE `employee_works_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 16:40:11
