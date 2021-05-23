-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, fecha:chararray, cantidad:int);
ord_cant = ORDER datos BY cantidad;
atri_cant = FOREACH ord_cant GENERATE cantidad;
filtro = LIMIT atri_cant 5;
STORE filtro INTO './output'  USING PigStorage('\t');
--
