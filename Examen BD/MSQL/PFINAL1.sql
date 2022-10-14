
-- BORRA LA BASE DE DATOS
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- CREA LA BASE DE DATOS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- USA LA BASE DE DATOS
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- CREA LA TABLA CATEGORIA
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
-- BORRA LA TABLA DE PIEZAS 
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`piezas` ;

-- -----------------------------------------------------
-- CREA LA TABLA PIEZAS 
-- -----------------------------------------------------

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
-- BORRA LA TABLA PROVEEDORES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`proveedores` ;

-- -----------------------------------------------------
-- CREA LA TABLA PROVEEDORES`
-- -----------------------------------------------------

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
-- BORRA LA TABLA SUMINISTRO
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`suministro` ;

-- -----------------------------------------------------
-- CREA LA TABLA SUMINISTRO
-- -----------------------------------------------------

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



