-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
--
DROP TABLE IF EXISTS tabla;
--
CREATE TABLE tabla (letra STRING,
                           fecha STRING,
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
select letra, count(letra) from tabla GROUP BY letra;
--
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT * FROM consultafinal;
--
--
