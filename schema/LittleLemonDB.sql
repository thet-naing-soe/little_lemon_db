CREATE DATABASE  IF NOT EXISTS `LittleLemonDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `LittleLemonDB`;
-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: LittleLemonDB
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

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
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date DEFAULT NULL,
  `TableNumber` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` (`BookingID`, `BookingDate`, `TableNumber`, `CustomerID`) VALUES (1,'2019-01-15',5,1),(2,'2019-02-20',3,2),(3,'2019-03-10',8,3),(4,'2020-04-16',2,4),(5,'2020-06-11',7,6),(6,'2021-05-16',4,5),(7,'2021-08-13',6,8),(8,'2022-07-20',9,7),(9,'2022-09-12',1,9),(10,'2023-06-19',10,6);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` (`CustomerID`, `FullName`, `PhoneNumber`, `Email`, `City`, `Country`, `PostalCode`) VALUES (1,'John Smith','555-0101','john.smith@email.com','New York','United States','10001'),(2,'Maria Garcia','555-0102','maria.g@email.com','Los Angeles','United States','90001'),(3,'James Johnson','555-0103','james.j@email.com','Chicago','United States','60601'),(4,'Emily Davis','555-0104','emily.d@email.com','Houston','United States','77001'),(5,'Michael Brown','555-0105','michael.b@email.com','Phoenix','United States','85001'),(6,'Sarah Wilson','555-0106','sarah.w@email.com','Miami','United States','33101'),(7,'David Martinez','555-0107','david.m@email.com','Seattle','United States','98101'),(8,'Lisa Anderson','555-0108','lisa.a@email.com','Boston','United States','02101'),(9,'Robert Taylor','555-0109','robert.t@email.com','Denver','United States','80201'),(10,'Jennifer Lee','555-0110','jennifer.l@email.com','Atlanta','United States','30301');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(255) DEFAULT NULL,
  `Cuisine` varchar(100) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `MenuItemsID` int DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `menu_menuitems_id_fk_idx` (`MenuItemsID`),
  CONSTRAINT `menu_menuitems_id_fk` FOREIGN KEY (`MenuItemsID`) REFERENCES `MenuItems` (`MenuItemsID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` (`MenuID`, `MenuName`, `Cuisine`, `Price`, `MenuItemsID`) VALUES (1,'Ocean Breeze','Seafood',220.00,1),(2,'Garden Fresh','Vegan',95.00,2),(3,'Firecracker','Asian Fusion',150.00,3),(4,'Hearty Comfort','Western',180.00,4),(5,'Sunny Isles','Mediterranean',205.00,5);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `MenuItemsID` int NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `StarterName` varchar(255) DEFAULT NULL,
  `DesertName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
INSERT INTO `MenuItems` (`MenuItemsID`, `CourseName`, `StarterName`, `DesertName`) VALUES (1,'Seafood Platter','Garlic Bread','Lemon Tart'),(2,'Vegan Delight','Bruschetta','Fruit Salad'),(3,'Spicy Fusion','Spring Rolls','Coconut Jelly'),(4,'Classic Roast','Soup of the Day','Cheesecake'),(5,'Mediterranean Mix','Greek Salad','Baklava');
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDeliveryStatus`
--

DROP TABLE IF EXISTS `OrderDeliveryStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDeliveryStatus` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `DeliveryDate` date DEFAULT NULL,
  `DeliveryStatus` varchar(50) DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `order_id_fk_idx` (`OrderID`),
  CONSTRAINT `delivery_order_fk` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDeliveryStatus`
--

LOCK TABLES `OrderDeliveryStatus` WRITE;
/*!40000 ALTER TABLE `OrderDeliveryStatus` DISABLE KEYS */;
INSERT INTO `OrderDeliveryStatus` (`DeliveryID`, `DeliveryDate`, `DeliveryStatus`, `OrderID`) VALUES (1,'2019-01-17','Delivered',1),(2,'2019-02-22','Delivered',2),(3,'2020-04-18','Delivered',14),(4,'2020-06-13','Delivered',16),(5,'2021-05-18','Delivered',25),(6,'2021-08-15','Delivered',28),(7,'2022-07-22','Delivered',37),(8,'2022-09-14','Delivered',39),(9,'2023-06-21','Delivered',46),(10,'2023-10-24','Delivered',50);
/*!40000 ALTER TABLE `OrderDeliveryStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `TotalCost` decimal(10,2) DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `customer_id_fk_idx` (`CustomerID`),
  KEY `menu_id_fk_idx` (`MenuID`),
  CONSTRAINT `orders_customer_fk` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_menu_fk` FOREIGN KEY (`MenuID`) REFERENCES `Menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` (`OrderID`, `OrderDate`, `Quantity`, `Cost`, `TotalCost`, `CustomerID`, `MenuID`) VALUES (1,'2019-01-15',3,450.00,660.00,1,1),(2,'2019-02-20',2,140.00,190.00,2,2),(3,'2019-03-10',5,600.00,750.00,3,3),(4,'2019-04-05',4,560.00,720.00,4,4),(5,'2019-05-12',3,480.00,615.00,5,5),(6,'2019-06-18',2,320.00,440.00,6,1),(7,'2019-07-22',6,420.00,570.00,7,2),(8,'2019-08-30',4,480.00,600.00,8,3),(9,'2019-09-14',3,420.00,540.00,9,4),(10,'2019-10-25',5,750.00,1025.00,10,5),(11,'2020-01-08',2,300.00,440.00,1,1),(12,'2020-02-14',4,280.00,380.00,2,2),(13,'2020-03-20',3,360.00,450.00,3,3),(14,'2020-04-16',5,700.00,900.00,4,4),(15,'2020-05-23',2,320.00,410.00,5,5),(16,'2020-06-11',6,960.00,1320.00,6,1),(17,'2020-07-07',3,210.00,285.00,7,2),(18,'2020-08-19',4,480.00,600.00,8,3),(19,'2020-09-25',2,280.00,360.00,9,4),(20,'2020-10-30',5,750.00,1025.00,10,5),(21,'2021-01-12',3,450.00,660.00,1,1),(22,'2021-02-18',2,140.00,190.00,2,2),(23,'2021-03-24',4,480.00,600.00,3,3),(24,'2021-04-10',3,420.00,540.00,4,4),(25,'2021-05-16',6,900.00,1230.00,5,5),(26,'2021-06-22',2,320.00,440.00,6,1),(27,'2021-07-28',5,350.00,475.00,7,2),(28,'2021-08-13',3,360.00,450.00,8,3),(29,'2021-09-19',4,560.00,720.00,9,4),(30,'2021-10-26',2,320.00,410.00,10,5),(31,'2022-01-05',4,640.00,880.00,1,1),(32,'2022-02-11',3,210.00,285.00,2,2),(33,'2022-03-17',5,600.00,750.00,3,3),(34,'2022-04-23',2,280.00,360.00,4,4),(35,'2022-05-29',4,640.00,820.00,5,5),(36,'2022-06-14',3,480.00,660.00,6,1),(37,'2022-07-20',6,420.00,570.00,7,2),(38,'2022-08-26',2,240.00,300.00,8,3),(39,'2022-09-12',5,700.00,900.00,9,4),(40,'2022-10-18',3,480.00,615.00,10,5),(41,'2023-01-09',2,320.00,440.00,1,1),(42,'2023-02-15',4,280.00,380.00,2,2),(43,'2023-03-21',3,360.00,450.00,3,3),(44,'2023-04-27',5,700.00,900.00,4,4),(45,'2023-05-13',2,320.00,410.00,5,5),(46,'2023-06-19',6,960.00,1320.00,6,1),(47,'2023-07-25',3,210.00,285.00,7,2),(48,'2023-08-31',4,480.00,600.00,8,3),(49,'2023-09-16',2,280.00,360.00,9,4),(50,'2023-10-22',5,750.00,1025.00,10,5);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `OrdersView`
--

DROP TABLE IF EXISTS `OrdersView`;
/*!50001 DROP VIEW IF EXISTS `OrdersView`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `OrdersView` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` (`StaffID`, `FullName`, `Role`, `Salary`, `PhoneNumber`) VALUES (1,'Nay Lin','Manager',2600.00,'0991112222'),(2,'Su Su','Head Chef',2400.00,'0975556666'),(3,'Myint Aye','Server',1200.00,'0967778888'),(4,'Wai Yan','Bartender',1300.00,'0953334444'),(5,'Ei Mon','Sous Chef',1800.00,'0944445555');
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `OrdersView`
--

/*!50001 DROP VIEW IF EXISTS `OrdersView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `OrdersView` AS select `Orders`.`OrderID` AS `OrderID`,`Orders`.`Quantity` AS `Quantity`,`Orders`.`TotalCost` AS `TotalCost` from `Orders` where (`Orders`.`Quantity` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-17 13:57:08
