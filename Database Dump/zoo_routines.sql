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
-- Dumping events for database 'zoo'
--

--
-- Dumping routines for database 'zoo'
--
/*!50003 DROP PROCEDURE IF EXISTS `submitanimal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`Team4`@`%` PROCEDURE `submitanimal`(IN s_ID int(11), IN s_Name varchar(45), s_Breed varchar(45), s_ArrivalDate date, s_Species varchar(45), s_Diet longtext, s_Sex varchar(1), s_DOB date, s_CarerID int(11), s_Attraction_Name varchar(45), s_Employee_ID int(11))
BEGIN
	insert into zoo.animal(ID, Name, Breed, ArrivalDate, Species, Diet, Sex, DOB, CarerID, Attraction_Name, Employee_ID) values (s_ID, s_Name, s_Breed, s_ArrivalDate, s_Species, s_Diet, s_Sex, s_DOB, s_CarerID, s_Attraction_Name, s_Employee_ID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submitattraction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`Team4`@`%` PROCEDURE `submitattraction`(IN s_Name varchar(45), IN s_ManagerID varchar(45), IN s_AnimalID varchar(45), IN s_Price double, IN s_UpkeepCost double)
BEGIN
	insert into zoo.attraction(Name, ManagerID, AnimalID, Price, UpkeepCost) values (s_Name, s_ManagerID, s_AnimalID, s_Price, s_UpkeepCost);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submitemployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`Team4`@`%` PROCEDURE `submitemployee`(IN s_ID int(11), IN s_FName varchar(45),IN s_MInitial Varchar(1), IN s_LName Varchar(45), IN s_StartDate date, IN s_Addr tinytext, IN s_Phone tinytext, IN s_Sex varchar(1), IN s_DOB date, IN s_Email varchar(45), IN s_Username varchar(45), IN s_Password varchar(45), IN s_Role varchar(45))
BEGIN
	insert into zoo.employee(ID, FName, MInitial, LName, StartDate, Addr, Phone, Sex, DOB, Email, Username, Password, Role) values (s_ID, s_FName, s_MInitial, s_LName, s_StartDate, s_Addr, s_Phone, s_Sex, s_DOB, s_Email, s_Username, MD5(s_Password), s_Role);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submititemtype` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`Team4`@`%` PROCEDURE `submititemtype`(IN s_ID int(11), IN s_InStock int(11), IN s_Name longtext, IN s_ItemType_ID int(11), IN s_ShopID int(11), IN s_GiftShop_ShopID int(11))
BEGIN
	insert into zoo.itemtype(ID, InStock, Name, ItemType_ID, ShopID, GiftShop_ShopID) values (s_ID, s_InStock, s_Name, s_ItemType_ID, s_ShopID, s_GiftShop_ShopID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submitmember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`Team4`@`%` PROCEDURE `submitmember`(IN s_Email varchar(80), IN s_FName varchar(45), IN s_MInitial varchar(1), IN s_LName varchar(45), IN s_StartDate date)
BEGIN
	insert into zoo.member(Email, FName, MInitial, LName, StartDate) values (s_Email, s_FName, s_MInitial, s_LName, s_StartDate);
END ;;
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

-- Dump completed on 2021-04-25 16:40:19
