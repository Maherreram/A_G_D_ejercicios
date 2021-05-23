-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- Nombre y ciudad en Mayusculas
fs -rm -f -r output;
-- 
--
datosw = LOAD 'data.csv' USING PigStorage(',') AS (id:int, nombre:chararray, edad:int, ciudad:chararray);
resultado = FOREACH datosw GENERATE UPPER(nombre) AS nombre, UPPER(ciudad) AS ciudad;
STORE  resultado INTO './output' USING PigStorage(',');
--
