CREATE DATABASE test;
USE test;
CREATE TABLE alumnos(
id int  PRIMARY KEY,
nombre VARCHAR(20),
apellido1 VARCHAR(20), 
apellido2 VARCHAR(20),
nota real );

DESCRIBE alumnos;
/* Trigger 1: alumno_check_nota_BI
        * Se ejecuta sobre la tabla alumnos
        * Se ejecuta antes de una operación de inserción
        * Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0
        * Si el nuevo valor de la nota que se quiere insertar es mayor que 10 se guarda como 10
	 */   
DELIMITER $$
CREATE TRIGGER alumno_check_nota_BI BEFORE INSERT ON alumnos
FOR EACH ROW
BEGIN
	IF NEW.nota < 0 THEN
		SET NEW.nota = 0;
	END IF;
    IF NEW.nota > 10 THEN
		SET NEW.nota = 10;
	END IF;
END;$$
/*
Trigger 2: alumno_check_nota_BU
        * Se ejecuta sobre la tabal alumnos
        * Se ejecuta antes de una operación de inserción
        * Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0
        * Si el nuevo valor de la nota que se quiere actualizar es mayor que 10 se guarda como 10
*/
DELIMITER $$
CREATE TRIGGER alumno_check_nota_BU BEFORE UPDATE ON alumnos
FOR EACH ROW
BEGIN
	IF NEW.nota < 0 THEN
		SET NEW.nota = 0;
	END IF;
    IF NEW.nota > 10 THEN
		SET NEW.nota = 10;
	END IF;
END;$$


INSERT INTO alumnos(id, nombre, apellido1, apellido2,nota) 
VALUES(1,'Juan','Aguilar','Islas' ,123);

INSERT INTO alumnos 
VALUES(2,'Juan','Aguilar','Islas' ,-1125);

UPDATE alumnos SET nota = "9" WHERE id = 2;

