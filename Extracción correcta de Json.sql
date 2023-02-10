-- Extracción correcta de datos de las columnas tipo Json

-- Columna Crew resuelto con procedimientos 

-- Crew Temporal Validado y la nueva tabla crew llenada DEFINITIVA 

DROP TABLE IF EXISTS crew_TMP2; 

CREATE TABLE crew_TMP2 AS 

SELECT id, 

CONVERT ( 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(crewNuevo, 

'"', '\''), 

'{\'', '{"'), 

'\': \'', '": "'), 

'\', \'', '", "'), 

'\': ', '": '), 

', \'', ', "') 

USING UTF8mb4 ) AS crew_new 

FROM crew_tmp; 

DROP TABLE IF EXISTS crew_TMP3; 

CREATE TABLE crew_TMP3 ( 

id_movie VARCHAR(250), 

name VARCHAR(250) , 

gender VARCHAR(250), 

department VARCHAR(250), 

job VARCHAR(250), 

credit_id VARCHAR(250), 

id VARCHAR(250) 

); 

-- Extraccion de la data de Json CREW 

DROP PROCEDURE IF EXISTS cursor_json_crew ; 

DELIMITER $$ 

CREATE PROCEDURE cursor_json_crew () 

BEGIN 

DECLARE done INT DEFAULT FALSE ; 

DECLARE i INT DEFAULT 0 ; 

DECLARE jsonData json ; 

DECLARE idMovie varchar(250); 

DECLARE idMovie2 varchar(250); 

DECLARE jsonId varchar(250) ; 

DECLARE jsonLabel varchar(250) ; 

DECLARE jsonLabel2 varchar(250) ; 

DECLARE jsonLabel3 varchar(250) ; 

DECLARE jsonLabel4 varchar(250) ; 

DECLARE jsonLabel5 varchar(250) ; 

DECLARE resultSTR LONGTEXT DEFAULT ''; 

-- Declarar el cursor 

DECLARE myCursor 

CURSOR FOR 

SELECT JSON_EXTRACT(CONVERT(crew_new USING UTF8MB4), '$[*]') FROM crew_tmp2; 

DECLARE myCursor2 

CURSOR FOR 

SELECT id FROM crew_tmp2; 

-- Declarar el handler para NOT FOUND (esto es marcar cuando el cursor ha llegado a su fin) 

DECLARE CONTINUE HANDLER 

FOR NOT FOUND SET done = TRUE ; 

-- Abrir el cursor 

OPEN myCursor ; 

OPEN myCursor2 ; 

cursorLoop: LOOP 

FETCH myCursor INTO jsonData ; 

FETCH myCursor2 INTO idMovie ; 

SET i = 0; 

-- Si alcanzo el final del cursor entonces salir del ciclo repetitivo 

IF done THEN 

LEAVE cursorLoop ; 

END IF ; 

WHILE JSON_EXTRACT(jsonData, CONCAT('$[', i, ']')) IS NOT NULL DO 

SET idMovie2 = idMovie; 

SET jsonId = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i, '].name')) , '') ; 

SET jsonLabel = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i,'].gender')) , '') ; 

SET jsonLabel2 = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i,'].department')) , '') ; 

SET jsonLabel3 = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i,'].job')) , '') ; 

SET jsonLabel4 = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i,'].credit_id')) , '') ; 

SET jsonLabel5 = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i,'].id')) , '') ; 

SET resultSTR = CONCAT(resultSTR, ' INSERT INTO crew_tmp3 VALUES (', idMovie2, ', ', jsonId, ', ', jsonLabel, ', ', jsonLabel2, ', ', jsonLabel3, ', ', jsonLabel4, ', ', jsonLabel5, '); '); 

SET i = i + 1; 

SET @sql_text = CONCAT('INSERT INTO crew_tmp3 VALUES (', idMovie2, ', ', REPLACE(jsonId, '\' ', ''), ', ', jsonLabel, ', ', jsonLabel2, ', ', jsonLabel3, ', ', jsonLabel4, ', ', jsonLabel5, '); '); 

PREPARE stmt FROM @sql_text; 

EXECUTE stmt; 

DEALLOCATE PREPARE stmt; 

END WHILE ; 

END LOOP ; 

SELECT jsonId, jsonLabel, resultSTR ; 

CLOSE myCursor ; 

END$$ 

DELIMITER ; 

CALL cursor_json_crew (); 

 

-- Columna Spoken_Languages resuelto con procedimientos 

DROP TABLE IF EXISTS spoken_languages_TMPX; 

CREATE TABLE spoken_languages_TMPX ( 

id_movie VARCHAR(250), 

iso_639_1 VARCHAR(250) , 

name VARCHAR(250) 

); 

DROP PROCEDURE IF EXISTS cursor_json_example3 ; 

DELIMITER $$ 

CREATE PROCEDURE cursor_json_example3 () 

BEGIN 

DECLARE done INT DEFAULT FALSE ; 

DECLARE i INT DEFAULT 0 ; 

DECLARE i2 INT DEFAULT 0 ; 

DECLARE jsonData json ; 

DECLARE idMovie varchar(250); 

DECLARE idMovie2 varchar(250); 

DECLARE jsonId varchar(250) ; 

DECLARE jsonLabel varchar(250) ; 

DECLARE resultSTR LONGTEXT DEFAULT ''; 

-- Declarar el cursor 

DECLARE myCursor 

CURSOR FOR 

SELECT JSON_EXTRACT(CONVERT(spoken_languagesNuevo USING UTF8MB4), '$[*]') FROM spoken_languages_tmp; 

DECLARE myCursor2 

CURSOR FOR 

SELECT id FROM movies_dataset; 

-- Declarar el handler para NOT FOUND (esto es marcar cuando el cursor ha llegado a su fin) 

DECLARE CONTINUE HANDLER 

FOR NOT FOUND SET done = TRUE ; 

-- Abrir el cursor 

OPEN myCursor ; 

OPEN myCursor2 ; 

cursorLoop: LOOP 

FETCH myCursor INTO jsonData ; 

FETCH myCursor2 INTO idMovie ; 

SET i = 0; 

-- Si alcanzo el final del cursor entonces salir del ciclo repetitivo 

IF done THEN 

LEAVE cursorLoop ; 

END IF ; 

WHILE JSON_EXTRACT(jsonData, CONCAT('$[', i, ']')) IS NOT NULL DO 

SET idMovie2 = idMovie; 

SET jsonId = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i, '].iso_639_1')) , '') ; 

SET jsonLabel = IFNULL(JSON_EXTRACT(jsonData, CONCAT('$[', i,'].name')) , '') ; 

SET resultSTR = CONCAT(resultSTR, ' INSERT INTO spoken_languages_TMPX VALUES (', idMovie2, ', ', jsonId, ', ', jsonLabel, '); '); 

SET i = i + 1; 

SET @sql_text = CONCAT('INSERT INTO spoken_languages_TMPX VALUES (', idMovie2, ', ', REPLACE(jsonId, '\' ', ''), ', ', jsonLabel, '); '); 

PREPARE stmt FROM @sql_text; 

EXECUTE stmt; 

DEALLOCATE PREPARE stmt; 

END WHILE ; 

END LOOP ; 

SELECT jsonId, jsonLabel, resultSTR ; 

CLOSE myCursor ; 

END$$ 

DELIMITER ; 

CALL cursor_json_example3 (); 

 

 

-- Columna Production_Companies resuelto con union 

DROP TABLE IF EXISTS production_companies_TMP2; 

CREATE TABLE production_companies_TMP2 AS 

SELECT * FROM ( 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[0].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[0].id')) as ProductionCompanyId 

FROM production_companies_tmp  

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[1].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[1].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[2].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[2].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[3].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[3].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[4].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[4].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[5].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[5].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[6].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[6].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[7].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[7].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[8].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[8].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[9].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[9].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[10].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[10].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[11].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[11].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[12].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[12].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[13].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[13].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[14].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[14].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[15].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[15].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[16].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[16].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[17].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[17].id')) as ProductionCompanyId 

FROM production_companies_tmp 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[18].name')) as ProductionCompanyName, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_companiesNuevo using utf8mb4), '$[18].id')) as ProductionCompanyId 

FROM production_companies_tmp 

) z_q WHERE ProductionCompanyName is not null AND ProductionCompanyId is not null 

ORDER BY z_q.id ASC ; 

 

 

-- Columna Production_Countries resuelto con union 

DROP TABLE IF EXISTS production_countries_TMP2; 

CREATE TABLE production_countries_TMP2 AS 

SELECT * FROM ( 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[0].iso_3166_1')) as ProductionCountriesId, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[0].name')) as ProductionCountriesNames 

FROM production_countries_TMP 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[1].iso_3166_1')) as ProductionCountriesId, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[1].name')) as ProductionCountriesNames 

FROM production_countries_TMP 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[2].iso_3166_1')) as ProductionCountriesId, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[2].name')) as ProductionCountriesNames 

FROM production_countries_TMP 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[3].iso_3166_1')) as ProductionCountriesId, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[3].name')) as ProductionCountriesNames 

FROM production_countries_TMP 

UNION 

SELECT id, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[4].iso_3166_1')) as ProductionCountriesId, 

JSON_UNQUOTE(JSON_EXTRACT(CONVERT(production_countriesNuevo using utf8mb4), '$[4].name')) as ProductionCountriesNames 

FROM production_countries_TMP 

) z_q WHERE ProductionCountriesId is not null AND ProductionCountriesNames is not null 

ORDER BY z_q.id ASC ; 