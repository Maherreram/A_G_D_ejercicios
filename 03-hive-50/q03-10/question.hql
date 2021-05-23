-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
DROP TABLE IF EXISTS tabla;
CREATE TABLE tabla (letra STRING,
                           fecha STRING,
                           cantidad INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="0");
--
-- cargo los datos a la tabla
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE
INTO TABLE tabla;
--
CREATE TABLE consultafinal AS
select Distinct cantidad from tabla order by cantidad asc limit 5;
--
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM consultafinal;
--
--
