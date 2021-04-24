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
-- Table structure for table `users`
--
use cs336project;
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
INSERT INTO `users` VALUES ('',''),('user1','user1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction`(
	`auctionID` int NOT NULL,
    `seller` varchar(45) NOT NULL,
    `startTime` time NOT NULL,
    `startDate` date NOT NULL,
    `minIncrement` float NOT NULL,
    `currentPrice` float NOT NULL,
    `initialPrice` float NOT NULL,
    `secretMin` float NOT NULL,
    PRIMARY KEY (`auctionID`)
    );

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `bidID` int NOT NULL,
  `auctionID` int NOT NULL,
  `seller` varchar(45) NOT NULL,
  `date` date DEFAULT NULL, 
  `time` time DEFAULT NULL,
  `bidAmount` float DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`bidID`),
  FOREIGN KEY (`username`) references users(`username`),
  FOREIGN KEY (`auctionID`) references auction(`auctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `selling`;


DROP TABLE IF EXISTS `auctioning`;
CREATE TABLE `auctioning`(
	`itemID` int NOT NULL,
    `auctionID` int NOT NULL,
    PRIMARY KEY (`auctionID`,`itemID`),
    FOREIGN KEY (`auctionID`) REFERENCES auction(auctionID),
    FOREIGN KEY (`itemID`) REFERENCES computerPart(itemID)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
DROP TABLE IF EXISTS `computerPart`;
CREATE TABLE `computerPart`(
	`partName` varchar(45) NOT NULL,
    `itemID` int NOT NULL,
    PRIMARY KEY (`itemID`)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
DROP TABLE IF EXISTS `CPU`;
CREATE TABLE `CPU`(
    `itemID` int NOT NULL,
    `brand` varchar(45) NOT NULL,
    `model` varchar(45) NOT NULL,
    `socket` varchar(45) NOT NULL,
    `frequency` varchar(45) NOT NULL,
    PRIMARY KEY (`itemID`),
    FOREIGN KEY (`itemID`) REFERENCES computerPart(itemID)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
DROP TABLE IF EXISTS `graphicsCard`;
CREATE TABLE `graphicsCard`(
    `itemID` int NOT NULL,
    `brand` varchar(45) NOT NULL,
    `model` varchar(45) NOT NULL,
    `color` varchar(45) NOT NULL,
    PRIMARY KEY (`itemID`),
    FOREIGN KEY (`itemID`) REFERENCES computerPart(itemID)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
DROP TABLE IF EXISTS `hardDrive`;
CREATE TABLE `hardDrive`(
    `itemID` int NOT NULL,
    `brand` varchar(45) NOT NULL,
    `model` varchar(45) NOT NULL,
    `color` varchar(45) NOT NULL,
    `capacity` varchar(45) NOT NULL,
    PRIMARY KEY (`itemID`),
    FOREIGN KEY (`itemID`) REFERENCES computerPart(itemID)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
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


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 11:42:08
