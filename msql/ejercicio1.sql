-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tienda
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tienda` ;

-- -----------------------------------------------------
-- Schema tienda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda` ;
USE `tienda` ;

-- -----------------------------------------------------
-- Table `tienda`.`Clientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tienda`.`Clientes` ;

CREATE TABLE IF NOT EXISTS `tienda`.`Clientes` (
  `idrfc` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  PRIMARY KEY (`idrfc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `tienda`.`Proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tienda`.`Proveedores` ;

CREATE TABLE IF NOT EXISTS `tienda`.`Proveedores` (
  `idrfc` VARCHAR(13) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrfc`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `tienda`.`Productos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tienda`.`Productos` ;

CREATE TABLE IF NOT EXISTS `tienda`.`Productos` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio unitario` FLOAT UNSIGNED NOT NULL,
  `Proveedores_idrfc` VARCHAR(13) NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_Productos_Proveedores_idx` (`Proveedores_idrfc` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `tienda`.`Compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tienda`.`Compras` ;

CREATE TABLE IF NOT EXISTS `tienda`.`Compras` (
  `folio` INT NOT NULL AUTO_INCREMENT,
  `Clientes_idrfc` VARCHAR(13) NOT NULL,
  `Productos_codigo` INT NOT NULL,
  PRIMARY KEY (`folio`),
  INDEX `fk_Clientes_has_Productos_Productos1_idx` (`Productos_codigo` ASC) VISIBLE,
  INDEX `fk_Clientes_has_Productos_Clientes1_idx` (`Clientes_idrfc` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
describe clientes
