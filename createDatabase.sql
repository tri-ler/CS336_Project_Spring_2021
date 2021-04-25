USE cs336project;

-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: cs336project
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `auctionID` int NOT NULL AUTO_INCREMENT,
  `seller` varchar(45) NOT NULL,
  `startTime` time NOT NULL,
  `startDate` date NOT NULL,
  `endTime` time NOT NULL,
  `endDate` date NOT NULL,
  `minIncrement` float NOT NULL,
  `currentPrice` float NOT NULL,
  `initialPrice` float NOT NULL,
  `winner` varchar(45) DEFAULT NULL,
  `secretMin` float NOT NULL,
  PRIMARY KEY (`auctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (1,'user1','08:00:00','2021-04-23','09:00:00','2021-04-26',1,5,5,NULL,10),(2,'user2','09:00:00','2021-04-24','09:00:00','2021-04-26',1,5,5,NULL,10),(3,'user3','20:00:00','2021-04-24','09:00:00','2021-04-26',1,5,5,NULL,10),(4,'user4','10:00:00','2021-04-25','10:10:00','2021-04-27',5,0,0,NULL,50),(5,'user5','11:00:00','2021-04-27','12:00:00','2021-04-30',1,10,4,NULL,20);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auctioning`
--

DROP TABLE IF EXISTS `auctioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctioning` (
  `itemID` int NOT NULL,
  `auctionID` int NOT NULL,
  PRIMARY KEY (`auctionID`,`itemID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `auctioning_ibfk_1` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`),
  CONSTRAINT `auctioning_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `computerpart` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctioning`
--

LOCK TABLES `auctioning` WRITE;
/*!40000 ALTER TABLE `auctioning` DISABLE KEYS */;
INSERT INTO `auctioning` VALUES (6,1),(7,2),(8,3),(9,4),(10,5);
/*!40000 ALTER TABLE `auctioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bidID` int NOT NULL AUTO_INCREMENT,
  `auctionID` int NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `bidAmount` float DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `isAuto` tinyint(1) NOT NULL,
  PRIMARY KEY (`bidID`),
  KEY `username` (`username`),
  KEY `auctionID` (`auctionID`),
  CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (1,1,'2021-04-24','01:00:00',10,'user5',0),(2,2,'2021-04-24','02:00:00',10,'user4',0),(3,3,'2021-04-24','03:00:00',10,'user3',0),(4,4,'2021-04-24','04:00:00',1,'user2',0),(5,5,'2021-04-24','05:00:00',10,'user1',0),(6,5,'2021-04-24','06:00:00',15,'user2',0),(7,4,'2021-04-24','07:00:00',15,'user3',0),(8,3,'2021-04-24','08:00:00',15,'user4',0),(9,2,'2021-04-24','09:00:00',20,'user5',0),(10,1,'2021-04-24','10:00:00',30,'user1',0);
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computerpart`
--

DROP TABLE IF EXISTS `computerpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computerpart` (
  `partName` varchar(45) NOT NULL,
  `itemID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`itemID`, `type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computerpart`
--

LOCK TABLES `computerpart` WRITE;
/*!40000 ALTER TABLE `computerpart` DISABLE KEYS */;
INSERT INTO `computerpart` VALUES ('Intel i7-6700',6,'CPU'),('Amd Ryzen 3600',7,'CPU'),('Intel i9-10900',8,'CPU'),('AMD Ryzen 5950',9,'CPU'),('Intel i3-9100',10,'CPU');
/*!40000 ALTER TABLE `computerpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cpu` (
  `itemID` int NOT NULL,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `socket` varchar(45) NOT NULL,
  `frequency` varchar(45) NOT NULL,
  PRIMARY KEY (`itemID`),
  CONSTRAINT `cpu_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `computerpart` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

LOCK TABLES `cpu` WRITE;
/*!40000 ALTER TABLE `cpu` DISABLE KEYS */;
INSERT INTO `cpu` VALUES (6,'intel','i7-6700','LGA2011','3.4 GHz'),(7,'amd','ryzen 3600','am4','4.0 GHz'),(8,'intel','i9-10900','LGA2011','5.0Ghz'),(9,'amd','ryzen 5950','am4','4.8 Ghz'),(10,'intel','','LGA2011','2.4 GHz');
/*!40000 ALTER TABLE `cpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphicscard`
--

DROP TABLE IF EXISTS `graphicscard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `graphicscard` (
  `itemID` int NOT NULL,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`itemID`),
  CONSTRAINT `graphicscard_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `computerpart` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphicscard`
--

LOCK TABLES `graphicscard` WRITE;
/*!40000 ALTER TABLE `graphicscard` DISABLE KEYS */;
/*!40000 ALTER TABLE `graphicscard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harddrive`
--

DROP TABLE IF EXISTS `harddrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `harddrive` (
  `itemID` int NOT NULL,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `capacity` varchar(45) NOT NULL,
  PRIMARY KEY (`itemID`),
  CONSTRAINT `harddrive_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `computerpart` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harddrive`
--

LOCK TABLES `harddrive` WRITE;
/*!40000 ALTER TABLE `harddrive` DISABLE KEYS */;
/*!40000 ALTER TABLE `harddrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representatives`
--

DROP TABLE IF EXISTS `representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `representatives` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representatives`
--

LOCK TABLES `representatives` WRITE;
/*!40000 ALTER TABLE `representatives` DISABLE KEYS */;
INSERT INTO `representatives` VALUES ('admin','admin'),('rep1','rep1');
/*!40000 ALTER TABLE `representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user1','user1'),('user2','user2'),('user3','user3'),('user4','user4'),('user5','user5');
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

-- Dump completed on 2021-04-24 22:21:08
