-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: aeropuerto
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avion` (
  `matricula` varchar(12) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `id_base` int(11) NOT NULL,
  `tipo` varchar(13) NOT NULL,
  PRIMARY KEY (`matricula`,`id_base`),
  KEY `fk_AVION_BASE1_idx` (`id_base`),
  CONSTRAINT `fk_AVION_BASE1` FOREIGN KEY (`id_base`) REFERENCES `base` (`id_base`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES ('A320320',300,2,'AIRBUS-A320'),('B737737',200,1,'BOEING-737'),('B747747',140,1,'BOEING-747'),('T144143',80,3,'TUPOLEV-T144'),('T144144',80,2,'TUPOLEV-T144');
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base`
--

DROP TABLE IF EXISTS `base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base` (
  `id_base` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_base`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base`
--

LOCK TABLES `base` WRITE;
/*!40000 ALTER TABLE `base` DISABLE KEYS */;
INSERT INTO `base` VALUES (1,'CDMX','Base CDMX'),(2,'Cancun','Base Cancun'),(3,'Monterrey','Base Monterrey');
/*!40000 ALTER TABLE `base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripulacion`
--

DROP TABLE IF EXISTS `tripulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tripulacion` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `id_base` int(11) NOT NULL,
  PRIMARY KEY (`codigo`,`id_base`),
  KEY `fk_TRIPULACION_BASE1_idx` (`id_base`),
  CONSTRAINT `fk_TRIPULACION_BASE1` FOREIGN KEY (`id_base`) REFERENCES `base` (`id_base`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripulacion`
--

LOCK TABLES `tripulacion` WRITE;
/*!40000 ALTER TABLE `tripulacion` DISABLE KEYS */;
INSERT INTO `tripulacion` VALUES (7,'Robert','De Niro','Piloto',1),(8,'Marty','Mcfly','Piloto',2),(9,'Alex','Guti','Piloto',3),(10,'Hector','Lopez','Sobrecargo',1),(11,'Pepe','Mendizabal','Sobrecargo',2),(12,'DJ','Cadena','Sobrecargo',3);
/*!40000 ALTER TABLE `tripulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripulacion_has_vuelo`
--

DROP TABLE IF EXISTS `tripulacion_has_vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tripulacion_has_vuelo` (
  `codigo` int(11) NOT NULL,
  `numero_vuelo` varchar(7) NOT NULL,
  PRIMARY KEY (`codigo`,`numero_vuelo`),
  KEY `fk_TRIPULACION_has_VUELO_VUELO1_idx` (`numero_vuelo`),
  KEY `fk_TRIPULACION_has_VUELO_TRIPULACION1_idx` (`codigo`),
  CONSTRAINT `fk_TRIPULACION_has_VUELO_TRIPULACION1` FOREIGN KEY (`codigo`) REFERENCES `tripulacion` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRIPULACION_has_VUELO_VUELO1` FOREIGN KEY (`numero_vuelo`) REFERENCES `vuelo` (`numero_vuelo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripulacion_has_vuelo`
--

LOCK TABLES `tripulacion_has_vuelo` WRITE;
/*!40000 ALTER TABLE `tripulacion_has_vuelo` DISABLE KEYS */;
INSERT INTO `tripulacion_has_vuelo` VALUES (7,'MY-1234'),(7,'MY-1235'),(7,'MY-1236'),(8,'CD-1234'),(8,'CD-1235'),(9,'CN-1234'),(9,'CN-1235'),(9,'CN-1236'),(10,'CD-1234'),(10,'CD-1235'),(11,'CN-1234'),(11,'CN-1235'),(11,'CN-1236'),(12,'MY-1234'),(12,'MY-1235'),(12,'MY-1236');
/*!40000 ALTER TABLE `tripulacion_has_vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `numero_vuelo` varchar(9) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `origen` varchar(45) NOT NULL,
  `hora_salida` time(6) NOT NULL,
  `fecha` date NOT NULL,
  `duracion` decimal(6,2) NOT NULL,
  `matricula` varchar(12) NOT NULL,
  PRIMARY KEY (`numero_vuelo`,`matricula`),
  KEY `fk_VUELO_AVION1_idx` (`matricula`),
  CONSTRAINT `fk_VUELO_AVION1` FOREIGN KEY (`matricula`) REFERENCES `avion` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES ('CD-1234','Cancun','CDMX','01:00:00.000000','2017-01-01',3.10,'A320320'),('CD-1235','Monterrey','CDMX','05:00:00.000000','2017-01-01',2.30,'B737737'),('CN-1234','CDMX','Cancun','19:00:00.000000','2017-01-01',2.05,'A320320'),('CN-1235','Monterrey','Cancun','23:00:00.000000','2017-02-02',2.50,'B747747'),('CN-1236','Monterrey','Cancun','19:00:00.000000','2017-03-01',2.05,'T144143'),('MY-1234','CDMX','Monterrey','13:00:00.000000','2017-01-01',2.08,'B737737'),('MY-1235','Cancun','Monterrey','06:05:00.000000','2017-02-02',1.59,'B747747'),('MY-1236','Cancun','Monterrey','06:10:00.000000','2017-03-02',1.58,'T144143');
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27  9:25:29
