CREATE DATABASE  IF NOT EXISTS `Kioskos` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Kioskos`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Kioskos
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb8u1

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
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empleado` (
  `no_empleado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellidos` varchar(45) NOT NULL,
  `Sueldo` smallint(5) unsigned NOT NULL DEFAULT '5000',
  `FechaContratacion` date NOT NULL,
  `nombre_kiosko` varchar(45) NOT NULL,
  PRIMARY KEY (`no_empleado`),
  KEY `fk_Empleado_1_idx` (`nombre_kiosko`),
  CONSTRAINT `fk_Empleado_1` FOREIGN KEY (`nombre_kiosko`) REFERENCES `Kiosko` (`nombre_kiosko`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'Alejandro','Guti',2700,'2016-02-12','La Fonda Argentina'),(2,'Fernando','Martinez',4800,'2015-08-04','NutreTec'),(3,'Alexander','Suárez',3200,'2016-05-05','Don Quesadillas Guti'),(4,'Mariana','Salinas',4800,'2015-04-26','NutreTec');
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kiosko`
--

DROP TABLE IF EXISTS `Kiosko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kiosko` (
  `nombre_kiosko` varchar(45) NOT NULL,
  `Telefono` char(10) DEFAULT '5555854562',
  `Ubicacion` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre_kiosko`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kiosko`
--

LOCK TABLES `Kiosko` WRITE;
/*!40000 ALTER TABLE `Kiosko` DISABLE KEYS */;
INSERT INTO `Kiosko` VALUES ('Don Quesadillas Guti','5564213034','Aulas 3 Santa Fe'),('La Fonda Argentina','5564641213','Aulas 1 Santa Fe'),('NutreTec','5587451246','Aulas 1 Santa Fe');
/*!40000 ALTER TABLE `Kiosko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto`
--

DROP TABLE IF EXISTS `Producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producto` (
  `upc` char(12) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Precio` decimal(5,2) unsigned NOT NULL,
  PRIMARY KEY (`upc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto`
--

LOCK TABLES `Producto` WRITE;
/*!40000 ALTER TABLE `Producto` DISABLE KEYS */;
INSERT INTO `Producto` VALUES ('023154895754','Paleta congelada fresa',15.00),('123456789012','Hamburguesa con queso',65.00),('325142512457','Galleta Emperador Chocolate',10.00),('456124578451','Sabritas Limoon',12.00),('658745875123','Donas Bimbo',45.00),('784515245697','Duvalin',5.00),('895641254215','Gatorade Naranja',20.00),('965745125487','Arrachera con papas',120.00);
/*!40000 ALTER TABLE `Producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producto_Venta`
--

DROP TABLE IF EXISTS `Producto_Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producto_Venta` (
  `upc_producto` char(12) NOT NULL,
  `idVenta` int(10) unsigned NOT NULL,
  `cantidad` smallint(5) unsigned NOT NULL,
  KEY `fk_Producto_Venta_1_idx` (`upc_producto`),
  KEY `fk_Producto_Venta_2_idx` (`idVenta`),
  CONSTRAINT `fk_Producto_Venta_1` FOREIGN KEY (`upc_producto`) REFERENCES `Producto` (`upc`),
  CONSTRAINT `fk_Producto_Venta_2` FOREIGN KEY (`idVenta`) REFERENCES `Venta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producto_Venta`
--

LOCK TABLES `Producto_Venta` WRITE;
/*!40000 ALTER TABLE `Producto_Venta` DISABLE KEYS */;
INSERT INTO `Producto_Venta` VALUES ('123456789012',1,3),('965745125487',1,1),('784515245697',2,2),('325142512457',3,2),('658745875123',3,1),('895641254215',4,2),('023154895754',5,4),('325142512457',6,3),('325142512457',7,1),('784515245697',7,3),('456124578451',8,2),('456124578451',9,1),('658745875123',10,3);
/*!40000 ALTER TABLE `Producto_Venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Venta` (
  `idVenta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FechaHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MetodoPago` varchar(45) NOT NULL,
  `no_empleado` int(10) unsigned NOT NULL,
  `nombre_kiosko` varchar(45) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_Venta_1_idx` (`no_empleado`),
  KEY `fk_Venta_2_idx` (`nombre_kiosko`),
  CONSTRAINT `fk_Venta_1` FOREIGN KEY (`no_empleado`) REFERENCES `Empleado` (`no_empleado`),
  CONSTRAINT `fk_Venta_2` FOREIGN KEY (`nombre_kiosko`) REFERENCES `Kiosko` (`nombre_kiosko`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
INSERT INTO `Venta` VALUES (1,'2017-03-13 00:42:46','Efectivo',1,'La Fonda Argentina'),(2,'2017-03-13 00:51:01','TDC',2,'NutreTec'),(3,'2017-03-13 00:51:01','Efectivo',2,'NutreTec'),(4,'2017-03-13 00:51:01','Efectivo',3,'Don Quesadillas Guti'),(5,'2017-03-13 00:51:01','Cheque',4,'NutreTec'),(6,'2017-03-13 00:51:01','Efectivo',1,'La Fonda Argentina'),(7,'2017-03-13 00:51:01','TDC',3,'Don Quesadillas Guti'),(8,'2017-03-13 00:51:01','Reloj',1,'La Fonda Argentina'),(9,'2017-03-13 00:51:01','Efectivo',2,'NutreTec'),(10,'2017-03-13 00:51:01','Efectivo',3,'Don Quesadillas Guti');
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-12 19:32:25
