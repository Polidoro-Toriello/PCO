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
-- Dumping data for table `articolo`
--

LOCK TABLES `articolo` WRITE;
/*!40000 ALTER TABLE `articolo` DISABLE KEYS */;
INSERT INTO `articolo` VALUES (1,'Nvidia RTX 3080','GPU Invidia RTX 3080',1200,14,'gpu',3),(3,'Nvidia RTX 3070','GPU Invidia RTX 3070',1000,15,'gpu',5),(4,'Nvidia RTX 3060','GPU Invidia RTX 3060',800,14,'gpu',0),(5,'RTX 3090 Ti','Le GeForce RTX™ 3090 Ti e 3090 sono \"Big Ferocious GPU\" (BFGPU) straordinarie con prestazioni di classe TITAN. Basate su Ampere, l\'architettura NVIDIA RTX di seconda generazione, offrono prestazioni doppie di ray-tracing e IA con Ray Tracing (RT) Core, Tensor Core e nuovi multiprocessori di streaming avanzati. Includono inoltre 24 GB di memoria G6X, il tutto per fornire un\'esperienza eccezionale per gamer e creativi.',100,22,'gpu',100),(6,'Intel Core i9-12900KS BX8071512900KS','Intel Core i9-12900KS 12. Processore desktop (frequenza di base: 2,4 GHz, 16 core, LGA1700, RAM DDR4 e DDR5 fino a 128 GB) BX8071512900KS',810,20,'cpu',8),(7,'Intel BX8071512900K, Core i9-12900K','Intel BX8071512900K, Core i9-12900K, 8C+8c/24T, 3.20-5.20GHz, in scatola senza dissipatore\"',675,25,'cpu',10),(8,'Corsair Vengeance RGB RS 16GB (2 x 8 GB), DDR4 3200MHz ','Corsair Vengeance RGB RS 16GB (2 x 8 GB), DDR4 3200MHz C16 Memoria per Desktop (Illuminazione RGB Dinamica, Tempi di Risposta Stretti, Compatibile con Intel & AMD 300/400/500 Series), Nero\"\"',98,23,'ram',7),(9,'Kingston FURY Beast RGB 16GB (2x8GB) 3200MHz DDR4','Kingston FURY Beast RGB 16GB (2x8GB) 3200MHz DDR4 CL16 Memoria Gaming Kit per Computer Fissi Kit da 2, KF432C16BBAK2/16',79,15,'ram',6),(10,'PCSpecialist Pro PC Gaming 	PRO_I5_11F_3060','PCSpecialist Pro PC Gaming - Intel® Core™ i5-11400F 2,60 GHz 6-Core, 16 GB RAM, GEFORCE RTX 3060 12 GB, 1 TB M.2 SSD',1299,24,'pc',4),(11,'PC-Gaming Megaport 31-DE','PC-Gaming AMD Ryzen 5 3600 6x 4.20GHz Turbo • Windows 11 • Nvidia GeForce RTX3060 12GB • 16GB 3200MHz DDR4 • 1TB M.2 SSD • WiFi • pc da gaming',1149,30,'pc',5),(12,'Crucial BX500','Crucial BX500 240 GB CT240BX500SSD1(Z) fino a 540 MB/s, SSD Interno, 3D NAND, SATA, 2.5 Pollici\"',48.99,10,'ssd',6),(13,'Crucial BX500 480 GB','Crucial BX500 480 GB CT480BX500SSD1 fino a 540 MB/s, SSD Interno, 3D NAND, SATA, 2.5 Pollici, Nero',79.99,11,'ssd',0),(14,'HDD WD 4 TB','WD 4TB Elements Portable, Hard Disk Esterno Portatile, USB 3.0',100.47,15,'hdd',4);
/*!40000 ALTER TABLE `articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `composizione`
--

LOCK TABLES `composizione` WRITE;
/*!40000 ALTER TABLE `composizione` DISABLE KEYS */;
INSERT INTO `composizione` VALUES (2,1,'Nvidia RTX 3080',1200,14,1,18,'GPU Invidia RTX 3080'),(3,1,'Nvidia RTX 3070',1000,15,3,18,'GPU Invidia RTX 3070'),(4,1,'Nvidia RTX 3060',800,14,4,18,'GPU Invidia RTX 3060'),(5,1,'RTX 3090 Ti',100,22,5,18,'Le GeForce RTX™ 3090 Ti e 3090 sono \"Big Ferocious GPU\" (BFGPU) straordinarie con prestazioni di classe TITAN. Basate su Ampere, l\'architettura NVIDIA RTX di seconda generazione, offrono prestazioni doppie di ray-tracing e IA con Ray Tracing (RT) Core, Tensor Core e nuovi multiprocessori di streaming avanzati. Includono inoltre 24 GB di memoria G6X, il tutto per fornire un\'esperienza eccezionale per gamer e creativi.'),(6,4,'Nvidia RTX 3080',1200,14,1,19,'GPU Invidia RTX 3080'),(7,2,'Nvidia RTX 3070',1000,15,3,19,'GPU Invidia RTX 3070'),(8,1,'Nvidia RTX 3060',800,14,4,19,'GPU Invidia RTX 3060'),(9,1,'Nvidia RTX 3080',1200,14,1,20,'GPU Invidia RTX 3080'),(10,1,'Nvidia RTX 3080',1200,14,1,21,'GPU Invidia RTX 3080'),(11,1,'Nvidia RTX 3080',1200,14,1,22,'GPU Invidia RTX 3080'),(12,1,'Nvidia RTX 3080',1200,14,1,23,'GPU Invidia RTX 3080'),(13,1,'Nvidia RTX 3080',1200,14,1,24,'GPU Invidia RTX 3080'),(14,1,'Nvidia RTX 3080',1200,14,1,25,'GPU Invidia RTX 3080'),(15,1,'Nvidia RTX 3080',1200,14,1,26,'GPU Invidia RTX 3080'),(16,1,'Nvidia RTX 3080',1200,14,1,27,'GPU Invidia RTX 3080'),(17,1,'Nvidia RTX 3080',1200,14,1,28,'GPU Invidia RTX 3080'),(18,1,'Nvidia RTX 3080',1200,14,1,29,'GPU Invidia RTX 3080'),(19,1,'Nvidia RTX 3080',1200,14,1,30,'GPU Invidia RTX 3080'),(20,1,'Nvidia RTX 3080',1200,14,1,31,'GPU Invidia RTX 3080'),(21,1,'Nvidia RTX 3080',1200,14,1,32,'GPU Invidia RTX 3080'),(22,3,'Nvidia RTX 3080',1200,14,1,33,'GPU Invidia RTX 3080'),(23,1,'Nvidia RTX 3060',800,14,4,33,'GPU Invidia RTX 3060'),(24,1,'Nvidia RTX 3060',800,14,4,34,'GPU Invidia RTX 3060'),(27,1,'Intel BX8071512900K, Core i9-12900K',675,25,7,37,'Intel BX8071512900K, Core i9-12900K, 8C+8c/24T, 3.20-5.20GHz, in scatola senza dissipatore'),(28,3,'Nvidia RTX 3070',1000,15,3,38,'GPU Invidia RTX 3070'),(29,1,'Intel BX8071512900K, Core i9-12900K',675,25,7,39,'Intel BX8071512900K, Core i9-12900K, 8C+8c/24T, 3.20-5.20GHz, in scatola senza dissipatore\"'),(30,1,'HDD WD 4 TB',100.47,16,14,40,'WD 4TB Elements Portable, Hard Disk Esterno Portatile, USB 3.0\"\"\"'),(31,1,'Nvidia RTX 3070',1000,15,3,41,'GPU Invidia RTX 3070'),(32,1,'Intel Core i9-12900KS BX8071512900KS',810,20,6,41,'Intel Core i9-12900KS 12. Processore desktop (frequenza di base: 2,4 GHz, 16 core, LGA1700, RAM DDR4 e DDR5 fino a 128 GB) BX8071512900KS'),(33,2,'HDD Toshiba 1TB',36.7,10,NULL,42,'TOSHIBA HDTB410EK3AA Canvio Basics, Disco Rigido Esterno Portatile, USB 3.2, 1 TB, Nero'),(34,1,'Nvidia RTX 3080',1200,14,1,43,'GPU Invidia RTX 3080'),(35,1,'Nvidia RTX 4080',1200,16,NULL,44,'Nvidia RTX 4080'),(36,1,'HDD Toshiba 1TB',36.7,10,NULL,45,'TOSHIBA HDTB410EK3AA Canvio Basics, Disco Rigido Esterno Portatile, USB 3.2, 1 TB, Nero'),(37,1,'PCSpecialist Pro PC Gaming 	PRO_I5_11F_3060',1299,24,10,45,'PCSpecialist Pro PC Gaming - Intel® Core™ i5-11400F 2,60 GHz 6-Core, 16 GB RAM, GEFORCE RTX 3060 12 GB, 1 TB M.2 SSD'),(38,1,'Crucial BX500 480 GB',79.99,11,13,46,'Crucial BX500 480 GB CT480BX500SSD1 fino a 540 MB/s, SSD Interno, 3D NAND, SATA, 2.5 Pollici, Nero'),(39,1,'cpu ryzen 5 1600x',678,23,NULL,47,'cpu ryzen 5 1600x'),(40,1,'Crucial BX500',48.99,10,12,48,'Crucial BX500 240 GB CT240BX500SSD1(Z) fino a 540 MB/s, SSD Interno, 3D NAND, SATA, 2.5 Pollici\"'),(41,1,'Nvidia RTX 3070',1000,15,3,48,'GPU Invidia RTX 3070'),(42,1,'PC-Gaming Megaport 31-DE',1149,30,11,49,'PC-Gaming AMD Ryzen 5 3600 6x 4.20GHz Turbo • Windows 11 • Nvidia GeForce RTX3060 12GB • 16GB 3200MHz DDR4 • 1TB M.2 SSD • WiFi • pc da gaming'),(43,1,'Kingston FURY Beast RGB 16GB (2x8GB) 3200MHz DDR4',79,15,9,51,'Kingston FURY Beast RGB 16GB (2x8GB) 3200MHz DDR4 CL16 Memoria Gaming Kit per Computer Fissi Kit da 2, KF432C16BBAK2/16'),(44,1,'Kingston FURY Beast RGB 16GB (2x8GB) 3200MHz DDR4',79,15,9,52,'Kingston FURY Beast RGB 16GB (2x8GB) 3200MHz DDR4 CL16 Memoria Gaming Kit per Computer Fissi Kit da 2, KF432C16BBAK2/16'),(45,1,'Crucial BX500 480 GB',79.99,11,13,53,'Crucial BX500 480 GB CT480BX500SSD1 fino a 540 MB/s, SSD Interno, 3D NAND, SATA, 2.5 Pollici, Nero'),(46,2,'Nvidia RTX 3060',800,14,4,54,'GPU Invidia RTX 3060'),(47,4,'Crucial BX500 480 GB',79.99,11,13,55,'Crucial BX500 480 GB CT480BX500SSD1 fino a 540 MB/s, SSD Interno, 3D NAND, SATA, 2.5 Pollici, Nero');
/*!40000 ALTER TABLE `composizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
INSERT INTO `indirizzo` VALUES (2,'giovannitoriello2000@gmail.com','Giovanni','Toriello','45325345435','Salerno','Montecorvino Rovella','84096','Via Giudice Mattei'),(6,'polidororiccardo311@gmail.com','Riccardo','Polidoro','3480847975','Salerno','Maiori','84010','Via Nuova Chiunzi 99'),(7,'m.rossini22@virgilio.it','Marco','Rossini','350 0987654','Salerno','Salerno','84121','Via Roma 11');
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `metodopagamento`
--

LOCK TABLES `metodopagamento` WRITE;
/*!40000 ALTER TABLE `metodopagamento` DISABLE KEYS */;
INSERT INTO `metodopagamento` VALUES (1,'53454353453','Visa','10/25',880,'Giovanni','Toriello','giovannitoriello2000@gmail.com'),(2,'5678956432','Visa','09/25',897,'Riccardo','Polidoro','polidororiccardo311@gmail.com'),(3,'5101 8976 4567 3421','Amex','05/25',670,'Mario','Rossini','m.rossini22@virgilio.it');
/*!40000 ALTER TABLE `metodopagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
INSERT INTO `ordine` VALUES (6,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(7,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(8,'confermato',1000,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(9,'confermato',4485,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(10,'confermato',3000,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(13,'confermato',3000,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(14,'confermato',1000,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(15,'confermato',2000,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(16,'confermato',1358.99,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(17,'confermato',1398.47,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(18,'confermato',3100,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(19,'confermato',7600,'giovannitoriello2000@gmail.com','2022-07-25',2,1),(20,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(21,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(22,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(23,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(24,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(25,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(26,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(27,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(28,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(29,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(30,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(31,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(32,'confermato',1200,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(33,'confermato',4400,'giovannitoriello2000@gmail.com','2022-07-26',2,1),(34,'confermato',800,'polidororiccardo311@gmail.com','2022-08-02',6,2),(37,'confermato',675,'polidororiccardo311@gmail.com','2022-08-02',6,2),(38,'confermato',3000,'m.rossini22@virgilio.it','2022-08-12',7,3),(39,'confermato',754,'m.rossini22@virgilio.it','2022-08-12',7,3),(40,'confermato',198.47,'m.rossini22@virgilio.it','2022-08-12',7,3),(41,'confermato',1810,'m.rossini22@virgilio.it','2022-08-12',7,3),(42,'confermato',73.4,'m.rossini22@virgilio.it','2022-08-18',7,3),(43,'confermato',1200,'m.rossini22@virgilio.it','2022-09-07',7,3),(44,'confermato',1200,'polidororiccardo311@gmail.com','2022-09-09',6,2),(45,'confermato',1335.7,'polidororiccardo311@gmail.com','2022-09-09',6,2),(46,'confermato',158.99,'polidororiccardo311@gmail.com','2022-09-12',6,2),(47,'confermato',678,'polidororiccardo311@gmail.com','2022-09-12',6,2),(48,'confermato',1048.99,'polidororiccardo311@gmail.com','2022-09-12',6,2),(49,'confermato',1149,'polidororiccardo311@gmail.com','2022-09-12',6,2),(50,'confermato',79,'polidororiccardo311@gmail.com','2022-09-12',6,2),(51,'confermato',79,'polidororiccardo311@gmail.com','2022-09-12',6,2),(52,'confermato',79,'polidororiccardo311@gmail.com','2022-09-12',6,2),(53,'confermato',79.99,'polidororiccardo311@gmail.com','2022-09-12',6,2),(54,'confermato',1600,'polidororiccardo311@gmail.com','2022-09-12',6,2),(55,'confermato',319.96,'polidororiccardo311@gmail.com','2022-09-12',6,2);
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('giovannitoriello2000@gmail.com','Giovanni','Toriello','xJohnny23','fb06b871645fc7351a4ba3beb7f300ae594e2816',1),('gverdi89@gmail.com','Giuseppe','Verdi','gverdi89','2c513b487e18a3035d2641fbc21a5420e9abe7e9',1),('lverdi67@gmail.com','Luca','Verdi','lverdi67','6fe730a041db7800a78310a6c1530e0ff0b9f9e8',0),('m.rossini22@virgilio.it','Marco','Rossini','mrkRoss22','3226e8140a9dd77e3b929b76540637bfe8389924',0),('mariorossi71@gmail.com','Mario','Rossi','mrossi71','4edeac5b7098326e79cf2f79daa32a62c421dafe',0),('paoloneri33@gmail.com','Paolo','Neri','pneri33','79be93691784a2d0881d67c6a37e0d7af7a48430',0),('polidororiccardo311@gmail.com','Riccardo','Polidoro','rik789','549c20329aec2eab8e6119f9a8949b62aa8e0ab3',0);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2022-09-12 21:43:28
