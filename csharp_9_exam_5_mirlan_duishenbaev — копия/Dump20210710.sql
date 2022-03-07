-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: warehouse_database
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_date` datetime NOT NULL,
  `product_id` int NOT NULL,
  `warehouse_id_in` int DEFAULT NULL,
  `warehouse_id_out` int DEFAULT NULL,
  `contragent_id` int DEFAULT NULL,
  `qty` decimal(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `FK_product_idx` (`product_id`),
  KEY `FK_contragent` (`contragent_id`),
  KEY `FK_warehouse_in` (`warehouse_id_in`),
  KEY `FK_warehouse_out` (`warehouse_id_out`),
  CONSTRAINT `FK_contragent` FOREIGN KEY (`contragent_id`) REFERENCES `contragents` (`id`),
  CONSTRAINT `FK_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FK_warehouse_in` FOREIGN KEY (`warehouse_id_in`) REFERENCES `warehouses` (`id`),
  CONSTRAINT `FK_warehouse_out` FOREIGN KEY (`warehouse_id_out`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'2020-02-19 15:30:00',1,2,NULL,4,60.000),(2,'2020-04-02 15:30:00',2,NULL,4,1,100.000),(3,'2020-05-21 15:30:00',3,4,2,NULL,20.000),(4,'2020-06-03 15:30:00',5,2,NULL,2,200.000),(5,'2020-06-30 15:30:00',4,3,NULL,3,130.000),(6,'2020-07-20 15:30:00',3,2,4,NULL,50.000),(7,'2020-09-08 15:30:00',1,NULL,3,2,90.000),(8,'2020-10-06 15:30:00',5,4,1,NULL,160.000),(9,'2020-10-23 15:30:00',2,1,NULL,4,40.000),(10,'2020-11-18 15:30:00',3,2,NULL,3,250.000),(11,'2020-12-17 15:30:00',4,4,3,NULL,100.000),(12,'2021-01-08 15:30:00',1,NULL,1,1,110.000),(13,'2021-03-29 15:30:00',5,NULL,2,4,80.000),(14,'2021-04-15 15:30:00',2,2,NULL,2,130.000),(15,'2021-05-11 15:30:00',3,1,NULL,4,270.000),(16,'2021-05-12 15:30:00',4,3,1,NULL,60.000),(17,'2021-06-04 15:30:00',1,1,4,NULL,100.000),(18,'2021-06-09 15:30:00',2,NULL,4,1,150.000),(19,'2021-07-02 15:30:00',1,2,NULL,1,300.000),(20,'2020-07-15 15:30:00',2,4,NULL,3,250.000),(21,'2020-12-10 15:30:00',3,3,NULL,2,250.000),(22,'2021-07-10 11:00:00',3,2,NULL,1,300.000);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Absolut'),(2,'Hennessy'),(3,'Corona'),(4,'Johnnie Walker'),(5,'Adrianna Vineyard');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT 'name category',
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Wine','Вино'),(2,'Vodka','Водка'),(3,'Whiskey','Виски'),(4,'Cognac','Коньяк'),(5,'Beer','Пиво');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contragents`
--

DROP TABLE IF EXISTS `contragents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contragents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contragent` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contragents`
--

LOCK TABLES `contragents` WRITE;
/*!40000 ALTER TABLE `contragents` DISABLE KEYS */;
INSERT INTO `contragents` VALUES (1,'Eric Cartman'),(2,'Stanley Marsh'),(3,'Kyle Broflovski'),(4,'Kenny McCormick');
/*!40000 ALTER TABLE `contragents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `product` varchar(45) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_category_idx` (`category_id`),
  KEY `FK_brand_idx` (`brand_id`),
  CONSTRAINT `FK_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,5,'White Stones',''),(2,5,3,'Corona Extra',''),(3,4,2,'Hennessy XO',''),(4,2,1,'Absolut 100',''),(5,3,4,'Red Label','');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `warehouse` varchar(45) NOT NULL DEFAULT 'warehouse name',
  `product_remains` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

LOCK TABLES `warehouses` WRITE;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES (1,'Southern',80),(2,'Northern',1190),(3,'Western',250),(4,'Eastern',130);
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-10 17:14:44
