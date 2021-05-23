-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, col2:chararray, col3:chararray);
nuevo = FOREACH datos GENERATE letra AS letra, STRSPLITTOBAG(col2, ',') AS col2, col3 AS col3;
nuevo_2 = FOREACH nuevo GENERATE letra AS letra, col2 AS col2, (STRSPLITTOBAG(col3, ',')) AS col3;
cuenta = FOREACH nuevo_2 GENERATE letra AS letra, COUNT(col2) as cuenta_col2, COUNT(col3) AS cuenta_col3;
ordenamiento = ORDER cuenta BY letra, cuenta_col2, cuenta_col3;
STORE ordenamiento INTO './output'  USING PigStorage(',');
--
