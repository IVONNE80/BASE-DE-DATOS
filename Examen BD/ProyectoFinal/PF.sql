/*
 TALLER: BASE DE DATOS
 PRACTICA:PROYECTO FINAL
 NOMBRE:IVONNE HERNANDEZ BAUTISTA
 FOLIO:15416TV14
 FECHA:14/10/22
*/
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Borra la base de datos TProveedor
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `TProveedor` ;

-- -----------------------------------------------------
-- Crea la base de datos y se usa TProveedor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TProveedor` ;
USE `TProveedor` ;

-- -----------------------------------------------------
-- Elimina y crea en la base de datos `TProveedor`. la tabla de`categorias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TProveedor`.`categorias` ;

CREATE TABLE IF NOT EXISTS `TProveedor`.`categorias` (
  `codigo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(80) NOT NULL);


-- -----------------------------------------------------
-- Elimina y crea en la base de datos `TProveedor`. la tabla de`piezas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TProveedor`.`piezas` ;

CREATE TABLE IF NOT EXISTS `TProveedor`.`piezas` (
  `codigo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(80) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `catego` VARCHAR(60) NOT NULL,
  `categorias_codigo` INT NOT NULL,
   INDEX `fk_piezas_categorias1_idx` (`categorias_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_piezas_categorias1`
    FOREIGN KEY (`categorias_codigo`)
    REFERENCES `TProveedor`.`categorias` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Elimina y crea en la base de datos `TProveedor`. la tabla de`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TProveedor`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `TProveedor`.`proveedores` (
  `codigo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(80) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL);
  
-- -----------------------------------------------------
-- Elimina y crea en la base de datos `TProveedor`. la tabla de`suministra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TProveedor`.`suministra` ;

CREATE TABLE IF NOT EXISTS `TProveedor`.`suministra` (
  `Idcodigo_suministra` INT PRIMARY KEY  AUTO_INCREMENT ,
  `piezas_codigo` INT NOT NULL,
  `proveedores_codigo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
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



