-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: club
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `c_tables`
--

DROP TABLE IF EXISTS `c_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_tables` (
  `ID` binary(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `Number` int NOT NULL,
  `CurrentStatusFree` tinyint(1) NOT NULL DEFAULT (true),
  `StatusChangedDatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StatusChangedByID` binary(16) NOT NULL,
  `StatusChangedByName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `table_id` (`ID`),
  KEY `changedby_id` (`StatusChangedByID`),
  CONSTRAINT `c_tables_ibfk_1` FOREIGN KEY (`StatusChangedByID`) REFERENCES `users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tables`
--

LOCK TABLES `c_tables` WRITE;
/*!40000 ALTER TABLE `c_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `ID` binary(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `TableID` binary(16) NOT NULL,
  `TableNumber` int NOT NULL,
  `DepositAmount` int NOT NULL,
  `TimeFrom` time NOT NULL,
  `TimeTo` time NOT NULL,
  `LastModifiedByID` binary(16) NOT NULL,
  `LastModifiedByName` varchar(50) NOT NULL,
  `LastModifiedDatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `deposit_id` (`ID`),
  KEY `changedby_id` (`LastModifiedByID`),
  KEY `table_id` (`TableID`),
  CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `c_tables` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `deposits_ibfk_2` FOREIGN KEY (`LastModifiedByID`) REFERENCES `users` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `ID` binary(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `EntryDatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FullName` varchar(50) NOT NULL,
  `GuestsAmount` int NOT NULL,
  `PromoterID` binary(16) NOT NULL,
  `PromoterName` varchar(50) NOT NULL,
  `TableID` binary(16) NOT NULL,
  `TableNumber` int NOT NULL,
  `DepositID` binary(16) NOT NULL,
  `DepositAmount` int NOT NULL,
  `ReservationDatetime` datetime NOT NULL,
  `PrePay` int DEFAULT NULL,
  `Payed` tinyint(1) NOT NULL DEFAULT (false),
  `Parking` tinyint(1) NOT NULL DEFAULT (false),
  `Guards` tinyint(1) NOT NULL DEFAULT (false),
  PRIMARY KEY (`ID`),
  KEY `reservation_id` (`ID`),
  KEY `promoter_id` (`PromoterID`),
  KEY `table_id` (`TableID`),
  KEY `deposit_id` (`DepositID`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `c_tables` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`PromoterID`) REFERENCES `users` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`DepositID`) REFERENCES `deposits` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID` binary(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (_binary 'Fh\‚xDç\Ì™èP!\0É¢','root'),(_binary 'Å\Í\ﬂ[Dâ\Ì™èP!\0É¢','Promoter'),(_binary 'ñÿõDâ\Ì™èP!\0É¢','Admin'),(_binary 'õ\·\\Dâ\Ì™èP!\0É¢','Analytics');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` binary(16) NOT NULL DEFAULT (uuid_to_bin(uuid())),
  `FullName` varchar(50) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `RoleID` binary(16) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `user_id` (`ID`),
  KEY `roles_id` (`RoleID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-05 14:47:14
