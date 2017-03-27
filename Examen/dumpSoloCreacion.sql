-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema examen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `examen` ;

-- -----------------------------------------------------
-- Table `examen`.`DIRECTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`DIRECTOR` (
  `nombre` VARCHAR(60) NOT NULL,
  `nacion` VARCHAR(45) NOT NULL,
  `fnac` DATE NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`PELICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`PELICULA` (
  `titulo` VARCHAR(50) NOT NULL,
  `año` YEAR NOT NULL,
  `nacion` VARCHAR(45) NOT NULL,
  `idioma` VARCHAR(45) NOT NULL,
  `color` TINYINT(1) NOT NULL,
  `resumen` VARCHAR(500) NOT NULL,
  `observaciones` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`titulo`, `nombre`),
  INDEX `fk_PELICULA_DIRECTOR_idx` (`nombre` ASC),
  CONSTRAINT `fk_PELICULA_DIRECTOR`
    FOREIGN KEY (`nombre`)
    REFERENCES `examen`.`DIRECTOR` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`ACTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`ACTOR` (
  `nombre` VARCHAR(60) NOT NULL,
  `nacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `examen`.`PELICULA_has_ACTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `examen`.`PELICULA_has_ACTOR` (
  `titulo` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  `personaje` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`titulo`, `nombre`),
  INDEX `fk_PELICULA_has_ACTOR_ACTOR1_idx` (`nombre` ASC),
  INDEX `fk_PELICULA_has_ACTOR_PELICULA1_idx` (`titulo` ASC),
  CONSTRAINT `fk_PELICULA_has_ACTOR_PELICULA1`
    FOREIGN KEY (`titulo`)
    REFERENCES `examen`.`PELICULA` (`titulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PELICULA_has_ACTOR_ACTOR1`
    FOREIGN KEY (`nombre`)
    REFERENCES `examen`.`ACTOR` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
