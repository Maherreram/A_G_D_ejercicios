-- 
-- Pregunta
-- ===========================================================================
--
-- Escriba una consulta que retorne los valores únicos de la columna `t0.c5` 
-- (ordenados). 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
DROP TABLE IF EXISTS consulta0;
CREATE TABLE consulta0 AS
SELECT c5[0] as c0 FROM  tbl0;
--
DROP TABLE IF EXISTS consulta1;
CREATE TABLE consulta1 AS
SELECT c5[1] as c1 FROM  tbl0;
--
DROP TABLE IF EXISTS consulta2;
CREATE TABLE consulta2 AS
SELECT c5[2] as c2 FROM  tbl0;
--
DROP TABLE IF EXISTS consulta3;
CREATE TABLE consulta3 AS
SELECT c5[3] as c3 FROM  tbl0;
--
DROP TABLE IF EXISTS consulta4;
CREATE TABLE consulta4 AS
SELECT c5[4] as c4 FROM  tbl0;
--
insert into table consulta0 select c1 from consulta1;
insert into table consulta0 select c2 from consulta2;
insert into table consulta0 select c3 from consulta3;
insert into table consulta0 select c4 from consulta4;
--
DROP TABLE IF EXISTS consultafinal;
CREATE TABLE consultafinal AS
SELECT distinct c0 as c0 FROM  consulta0 where c0!='null';
--
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM consultafinal;
--
--

