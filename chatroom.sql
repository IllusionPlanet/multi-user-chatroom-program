-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: my-database.c7u2kc6sgxm7.ca-central-1.rds.amazonaws.com    Database: chatroom
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` varchar(30) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2024-08-21 19:39:50','Chopin进入聊天室'),(2,'2024-08-27 22:12:47','Wver进入聊天室'),(3,'2024-08-27 22:12:55','Wver: hai'),(4,'2024-08-27 22:12:59','Wver: j'),(5,'2024-08-27 22:13:01','Wver: kkk'),(6,'2024-08-28 01:49:43','test进入聊天室'),(7,'2024-08-28 01:50:28','听忐忑进入聊天室'),(8,'2024-08-28 01:50:30','听忐忑: 321'),(9,'2024-08-28 02:16:37','233的进入聊天室'),(10,'2024-08-28 02:16:38','233的: 1'),(11,'2024-08-28 03:02:10','33进入聊天室'),(12,'2024-08-28 03:03:27','Chopin进入聊天室'),(13,'2024-08-28 03:06:58','3232进入聊天室'),(14,'2024-08-28 03:07:38','333进入聊天室'),(15,'2024-08-28 03:12:37','232进入聊天室'),(16,'2024-08-28 03:13:37','22进入聊天室'),(17,'2024-08-28 03:16:17','23进入聊天室'),(18,'2024-08-28 03:19:20','234进入聊天室'),(19,'2024-08-28 07:19:35','234: 2'),(20,'2024-08-28 03:33:50','343进入聊天室'),(21,'2024-08-28 07:33:49','343: 33'),(22,'2024-08-28 04:09:14','343进入聊天室'),(23,'2024-08-28 08:09:14','343: 22'),(24,'2024-08-28 04:10:18','4343进入聊天室'),(25,'2024-08-28 08:10:18','4343: 33'),(26,'2024-08-28 04:12:17','44445进入聊天室'),(27,'2024-08-28 08:12:17','44445: 353'),(28,'2024-08-28 16:19:22','进入聊天室'),(29,'2024-08-28 08:19:24',': 123'),(30,'2024-08-28 04:21:51','测试用户进入聊天室'),(31,'2024-08-28 08:21:54','测试用户: test'),(32,'2024-08-28 08:22:21',': 你发个信息'),(33,'2024-08-28 08:22:26','测试用户: 牛逼'),(34,'2024-08-28 08:22:40',': 儿子，你真棒！'),(35,'2024-08-28 08:22:54','测试用户: ttt123'),(36,'2024-08-28 08:22:54',': 我先退出，弄个名字'),(37,'2024-08-28 16:23:23','爸爸进入聊天室'),(38,'2024-08-28 08:23:28','爸爸: 哈哈!'),(39,'2024-08-28 08:23:49','测试用户: 这支持多人参与'),(40,'2024-08-28 08:24:30','爸爸: 打完字不能用回车发送信息？你有没有设置用哪个键发送信息？'),(41,'2024-08-28 08:25:30','测试用户: 目前没有，但设置起来很简单'),(42,'2024-08-28 08:26:03','测试用户: '),(43,'2024-08-28 08:26:12','测试用户: v1.0'),(44,'2024-08-28 08:26:35','测试用户: '),(45,'2024-08-28 08:26:45','测试用户: '),(46,'2024-08-28 08:28:04','爸爸: 以后咱家要有啥敏感信息，比如密码呀啥的，用这个是不是更安全？');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-30 14:13:19
