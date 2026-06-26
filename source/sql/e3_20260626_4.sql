-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: e3
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
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'マイコン炊飯器',10000,7,3.913894324,10000000),(2,'小型炊飯器',6000,5,3.287671232,10000001),(3,'ワイヤレスイヤホン',15000,4,10.273972602,10000001),(4,'安ワイヤレスイヤホン',3000,1,8.219178082,10000000),(5,'有線イヤホン',8000,3,7.305936073,10000001),(6,'90L冷蔵庫',24800,6,11.324200913,10000000),(7,'スマートフリッジ140L',39800,8,13.630136986,10000001),(8,'卓上ミニ扇風機',2980,3,2.721461187,10000000),(9,'サイレントフロー',4980,4,3.410958904,10000001),(10,'エアサーキュレーター',7480,5,4.098630136,10000000);
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
) ENGINE=InnoDB AUTO_INCREMENT=10000003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (10000000,'passWord'),(10000001,'TestLoginpw'),(10000002,'404TESTPASS');
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
  `userid` int DEFAULT NULL,
  `frame` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rireki`
--

LOCK TABLES `rireki` WRITE;
/*!40000 ALTER TABLE `rireki` DISABLE KEYS */;
INSERT INTO `rireki` VALUES (1,'家電','コーヒーメーカー','2026-06-12',10000,1,'ネフレ',5,5.479452054,500,200,'カフェちゃん',NULL,10000000,2),(2,'家電','PC','2026-06-12',300000,3,'ガレリオ',5,164.383561643,600,200,'必需品',NULL,10000000,3),(3,'家電','ホットカーペット','2026-10-06',15000,2,'アイリスオーヤマ',5,8.219178082,700,200,'暖地面',NULL,10000000,4),(4,'家電','電卓機','2023-06-20',2000,1,'アイリスオーヤマ',5,1.09589041,50,200,'計算さん',NULL,10000000,5),(5,'家電','ノートPC','2025-12-12',300000,3,'富士山通',5,164.383561643,100,200,'ハイスペック',NULL,10000001,3),(6,'家電','扇風機','2026-06-12',100000,1,'アイリスオーヤマ',5,5.479452054,200,200,'風ちゃん',NULL,10000000,1),(7,'家電','冷蔵庫','2016-04-12',105000,5,'クールテック',10,28.767123287,3950,3950,'ひやりん',NULL,10000001,1),(8,'家電','電子レンジ','2017-03-09',29800,1,'ヒートウェーブ',8,10.205479452,3350,3350,'マイク',NULL,10000000,2),(9,'家電','掃除機','2016-01-01',52000,3,'クリーンスター',7,47.488584474,2002,2002,'Mr.スター',NULL,10000001,3),(10,'家電','洗濯機','2017-04-10',48000,3,'アクアクリン製作所',8,16.438356164,3052,3052,'せんたくん',NULL,10000000,4),(11,'家電','トースター','2018-02-15',6800,1,'ベイクテック',6,3.105022831,1205,1205,'パン焼ん',NULL,10000001,1),(12,'家具','ソファー','2015-09-01',32000,1,'コンフォート家具工房',10,8.767123287,3800,3800,'ふかふか丸',NULL,10000000,2),(13,'家電','エアコン','2016-05-20',58000,5,'エアロシステムズ',10,15.890410958,1944,1944,'サム',NULL,10000001,3),(14,'ぬいぐるみ','モフモフベア','2017-12-10',2400,0,'縫い工房',12,0.547945205,1080,1080,'もふぃ',NULL,10000000,5);
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
  `userid` int DEFAULT NULL,
  `frame` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shouhin`
--

LOCK TABLES `shouhin` WRITE;
/*!40000 ALTER TABLE `shouhin` DISABLE KEYS */;
INSERT INTO `shouhin` VALUES (1,'家電','冷蔵庫','2026-06-12',20000,1,'西芝',5,11,3,200,'レイちゃん',NULL,10000000,1),(2,'家電','電子レンジ','2026-06-13',5000,1,'アイリスオオウチ',5,3,3,200,'アタメル',NULL,10000000,2),(3,'家電','掃除機','2026-06-15',50000,1,'ダイサン',5,27,3,200,'バキューム',NULL,10000000,3),(4,'家電','扇風機','2026-06-18',30000,1,'風力研究所',5,16,3,200,'風神',NULL,10000000,4),(5,'家電','トースター','2026-06-12',10000,1,'ホカホカ',5,5,3,200,'朝のお供',NULL,10000000,1),(6,'家電','掃除機','2023-09-20',21000,3,'スイープリンク社',7,8.219178082,1003,1552,'すいすい君',NULL,10000001,2),(7,'家具','ソファー','2022-05-10',26000,1,'コンフォート家具工房',10,7,1502,2148,'祖父',NULL,10000000,3),(8,'家電','エアコン','2023-06-01',48000,5,'エアロシステムズ',10,13.150684931,1114,1276,'カチ山コチ太郎',NULL,10000001,4),(9,'ぬいぐるみ','サメぬい','2024-12-24',1600,0,'縫い工房',12,0,543,3837,'トンカチ頭',NULL,10000000,1),(10,'その他','76','2022-08-05',1620000,5,'東洋ターボ',12,369.863013698,1414,2966,'ナナロク',NULL,10000001,5),(11,'家電','扇風機','2024-07-12',4200,1,'エアフロー技研',6,2,708,1482,'寒太郎',NULL,10000000,1),(12,'その他','時計','2024-09-22',6800,1,'タイムクラフト',10,1.863013698,636,302,'チックンタックン',NULL,10000001,3),(13,'家電','スマートフォン','2024-10-08',26800,1,'モバイルリンク',5,15,620,1205,'相棒',NULL,10000000,2),(14,'その他','自転車','2023-04-12',19800,1,'スピードライン工業',8,6.780821917,1130,1790,'チャリリン・モンロー',NULL,10000001,3);
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

-- Dump completed on 2026-06-26 11:40:29
