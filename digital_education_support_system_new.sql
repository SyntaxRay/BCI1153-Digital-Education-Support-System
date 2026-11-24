-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: digital_education_support_system
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` char(5) NOT NULL,
  `student_id` char(5) NOT NULL,
  `teacher_id` char(5) NOT NULL,
  `session_id` char(5) NOT NULL,
  `event_id` char(5) NOT NULL,
  `status` varchar(10) NOT NULL,
  `remarks` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `session_id` (`session_id`,`student_id`),
  KEY `student_id` (`student_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `session` (`sess_id`),
  CONSTRAINT `attendance_ibfk_4` FOREIGN KEY (`event_id`) REFERENCES `disruptive_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_platform`
--

DROP TABLE IF EXISTS `digital_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digital_platform` (
  `platform_id` char(5) NOT NULL,
  `student_id` char(5) NOT NULL,
  `platform_name` varchar(30) NOT NULL,
  `platform_type` varchar(25) NOT NULL,
  PRIMARY KEY (`platform_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `digital_platform_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_platform`
--

LOCK TABLES `digital_platform` WRITE;
/*!40000 ALTER TABLE `digital_platform` DISABLE KEYS */;
/*!40000 ALTER TABLE `digital_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disruptive_event`
--

DROP TABLE IF EXISTS `disruptive_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disruptive_event` (
  `event_id` char(5) NOT NULL,
  `event_name` varchar(60) NOT NULL,
  `hazard_type` varchar(20) NOT NULL,
  `severity_level` varchar(10) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disruptive_event`
--

LOCK TABLES `disruptive_event` WRITE;
/*!40000 ALTER TABLE `disruptive_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `disruptive_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_support_sess`
--

DROP TABLE IF EXISTS `equipment_support_sess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_support_sess` (
  `sess_id` char(5) NOT NULL,
  `equipment_type` varchar(50) NOT NULL,
  `serial_no` varchar(20) NOT NULL,
  `dispatch_status` varchar(15) NOT NULL,
  PRIMARY KEY (`sess_id`),
  UNIQUE KEY `serial_no` (`serial_no`),
  CONSTRAINT `equipment_support_sess_ibfk_1` FOREIGN KEY (`sess_id`) REFERENCES `session` (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_support_sess`
--

LOCK TABLES `equipment_support_sess` WRITE;
/*!40000 ALTER TABLE `equipment_support_sess` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_support_sess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_resource`
--

DROP TABLE IF EXISTS `learning_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `learning_resource` (
  `resource_id` char(5) NOT NULL,
  `platform_id` char(5) NOT NULL,
  `resource_name` varchar(70) NOT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `platform_id` (`platform_id`),
  CONSTRAINT `learning_resource_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `digital_platform` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_resource`
--

LOCK TABLES `learning_resource` WRITE;
/*!40000 ALTER TABLE `learning_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `learning_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `school_id` char(5) NOT NULL,
  `school_type` varchar(15) NOT NULL,
  `school_name` varchar(60) NOT NULL,
  `district` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sess_id` char(5) NOT NULL,
  `plat_id` char(5) NOT NULL,
  `tech_id` char(5) NOT NULL,
  `sub_id` char(5) NOT NULL,
  `event_id` char(5) NOT NULL,
  `session_date` date NOT NULL,
  `mode` varchar(10) NOT NULL,
  PRIMARY KEY (`sess_id`),
  KEY `plat_id` (`plat_id`),
  KEY `tech_id` (`tech_id`),
  KEY `sub_id` (`sub_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`plat_id`) REFERENCES `digital_platform` (`platform_id`),
  CONSTRAINT `session_ibfk_2` FOREIGN KEY (`tech_id`) REFERENCES `teacher` (`teacher_id`),
  CONSTRAINT `session_ibfk_3` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`sub_id`),
  CONSTRAINT `session_ibfk_4` FOREIGN KEY (`event_id`) REFERENCES `disruptive_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` char(5) NOT NULL,
  `school_id` char(5) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `form_level` tinyint NOT NULL,
  `guardian_phone` varchar(15) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `sub_id` char(5) NOT NULL,
  `title` varchar(40) NOT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `teacher_id` char(5) NOT NULL,
  `school_id` char(5) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `specialization` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_meet_sess`
--

DROP TABLE IF EXISTS `virtual_meet_sess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virtual_meet_sess` (
  `sess_id` char(5) NOT NULL,
  `meet_link` varchar(80) NOT NULL,
  `meeting_pwd` varchar(20) DEFAULT NULL,
  `rec_url` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sess_id`),
  CONSTRAINT `virtual_meet_sess_ibfk_1` FOREIGN KEY (`sess_id`) REFERENCES `session` (`sess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_meet_sess`
--

LOCK TABLES `virtual_meet_sess` WRITE;
/*!40000 ALTER TABLE `virtual_meet_sess` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_meet_sess` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25  0:46:21
