-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
nuevo = FOREACH u GENERATE surname as surname, COUNT(STRSPLITTOBAG(surname, '')) AS cuenta_let;
ordenamiento = ORDER nuevo BY cuenta_let DESC, surname;
filtro = LIMIT ordenamiento 5;
STORE filtro INTO './output'  USING PigStorage(',');
--
