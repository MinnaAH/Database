-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: night_club_oy
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `esiintyjat`
--

DROP TABLE IF EXISTS `esiintyjat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `esiintyjat` (
  `RAVINTOLA_ID` int(11) NOT NULL,
  `NIMI` varchar(45) NOT NULL,
  `PVM` date NOT NULL,
  `AIKA` time(4) NOT NULL,
  `LIPPU` decimal(5,2) NOT NULL,
  KEY `FK_ravintola_idx` (`RAVINTOLA_ID`),
  CONSTRAINT `FK_esiintyjä` FOREIGN KEY (`RAVINTOLA_ID`) REFERENCES `yokerho` (`TUNNUS`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `esiintyjat`
--

LOCK TABLES `esiintyjat` WRITE;
/*!40000 ALTER TABLE `esiintyjat` DISABLE KEYS */;
/*!40000 ALTER TABLE `esiintyjat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juomat`
--

DROP TABLE IF EXISTS `juomat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juomat` (
  `TUOTENRO` int(7) NOT NULL,
  `NIMI` varchar(20) NOT NULL,
  `HINTA` decimal(4,2) NOT NULL,
  `PROSENTTI` int(11) DEFAULT NULL,
  `TOIMITTAJA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TUOTENRO`),
  CONSTRAINT `FK_juomat` FOREIGN KEY (`TUOTENRO`) REFERENCES `tuotteet` (`TUOTENRO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juomat`
--

LOCK TABLES `juomat` WRITE;
/*!40000 ALTER TABLE `juomat` DISABLE KEYS */;
/*!40000 ALTER TABLE `juomat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paalikko`
--

DROP TABLE IF EXISTS `paalikko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paalikko` (
  `TUNNUS` int(4) NOT NULL,
  `ETUNIMI` varchar(20) NOT NULL,
  `SUKUNIMI` varchar(45) NOT NULL,
  `EMAIL` varchar(70) NOT NULL,
  `PUHNRO` varchar(10) NOT NULL,
  PRIMARY KEY (`TUNNUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paalikko`
--

LOCK TABLES `paalikko` WRITE;
/*!40000 ALTER TABLE `paalikko` DISABLE KEYS */;
/*!40000 ALTER TABLE `paalikko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purtavat`
--

DROP TABLE IF EXISTS `purtavat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purtavat` (
  `TUOTENRO` int(7) NOT NULL,
  `NIMI` varchar(45) NOT NULL,
  `HINTA` decimal(4,2) NOT NULL,
  `VALMISTAJA` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TUOTENRO`),
  CONSTRAINT `FK_purtavat` FOREIGN KEY (`TUOTENRO`) REFERENCES `tuotteet` (`TUOTENRO`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purtavat`
--

LOCK TABLES `purtavat` WRITE;
/*!40000 ALTER TABLE `purtavat` DISABLE KEYS */;
/*!40000 ALTER TABLE `purtavat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuotteet`
--

DROP TABLE IF EXISTS `tuotteet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuotteet` (
  `SAATAVUUS` int(11) NOT NULL,
  `TUOTENRO` int(7) NOT NULL,
  PRIMARY KEY (`TUOTENRO`),
  KEY `FK_saatavuus_idx` (`SAATAVUUS`),
  CONSTRAINT `FK_saatavuus` FOREIGN KEY (`SAATAVUUS`) REFERENCES `yokerho` (`TUNNUS`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuotteet`
--

LOCK TABLES `tuotteet` WRITE;
/*!40000 ALTER TABLE `tuotteet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tuotteet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip`
--

DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip` (
  `RAVINTOLA` int(11) NOT NULL,
  `ETUNIMI` varchar(20) NOT NULL,
  `SUKUNIMI` varchar(45) NOT NULL,
  `SYNTYMAPAIVA` date NOT NULL,
  `EMAIL` varchar(70) NOT NULL,
  `PUHNRO` varchar(10) NOT NULL,
  KEY `FK_VIP_idx` (`RAVINTOLA`),
  CONSTRAINT `FK_VIP` FOREIGN KEY (`RAVINTOLA`) REFERENCES `yokerho` (`TUNNUS`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip`
--

LOCK TABLES `vip` WRITE;
/*!40000 ALTER TABLE `vip` DISABLE KEYS */;
/*!40000 ALTER TABLE `vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yokerho`
--

DROP TABLE IF EXISTS `yokerho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yokerho` (
  `TUNNUS` int(11) NOT NULL AUTO_INCREMENT,
  `OSOITE` varchar(45) NOT NULL,
  `KAUPUNKI` varchar(45) NOT NULL,
  `EMAIL` varchar(70) NOT NULL,
  `PAALIKKO` int(4) NOT NULL,
  PRIMARY KEY (`TUNNUS`),
  KEY `FK_paalikko_idx` (`PAALIKKO`),
  CONSTRAINT `FK_paalikko` FOREIGN KEY (`PAALIKKO`) REFERENCES `paalikko` (`TUNNUS`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yokerho`
--

LOCK TABLES `yokerho` WRITE;
/*!40000 ALTER TABLE `yokerho` DISABLE KEYS */;
/*!40000 ALTER TABLE `yokerho` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-14 16:23:06
