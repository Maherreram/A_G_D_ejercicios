-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, fecha:chararray, cantidad:int);
agrupamiento = GROUP datos by letra;
suma = FOREACH agrupamiento GENERATE group, COUNT(datos);
STORE suma INTO './output'  USING PigStorage('\t');
--
