-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, col2:chararray, col3:chararray);
nuevo = FOREACH datos GENERATE STRSPLITTOBAG(col2, '[^A-Za-z0-9]') AS col2, col3 AS col3;
nuevo_2 = FOREACH nuevo GENERATE col2 AS col2, (STRSPLITTOBAG(col3, '[^A-Za-z0-9]')) AS col3;
nuevo_3 = FOREACH nuevo_2 GENERATE FLATTEN(col2) AS col2, FLATTEN(col3) AS col3;
nuevo_4 = FOREACH nuevo_3 GENERATE (CHARARRAY)(col2) AS col2, (CHARARRAY)(col3) AS col3;
filtro = FILTER nuevo_4 BY (col2 matches '[a-z]') AND (col3 matches '[a-z]{3}');
agrupamiento = GROUP filtro BY (col2, col3);
cuenta = FOREACH agrupamiento GENERATE group, COUNT(filtro);
STORE cuenta INTO './output'  USING PigStorage('\t');
--
