-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dept_emp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dept_emp` ;

-- -----------------------------------------------------
-- Schema dept_emp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dept_emp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dept_emp` ;

-- -----------------------------------------------------
-- Table `dept_emp`.`dept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dept_emp`.`dept` ;

CREATE TABLE IF NOT EXISTS `dept_emp`.`dept` (
  `deptno` DECIMAL(2,0) NOT NULL,
  `dname` VARCHAR(12) NULL DEFAULT NULL,
  `loc` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`deptno`),
  UNIQUE INDEX `dname` (`dname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dept_emp`.`emp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dept_emp`.`emp` ;

CREATE TABLE IF NOT EXISTS `dept_emp`.`emp` (
  `empno` DECIMAL(4,0) NOT NULL,
  `ename` VARCHAR(11) NOT NULL,
  `job` VARCHAR(13) NOT NULL,
  `mgr` DECIMAL(4,0) NULL DEFAULT NULL,
  `hiredate` DATE NOT NULL,
  `sal` DECIMAL(7,2) NOT NULL,
  `comm` DECIMAL(7,2) NULL DEFAULT NULL,
  `deptno` DECIMAL(2,0) NULL DEFAULT NULL,
  PRIMARY KEY (`empno`),
  INDEX `emp_deptno_detp_deptno_fk` (`deptno` ASC) VISIBLE,
  INDEX `emp_mgr_fk` (`mgr` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dept_emp`.`salgrade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dept_emp`.`salgrade` ;

CREATE TABLE IF NOT EXISTS `dept_emp`.`salgrade` (
  `grade` DECIMAL(1,0) NOT NULL,
  `losal` DECIMAL(6,2) NOT NULL,
  `hisal` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`grade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dept_emp`.`dept`
-- -----------------------------------------------------
START TRANSACTION;
USE `dept_emp`;
INSERT INTO `dept_emp`.`dept` (`deptno`, `dname`, `loc`) VALUES (10, 'ACCOUNTING', 'NEW_YORK');
INSERT INTO `dept_emp`.`dept` (`deptno`, `dname`, `loc`) VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO `dept_emp`.`dept` (`deptno`, `dname`, `loc`) VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO `dept_emp`.`dept` (`deptno`, `dname`, `loc`) VALUES (40, 'OPERATIONS', 'BOSTON');

COMMIT;

