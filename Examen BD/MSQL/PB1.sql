-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema TProveedor
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TProveedor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TProveedor` ;
USE `TProveedor` ;

-- -----------------------------------------------------
-- Table `TProveedor`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TProveedor`.`categorias` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `TProveedor`.`piezas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TProveedor`.`piezas` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `catego` VARCHAR(60) NOT NULL,
  `categorias_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_piezas_categorias1_idx` (`categorias_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_piezas_categorias1`
    FOREIGN KEY (`categorias_codigo`)
    REFERENCES `TProveedor`.`categorias` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `TProveedor`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TProveedor`.`proveedores` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `TProveedor`.`suministra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TProveedor`.`suministra` (
  `piezas_codigo` INT NOT NULL,
  `proveedores_codigo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  INDEX `fk_piezas_has_proveedores_proveedores1_idx` (`proveedores_codigo` ASC) VISIBLE,
  INDEX `fk_piezas_has_proveedores_piezas_idx` (`piezas_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_piezas_has_proveedores_piezas`
    FOREIGN KEY (`piezas_codigo`)
    REFERENCES `TProveedor`.`piezas` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_piezas_has_proveedores_proveedores1`
    FOREIGN KEY (`proveedores_codigo`)
    REFERENCES `TProveedor`.`proveedores` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
