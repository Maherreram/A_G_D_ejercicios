-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
datos = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray, col2:chararray, col3:chararray);
words = FOREACH datos GENERATE FLATTEN(TOKENIZE(col2)) AS let;
agrupamiento = GROUP words BY let;
wordcount = FOREACH agrupamiento GENERATE group, COUNT(words);
limitar = LIMIT wordcount 7;
STORE limitar INTO './output'  USING PigStorage('\t');
--

