-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--
datos = LOAD 'data.csv' USING PigStorage(',') AS (id:INT, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, catidad:int);
ordenados = ORDER datos BY id DESC;
STORE  ordenados INTO './output' USING PigStorage(',');
--
