-- MariaDB dump 10.19-11.2.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: muse
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_chk` tinyint(1) DEFAULT NULL,
  `contents` varchar(300) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `members_id` bigint(20) NOT NULL,
  `music_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `music_id` (`music_id`),
  KEY `members_id` (`members_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`members_id`) REFERENCES `members` (`members_id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`comment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `follow_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `unfollow_at` datetime DEFAULT NULL,
  `unfollow_YN` tinyint(1) DEFAULT 0,
  `follow_ing` bigint(20) DEFAULT NULL,
  `follower` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`follow_id`),
  KEY `follow_ing` (`follow_ing`),
  KEY `follower` (`follower`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follow_ing`) REFERENCES `members` (`members_id`),
  CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `members` (`members_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES
(1,'2023-12-02 19:34:18',NULL,0,1,2),
(2,'2023-12-02 19:34:18',NULL,0,1,3),
(3,'2023-12-02 19:34:18',NULL,0,2,1),
(4,'2023-12-02 19:34:18',NULL,0,3,1),
(5,'2023-12-02 19:34:18',NULL,0,3,2);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `image_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `members_id` bigint(20) DEFAULT NULL,
  `music_id` bigint(20) DEFAULT NULL,
  `playlist_id` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `deleted_YN` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`image_id`),
  KEY `playlist_id` (`playlist_id`),
  KEY `members_id` (`members_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE,
  CONSTRAINT `image_ibfk_2` FOREIGN KEY (`members_id`) REFERENCES `members` (`members_id`) ON DELETE CASCADE,
  CONSTRAINT `image_ibfk_3` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES
(1,'public/storage/img/1',1,NULL,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(2,'public/storage/img/2',2,NULL,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(3,'public/storage/img/3',3,NULL,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(4,'public/storage/img/4',NULL,1,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(5,'public/storage/img/5',NULL,2,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(6,'public/storage/img/6',NULL,4,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(7,'public/storage/img/7',NULL,7,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(8,'public/storage/img/8',NULL,8,NULL,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(9,'public/storage/img/9',NULL,NULL,1,'2023-12-02 19:34:18','2023-12-02 19:34:18',NULL,0),
(10,'public/storage/img/10',NULL,NULL,2),
(11,'public/storage/img/11',NULL,NULL,3),
(12,'public/storage/img/12',NULL,NULL,4);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `likes_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `canceled_at` datetime DEFAULT NULL,
  `canceled_YN` tinyint(1) DEFAULT 0,
  `who_id` bigint(20) DEFAULT NULL,
  `members_id` bigint(20) DEFAULT NULL,
  `playlist_id` bigint(20) DEFAULT NULL,
  `music_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`likes_id`),
  KEY `who_id` (`who_id`),
  KEY `playlist_id` (`playlist_id`),
  KEY `members_id` (`members_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`who_id`) REFERENCES `members` (`members_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`members_id`) REFERENCES `members` (`members_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_4` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `members_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(200) NOT NULL,
  `nickname` varchar(200) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  `birth_date` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `deleted_YN` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`members_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES
(1,'amy@gmail.com','123','Amy','a','F','010-1111-1111','2001-01-01 00:00:00','2023-12-02 19:33:46','2023-12-02 19:33:46',NULL,0),
(2,'john@gmail.com','456','john','b','M','010-2222-2222','2002-02-02 00:00:00','2023-12-02 19:33:46','2023-12-02 19:33:46',NULL,0),
(3,'tom@gmail.com','789','tom','t','M','010-3333-3333','2003-03-03 00:00:00','2023-12-02 19:33:46','2023-12-02 19:33:46',NULL,0),
(4,'sally@gmail.com','135','sally','s','M','010-4444-4444','2004-04-04 00:00:00','2023-12-02 19:33:46','2023-12-02 19:33:46',NULL,0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `music_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `artist` varchar(200) NOT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `music_file_url` varchar(255) NOT NULL,
  `genre` enum('Kpop','Jpop','OST','Pop','Classic','Jazz','Indie','Canadian_blues','Contemporary_RnB','Punk_blues','Crossover_music','Instrumental','Lofi','Blues_rock','Chicago_blues','Delta_blues','EDM','Country_pop','Country_rap','Country_rock','Instrumental_country','Western','New_age','Darkcore','Disco','City_pop','Dance_pop','Electronic_rock','Dance_rock','Alternative_dance','Madchester','Baggy','New_rave','New_romantic','Electropop','Electronica','Folktronica','Acid_jazz','Jungle','Hipster_hop','Cloud_rap','Acid_house','Chicago_house','Futurepop','Dubstep') DEFAULT NULL,
  `on_off` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `deleted_YN` tinyint(1) DEFAULT 0,
  `members_id` bigint(20) NOT NULL,
  PRIMARY KEY (`music_id`),
  KEY `members_id` (`members_id`),
  CONSTRAINT `music_ibfk_1` FOREIGN KEY (`members_id`) REFERENCES `members` (`members_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES
(1,'Day 1','HONNE','1 desc','public/storage/1','Kpop',1,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,1),
(2,'Pretty','Day6','2 desc','public/storage/2','Indie',NULL,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,1),
(3,'ETA','NEW JEANS','3 desc','public/storage/3','Dubstep',0,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,3),
(4,'Isn\'t she lovely','Stevie Wonder','4 desc','public/storage/4','Jazz',1,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,3),
(5,'BADDIE','IVE','5 desc','public/storage/5','EDM',0,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,2),
(6,'2002','ANNE-MAIRE','6 desc','public/storage/6','New_romantic',1,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,4),
(7,'HYPE BOY','NEW JEANS','7 desc','public/storage/7','Jazz',1,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,4),
(8,'Symphony no.6','Beethoven','8 desc','public/storage/8','Classic',1,'2023-12-02 19:34:01','2023-12-02 19:34:01',NULL,0,2);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `playlist_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(100) NOT NULL,
  `on_off` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `deleted_YN` tinyint(1) DEFAULT 0,
  `members_id` bigint(20) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `members_id` (`members_id`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`members_id`) REFERENCES `members` (`members_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES
(1,'happy',1,'2023-12-02 19:34:07','2023-12-02 19:34:07',NULL,0,1),
(2,'lovely',1,'2023-12-02 19:34:07','2023-12-02 19:34:07',NULL,0,2),
(3,'angry',1,'2023-12-02 19:34:07','2023-12-02 19:34:07',NULL,0,3),
(4,'gloomy',1,'2023-12-02 19:34:07','2023-12-02 19:34:07',NULL,0,4);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_music`
--

DROP TABLE IF EXISTS `playlist_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_music` (
  `pm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `deleted_YN` tinyint(1) DEFAULT 0,
  `playlist_id` bigint(20) NOT NULL,
  `music_id` bigint(20) NOT NULL,
  PRIMARY KEY (`pm_id`),
  KEY `playlist_id` (`playlist_id`),
  KEY `music_id` (`music_id`),
  CONSTRAINT `playlist_music_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE,
  CONSTRAINT `playlist_music_ibfk_2` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_music`
--

LOCK TABLES `playlist_music` WRITE;
/*!40000 ALTER TABLE `playlist_music` DISABLE KEYS */;
INSERT INTO `playlist_music` VALUES
(1,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,1,1),
(2,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,1,2),
(3,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,1,3),
(4,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,1,4),
(5,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,2,5),
(6,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,2,6),
(7,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,2,7),
(8,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,2,8),
(9,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,3,2),
(10,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,3,4),
(11,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,3,6),
(12,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,3,8),
(13,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,4,1),
(14,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,4,3),
(15,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,4,5),
(16,'2023-12-02 19:34:12','2023-12-02 19:34:12',NULL,0,4,7);
/*!40000 ALTER TABLE `playlist_music` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 19:35:12
