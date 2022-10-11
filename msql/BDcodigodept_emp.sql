-- SHOW databases, este muestra todas las bases de datos; 
-- Crea la base de datos dept_emp
CREATE DATABASE dept_emp;
-- Selecciona la base de datos para usarla
USE dept_emp;
-- Borra la base de datos dept_emp; 
-- DROP DATABASE dept_emp;
-- Comentario de linea
/* comentario
de
bloque
*/
-- Se crea la tabla dept
CREATE TABLE dept(
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11) NOT NULL);
-- Muestra la tabla dept;
DESCRIBE dept;
-- Insertamos los registros en la tabla dept;
INSERT INTO dept(deptno, dname,loc) 
VALUES(10,'ACCOUNTING','NEW_YORK');
INSERT INTO dept(deptno, dname,loc) 
VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept(deptno, dname,loc) 
VALUES(30,'SALES','CHICAGO');
INSERT INTO dept(dname,deptno,loc) 
VALUES('OPERATIONS',40,'BOSTON');
/*SENTENCIA SELECT
SELECT * |columna1, columna2,...
FROM nombre-tabla
[WHERE condición]
[GROUP BY columna1,columna2 ...]
[HAVING condición-selección-grupos]
[ORDEN BY columna1 [DESC], columna2 [DESC], ...]
*/
-- Muestra todas las columnas de la tabla dept;
SELECT *
FROM dept;
--  CONSULTAS A dept
-- Esta mostrando la localidad y el nombre de la tabla dept
SELECT loc, dname
FROM dept;
--  Muestra todas las columnas de la tabla dept siemrre y cuando deptno sea menor a 30
SELECT *
FROM dept
WHERE deptno<30;
-- Muestra de la tabla dept, la localida y el nombre siempre y cuando sea  menor a 30
SELECT loc, dname
FROM dept
WHERE deptno <30;
-- Se crea la tabla emp, con dos llaves foraneas;
CREATE TABLE emp(
empno NUMERIC(4) PRIMARY KEY,
ename VARCHAR(11) NOT NULL,
job VARCHAR(13) NOT NULL,
mgr NUMERIC(4),
hiredate DATE NOT NULL,
sal NUMERIC(7,2) NOT NULL,
comm NUMERIC(7,2),
deptno NUMERIC(2),
-- Restricción en emp_deptno_dept_deptno_fk llave foranea de la tabla dept
CONSTRAINT emp_deptno_detp_deptno_fk FOREIGN KEY (deptno) REFERENCES dept (deptno),
-- Restrcción en emp_mgr_fk llave forania de la tabla emp 
CONSTRAINT emp_mgr_fk FOREIGN KEY (mgr) REFERENCES emp (empno));
-- Muestra toda la tabla emp;
DESCRIBE emp;
-- Insertamos todos los registros en la tabla emp;
INSERT INTO emp
VALUES(7839, 'KING', 'PRESIDENT', NULL, '2011-11-17', 5000, NULL, 10);
INSERT INTO emp
VALUES(7698, 'BLAKE','MANAGER',7839,'2011-05-01',2850,NULL,30);
INSERT INTO emp
VALUES(7782,'CLARK','MANAGER',7839,'2011-06-09',2450,NULL,10);
INSERT INTO emp
VALUES(7566,'JONES','MANAGER', 7839, '2011-04-02',2975,NULL,20);
INSERT INTO emp
VALUES(7654,'MARTIN','SALESMAN',7698, '2011-09-28',1250,1400,30);
INSERT INTO emp
VALUES(7499,'ALLEN', 'SALESMAN',7698, '2011-02-20',1600,300, 30);
INSERT INTO emp
VALUES(7844,'TURNER','SALESMAN',7698, '2011-09-08',1500,0, 30);
INSERT INTO emp
VALUES(7900,'JAMES', 'CLERK',7698, '2011-12-03',950,NULL,30);
INSERT INTO emp
VALUES(7521,'WARD','SALESMAN',7698, '2011-02-22',1250,500, 30);
INSERT INTO emp
VALUES(7902,'FORD','ANALYST', 7566, '2011-12-03',3000,NULL,20);
INSERT INTO emp
VALUES(7369,'SMITH', 'CLERK',7902, '2010-12-17',800,NULL, 20);
INSERT INTO emp
VALUES(7788,'SCOTT', 'ANALYST', 7566, '2012-12-09',3000,NULL,20);
INSERT INTO emp
VALUES(7876,'ADAMS', 'CLERK', 7788, '2012-01-12',1100,NULL,20);
INSERT INTO emp
VALUES(7934,'MILLER','CLERK',7782, '2012-01-23',1300,NULL,10);
/*-- Consultas
-- Muestra todas las filas de la tabla emp
SELECT * FROM emp;
-- Muestra tres atributos determinados de la tabla emp 
SELECT ename, hiredate, sal FROM emp;*/
-- Se crea la tabla salgrade;
CREATE TABLE salgrade(
    grade NUMERIC(1) PRIMARY KEY,
    losal NUMERIC(6,2) NOT NULL,
    hisal NUMERIC(6,2) NOT NULL);
-- DESCRIBE salgrade;
INSERT INTO salgrade
VALUES(1,700,1200);
INSERT INTO salgrade
VALUES(3,1401,2000); 
INSERT INTO salgrade
VALUES(4,2001,3000);
INSERT INTO salgrade
VALUES(5,3001,9999);

/*-- consultas
-- Muestra todas las columnas de la tabla salgrade
SELECT *
FROM salgrade;
-- Muestra todas las columnas de la tabla salgrade siemrre y cuando salgrade sea mayor a 1400 y hisal menor a 4000;
SELECT *
FROM salgrade
WHERE losal > 1400
AND hisal < 4000;
SELECT ename, sal, sal+300
FROM emp;
SELECT ename, sal, 12*sal+100
FROM emp;
SELECT ename, sal, 100+sal*12
FROM emp;
SELECT ename, sal, 12*(sal+100)
FROM emp;
SELECT ename, sal, 1.20*sal
FROM emp;
SELECT ename, job, sal, comm
FROM emp;
SELECT ename, sal, 12*(sal+100)
FROM emp
WHERE ename='KING';
SELECT ename, 12*sal+comm
FROM emp
WHERE ename='KING';
SELECT ename AS nombre, sal salario
FROM emp;
SELECT ename AS nombre, 12*sal AS "Salario Anual"
FROM emp;
SELECT CONCAT(ename,' ',job) AS empleado
FROM emp;
SELECT CONCAT(ename,' is a ',job) AS "Detalles de Empleo"
FROM emp;
SELECT DISTINCT deptno
FROM emp;
SELECT DISTINCT deptno, job
FROM emp;
SELECT ename,job,deptno
FROM emp
WHERE job = 'CLERK';
SELECT ename, sal, comm
FROM emp
WHERE sal <= comm;
SELECT ename, sal
FROM emp
WHERE sal BETWEEN 1000 AND 1500;
select empno, ename,sal, mgr
from emp
where mgr IN(7902,7566,7788);
SELECT empno,ename,mgr,deptno
FROM emp
WHERE ename IN('FORD','ALLEN');
SELECT ename
FROM emp
WHERE ename LIKE 'S%';
SELECT ename, hiredate
FROM emp
WHERE hiredate LIKE '2011%';
SELECT ename
FROM emp
WHERE ename LIKE '_A%';*/
-- CONSULTAS SQL;
-- 1. Calcula el número total de empleados que hay en la tabla emp.
SELECT COUNT(*) FROM emp;
-- 2. Muestra el número total de empleados que tiene cada departamento, mostrando el nombre del departamento, incluir los departamentos que no tengan empleados. 
-- Ordenar el resultado descendentemente por el número de empleados.
SELECT dept.dname , count(emp.ename)
FROM dept left join emp
on dept.deptno = emp.deptno
group by dept.deptno;
-- 3. Mostrar el salario máximo, el salario mínimo y el salario promedio de los empleados de cada departamento. El resultado tiene que mostrar el nombre del departamento.
SELECT AVG(sal),MIN(sal),MAX(sal)
FROM emp;
SELECT dept.dname , AVG(sal),MIN(sal),MAX(sal)
FROM dept left join emp
on dept.deptno = emp.deptno
group by dept.deptno;
-- 4. Mostrar el cada cargo (job), junto con el salario máximo, mínimo y el número total de empleados que ganan menos de $1100.
SELECT emp.job , MIN(sal),MAX(sal), count(job)
FROM emp; 
-- 5. Lista los nombres y el salario de todos los empleados.
SELECT emp.ename  as ename , emp.sal as sal
FROM emp;
-- 6. Lista todas las columnas de la tabla emp.
SELECT * FROM emp;
-- 7. Muestra una lista con el nombre del empleado, salario y nombre del departamento al que pertenece.
SELECT emp.ename  as ename , emp.sal as sal , dept.dname as dname
FROM emp  left join dept 
on emp.deptno = dept.deptno  
group by emp.deptno;
-- 8. Listar todos los empleados que tienen el cargo “ANALYST”
SELECT ename  
from emp
WHERE job = 'analyst'; 
-- 9. Devuelve todos los empleados del departamento “SALES”
SELECT ename
from emp
join dept 
on emp.deptno = dept.deptno
where dept.dname = 'sales';
-- 10. Muestra quién gana más en el departamento “ACCOUNTING”.
SELECT sal 
from emp
join dept 
on emp.deptno = dept.deptno
where dept.dname > 'accounting';


   