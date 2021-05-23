-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Construya una consulta que ordene la tabla por letra y valor (3ra columna).
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
DROP TABLE IF EXISTS tabla;
--
CREATE TABLE tabla (letra STRING,
                           fecha DATE,
                           cantidad INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="0");
--
--cargo los datos a la tabla
LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE
INTO TABLE tabla;
--
CREATE TABLE consultafinal AS
select * from tabla order by letra, cantidad, fecha;
--
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM consultafinal;
--
--

