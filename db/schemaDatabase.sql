CREATE DATABASE  IF NOT EXISTS `storage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `storage`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: storage
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
-- Table structure for table `articolo`
--

DROP TABLE IF EXISTS `articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articolo` (
  `idarticolo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descrizione` varchar(2000) NOT NULL,
  `prezzo` float NOT NULL,
  `iva` int(11) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `qtadisponibile` int(11) NOT NULL,
  PRIMARY KEY (`idarticolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `composizione`
--

DROP TABLE IF EXISTS `composizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composizione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantità` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `prezzo` float NOT NULL,
  `descrizione` varchar(2000) NOT NULL,
  `iva` int(11) NOT NULL,
  `idarticolo` int(11) DEFAULT NULL,
  `idordine` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `composzionearticolo_idx` (`idarticolo`),
  KEY `composizioneordine_idx` (`idordine`),
  CONSTRAINT `composizionearticolo` FOREIGN KEY (`idarticolo`) REFERENCES `articolo` (`idarticolo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `composizioneordine` FOREIGN KEY (`idordine`) REFERENCES `ordine` (`idordine`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `codice` int(11) NOT NULL AUTO_INCREMENT,
  `utente` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `cellulare` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `citta` varchar(45) NOT NULL,
  `cap` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `utente_idx` (`utente`),
  CONSTRAINT `utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metodopagamento`
--

DROP TABLE IF EXISTS `metodopagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopagamento` (
  `numerocarta` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `scadenza` varchar(45) NOT NULL,
  `cvv` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`numerocarta`),
  KEY `metodoutente_idx` (`email`),
  CONSTRAINT `metodoutente` FOREIGN KEY (`email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `idordine` int(11) NOT NULL AUTO_INCREMENT,
  `stato` varchar(45) NOT NULL,
  `totale` float NOT NULL,
  `email` varchar(45) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`idordine`),
  UNIQUE KEY `idOrdine_UNIQUE` (`idordine`),
  KEY `Email_idx` (`email`),
  CONSTRAINT `Email` FOREIGN KEY (`email`) REFERENCES `utente` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `user_id_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'storage'
--

--
-- Dumping routines for database 'storage'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-03 20:24:44
