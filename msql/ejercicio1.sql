-- SHOW databases; 
CREATE DATABASE dept_emp;
USE dept_emp;
-- DROP DATABASE dept_emp; 
CREATE TABLE dept(
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11) NOT NULL);
-- DESCRIBE dept;
INSERT INTO dept(deptno, dname,loc) 
VALUES(10,'ACCOUNTING','NEW_YORK');
DESCRIBE dept;
INSERT INTO dept(deptno, dname,loc) 
VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept(deptno, dname,loc) 
VALUES(30,'SALES','CHICAGO');
INSERT INTO dept(dname,deptno,loc) 
VALUES('OPERATIONS',40,'BOSTON');
SELECT loc, dname
FROM dept;
SELECT loc, dname
FROM dept
WHERE deptno <30;
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
DESCRIBE emp;
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
