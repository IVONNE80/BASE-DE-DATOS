-- TALLER: BASE DE DATOS
-- PRACTICA:6
-- NOMBRE:IVONNE HERNANDEZ BAUTISTA
-- FOLIO:15416TV14
-- FECHA:05/10/22
-- https://www.db-fiddle.com/f/gy1RGLhdk81BGo1x2pTXDK/0

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Tienda_Informatica
-- -----------------------------------------------------
-- Elimina la base de datos de Shemas
DROP SCHEMA IF EXISTS `Tienda_Informatica` ;

-- -----------------------------------------------------
-- Schema Tienda_Informatica
-- -----------------------------------------------------
-- Crea la base de datos de Tienda_informatica
CREATE SCHEMA IF NOT EXISTS `Tienda_Informatica` ;
-- Selecciona la base de datos de Tienda_Informatica
USE `Tienda_Informatica` ;

-- -----------------------------------------------------
-- Table `Tienda_Informatica`.`Fabricantes`
-- -----------------------------------------------------
-- Elimina la base de datos de Fabricantes  que esta en tienda de informatica
DROP TABLE IF EXISTS `Tienda_Informatica`.`Fabricantes` ;
-- Crea la base de datos de Tienda_informatica la tabla de Fabricantes
CREATE TABLE IF NOT EXISTS `Tienda_Informatica`.`Fabricantes` (
  `idCodigo` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL unique);


-- -----------------------------------------------------
-- Table `Tienda_Informatica`.`Productos`
-- -----------------------------------------------------
-- -- Elimina la base de datos de Productos que esta en tienda de informatica
DROP TABLE IF EXISTS `Tienda_Informatica`.`Productos` ;
-- Crea la base de datos de Tienda_informatica la tabla de Productos
CREATE TABLE IF NOT EXISTS `Tienda_Informatica`.`Productos` (
  `idCodigo` INT primary key NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `precio` DOUBLE UNSIGNED NOT NULL,
  `Fabricantes_idCodigo` INT NOT NULL,
  CONSTRAINT `fk_Productos_Fabricantes`
    FOREIGN KEY (`Fabricantes_idCodigo`)
    REFERENCES `Tienda_Informatica`.`Fabricantes` (`idCodigo`));












-- Describimos la tabla Fabricantes
DESCRIBE Fabricantes;
-- Insertamos los registros en la tabla de fabricantes
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Asus');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Lenovo');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Hewlett-Packard');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Samsung');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Seagate');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Crucial');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Gigabyte');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Huawei');
INSERT INTO Fabricantes(idCodigo, nombre) 
VALUES(null,'Xiaomi');
-- Describe la tabla Productos
DESCRIBE Productos;
-- Insertamos los registros en la tabla de Productos
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(1,'Disco duro SATA3 1TB', '86.99', '5' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(2,'Memoria RAM DDR4 8GB', '120', '6' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(3,'Disco SSD 1 TB', '150.99', '4' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(4,'GeForce GTX 105Ti', '185', '7' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(5,'GeForce GTX 1080 Xtreme', '755', '6' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(6,'Monitor 24 LED Full HD', '202', '1' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(7,'Monitor 27 LED Full HD', '245.99', '1' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(8,'Port??til Yoga 520', '559', '2' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(9,'Port??til Ideapd 320', '444', '2' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(10,'Impresora HP Deskjet 3720', '59.99', '3' );
INSERT INTO Productos(idCodigo, nombre, precio, Fabricantes_idCodigo) 
VALUES(11,'Impresora HP Laserjet Pro M26nw', '180', '3' );
select * from Fabricantes;
select * from Productos;
