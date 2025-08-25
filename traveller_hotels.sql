-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: traveller
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `HotelID` int NOT NULL AUTO_INCREMENT,
  `HotelName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ContactPerson` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ToTown` int NOT NULL,
  `ToHotelOrganizer` int NOT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`HotelID`),
  KEY `fk_hotels_town` (`ToTown`),
  KEY `fk_hotels_organizer` (`ToHotelOrganizer`),
  CONSTRAINT `fk_hotels_organizer` FOREIGN KEY (`ToHotelOrganizer`) REFERENCES `hotelorganizer` (`organizerId`),
  CONSTRAINT `fk_hotels_town` FOREIGN KEY (`ToTown`) REFERENCES `towns` (`TownID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Grand Hotel Sofia','bul. Vitosha 1, Sofia','+35928888888','info@grandhotelsofia.bg','Maria Ivanova',1,1,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(2,'Central Plaza Hotel','pl. Sveta Nedelya 5, Sofia','+35928777777','reservations@centralplaza.bg','Georgi Petrov',1,1,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(3,'Mountain View Resort','ul. Vitosha 25, Sofia','+35928666666','book@mountainview.bg','Elena Dimitrova',1,1,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(4,'Ancient City Hotel','ul. Knyaz Alexander 15, Plovdiv','+35932655555','info@ancientcity.bg','Ivan Stoyanov',2,2,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(5,'River Side Hotel','bul. Maritsa 8, Plovdiv','+35932644444','reserve@riverside.bg','Petra Nikolova',2,2,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(6,'Old Town Resort','ul. Strumna 3, Plovdiv','+35932633333','booking@oldtown.bg','Dimitar Georgiev',2,2,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(7,'Black Sea Palace','bul. Primorski 10, Varna','+35952622222','info@blackseapalace.bg','Sofia Marinova',3,3,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(8,'Beach Resort Varna','ul. Chaika 5, Varna','+35952611111','reservations@beachresort.bg','Kaloyan Ivanov',3,3,'2025-08-19 19:25:21','2025-08-19 19:25:21',1),(9,'Marina Bay Hotel','ul. Morska 12, Varna','+35952600000','book@marinabay.bg','Radoslav Petkov',3,3,'2025-08-19 19:25:21','2025-08-19 19:25:21',1);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-25 10:22:51
