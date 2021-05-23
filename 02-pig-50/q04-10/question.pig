--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
datos = LOAD 'truck_event_text_partition.csv' USING PigStorage(',') AS (driverId:INT, truckId:INT, eventTime:CHARARRAY, eventType:CHARARRAY, longitude:DOUBLE, latitude:DOUBLE, eventKey:CHARARRAY, correlationId:CHARARRAY, driverName:CHARARRAY, routeId:INT, routeName:CHARARRAY, eventDate:CHARARRAY);
regis = limit datos 10;
col_1_2_3 = FOREACH regis GENERATE driverId as driverId, truckId as truckId, eventTime as eventTime;
ordenados = ORDER col_1_2_3 BY driverId, truckId, eventTime;
STORE ordenados INTO './output'  USING PigStorage(',');
-- 
