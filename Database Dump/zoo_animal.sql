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
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `Name` varchar(45) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `Breed` varchar(45) NOT NULL,
  `ArrivalDate` date NOT NULL,
  `Species` varchar(45) NOT NULL,
  `Diet` longtext NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `DeceasedDate` date DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `CarerID` int(11) NOT NULL,
  `Attraction_Name` varchar(45) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`CarerID`),
  KEY `fk_Animal_Attraction1_idx` (`Attraction_Name`),
  KEY `fk_Animal_Employee1_idx` (`Employee_ID`),
  CONSTRAINT `fk_Animal_Attraction1` FOREIGN KEY (`Attraction_Name`) REFERENCES `attraction` (`Name`),
  CONSTRAINT `fk_Animal_Employee1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES ('George',1,'Monkey','2012-01-01','Gorilla','Carnivore','M','2011-11-11','2013-01-03',10,'Monkey Attraction',10),('Alex',5,'Tiger','2021-10-14','South China Tiger','Carnivore','F','2021-04-13','2010-05-20',44,'Tiger Viewing',10),('Geralt',15,'Giraffe','2021-04-10','Longus Neckus','Herbivore','M',NULL,'2010-01-01',144423,'Viewing',10),('Bodhi',42,'Bear','2020-05-16','Polar Bear','Carnivore','M',NULL,'2016-08-17',99,'Bear Enclosure',99),('Alex',50,'Cat','2010-05-01','Black Cat','Carnivore','M','2021-01-20','2010-05-01',99,'Tiger Viewing',99),('John',61,'Bear','2021-07-20','Black Bear','Carnivore','F','2021-04-20','2010-08-19',99,'Bear Enclosure',99),('DoggoNotSupervisorDoggo',99,'Doggo','2005-07-15','Dog','Carnivore','F',NULL,'1932-02-04',10,'Viewing',10);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 16:40:12
