-- -----------------------------------------------------

CREATE DATABASE proveedores DEFAULT CHARACTER SET utf8 ;
USE proveedores;
CREATE TABLE categorias(
  `idCodigo` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL UNIQUE
  );

CREATE TABLE pieza (
  `codigo` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL,
  `color` VARCHAR(25) NOT NULL,
  `precio` FLOAT NOT NULL CHECK (precio > 0),
  `codigo_categoria` INT UNSIGNED NOT NULL,
   FOREIGN KEY (`codigo_categoria`) REFERENCES categoria (codigo)
    );

CREATE TABLE proveedor (
  `codigo` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL
  );
CREATE TABLE suministra (
  `codigo_proveedor` INT UNSIGNED,
  `codigo_pieza` INT UNSIGNED,
  `cantidad` INT UNSIGNED NOT NULL CHECK (cantidad > 0) ,
  `fecha` DATE NOT NULL,
	PRIMARY KEY (`codigo_proveedor`, `codigo_pieza`),
    FOREIGN KEY (`codigo_proveedor`) REFERENCES proveedor (codigo),
    FOREIGN KEY (`codigo_pieza`) REFERENCES pieza (codigo)
    );
    


