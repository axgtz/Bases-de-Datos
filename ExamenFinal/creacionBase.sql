-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conductor` (
  `idConductor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `rfc` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idConductor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orden_De_Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orden_De_Entrega` (
  `idOrden_De_Entrega` INT NOT NULL,
  `Conductor_idConductor` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `completada` TINYINT(1) NOT NULL DEFAULT 0,
  `direccion_Entrega` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idOrden_De_Entrega`),
  INDEX `fk_Orden_De_Entrega_Conductor1_idx` (`Conductor_idConductor` ASC),
  INDEX `fk_Orden_De_Entrega_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Orden_De_Entrega_Conductor1`
    FOREIGN KEY (`Conductor_idConductor`)
    REFERENCES `mydb`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orden_De_Entrega_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Item` (
  `idItem` INT NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `peso` FLOAT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idItem`),
  INDEX `fk_Item_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Item_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Intento_De_Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Intento_De_Entrega` (
  `idIntento_De_Entrega` INT NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha_Hora` DATETIME NOT NULL,
  `Orden_De_Entrega_Cliente_idCliente` INT NOT NULL,
  `Conductor_idConductor` INT NOT NULL,
  PRIMARY KEY (`idIntento_De_Entrega`),
  INDEX `fk_Intento_De_Entrega_Orden_De_Entrega1_idx` (`Orden_De_Entrega_Cliente_idCliente` ASC),
  INDEX `fk_Intento_De_Entrega_Conductor1_idx` (`Conductor_idConductor` ASC),
  CONSTRAINT `fk_Intento_De_Entrega_Orden_De_Entrega1`
    FOREIGN KEY (`Orden_De_Entrega_Cliente_idCliente`)
    REFERENCES `mydb`.`Orden_De_Entrega` (`Cliente_idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Intento_De_Entrega_Conductor1`
    FOREIGN KEY (`Conductor_idConductor`)
    REFERENCES `mydb`.`Conductor` (`idConductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Item_has_Orden_De_Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Item_has_Orden_De_Entrega` (
  `Item_idItem` INT NOT NULL,
  `Orden_De_Entrega_idOrden_De_Entrega` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`Item_idItem`, `Orden_De_Entrega_idOrden_De_Entrega`),
  INDEX `fk_Item_has_Orden_De_Entrega_Orden_De_Entrega1_idx` (`Orden_De_Entrega_idOrden_De_Entrega` ASC),
  INDEX `fk_Item_has_Orden_De_Entrega_Item_idx` (`Item_idItem` ASC),
  CONSTRAINT `fk_Item_has_Orden_De_Entrega_Item`
    FOREIGN KEY (`Item_idItem`)
    REFERENCES `mydb`.`Item` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_has_Orden_De_Entrega_Orden_De_Entrega1`
    FOREIGN KEY (`Orden_De_Entrega_idOrden_De_Entrega`)
    REFERENCES `mydb`.`Orden_De_Entrega` (`idOrden_De_Entrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

