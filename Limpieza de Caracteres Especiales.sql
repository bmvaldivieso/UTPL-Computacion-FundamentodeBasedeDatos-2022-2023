-- Limpieza de Caracteres Especiales

-- Limpieza Correspondiente a la columna Director 

DROP TABLE IF EXISTS director_TMP; 

CREATE TABLE director_TMP AS 

SELECT id, director AS directorOriginal, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(director, 

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

'\\u00fb', 'û'), 

'\\u00c1', 'Á'), 

'\\u0161', 'š'), 

'\\u0144s', 'ń'), 

'\\u014ct', 'Ō'), 

'\\u0142', 'ł'), 

'\\u017e', 'ž') 

AS directorNuevo 

FROM movies_dataset; 




-- Limpieza Correspondiente a la columna Crew 

DROP TABLE IF EXISTS crew_TMP; 

CREATE TABLE crew_TMP AS 

SELECT id, crew AS crewOriginal, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(crew, 

'\\u00e9', 'é'),  

'\\u00ed', 'í'),  

'\\u00e1', 'á'),  

'\\u00f3', 'ó'),  

'\\u00e2', 'â'), 

'\\u00f6', 'ö'),  

'\\u00f1', 'ñ'),  

'\\u00e7', 'ç'),  

'\\u00f4', 'ô'),  

'\\u00e5', 'å'),  

'\\u00e8', 'è'),  

'\\u00eb', 'ë'),  

'\\u00e3', 'ã'),  

'\\u00fc', 'ü'),  

'\\u00ee', 'î'),  

'\\u00c9', 'É'),  

'\\u00e4', 'ä'),  

'\\u00fd', 'ý'),  

'\\u00fa', 'ú'),  

'\\u00ef', 'ï'),  

'\\u00d6', 'Ö'),  

'\\u00d4', 'Ô'), 

'\\u00c1', 'Á'),  

'\\u00f8', 'ø'),  

'\\u00e6', 'æ'),  

'\\u00c0', 'À'),  

'\\u00e0', 'à'),  

'\\u00d3', 'Ó'),  

'\\u00fb', 'û'),  

'\\u00f0', 'ð'),  

'\\u00da', 'Ú'),  

'\\u00d8', 'Ø'),  

'\\u00c5', 'Å'),  

'\\u00df', 'ß'), 

'\\u00ea', 'ê'),  

'\\u00fe', 'þ'),  

'\\u00cd', 'Í'),  

'\\u00ec', 'ì'),  

'\\u00f5', 'õ'),  

'\\u00de', 'Þ'),  

'\\u00f2', 'ò'), 

'\\u0159','ř'), 

'\\u0144','ń'), 

'\\u015f','ş'), 

'\\u0161','š'), 

'\\u0107','ć'), 

'\\u0161','š'), 

'\\u010d','č'), 

'\\u0142','ł'), 

'\\u015e','Ş'), 

'\\u0411','Б'), 

'\\u014c','Ō'), 

'\\u010e','Ď'), 

'\\u015e','Ş'), 

'\\u010d','č'), 

'\\u017e','ž'), 

'\\u0107','ć'), 

'\\u2019','’'), 

'\\u5f20','张'), 

'\\u0160','Š'), 

'\\u043e','о'), 

'\\u011b','ě'), 

'\\u0160','Š'), 

'\\u0141','Ł'), 

'\\u7acb','立'), 

'\\u0165','ť'), 

'\\u0440','р'), 

'\\u010c','Č'), 

'\\u017b','Ż'), 

'\\u0438','и'), 

'\\u0441','с'), 

'\\u0421','С'), 

'\\u0442','т'), 

'\\u0443','y'), 

'\\u0433','r'), 

'\\u0430','a'), 

'\\u0446','ц'), 

'\\u043a','k'), 

'\\u0439','й') 

AS crewNuevo 

FROM movies_dataset; 

 

-- Limpieza Correspondiente a la columna Keywords 

DROP TABLE IF EXISTS keywords_TMP; 

CREATE TABLE keywords_TMP AS 

SELECT id, keywords AS keywordsOriginal, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(keywords, 

'\\u00e9', 'é'),  

'\\u00ed', 'í'),  

'\\u00e1', 'á'),  

'\\u00f3', 'ó'),  

'\\u00e2', 'â'), 

'\\u00f6', 'ö'),  

'\\u00f1', 'ñ'),  

'\\u00e7', 'ç'),  

'\\u00f4', 'ô'),  

'\\u00e5', 'å'),  

'\\u00e8', 'è'),  

'\\u00eb', 'ë'),  

'\\u00e3', 'ã'),  

'\\u00fc', 'ü'),  

'\\u00ee', 'î'),  

'\\u00c9', 'É'),  

'\\u00e4', 'ä'),  

'\\u00fd', 'ý'),  

'\\u00fa', 'ú'),  

'\\u00ef', 'ï'),  

'\\u00d6', 'Ö'),  

'\\u00d4', 'Ô'), 

'\\u00c1', 'Á'),  

'\\u00f8', 'ø'),  

'\\u00e6', 'æ'),  

'\\u00c0', 'À'),  

'\\u00e0', 'à'),  

'\\u00d3', 'Ó'),  

'\\u00fb', 'û'),  

'\\u00f0', 'ð'),  

'\\u00da', 'Ú'),  

'\\u00d8', 'Ø'),  

'\\u00c5', 'Å'),  

'\\u00df', 'ß'), 

'\\u00ea', 'ê'),  

'\\u00fe', 'þ'),  

'\\u00cd', 'Í'),  

'\\u00ec', 'ì'),  

'\\u00f5', 'õ'),  

'\\u00de', 'Þ'),  

'\\u00f2', 'ò'), 

'\\u0159','ř'), 

'\\u0144','ń'), 

'\\u015f','ş'), 

'\\u0161','š'), 

'\\u0107','ć'), 

'\\u0161','š'), 

'\\u010d','č'), 

'\\u0142','ł'), 

'\\u015e','Ş'), 

'\\u0411','Б'), 

'\\u014c','Ō'), 

'\\u010e','Ď'), 

'\\u015e','Ş'), 

'\\u010d','č'), 

'\\u017e','ž'), 

'\\u0107','ć'), 

'\\u2019','’'), 

'\\u5f20','张'), 

'\\u0160','Š'), 

'\\u043e','о'), 

'\\u011b','ě'), 

'\\u0160','Š'), 

'\\u0141','Ł'), 

'\\u7acb','立'), 

'\\u0165','ť'), 

'\\u0440','р'), 

'\\u010c','Č'), 

'\\u017b','Ż'), 

'\\u0438','и'), 

'\\u0441','с'), 

'\\u0421','С'), 

'\\u0442','т'), 

'\\u0443','y'), 

'\\u0433','r'), 

'\\u0430','a'), 

'\\u0446','ц'), 

'\\u043a','k'), 

'\\u0439','й'), 

'\\u00a0',' '), 

'\\u7edd','绝'), 

'\\u2013','–'), 

"'",'') 

AS keywordsNuevo 

FROM movies_dataset; 

 

-- Limpieza Correspondiente a la columna Original_Title 

DROP TABLE IF EXISTS original_title_movies_TMP; 

CREATE TABLE original_title_movies_TMP AS 

SELECT 		id, 

budget, 

homepage, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(original_title, 

'キュア', 'Cure'), 

'دایره', 'El Círculo'), 

'بچه‌های آسمان', 'Bacheha-Ye aseman'), 

'Κυνόδοντας', 'Colmillos'), 

'疯狂的石头', 'Crazy Stone'), 

'七人の侍', 'Los siete samuráis'), 

'جدایی نادر از سیمین', 'Una separación'), 

'दिल जो भी कहे', 'Dil Jo Bhi Kahey...'), 

'سكر بنات', 'Caramelo'), 

'வாலு', 'Vaalu'), 

'एबीसीडी', 'Any Body Can Dance'), 

'醉拳二', 'El maestro borracho II'), 

'疯狂的赛车', 'Crazy Racer'), 

'올드보이', 'Oldboy: cinco días para vengarse'), 

'归来', 'Regreso a casa'), 

'Географ глобус пропил', 'Geograf globus propil'), 

'放‧逐', 'Exiled'), 

'친절한 금자씨', 'Señora venganza'), 

'一個好人', 'El invencible'), 

'Снежная королева', 'La reina de las nieves'), 

'Z 風暴', 'Tormenta Z'), 

'紅番區', 'Masacre en Nueva York'), 

'非常幸运', 'Mi estrella de la suerte'), 

'アキラ', 'Akira'), 

'실미도', 'Silmido'), 

'少林足球', 'Siu lam juk kau'), 

'कृष', 'Krrish'), 

'三城记', 'A Tale of Three Cities'), 

'まあだだよ', 'Madadayo'), 

'兔侠传奇', 'Legend of a Rabbit'), 

'南京!南京!', 'Ciudad de vida y muerte'), 

'三枪拍案惊奇', 'San qiang pai an jing qi'), 

'괴물', 'The Host'), 

'十面埋伏', 'La casa de las dagas voladoras'), 

'태극기 휘날리며', 'La hermandad de la guerra'), 

'인천상륙작전', 'Operación oculta'), 

'剑雨', 'Reino de los Asesinos'), 

'新宿事件', 'La venganza del dragón'), 

'Возвращение', 'El regreso'), 

'刺客聶隱娘', 'La asesina'), 

'해운대', 'Tidal Wave'), 

'卧虎藏龙', 'El tigre y el dragón'), 

'逃出生天', 'La torre del infierno'), 

'風暴', 'Firestorm'), 

'千と千尋の神隠し', 'El viaje de Chihiro'), 

'ராமானுஜன்', 'Ramanujan'), 

'三国之见龙卸甲', 'Tres Reinos: La Resurreccion del Dragon'), 

'長江七號', 'Cj7: Juguete Del Espacio'), 

'黃石的孩子', 'Los niños de China'), 

'もののけ姫', 'La princesa Mononoke'), 

'功夫', 'Kung-Fusión'), 

'十月圍城', 'Bodyguards and Assassins'), 

'ハウルの動く城', 'El increíble castillo vagabundo'), 

'一個人的武林', 'Kung Fu Jungle'), 

'キャプテンハーロック', 'Space Pirate Captain Harlock'), 

'辛亥革命', '1911'), 

'디워', 'Furia de Dragones'), 

'崖の上のポニョ', 'Ponyo y el secreto de la sirenita'), 

'一代宗師', 'El arte de la guerra'), 

'滿城盡帶黃金甲', 'La maldición de la flor dorada'), 

'西游记之孙悟空三打白骨精', 'The Monkey King 2'), 

'天將雄師', 'Dragon Blade'), 

'金陵十三釵', 'Las flores de la guerra'), 

'シン・ゴジラ', 'Shin Godzilla'), 

'좋은 놈, 나쁜 놈, 이상한 놈', 'El bueno, el malo y el raro'), 

'곡성', 'The Wailing'), 

'葉問3', 'Ip Man 3'), 

'英雄', 'Héroe'), 

'投名狀', 'Los señores de la guerra'), 

'สุริโยไท', 'La leyenda de Suriyothai'), 

'ต้มยำกุ้ง', 'Tom yum goong'), 

'कभी अलविदा ना कहना', 'Kabhi Alvida Naa Kehna'), 

'Трудно быть богом', 'Que difícil es ser Dios'), 

'Солярис', 'Solaris'), 

'Савва. Сердце воина', 'Savva y el dragón de fuego'), 

'Ночной дозор', 'Guardianes de la noche'), 

'Монгол', 'Mongol'), 

'Белка и Стрелка. Звёздные собаки', 'Mascotas en el espacio') 

AS original_title, 

overview, 

popularity, 

release_date, 

revenue, 

runtime, 

status, 

tagline, 

title, 

vote_average, 

vote_count, 

original_language 

FROM movies_dataset; 

 

-- Limpieza Correspondiente a la columna Production_Companies 

 

DROP TABLE IF EXISTS production_companies_TMP; 

CREATE TABLE production_companies_TMP AS 

SELECT id, production_companies AS production_companiesOriginal, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(production_companies, 

'\\u00e9', 'é'),  

'\\u00ed', 'í'),  

'\\u00e1', 'á'),  

'\\u00f3', 'ó'),  

'\\u00e2', 'â'), 

'\\u00f6', 'ö'),  

'\\u00f1', 'ñ'),  

'\\u00e7', 'ç'),  

'\\u00f4', 'ô'),  

'\\u00e5', 'å'),  

'\\u00e8', 'è'),  

'\\u00eb', 'ë'),  

'\\u00e3', 'ã'),  

'\\u00fc', 'ü'),  

'\\u00ee', 'î'),  

'\\u00c9', 'É'),  

'\\u00e4', 'ä'),  

'\\u00fd', 'ý'),  

'\\u00fa', 'ú'),  

'\\u00ef', 'ï'),  

'\\u00d6', 'Ö'),  

'\\u00d4', 'Ô'), 

'\\u00c1', 'Á'),  

'\\u00f8', 'ø'),  

'\\u00e6', 'æ'),  

'\\u00c0', 'À'),  

'\\u00e0', 'à'),  

'\\u00d3', 'Ó'),  

'\\u00fb', 'û'),  

'\\u00f0', 'ð'),  

'\\u00da', 'Ú'),  

'\\u00d8', 'Ø'),  

'\\u00c5', 'Å'),  

'\\u00df', 'ß') , 

'\\u00ea', 'ê'),  

'\\u00fe', 'þ'),  

'\\u00cd', 'Í'),  

'\\u00ec', 'ì'),  

'\\u00f5', 'õ'),  

'\\u00de', 'Þ'),  

'\\u00f2', 'ò'), 

'\\u0159','ř'), 

'\\u0144','ń'), 

'\\u015f','ş'), 

'\\u0161','š'), 

'\\u0107','ć'), 

'\\u0161','š'), 

'\\u010d','č'), 

'\\u0142','ł'), 

'\\u015e','Ş'), 

'\\u0411','Б'), 

'\\u014c','Ō'), 

'\\u010e','Ď'), 

'\\u015e','Ş'), 

'\\u010d','č'), 

'\\u017e','ž'), 

'\\u0107','ć'), 

'\\u2019','’'), 

'\\u5f20','张'), 

'\\u0160','Š'), 

'\\u043e','о'), 

'\\u011b','ě'), 

'\\u0160','Š'), 

'\\u0141','Ł'), 

'\\u7acb','立'), 

'\\u0165','ť'), 

'\\u0440','р'), 

'\\u010c','Č'), 

'\\u017b','Ż'), 

'\\u0438','и'), 

'\\u0441','с'), 

'\\u0421','С'), 

'\\u0442','т'), 

'\\u0443','y'), 

'\\u0433','r'), 

'\\u0430','a'), 

'\\u0446','ц'), 

'\\u043a','k'), 

'\\u0439','й'), 

'\\u00b0','°'), 

'\\u00b2','²'), 

'\\u00ce','Î') 

AS production_companiesNuevo 

FROM movies_dataset; 

 

-- Limpieza Correspondiente a la columna Production_Countries 

 

DROP TABLE IF EXISTS production_countries_TMP; 

CREATE TABLE production_countries_TMP AS 

SELECT id, production_countries AS production_countriesOriginal, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(production_countries, 

'\\u00e9', 'é'),  

'\\u00ed', 'í'),  

'\\u00e1', 'á'),  

'\\u00f3', 'ó'),  

'\\u00e2', 'â'), 

'\\u00f6', 'ö'),  

'\\u00f1', 'ñ'),  

'\\u00e7', 'ç'),  

'\\u00f4', 'ô'),  

'\\u00e5', 'å'),  

'\\u00e8', 'è'),  

'\\u00eb', 'ë'),  

'\\u00e3', 'ã'),  

'\\u00fc', 'ü'),  

'\\u00ee', 'î'),  

'\\u00c9', 'É'),  

'\\u00e4', 'ä'),  

'\\u00fd', 'ý'),  

'\\u00fa', 'ú'),  

'\\u00ef', 'ï'),  

'\\u00d6', 'Ö'),  

'\\u00d4', 'Ô'), 

'\\u00c1', 'Á'),  

'\\u00f8', 'ø'),  

'\\u00e6', 'æ'),  

'\\u00c0', 'À'),  

'\\u00e0', 'à'),  

'\\u00d3', 'Ó'),  

'\\u00fb', 'û'),  

'\\u00f0', 'ð'),  

'\\u00da', 'Ú'),  

'\\u00d8', 'Ø'),  

'\\u00c5', 'Å'),  

'\\u00df', 'ß') , 

'\\u00ea', 'ê'),  

'\\u00fe', 'þ'),  

'\\u00cd', 'Í'),  

'\\u00ec', 'ì'),  

'\\u00f5', 'õ'),  

'\\u00de', 'Þ'),  

'\\u00f2', 'ò'), 

'\\u0159','ř'), 

'\\u0144','ń'), 

'\\u015f','ş'), 

'\\u0161','š'), 

'\\u0107','ć'), 

'\\u0161','š'), 

'\\u010d','č'), 

'\\u0142','ł'), 

'\\u015e','Ş'), 

'\\u0411','Б'), 

'\\u014c','Ō'), 

'\\u010e','Ď'), 

'\\u015e','Ş'), 

'\\u010d','č'), 

'\\u017e','ž'), 

'\\u0107','ć'), 

'\\u2019','’'), 

'\\u5f20','张'), 

'\\u0160','Š'), 

'\\u043e','о'), 

'\\u011b','ě'), 

'\\u0160','Š'), 

'\\u0141','Ł'), 

'\\u7acb','立'), 

'\\u0165','ť'), 

'\\u0440','р'), 

'\\u010c','Č'), 

'\\u017b','Ż'), 

'\\u0438','и'), 

'\\u0441','с'), 

'\\u0421','С'), 

'\\u0442','т'), 

'\\u0443','y'), 

'\\u0433','r'), 

'\\u0430','a'), 

'\\u0446','ц'), 

'\\u043a','k'), 

'\\u0439','й'), 

'\\u00b0','°'), 

'\\u00b2','²'), 

'\\u00ce','Î') 

AS production_countriesNuevo 

FROM movies_dataset; 

 

 

-- Limpieza Correspondiente a la columna Spoken_Languages 

 

DROP TABLE IF EXISTS spoken_languages_TMP; 

CREATE TABLE spoken_languages_TMP AS 

SELECT id, spoken_languages AS spoken_languagesOriginal, 

REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(spoken_languages, 

'\\u00e9', 'é'),  

'\\u00ed', 'í'),  

'\\u00e1', 'á'),  

'\\u00f3', 'ó'),  

'\\u00e2', 'â'), 

'\\u00f6', 'ö'),  

'\\u00f1', 'ñ'),  

'\\u00e7', 'ç'),  

'\\u00f4', 'ô'),  

'\\u00e5', 'å'),  

'\\u00e8', 'è'),  

'\\u00eb', 'ë'),  

'\\u00e3', 'ã'),  

'\\u00fc', 'ü'),  

'\\u00ee', 'î'),  

'\\u00c9', 'É'),  

'\\u00e4', 'ä'),  

'\\u00fd', 'ý'),  

'\\u00fa', 'ú'),  

'\\u00ef', 'ï'),  

'\\u00d6', 'Ö'),  

'\\u00d4', 'Ô'), 

'\\u00c1', 'Á'),  

'\\u00f8', 'ø'),  

'\\u00e6', 'æ'),  

'\\u00c0', 'À'),  

'\\u00e0', 'à'),  

'\\u00d3', 'Ó'),  

'\\u00fb', 'û'),  

'\\u00f0', 'ð'),  

'\\u00da', 'Ú'),  

'\\u00d8', 'Ø'),  

'\\u00c5', 'Å'),  

'\\u00df', 'ß') , 

'\\u00ea', 'ê'),  

'\\u00fe', 'þ'),  

'\\u00cd', 'Í'),  

'\\u00ec', 'ì'),  

'\\u00f5', 'õ'),  

'\\u00de', 'Þ'),  

'\\u00f2', 'ò'), 

'\\u0159','ř'), 

'\\u0144','ń'), 

'\\u015f','ş'), 

'\\u0161','š'), 

'\\u0107','ć'), 

'\\u0161','š'), 

'\\u010d','č'), 

'\\u0142','ł'), 

'\\u015e','Ş'), 

'\\u0411','Б'), 

'\\u014c','Ō'), 

'\\u010e','Ď'), 

'\\u015e','Ş'), 

'\\u010d','č'), 

'\\u017e','ž'), 

'\\u0107','ć'), 

'\\u2019','’'), 

'\\u5f20','张'), 

'\\u0160','Š'), 

'\\u043e','о'), 

'\\u011b','ě'), 

'\\u0160','Š'), 

'\\u0141','Ł'), 

'\\u7acb','立'), 

'\\u0165','ť'), 

'\\u0440','р'), 

'\\u010c','Č'), 

'\\u017b','Ż'), 

'\\u0438','и'), 

'\\u0441','с'), 

'\\u0421','С'), 

'\\u0442','т'), 

'\\u0443','y'), 

'\\u0433','r'), 

'\\u0430','a'), 

'\\u0446','ц'), 

'\\u043a','k'), 

'\\u0439','й'), 

'\\u00b0','°'), 

'\\u00b2','²'), 

'\\u00ce','Î'), 

'\\ud55c','한'), 

'\\u666e','普'), 

'\\u65e5','日'), 

'\\u5e7f','广'), 

'\\u1ebf','ế'), 

'\\u10e5','ქ'), 

'\\u0e20','ภ'), 

'\\u0c24','త'), 

'\\u0ba4','த'), 

'\\u0a2a','ਪ'), 

'\\u09ac','ব'), 

'\\u0939','ह'), 

'\\u067e','پ'), 

'\\u0641','ف'), 

'\\u0627','ا'), 

'\\u05e2','ע'), 

'\\u049b','қ'), 

'\\u0431','б'), 

'\\u0423','У'), 

'\\u03b5','ε'), 

'\\u0103','ă'), 

'\\u03bb','λ'), 

'\\u0e32','า'), 

'\\u093f','ि'), 

'\\u0631','ر'), 

'\\u0644','ل'), 

'\\u05b4','״'), 

'\\u044a','ы'), 

'\\u0457','ї'), 

'\\u0a70','ਰ'), 

'\\u0437','з'), 

'\\u0c46','ె'), 

'\\u069a',' ؚ'), 

'\\u0bae','म'), 

'\\u09be','া'), 

'\\u901a','通'), 

'\\u672c','本'), 

'\\uad6d','国'), 

'\\u5dde','州'), 

'\\u1ec7','ệ'), 

'\\u10d0','ა'), 

'\\u03b7','η'),  

'\\u0e29','ษ '), 

'\\u0928','न '), 

'\\u0633','س'), 

'\\u062f','د'), 

'\\u0639','ع'), 

'\\u05d1','ב'), 

'\\u043b','л'), 

'\\u043d','н'), 

'\\u0a1c','ਜ '), 

'\\u0c32','ల '), 

'\\u062a','ت'), 

'\\u0bbf','ய'), 

'\\u0982','ং'), 

'\\u8bdd','话'), 

'\\u8a9e','語'), 

'\\uc5b4','아'), 

'\\u10e0','რ'), 

'\\u03bd','ν'), 

'\\u0e44',' ไ'), 

'\\u094d',' ्'), 

'\\u06cc','ی'), 

'\\u0648','و'), 

'\\u0628','ب'), 

'\\u05b0','װ'), 

'\\u0435','е'), 

'\\u044c','ь'), 

'\\u0a3e','ਾ '), 

'\\u0c41','ఁ '), 

'\\u0bb4',' ழ '), 

'\\u09b2',' ল '), 

'\\u5ee3','廣'), 

'\\uc870','윰'), 

'\\u10d7','თ'), 

'\\u03b9','ι'), 

'\\u0e17','ท '), 

'\\u0926','द '), 

'\\u064a','ي'), 

'\\u05e8','ר'), 

'\\u0a2c','ਬ '), 

'\\u0c17','గ'), 

'\\u0bcd','ಎ '), 

'\\u8a71','話'), 

'\\uc120','저'), 

'\\u10e3','უ'), 

'\\u03ba','κ'), 

'\\u0e22','ย'), 

'\\u0940','ी'), 

'\\u0629','ة'), 

'\\u05d9','י'), 

'\\u0a40','ਠ '), 

'\\ub9d0','볐'), 

'\\u10da','ლ'), 

'\\u03ac','ά'), 

'\\u05ea','ת'), 

'\\u10d8','ი') 

AS spoken_languagesNuevo 

FROM movies_dataset; 