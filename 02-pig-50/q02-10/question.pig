-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, fecha:chararray, cantidad:int);
ord_letra_cantidad = ORDER datos BY letra, cantidad;
STORE ord_letra_cantidad INTO './output'  USING PigStorage('\t');
-- 
