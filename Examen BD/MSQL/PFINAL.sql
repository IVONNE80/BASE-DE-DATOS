-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proveedores
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`categorias` ;

CREATE TABLE IF NOT EXISTS `mydb`.`categorias` (
  `idCodigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCodigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`piezas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`piezas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`piezas` (
  `idcodigo` INT NOT NULL AUTO_INCREMENT,
  `categorias_idCodigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcodigo`),
  INDEX `fk_piezas_categorias1_idx` (`categorias_idCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_piezas_categorias1`
    FOREIGN KEY (`categorias_idCodigo`)
    REFERENCES `mydb`.`categorias` (`idCodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `mydb`.`proveedores` (
  `idcodigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcodigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `mydb`.`suministro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`suministro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`suministro` (
  `piezas_idcodigo` INT NOT NULL,
  `proveedores_idcodigo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  INDEX `fk_piezas_has_proveedores_proveedores1_idx` (`proveedores_idcodigo` ASC) VISIBLE,
  INDEX `fk_piezas_has_proveedores_piezas_idx` (`piezas_idcodigo` ASC) VISIBLE,
  CONSTRAINT `fk_piezas_has_proveedores_piezas`
    FOREIGN KEY (`piezas_idcodigo`)
    REFERENCES `mydb`.`piezas` (`idcodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_piezas_has_proveedores_proveedores1`
    FOREIGN KEY (`proveedores_idcodigo`)
    REFERENCES `mydb`.`proveedores` (`idcodigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
