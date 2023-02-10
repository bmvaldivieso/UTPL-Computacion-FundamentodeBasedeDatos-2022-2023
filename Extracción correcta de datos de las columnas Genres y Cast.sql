-- Extracción correcta de datos de las columnas Genres y Cast

-- Columna Genres 

DROP TABLE IF EXISTS Movies_Genres_TMP; 

CREATE TABLE Movies_Genres_TMP AS 

SELECT id, 

genres as genresOrig , 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(genres, 

'Science Fiction', 'Science_Fiction'), 

'Action Adventure', 'Action_Adventure'), 

'Action Comedy', 'Action_Comedy'), 

'Thriller Drama', 'Thriller_Drama'), 

'Fantasy Adventure', 'Fantasy_Adventure'), 

'Horror Comedy', 'Horror_Comedy'), 

'Crime Drama', 'Crime_Drama'), 

'Romance Drama', 'Romance_Drama'), 

'Western Comedy', 'Western_Comedy'), 

'War Drama', 'War_Drama'), 

'Family Comedy','Family_Comedy'), 

'Documentary Drama','Documentary_Drama'), 

'Mystery Thriller','Mystery_Thriller'), 

'Action Thriller','Action_Thriller'), 

'Romance Comedy Drama','Romance_Comedy-Drama'), 

'Fantasy Comedy.','Fantasy_Comedy.'), 

'Comedy Drama','Comedy_Drama'), 

'Crime Comedy','Crime_Comedy'), 

'Drama Comedy','Drama_Comedy'), 

'Horror Drama','Horror_Drama'), 

'Romance Thriller','Romance_Thriller'), 

'Fantasy Thriller','Fantasy_Thriller'), 

'Action Crime','Action_Crime'), 

'Fantasy Crime','Fantasy_Crime'), 

'Thriller Crime','Thriller_Crime'), 

'Action Drama','Action_Drama'), 

'Romance Adventure','Romance_Adventure'), 

'Fantasy Adventure','Fantasy_Adventure'), 

'Thriller Adventure','Thriller_Adventure') 

 AS genresNew 

FROM movies_dataset; 

-- 

DROP TABLE IF EXISTS Movies_Genres; 

CREATE TABLE Movies_Genres AS 

SELECT id, 

SUBSTRING_INDEX(genresNew, ' ', 1) AS genre 

FROM Movies_Genres_TMP 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(genresNew, ' ', 2), ' ', -1) AS genre 

FROM Movies_Genres_TMP 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(genresNew, ' ', 3), ' ', -1) AS genre 

FROM Movies_Genres_TMP 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(genresNew, ' ', 4), ' ', -1) AS genre 

FROM Movies_Genres_TMP 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(genresNew, ' ', 5), ' ', -1) AS genre 

FROM Movies_Genres_TMP 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(genresNew, ' ', 6), ' ', -1) AS genre 

FROM Movies_Genres_TMP; 

 

-- Columna Cast 

DROP TABLE IF EXISTS cast; 

CREATE TABLE cast AS 

SELECT id, cast 

FROM movies_dataset; 

DROP TABLE IF EXISTS cast_TMP; 

CREATE TABLE cast_TMP AS 

SELECT id, 

cast as castOriginal , 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cast, 

 'Jennifer Jason Leigh', 'Jennifer Jason_Leigh'), 

 '\\u00ef', 'ï'), 

 '\\u00e9', 'é'), 

 '\\u00d3', 'Ó'), 

 '\\u00f1', 'ñ'), 

 '\\u00c1', 'Á'), 

 '\\u00e0', 'à'), 

'\\u00f3n', 'ó'), 

'\\u00fcr', 'ü'), 

'\\u00f4', 'ô'), 

'\\u00e4t', 'ä'), 

'\\u00fa', 'ú'), 

'\\u00c0l', 'À'), 

'\\u00fas', 'ú'), 

'\\u00e0', 'à'), 

'\\u00fc', 'ú'), 

'\\u00f4', 'ô'), 

'\\u00fa', 'ú'), 

'\\u00df', 'ß'), 

'\\u00ea', 'ê'), 

'\\u00c9', 'É'), 

'\\u00c0', 'À'), 

'\\u00d8', 'Ø'), 

'\\u00dc', 'Ü'), 

'\\u00e9', 'é'), 

'\\u00e1', 'á'), 

'\\u00f1', 'ñ'), 

'\\u00f3', 'ó'), 

'\\u00c0', 'À'), 

'\\u00e5', 'å'), 

'\\u00f6', 'ö'), 

'\\u00f4', 'ô'), 

'\\u00ed', 'í'), 

'\\u00e7', 'ç'), 

'\\u00f8', 'ø'), 

'\\u0159', 'ř'), 

'\\u00c5', 'Å'), 

'\\u00d8', 'Ø'), 

'\\u00c9', 'É'), 

'\\u00e6', 'æ'), 

'\\u00e4', 'ä'), 

'\\u00e8', 'è'), 

'\\u00ef', 'ï'), 

 '\\u00e1', 'á'), 

 '\\u00e5rd', 'á'), 

 '\\u00f6', 'ö'), 

 '\\u00e8', 'è'), 

 '\\u00ed', 'í'), 

 '\\u016b', 'ū'), 

'\\u014d', 'ō'), 

 '\\u00f8', 'ø'), 

 '\\u00e6', 'æ'), 

 '\\u00eb', 'ë'), 

 '\\u00c5', 'Å'), 

 '\\u042e', 'Ю'), 

'\\u043b', 'л'), 

'\\u0438', 'и'), 

'\\u044f', 'я'), 

'\\u0421', 'С'), 

'\\u043d', 'н'), 

'\\u0433', 'г'), 

'\\u0440', 'р'), 

'\\u044c', 'ь'), 

 '\\u015b', 'ś'), 

 '\\u067e', 'پ'), 

 '\\u0219', 'ș'), 

 '\\u0110', 'Đ'), 

 '\\u00fbin', 'û'), 

 '\\u0101', 'ā'), 

 '\\u00ee', 'î'), 

 ' von ', ' von_'), 

 'Frederique van der Wal', 'Frederique van_der_Wal'), 

 'Tupac Amaru Shakur', 'Tupac Amaru_Shakur"'), 

 ' de la ', ' de_la_'), 

 ' De ', ' De_'), 

 'G. W. Bailey', 'G._W. Bailey'), 

 'Ana de la Reguera', 'Ana de_la_Reguera'), 

 'Neil Patrick Harris', 'Neil Patrick_Harris'), 

 'Jo', 'Jo_'), 

 'Pelé ', 'Pelé --- '), 

 ' . ', ' ._'), 

 'Madonna ', 'Madonna ---- '), 

 'Pink ', 'Pink ---- '), 

 'Frances de la Tour', 'Frances de_la_Tour'), 

 'Paz de la Huerta', 'Paz de_la_Huerta'), 

 'Rodrigo de la Serna', 'Rodrigo de_la_Serna'), 

 'Rapahel de la Sierra', 'Raphael de_la_Sierra'), 

 'Samuel L. Jackson', 'Samuel L._Jackson'), 

'Helena Bonham Carter', 'Helena Bonham_Carter'), 

'Don', 'Don_'), 

'LL Cool J', 'LL Cool_J'), 

 'Bryce Dallas Howard', 'Bryce Dallas_Howard'), 

 'David Ogden Stiers', 'David Ogden_Stiers'), 

' Jr. ', '_Jr. '), 

 ' Jr.', '_Jr.'), 

'Catherine Zeta-Jones', 'Catherine Zeta_Jones'), 

 'Martin Smith', 'Martin_Smith'), 

 'Thomas Haden Church', 'Thomas Haden_Church'), 

 'James Badge Dale', 'James Badge_Dale'), 

 'Tommy Lee', 'Tommy_Lee'), 

 'Dakota Blue', 'Dakota_Blue'), 

 'Rihanna ', 'Rihanna ---- '), 

 'M. Emmet', 'M._Emmet'), 

 'Jo_hn Michael', 'Jo_hn_Michael'), 

 'R. D.', 'R._D.'), 

 'Jo_hn C.', 'Jo_hn_C.'), 

 ' del ', ' del_'), 

 'Baron Cohen', 'Baron_Cohen'), 

 'Chloë Grace Moretz', 'Chloë_Grace Moretz'), 

 'Billy Bob', 'Billy_Bob'), 

 'Lara Flynn', 'Lara_Flynn'), 

 'Jeffrey Dean', 'Jeffrey_Dean'), 

 'William H.', 'William_H.'), 

 'Tim Blake', 'Tim_Blake'), 

 'D. B.', 'D._B.'), 

 ' Ludacris', ' ---- Ludacris'), 

 'Jay O.', 'Jay_O.'), 

 'Michael J.', 'Michael_J.'), 

 'Jackie Earle', 'Jackie_Earle'), 

 'Jo_nny Lee', 'Jo_nny_Lee'), 

 'Will Yun', 'Will_Yun'), 

 'Jamie Renée', 'Jamie_Renée'), 

 'Michael B.', 'Michael_B.'), 

 'Dick Van', 'Dick_Van'), 

 ' de ', ' de_'), 

 'Mario Van', 'Mario_Van'), 

 'Michael-Leon', 'Michael_Leon'), 

 'Anika Noni', 'Anika_Noni'), 

 'Michael Clarke', 'Michael_Clarke'), 

 'Jamie Lee', 'Jamie_Lee'), 

 'Van Dien', 'Van_Dien'), 

 'Gordon-Levitt', 'Gordon_Levitt'), 

'David Hyde', 'David_Hyde'), 

 'Hadley Belle', 'Hadley_Belle'), 

 'Sarah Jessica', 'Sarah_Jessica'), 

 'Edward James', 'Edward_James'), 

 'Seann William', 'Seann_William'), 

 'Юлия Снигирь', 'Yuliya Snigir'), 

 'Mary Elizabeth Winstead', 'Mary_Elizabeth Winstead'), 

 'Craig T.', 'Craig_T.'), 

 'Brandon T.', 'Brandon_T.'), 

 'Philip Seymour', 'Philip_Seymour'), 

 'Rhys Meyers', 'Rhys_Meyers'), 

 'Matthew Gray', 'Matthew_Gray'), 

 'Will.i.am', 'Will.i.am ----'), 

 'Reyes, Jr.', 'Reyes,_Jr.'), 

 ' van ', ' van_'), 

 'Haley Jo_el', 'Haley_Jo_el'), 

 'James Earl', 'James_Earl'), 

 'F. Murray', 'F._Murray'), 

 'Marcia Gay', 'Marcia_Gay'), 

'Sarah Michelle', 'Sarah_Michelle'), 

 ' the ', ' the_'), 

 'Larry the_Cable Guy', 'Larry the_Cable_Guy'), 

 'Pinkett Smith', 'Pinkett_Smith'), 

 ' Nelly Borgeaud ', ' *Nelly Borgeaud '), 

 ' Nelly', ' ---- Nelly'), 

 'Raymond J. Barry', 'Raymond J._Barry'), 

 'Dee Bradley', 'Dee_Bradley'), 

 'Brooks Grant', 'Brooks_Grant'), 

 'Lister Jr.', 'Lister_Jr.'), 

 'Ólafur Darri', 'Ólafur_Darri'), 

 'Jo_nathan Taylor', 'Jo_nathan_Taylor'), 

 'T. Austin', 'T._Austin'), 

 'Yun-fat', 'Yun_fat'), 

'Duk Kim', 'Duk_Kim'), 

 'Jason Scott', 'Jason_Scott'), 

 'Lou Taylor', 'Lou_Taylor'), 

 'Raven-Symoné', 'Raven Symoné'), 

 'Robert Sean', 'Robert_Sean'), 

 'Maï Anh Le', 'Maï_Anh Le'), 

' Tao\' Petcharoen', '_Tao\'_Petcharoen'), 

 'Mary Elizabeth', 'Mary_Elizabeth'), 

 'William B.', 'William_B.'), 

 'Neha Bikram Saluja', 'Neha_Bikram Saluja'), 

 'Revathi ', 'Revathi ---- '), 

 'Amitabh Bachchan', 'Amitabh *Bachchan'), 

 'Jaya Bachchan', 'Jaya *Bachchan'), 

 'Aishwarya Rai Bachchan', 'Aishwarya_Rai *Bachchan'), 

 'Miyavi ', 'Miyavi ---- '), 

 'C. Thomas', 'C._Thomas'), 

 'Richard E.', 'Richard_E.'), 

 'Jo_n Bon', 'Jo_n_Bon'), 

 'Anna Deavere', 'Anna_Deavere'), 

 'Jo_e Don_', 'Jo_e_Don_'), 

 'Kristin Scott', 'Kristin_Scott'), 

'Orianthi ', 'Orianthi ---- '), 

'Downey Jr.', 'Downey_Jr.'), 

'Sinbad ', 'Sinbad Sinbad '), 

'Jennifer Love', 'Jennifer_Love'), 

'Evan Rachel', 'Evan_Rachel'), 

'Lisa Roberts', 'Lisa_Roberts'), 

'Penelope Ann', 'Penelope_Ann'), 

'Charles S.', 'Charles_S.'), 

 'Richard T.', 'Richard_T.'), 

'Lou Diamond', 'Lou_Diamond'), 

'Jessica Brown', 'Jessica_Brown'), 

'Jamie Campbell', 'Jamie_Campbell'), 

'Xiao Shen', 'Xiao_Shen'), 

'Eva Amurri', 'Eva_Amurri'), 

'Julie Ann', 'Julie_Ann'), 

'Taraji P.', 'Taraji_P.'), 

'Vivica A.', 'Vivica_A.'), 

'Gordon Liu', 'Gordon_Liu'), 

'Chia-Hui', 'Chia_Hui'), 

'Wen Yann', 'Wen_Yann'), 

 'Ellen Hamilton Latzen', 'Ellen_Hamilton Latzen'), 

 'William Lee Scott', 'William_Lee Scott'), 

 'Jeremy James Kissner', 'Jeremy_James Kissner'), 

 '"Weird Al" Yankovic', '"Weird_Al" Yankovic'), 

 ' Scott Mortensen', ' *Scott Mortensen'), 

 'Audrey Lynn Tennent', 'Audrey_Lynn Tennent'), 

'Cher ', 'Cher ---- '), 

'Courtney B.', 'Courtney_B.'), 

'Charles S.', 'Charles_S.'), 

'Sarah Jane', 'Sarah_Jane'), 

 'John Benjamin', 'John_Benjamin'), 

'Sydney Tamiia', 'Sydney_Tamiia'), 

'Lisa Gay', 'Lisa_Gay'), 

'Jo_ey Lauren', 'Jo_ey_Lauren'), 

'K. C.', 'K._C.'), 

'Maggie Elizabeth', 'Maggie_Elizabeth'), 

 'Jo_hn Benjamin', 'Jo_hn_Benjamin'), 

'Skye McCole', 'Skye_McCole'), 

'Erik Per', 'Erik_Per'), 

'Deborah Kara', 'Deborah_Kara'), 

'Thomas Ian', 'Thomas_Ian'), 

'Sarah Wayne', 'Sarah_Wayne'), 

'Debnam-Carey', 'Debnam_Carey'), 

'Gilbert R.', 'Gilbert_R.'), 

'R. Lee', 'R._Lee'), 

 'Lily Autumn Page', 'Lily_Autumn Page'), 

 ' Douglas Rain ', ' Douglas Rain* '), 

'Rain ', 'Rain ---- '), 

'Cyndi Mayo', 'Cyndi_Mayo' ), 

'Brían F.', 'Brían_F.' ), 

 'Eddie Kaye', 'Eddie_Kaye' ), 

 ' Mo\'Nique', ' ------ Mo\'Nique' ), 

'Michael C.', ' Mo\'Michael_C.' ), 

'Andrew Dice', 'Andrew_Dice' ), 

'Russell G.', 'Russell_G.' ), 

'Jean Michel', 'Jean_Michel' ), 

'Anderson III', 'Anderson_III' ), 

'Litefoot ', 'Litefoot ------ ' ), 

'Keenen Ivory', 'Keenen_Ivory' ), 

'Kevin J.', 'Kevin_J.' ), 

'Catalina Sandino', 'Catalina_Sandino' ), 

'David Alan', 'David_Alan' ), 

'Tony Leung', 'Tony_Leung' ), 

'Eminem ', 'Eminem ------ ' ), 

'Thomas F.', 'Thomas_F.' ), 

'T.I. ', 'T.I. ------ ' ), 

' T.I.', ' ------ T.I.' ), 

 ' Mo\'', ' _Mo\'' ), 

 'Charles Malik', 'Charles_Malik' ), 

'Lisa Ann', 'Lisa_Ann' ), 

'Michael Jai', 'Michael_Jai' ), 

'Raoul Max', 'Raoul_Max' ), 

'Mary Kay', 'Mary_Kay' ), 

'Jo_hn Carroll', 'Jo_hn_Carroll' ), 

'Angelo Barra', 'Angelo_Barra' ), 

'Jacqueline MacInnes', 'Jacqueline_MacInnes' ), 

'Jamie Campbell', 'Jamie_Campbell' ), 

'Rachael Leigh', 'Rachael_Leigh' ), 

'Rufus Sewell', 'Rufus Sewell' ), 

'Prabhas ', 'Prabhas ---- ' ), 

'Tom Everett', 'Tom_Everett' ), 

'Vicellous Reon', 'Vicellous_Reon' ), 

'James Van', 'James_Van' ), 

'Der Beek', 'Der_Beek' ), 

'Rachael Leigh', 'Rachael_Leigh' ), 

 'Philip Baker Hall', 'Philip_Baker Hall' ), 

'Omar Benson Miller', 'Omar_Benson Miller' ), 

'Jean-Claude Van Damme', 'Jean-Claude Van_Damme' ), 

'Alexandra Maria', 'Alexandra_Maria' ), 

'Philip Baker Hall', 'Philip_Baker Hall' ), 

'Juan Carlos Hernández', 'Juan_Carlos Hernández' ), 

'Daniel E. Smith', 'Daniel_E. Smith' ), 

'J. T. Walsh', 'J._T. Walsh' ), 

'Klaus Maria Brandauer', 'Klaus_Maria Brandauer' ), 

'Fred Dalton Thompson', 'Fred_Dalton Thompson' ), 

 'Jamyang Jamtsho Wangchuk', 'Jamyang_Jamtsho Wangchuk' ), 

' Mako', ' ---- Mako' ), 

'S. Epatha Merkerson', 'S._Epatha Merkerson' ), 

'Eric Christian Olsen', 'Eric_Christian Olsen' ), 

'Irma P. Hall', 'Irma_P. Hall' ), 

'Eric Christian Olsen', 'Eric_Christian Olsen' ), 

'Aaliyah ', 'Aaliyah --- ' ), 

'Mary Beth Hurt', 'Mary_Beth Hurt' ), 

 'Nicole Ari Parker', 'Nicole_Ari Parker' ), 

'Sam J. Jo_nes', 'Sam_J. Jo_nes' ), 

' Xzibit', ' ---- Xzibit' ), 

'Clifton Collins Jr', 'Clifton Collins_Jr' ), 

 'Maï_Anh Le', 'Maï_Anh Le*' ), 

 'Charlotte Le Bon', 'Charlotte_Le* Bon' ), 

 'Steve Le Marquand', 'Steve_Le* Marquandn' ), 

 'Bernard Le Coq', 'Bernard_Le* Coq' ), 

 'Isild Le Besco', 'Isild_Le* Besco' ), 

 'James Le Gros', 'James_Le* Gros' ), 

 'Le Sage', 'Le* Sage' ), 

 'Paul Le Mat', 'Paul_Le* Mat' ), 

 'Renée Le Calm', 'Renée_Le* Calm' ), 

'Chao Li Chi', 'Chao_Li Chi' ), 

'Jewel ', 'Jewel ---- ' ), 

'Ki Hong Lee ', 'Ki_Hong Lee' ), 

'June Diane Raphael', 'June_Diane Raphael' ), 

'Daniel Hugh Kelly', 'Daniel_Hugh Kelly' ), 

'Eva Marie Saint', 'Eva_Marie Saint' ), 

' DMX', ' ---- DMX' ), 

'Robin Atkin Downes', 'Robin_Atkin Downes' ), 

'Robert Jo_hn Burke', 'Robert_Jo_hn Burke' ), 

'Billy Dee Williams', 'Billy_Dee Williams' ), 

' Sisqó', ' ---- Sisqó' ), 

'Callum Keith Rennie', 'Callum_Keith Rennie' ), 

'Billy Ray Cyrus', 'Billy_Ray Cyrus' ), 

'Gael García Bernal', 'Gael_García Bernal' ), 

'Adam G. Sevani', 'Adam_G. Sevani' ), 

'Ki_Hong LeeKaya', 'Ki_Hong Lee Kaya' ), 

'Mark Boone Junior', 'Mark_Boone Junior' ), 

'María Conchita Alonso', 'María_Conchita Alonso' ), 

'Lynn \'Red\' Williams', 'Lynn_\'Red\' Williams' ), 

'L. Scott Caldwell', 'L._Scott Caldwell' ), 

'Brian J. White', 'Brian_J. White' ), 

'Doug E. Doug', 'Doug_E. Doug' ), 

'Holly Robinson Peete', 'Holly_Robinson Peete' ), 

'Christoph Maria Herbst', 'Christoph_Maria Herbst' ), 

 'Anna Maria Horsford', 'Anna_Maria Horsford' ), 

 'Amanda Redman', 'Amanda Redman*' ), 

'Redman ', 'Redman --- ' ), 

'Jo_nathan Ke Quan', 'Jo_nathan_Ke Quan' ), 

'Bobb\'e J. Thompson', 'Bobb\'e_J. Thompson' ), 

' Norfolk', ' ---- Norfolk' ), 

'RZA ', 'RZA --- ' ), 

'Benjamin Jay Davis', 'Benjamin_Jay Davis' ), 

'Adam David Thompson', 'Adam_David Thompson' ), 

'Keegan Connor Tracy', 'Keegan_Connor Tracy' ), 

'Gerald R. Molen', 'Gerald_R. Molen' ), 

'Michele Lamar Richards', 'Michele_Lamar Richards' ), 

'Michael Kenneth Williams', 'Michael_Kenneth Williams' ), 

 'Luis Fernando Peña', 'Luis_Fernando Peña' ), 

'Silambarasan ', 'Silambarasan ----- ' ), 

'Santhanam ', 'Santhanam -- ' ), 

' Brahmanandam', ' ---- Brahmanandam' ), 

'Matthew A. Brown', 'Matthew_A. Brown' ), 

'Anna Claire Sneed', 'Anna_Claire Sneed' ), 

' Cherki', ' ---- Cherki' ), 

'Kimberly J. Brown', 'Kimberly_J. Brown' ), 

'Brendan "Doogie" Milewski', 'Brendan_"Doogie" Milewski' ), 

 'Jo_hn Bennett Perry', 'Jo_hn_Bennett Perry' ), 

 'Christopher Walken', 'Christopher* Walken' ), 

 'Dyllan Christopher', 'Dyllan Christopher*' ), 

 'Christopher Lloyd', 'Christopher* Lloyd' ), 

 'Christopher Meloni', 'Christopher* Meloni' ), 

 'Mads Sjøgård Pettersen', 'Mads_Sjøgård Pettersen' ), 

 'Tyler James Williams', 'Tyler_James Williams' ), 

 'Patrick St. Esprit', 'Patrick_St. Esprit' ), 

 'Christopher Evan Welch', 'Christopher*_Evan Welch' ), 

 'Henry Ian Cusick', 'Henry_Ian Cusick' ), 

 'Jesse Lee Soffer', 'Jesse_Lee Soffer' ), 

 'Christopher Shand', 'Christopher* Shand' ), 

 'Christopher Nicholas Smith', 'Christopher*_Nicholas Smith' ), 

 'Christopher Jo_rdan Wallace', 'Christopher*_Jo_rdan Wallace' ), 

 'Jo_hn P. Ryan', 'Jo_hn_P. Ryan' ), 

 'Connor Christopher Levins', 'Connor_Christopher* Levins' ), 

 'Christopher Beiring', 'Christopher* Beiring' ), 

 'Brian Keith Allen', 'Brian_Keith Allen' ), 

 'Christopher Darga', 'Christopher* Darga' ), 

 'Harold House Moore', 'Harold_House Moore' ), 

 'Christopher Toler', 'Christopher* Toler' ), 

 'Christopher Robin Miller', 'Christopher*_Robin Miller' ), 

 'Natalie Stephany Aguilar', 'Natalie_Stephany Aguilar' ), 

 'Dragon ', 'Dragon ---- ' ), 

'Don_ald L. Brooks', 'Don_ald_L. Brooks' ), 

'Ice-T ', 'Ice-T ---- ' ), 

'Amidou ', 'Amidou ---- ' ), 

 'Marion Cotillard', '*Marion* Cotillard' ), 

 'Mario_Van Peebles', '*Mario*_Van Peebles' ), 

 'Marion Darlington', '*Marion* Darlington' ), 

 'Marion Bailey', '*Marion* Bailey' ), 

 'Marion O\'Dwyer', '*Marion* O\'Dwyer' ), 

 'Marion Lambert', '*Marion* Lambert' ), 

 'Melvin Van Peebles', 'Melvin_Van Peebles' ), 

'Mario ', 'Mario ---- ' ), 

 ' Mario', ' ---- Mario' ), 

'Steve-O ', 'Steve-O ---- ' ), 

'GQ ', 'GQ ---- ' ), 

 ' GQ', ' ---- GQ' ), 

'Luenell ', 'Luenell --- ' ), 

 'Yedidia ', 'Yedidia --- ' ), 

 'Machado ', 'Machado --- ' ), 

'Aliya Ba Sen', 'Aliya_Ba Sen' ), 

'Ne-Yo ', 'NeYo --- '), 

'Astro ', 'Astro --- ' ), 

 'Gabrielle Lopes Benites', 'Gabrielle_Lopes Benites' ), 

'Common ', 'Common --- ' ), 

'Arletty ', 'Arletty --- ' ), 

'Rekha ', 'Rekha --- ' ), 

 'Wilbur \'Hi-Fi\' White Leon Isaac Kennedy', 'Wilbur_\'Hi-Fi\'_White Leon_Isaac_Kennedy' ), 

'Max Elliott Slade', 'Max_Elliott Slade' ), 

'J. Evan Bonifant', 'J._Evan Bonifant' ), 

'Caroline Junko King', 'Caroline_Junko King' ), 

'Floyd Red Crow Westerman', 'Floyd_Red Crow_Westerman' ), 

'Rodney A. Grant', 'Rodney_A. Grant' ), 

'Shah Rukh Khan', 'Shah_Rukh Khan' ), 

'Douglas M. Griffin', 'Douglas_M. Griffin' ), 

'Putu Dinda Pratika', 'Putu_Dinda Pratika' ), 

'Puti Sri Candra Dewi', 'Puti_Sri Candra_Dewi' ), 

'Ni Made Megahadi Pratiwi', 'Ni_Made Megahadi_Pratiwi' ), 

'George H. W. Bush', 'George H._W._Bush' ), 

'George W. Bush', 'George_W. Bush' ), 

'Stig Frode Henriksen', 'Stig_Frode Henriksen' ), 

'Jeppe Beck Laursen', 'Jeppe_Beck Laursen' ), 

 'Patrick J. Adams', 'Patrick_J. Adams' ), 

'Jo_hnny A. Sanchez', 'Jo_hnny_A. Sanchez' ), 

 'Rufus Sewell', 'Rufus* Sewell' ), 

 'Rufus Graham', 'Rufus* Graham' ), 

 'Rufus ', 'Rufus ---- ' ), 

 'Kevin Peter Hall', 'Kevin_Peter* Hall' ), 

 'Corlandos Scott ', 'Corlandos Scott*' ), 

 'Chad Michael Murray', 'Chad_Michael* Murray' ), 

 'Mary Lynn Rajskub', 'Mary_Lynn* Rajskub' ), 

'Jo_el David Moore', 'Jo_el_David* Moore' ), 

'Elizabeth of Toro', 'Elizabeth of_Toro*' ), 

'Jennifer Schwalbach Smith', 'Jennifer_Schwalbach* Smith' ), 

 'Brian Van Holt', 'Brian_Van* Holt' ), 

 'Steven R. McQueen', 'Steven_R. McQueen' ), 

 'Jill Marie Jo_nes', 'Jill_Marie* Jo_nes' ), 

 'Omar J. Dorsey', 'Omar_J. Dorsey' ), 

 'Tony Lo Bianco', 'Tony_Lo* Bianco' ), 

 'Anthony Michael Hall', 'Anthony_Michael* Hall' ), 

 'Frank C. Turner', 'Frank_C. Turner' ), 

'Chen Hu Jun', 'Chen_Hu* Jun' ), 

'Mary J. Blige', 'Mary_J. Blige' ), 

'Christie Lynn Smith', 'Christie_Lynn* Smith' ), 

'Eddie Cheung Siu-Fai', 'Eddie_Cheung* Siu-Fai' ), 

'Sean Patrick Thomas', 'Sean_Patrick* Thomas' ), 

 'Eve ', 'Eve --- ' ), 

'van den ', 'van_den_') AS castNuevo 

FROM cast; 

-- Tabla Final 

DROP TABLE IF EXISTS cast_final;  

CREATE TABLE cast_final AS  

SELECT id, 

SUBSTRING_INDEX(castNuevo, ' ', 2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 4), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 6), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 8), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 10), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 12), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 14), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 16), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 18), ' ', -2) AS nombres 

FROM cast_tmp 

UNION 

SELECT id, 

SUBSTRING_INDEX(SUBSTRING_INDEX(castNuevo, ' ', 20), ' ', -2) AS nombres 

FROM cast_tmp  

ORDER BY id; 