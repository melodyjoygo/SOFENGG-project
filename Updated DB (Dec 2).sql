CREATE DATABASE  IF NOT EXISTS `softengdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `softengdb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: softengdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clerk_add_request`
--

DROP TABLE IF EXISTS `clerk_add_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clerk_add_request` (
  `requestID` int(11) NOT NULL,
  `materialID` varchar(45) NOT NULL,
  `quantity` varchar(45) NOT NULL,
  `unitPrice` varchar(45) NOT NULL,
  `userID` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clerk_add_request`
--

/*!40000 ALTER TABLE `clerk_add_request` DISABLE KEYS */;
INSERT INTO `clerk_add_request` VALUES (1,'1','100','100',2,'Declined'),(2,'1','100','100',2,'Approved');
/*!40000 ALTER TABLE `clerk_add_request` ENABLE KEYS */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clients` (
  `clientID` int(11) NOT NULL,
  `clientName` varchar(45) NOT NULL,
  PRIMARY KEY (`clientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Riot Games'),(2,'Samsung'),(3,'Kfc'),(4,'Miki');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;

--
-- Table structure for table `delivery_tracker`
--

DROP TABLE IF EXISTS `delivery_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery_tracker` (
  `deliveryID` int(11) NOT NULL,
  `deliveryReceiptNumber` varchar(45) NOT NULL,
  `materialID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `invoiceNumber` varchar(45) NOT NULL,
  `poNumber` varchar(45) NOT NULL,
  `inInventory` int(11) NOT NULL,
  `unitPrice` decimal(10,0) NOT NULL,
  `requestID` varchar(45) NOT NULL,
  `userID` varchar(45) NOT NULL,
  PRIMARY KEY (`deliveryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_tracker`
--

/*!40000 ALTER TABLE `delivery_tracker` DISABLE KEYS */;
INSERT INTO `delivery_tracker` VALUES (1,'VN555',1,100,'IN123','P001',0,100,'1','3'),(2,'VN556',1,100,'IN124','P001',1,100,'2','3');
/*!40000 ALTER TABLE `delivery_tracker` ENABLE KEYS */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inventory` (
  `inventoryID` int(11) NOT NULL,
  `materialID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dateModified` date NOT NULL,
  `unitPrice` double NOT NULL,
  PRIMARY KEY (`inventoryID`),
  KEY `materialID_idx` (`materialID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,100,'2019-11-23',100);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

--
-- Table structure for table `material_types`
--

DROP TABLE IF EXISTS `material_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `material_types` (
  `mtID` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`mtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_types`
--

/*!40000 ALTER TABLE `material_types` DISABLE KEYS */;
INSERT INTO `material_types` VALUES (1,'Plastic'),(2,'Wood'),(3,'Acrylic'),(4,'Metal'),(5,'Bronze'),(6,'Gold'),(7,'Sterling');
/*!40000 ALTER TABLE `material_types` ENABLE KEYS */;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `materials` (
  `materialID` int(11) NOT NULL,
  `materialName` varchar(45) NOT NULL,
  `materialType` int(11) NOT NULL,
  `supplierID` int(11) NOT NULL,
  `unitOfMeasure` int(11) NOT NULL,
  PRIMARY KEY (`materialID`),
  KEY `supplierID_idx` (`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'2x4',2,1,1),(2,'2x4',1,1,1),(3,'Tent',3,1,1),(4,'5x2',2,1,1);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;

--
-- Table structure for table `project_materials`
--

DROP TABLE IF EXISTS `project_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project_materials` (
  `pmID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL,
  `materialID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`pmID`),
  KEY `projectID_idx` (`projectID`),
  KEY `materialID_idx` (`materialID`),
  CONSTRAINT `projectID` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_materials`
--

/*!40000 ALTER TABLE `project_materials` DISABLE KEYS */;
INSERT INTO `project_materials` VALUES (1,1,1,22222,0),(2,2,1,10,0),(3,1,1,12,0),(4,1,1,123,0),(5,1,3,10,0),(6,3,2,10,0),(7,1,1,123,0),(8,1,3,1,0);
/*!40000 ALTER TABLE `project_materials` ENABLE KEYS */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `projects` (
  `projectID` int(11) NOT NULL,
  `clientID` int(11) DEFAULT NULL,
  `projectNumber` varchar(45) DEFAULT NULL,
  `dateAdded` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,3,'P1911-00000','2019-11-17','Approved'),(2,1,'P1911-00001','2019-11-17','Pending'),(3,2,'P1911-00002','2019-11-18','Pending'),(4,1,'P1911-00003','2019-11-19','Pending');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

--
-- Table structure for table `stockman_edit_requests`
--

DROP TABLE IF EXISTS `stockman_edit_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockman_edit_requests` (
  `requestID` int(11) NOT NULL,
  `deliveryID` varchar(45) NOT NULL,
  `newDeliveryReceipt` varchar(45) NOT NULL,
  `newItemID` varchar(45) NOT NULL,
  `newQuantity` varchar(45) NOT NULL,
  `newSupplierID` varchar(45) NOT NULL,
  `currDeliveryReceipt` varchar(45) NOT NULL,
  `currItemID` varchar(45) NOT NULL,
  `currQuantity` varchar(45) NOT NULL,
  `currSupplierID` varchar(45) NOT NULL,
  `userID` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockman_edit_requests`
--

/*!40000 ALTER TABLE `stockman_edit_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockman_edit_requests` ENABLE KEYS */;

--
-- Table structure for table `stockman_release_requests`
--

DROP TABLE IF EXISTS `stockman_release_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stockman_release_requests` (
  `requestID` int(11) NOT NULL,
  `projectID` varchar(45) NOT NULL,
  `itemID` varchar(45) NOT NULL,
  `qty` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `dateRequested` date NOT NULL,
  `userID` int(11) NOT NULL,
  `released` int(11) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockman_release_requests`
--

/*!40000 ALTER TABLE `stockman_release_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockman_release_requests` ENABLE KEYS */;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suppliers` (
  `supplierID` int(11) NOT NULL,
  `supplierName` varchar(45) NOT NULL,
  `contactNumber` tinytext NOT NULL,
  PRIMARY KEY (`supplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Ace Hardware','8878888'),(2,'Mcdonalds','88886236');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transactions` (
  `transactionID` int(11) NOT NULL,
  `materialID` int(11) NOT NULL,
  `supplieriD` int(11) NOT NULL,
  `price` decimal(19,4) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `poNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

--
-- Table structure for table `unit_of_measures`
--

DROP TABLE IF EXISTS `unit_of_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unit_of_measures` (
  `uomID` int(11) NOT NULL,
  `unitOfMeasure` varchar(45) NOT NULL,
  PRIMARY KEY (`uomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measures`
--

/*!40000 ALTER TABLE `unit_of_measures` DISABLE KEYS */;
INSERT INTO `unit_of_measures` VALUES (1,'pc'),(2,'block'),(3,'pint');
/*!40000 ALTER TABLE `unit_of_measures` ENABLE KEYS */;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_types` (
  `utID` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`utID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (0,'Super Admin'),(1,'User Admin'),(2,'Admin'),(3,'Clerk'),(4,'Stockman');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(99) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userType` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Melody','Go','melody_go@dlsu.edu.ph','U2FsdGVkX19LkaTwkDA/Mz53Sen5h53BuM2pmav+JqI=',0),(2,'Rebecalyn','Lao','rebecalyn_lao@dlsu.edu.ph','U2FsdGVkX19Y7gb2XVpkBnheS2NLLZsfhXG4J7DIZUQ=',3),(3,'Darren','Tee','darren_tee@dlsu.edu.ph','U2FsdGVkX19YYa+sOn7aF33GDofFaCQQTuucgvK6S9I=',4),(4,'Cas','Go','casper_go@dlsu.edu.ph','U2FsdGVkX1+2jp6zpWCnLaLFmH5AC2ZMgdqecdcGOTI=',1),(5,'Jits','Jitsugen','jits_jitsugen@gmail.com','U2FsdGVkX1+7v7exz+ZuNefxpBwJtv2vbjOer0Wd0is=',3),(6,'Qwe','Qwe','qwe@dlsu.edu.ph','U2FsdGVkX19O2i4UUMtk5mdrMKhKaTy03vr71W3F1pA=',1),(7,'Viktor','Ty','viktor_ty@dlsu.edu.ph','U2FsdGVkX1/Rz6TEw0DcAPkQRpIPe3Q8KuMQkTNxCME=',2),(8,'Phoebe','Chen','feebee@dlsu.edu.ph','U2FsdGVkX18tAIgksObsUIWsa12M1eHEWRGr+c9Ehdo=',1),(9,'A','A','aaa@dlsu.edu.ph','U2FsdGVkX1+xHGMRUY/ntVjaicn3NPVqOM1jee4jo4g=',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `year_tracker`
--

DROP TABLE IF EXISTS `year_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `year_tracker` (
  `yearID` int(11) NOT NULL,
  `currYear` int(11) NOT NULL,
  PRIMARY KEY (`yearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `year_tracker`
--

/*!40000 ALTER TABLE `year_tracker` DISABLE KEYS */;
INSERT INTO `year_tracker` VALUES (1,2019);
/*!40000 ALTER TABLE `year_tracker` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed