CREATE DATABASE  IF NOT EXISTS `examen` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `examen`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: examen
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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `nombre` varchar(60) NOT NULL,
  `nacion` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES ('Anne Hathaway','UK'),('Christian Bale','USA'),('Ellen Page ','USA'),('Jessica Chastain','UK'),('Joseph Gordon-Levitt','UK'),('Leonardo DiCaprio','USA'),('Matthew McConaughey','UK'),('Tom Hardy','USA');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `nombre` varchar(60) NOT NULL,
  `nacion` varchar(45) NOT NULL,
  `fnac` date NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES ('Christopher Nolan','USA','1970-10-10'),('Cuarón','MX','1970-10-10');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula` (
  `titulo` varchar(50) NOT NULL,
  `año` year(4) NOT NULL,
  `nacion` varchar(45) NOT NULL,
  `idioma` varchar(45) NOT NULL,
  `color` tinyint(1) NOT NULL,
  `resumen` varchar(500) NOT NULL,
  `observaciones` varchar(45) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`titulo`,`nombre`),
  KEY `fk_PELICULA_DIRECTOR_idx` (`nombre`),
  CONSTRAINT `fk_PELICULA_DIRECTOR` FOREIGN KEY (`nombre`) REFERENCES `director` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES ('Inception',2010,'USA','EN',1,'Se trata de que te meten en sueños y se alocan ahí','Turbo buena la peli','Christopher Nolan'),('Interstellar',2014,'USA','EN',1,'Se van en una nave en un hoyo negrro y son traicionados','Una de las mejores scifi del siglo','Christopher Nolan'),('The Dark Knight Rises',2012,'USA','EN',1,'Llega Batman y salva a todos','Parte de la mejor trilogia de superheroes','Christopher Nolan');
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula_has_actor`
--

DROP TABLE IF EXISTS `pelicula_has_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula_has_actor` (
  `titulo` varchar(50) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `personaje` varchar(45) NOT NULL,
  PRIMARY KEY (`titulo`,`nombre`),
  KEY `fk_PELICULA_has_ACTOR_ACTOR1_idx` (`nombre`),
  KEY `fk_PELICULA_has_ACTOR_PELICULA1_idx` (`titulo`),
  CONSTRAINT `fk_PELICULA_has_ACTOR_ACTOR1` FOREIGN KEY (`nombre`) REFERENCES `actor` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PELICULA_has_ACTOR_PELICULA1` FOREIGN KEY (`titulo`) REFERENCES `pelicula` (`titulo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula_has_actor`
--

LOCK TABLES `pelicula_has_actor` WRITE;
/*!40000 ALTER TABLE `pelicula_has_actor` DISABLE KEYS */;
INSERT INTO `pelicula_has_actor` VALUES ('Inception','Ellen Page','Estudiante'),('Inception','Joseph Gordon-Levitt','El arquitecto'),('Inception','Leonardo DiCaprio','Lider'),('Interstellar','Anne Hathaway','Astronauta 2'),('Interstellar','Jessica Chastain','Dr Rose'),('Interstellar','Matthew McConaughey','Piloto'),('The Dark Knight Rises','Anne Hathaway','Gatubela'),('The Dark Knight Rises','Christian Bale','Bruno Days'),('The Dark Knight Rises','Tom Hardy','Toxico');
/*!40000 ALTER TABLE `pelicula_has_actor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-27 10:42:16
