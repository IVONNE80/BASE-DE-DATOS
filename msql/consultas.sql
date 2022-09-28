--  CONSULTAS A dept
-- Csta mostrado la localidad y el nombre de la tabla dept
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
-- M
