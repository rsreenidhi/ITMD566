CREATE DATABASE  IF NOT EXISTS `taxi1729` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `taxi1729`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: taxi1729
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `rent_car`
--

DROP TABLE IF EXISTS `rent_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent_car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_brand` varchar(45) DEFAULT NULL,
  `car_cost` double DEFAULT NULL,
  `insurance_cost` double DEFAULT NULL,
  `car_image` varchar(120) DEFAULT NULL,
  `car_type` varchar(45) DEFAULT NULL,
  `car_model` varchar(45) DEFAULT NULL,
  `car_color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_car`
--

LOCK TABLES `rent_car` WRITE;
/*!40000 ALTER TABLE `rent_car` DISABLE KEYS */;
INSERT INTO `rent_car` VALUES (1,'Ferrari',30,80,'./images/ferrari.png','Sedan','2015','red'),(2,'BMW',25,40,'./images/bmw.png','Sedan','2012','black'),(3,'Mercedes',28,65,'./images/merc.png','SUV','2013','blue');
/*!40000 ALTER TABLE `rent_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_request`
--

DROP TABLE IF EXISTS `rent_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_brand` varchar(45) DEFAULT NULL,
  `car_cost` varchar(45) DEFAULT NULL,
  `car_type` varchar(45) DEFAULT NULL,
  `accept` tinyint(4) DEFAULT NULL,
  `car_user` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_request`
--

LOCK TABLES `rent_request` WRITE;
/*!40000 ALTER TABLE `rent_request` DISABLE KEYS */;
INSERT INTO `rent_request` VALUES (4,'Ferrari','220.0','Sedan',1,'1'),(5,'BMW','130.0','Sedan',1,'1'),(6,'BMW','130.0','Sedan',1,'1'),(7,'BMW','130.0','Sedan',1,'1'),(8,'Ferrari','220.0','Sedan',0,'1'),(9,'Ferrari','220.0','Sedan',1,'1'),(10,'BMW','455.0','Sedan',1,'1'),(11,'BMW','130.0','Sedan',1,'1');
/*!40000 ALTER TABLE `rent_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_car`
--

DROP TABLE IF EXISTS `ride_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_brand` varchar(45) DEFAULT NULL,
  `car_driver` varchar(45) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `file_path` varchar(150) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `car_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_car`
--

LOCK TABLES `ride_car` WRITE;
/*!40000 ALTER TABLE `ride_car` DISABLE KEYS */;
INSERT INTO `ride_car` VALUES (1,'Hyundai','Steven Smith',1.2,'images/hyundai.png',3.5,'Sedan'),(2,'Audi','Peter Parker',2.2,'images/aduiSUV.png',5,'SUV');
/*!40000 ALTER TABLE `ride_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_request`
--

DROP TABLE IF EXISTS `ride_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ride_request` (
  `ride_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_brand` varchar(45) DEFAULT NULL,
  `car_cost` varchar(45) DEFAULT NULL,
  `car_type` varchar(45) DEFAULT NULL,
  `accept` tinyint(4) DEFAULT NULL,
  `car_user` varchar(150) DEFAULT NULL,
  `car_driver` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ride_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_request`
--

LOCK TABLES `ride_request` WRITE;
/*!40000 ALTER TABLE `ride_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `ride_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_history`
--

DROP TABLE IF EXISTS `trip_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trip_history` (
  `trip_id` int(11) NOT NULL AUTO_INCREMENT,
  `trip_date` date DEFAULT NULL,
  `trip_driver` varchar(45) DEFAULT NULL,
  `trip_fare` double DEFAULT NULL,
  `trip_car` varchar(45) DEFAULT NULL,
  `service_type` varchar(45) DEFAULT NULL,
  `trip_rating` float DEFAULT NULL,
  `trip_userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `trip_user_idx` (`trip_userId`),
  CONSTRAINT `trip_user` FOREIGN KEY (`trip_userId`) REFERENCES `user_login` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_history`
--

LOCK TABLES `trip_history` WRITE;
/*!40000 ALTER TABLE `trip_history` DISABLE KEYS */;
INSERT INTO `trip_history` VALUES (1,'2018-01-05','Nixon',5,'BMW','ride',4.5,1),(2,'2018-01-25','Patel',12,'Mazda','ride',4,1),(3,'2018-02-21','Bauer',8.5,'Audi','rent',5,1),(4,'2018-04-26','Self',130,'BMW','Rent',5,1),(5,'2018-04-26','Self',130,'BMW','Rent',5,1);
/*!40000 ALTER TABLE `trip_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(65) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,'Ramanuja','Sreenidhi','rsreenidhi','test','rs@hawk.iit.edu',1),(2,'Administrator','','admin','admin','ad@gmail.com',0),(3,'Shivank','Saxena','saxena','test123','ssasxena@hawk.iit.eud',1),(4,'test','test','test','test','test@gmail.com',1),(5,'James ','Papdemas','jpapa','jpapa','jpapa@hawk.iit.edu',0);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'taxi1729'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-26 21:11:39
