-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: hibernate_mapping
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `book_info`
--

DROP TABLE IF EXISTS `book_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_info` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9pxi16pgp2x53x0t5nux2dqxb` (`student_id`),
  CONSTRAINT `FK9pxi16pgp2x53x0t5nux2dqxb` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_info`
--

LOCK TABLES `book_info` WRITE;
/*!40000 ALTER TABLE `book_info` DISABLE KEYS */;
INSERT INTO `book_info` VALUES (34,'author DHS-Book','DHS-Book',125,8),(35,'author URH-Book','URH-Book',200,12),(36,'author FBD-Book','FBD-Book',180,14),(37,'author EBQ-Book','EBQ-Book',150,10),(38,'author IFM-Book','IFM-Book',210,16);
/*!40000 ALTER TABLE `book_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_info`
--

DROP TABLE IF EXISTS `course_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_info` (
  `id` bigint(20) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_info`
--

LOCK TABLES `course_info` WRITE;
/*!40000 ALTER TABLE `course_info` DISABLE KEYS */;
INSERT INTO `course_info` VALUES (39,'2022-02-20 23:59:59','ILD-Course','2022-02-02 00:00:00'),(40,'2022-02-20 23:59:59','IFM-Course','2022-02-05 00:00:00'),(41,'2022-02-25 23:59:59','ESA-Course','2022-02-07 00:00:00'),(42,'2022-02-24 23:59:59','GBF-Course','2022-02-06 00:00:00'),(43,'2022-02-27 23:59:59','WSA-Course','2022-02-09 00:00:00'),(44,'2022-03-02 23:59:59','PIK-Course','2022-02-12 00:00:00');
/*!40000 ALTER TABLE `course_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_info`
--

DROP TABLE IF EXISTS `guardian_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_info` (
  `id` bigint(20) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_info`
--

LOCK TABLES `guardian_info` WRITE;
/*!40000 ALTER TABLE `guardian_info` DISABLE KEYS */;
INSERT INTO `guardian_info` VALUES (9,'8003','Guardian2','EOKDS'),(11,'7412','Guardian4','UNDHF'),(13,'1296','Guardian1','WSZJH'),(15,'3241','Guardian5','AZXFO'),(17,'5201','Guardian8','APDWC');
/*!40000 ALTER TABLE `guardian_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (45);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_info`
--

DROP TABLE IF EXISTS `student_course_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_info` (
  `student_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  KEY `FKdm5v4pksxjpq9h2i5y37q1ght` (`course_id`),
  KEY `FKblbksgo1o2xu2q5rug9mk37f3` (`student_id`),
  CONSTRAINT `FKblbksgo1o2xu2q5rug9mk37f3` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`id`),
  CONSTRAINT `FKdm5v4pksxjpq9h2i5y37q1ght` FOREIGN KEY (`course_id`) REFERENCES `course_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_info`
--

LOCK TABLES `student_course_info` WRITE;
/*!40000 ALTER TABLE `student_course_info` DISABLE KEYS */;
INSERT INTO `student_course_info` VALUES (8,39),(8,40),(10,40),(10,41),(12,39),(12,44),(16,44),(16,42),(16,41);
/*!40000 ALTER TABLE `student_course_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_info` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `guardian_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_syqbe3v6av02fssvj7kl1tvux` (`guardian_id`),
  KEY `FKltbwtmn5s50d791jrfb97gaii` (`teacher_id`),
  CONSTRAINT `FKkw2yi8thgt15owj6voe5gholr` FOREIGN KEY (`guardian_id`) REFERENCES `guardian_info` (`id`),
  CONSTRAINT `FKltbwtmn5s50d791jrfb97gaii` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_info`
--

LOCK TABLES `student_info` WRITE;
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
INSERT INTO `student_info` VALUES (8,'Student1','3rd',2,9),(10,'Student2','2nd',3,11),(12,'Student3','4th',3,13),(14,'Student4','1st',2,15),(16,'Student8','4th',1,17);
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_info` (
  `id` bigint(20) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_info`
--

LOCK TABLES `teacher_info` WRITE;
/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` VALUES (1,'1234','SBC','Teacher1'),(2,'8562','EJD','Teacher2'),(3,'9654','PDL','Teacher3');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-22 19:00:12
