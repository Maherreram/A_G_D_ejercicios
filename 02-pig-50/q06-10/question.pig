-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, col2:chararray, col3:chararray);
nuevo = FOREACH datos GENERATE FLATTEN(STRSPLITTOBAG(col3, '[^A-Za-z0-9]')) AS separacion;
agrupamiento = GROUP nuevo BY separacion;
cuenta = FOREACH agrupamiento GENERATE group, COUNT(nuevo);
ordenamiento_1 = ORDER cuenta BY group DESC;
filtro = LIMIT ordenamiento_1 10;
ordenamiento_2 = ORDER filtro BY group ASC;
STORE ordenamiento_2 INTO './output'  USING PigStorage(',');
--
