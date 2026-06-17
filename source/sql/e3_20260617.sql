-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: monocolledb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shouhin` varchar(300) DEFAULT NULL,
  `money` int NOT NULL,
  `use_year` int NOT NULL,
  `day_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'マイコン炊飯器',10000,7,3.913894324),(2,'小型炊飯器',6000,5,3.287671232),(3,'ワイヤレスイヤホン',15000,4,10.273972602),(4,'安ワイヤレスイヤホン',3000,1,8.219178082),(5,'有線イヤホン',8000,3,7.305936073),(6,'90L冷蔵庫',24800,6,11.324200913),(7,'スマートフリッジ140L',39800,8,13.630136986),(8,'卓上ミニ扇風機',2980,3,2.721461187),(9,'サイレントフロー',4980,4,3.410958904),(10,'エアサーキュレーター',7480,5,4.098630136);
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,''),(2,'TestLoginpw'),(3,'404TESTPASS');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rireki`
--

DROP TABLE IF EXISTS `rireki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rireki` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(200) NOT NULL,
  `shouhin` varchar(300) NOT NULL,
  `buy_date` date NOT NULL,
  `price` int NOT NULL,
  `wperiod` int DEFAULT NULL,
  `maker` varchar(300) DEFAULT NULL,
  `life` int NOT NULL,
  `day_price` double DEFAULT NULL,
  `progress` int DEFAULT NULL,
  `goal` int DEFAULT NULL,
  `nickname` varchar(300) DEFAULT NULL,
  `img` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rireki`
--

LOCK TABLES `rireki` WRITE;
/*!40000 ALTER TABLE `rireki` DISABLE KEYS */;
INSERT INTO `rireki` VALUES (1,'家電','扇風機','2026-06-12',100000,90,'アイリスオーヤマ',5,2,3,200,'風ちゃん',NULL);
/*!40000 ALTER TABLE `rireki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shouhin`
--

DROP TABLE IF EXISTS `shouhin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shouhin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre` varchar(200) NOT NULL,
  `shouhin` varchar(300) NOT NULL,
  `buy_date` date NOT NULL,
  `price` int NOT NULL,
  `wperiod` int DEFAULT NULL,
  `maker` varchar(300) DEFAULT NULL,
  `life` int NOT NULL,
  `day_price` double DEFAULT NULL,
  `progress` int DEFAULT NULL,
  `goal` int DEFAULT NULL,
  `nickname` varchar(300) DEFAULT NULL,
  `img` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shouhin`
--

LOCK TABLES `shouhin` WRITE;
/*!40000 ALTER TABLE `shouhin` DISABLE KEYS */;
INSERT INTO `shouhin` VALUES (1,'家電','冷蔵庫','2026-06-12',10000,90,'アイリスオーヤマ',5,2,3,200,'レイちゃん',NULL),(2,'家電','','2026-06-12',10000,90,'アイリスオーヤマ',5,2,3,200,'レイちゃん',NULL);
/*!40000 ALTER TABLE `shouhin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-17 14:45:17
