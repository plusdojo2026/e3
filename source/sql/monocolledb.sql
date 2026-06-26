

/*******************
 *
 * DROP DATABASE IF EXISTS e3;
 * CREATE DATABASE e3;
 * USE e3;
 * CREATE USER 'e3'@'localhost' IDENTIFIED BY 'password';
 * GRANT ALL PRIVILEGES ON *.* TO 'e3'@'localhost';
 *
 ***************** */


/* ログインDB */
CREATE TABLE login (
id int (50) AUTO_INCREMENT PRIMARY KEY,
password varchar (50) NOT NULL
);
/*追加 ユーザーIDは数字8桁表示*/
ALTER TABLE login AUTO_INCREMENT = 10000000;

/* PW:8文字以上(数字、大文字、小文字から 2 つ以上) */
INSERT INTO login (password) VALUES ('passWord');
INSERT INTO login (password) VALUES ('TestLoginpw');
INSERT INTO login (password) VALUES ('404TESTPASS');

/* 購入診断DB */
CREATE TABLE diagnosis (
id int (50) AUTO_INCREMENT PRIMARY KEY,
shouhin varchar (300),
money int NOT NULL,
use_year int NOT NULL,
day_price double,/* 価格÷耐用年数で求める、表示時はint型にする */
userid int
);

SELECT * FROM diagnosis;

/* 10件 */
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('マイコン炊飯器', 10000, 7 ,10000/(7*365), 10000000);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('小型炊飯器', 6000, 5, 6000/(5*365), 10000001);

INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('ワイヤレスイヤホン', 15000, 4, 15000/(4*365), 10000001);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('安ワイヤレスイヤホン', 3000, 1, 3000/(1*365), 10000000);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('有線イヤホン', 8000, 3, 8000/(3*365), 10000001);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('90L冷蔵庫', 24800, 6, 24800/(6*365), 10000000);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('スマートフリッジ140L', 39800, 8, 39800/(8*365), 10000001);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('卓上ミニ扇風機', 2980, 3, 2980/(3*365), 10000000);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('サイレントフロー', 4980, 4, 4980/(4*365), 10000001);
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price, userid) 
	VALUES('エアサーキュレーター', 7480, 5, 7480/(5*365), 10000000);

/* 商品詳細DB */
create table shouhin (
id int (50) AUTO_INCREMENT PRIMARY KEY,
genre varchar (200) NOT NULL,
shouhin varchar (300) NOT NULL,
buy_date date NOT NULL,
price int NOT NULL,
wperiod int ,
maker varchar (300),
life int NOT NULL,
day_price double ,
progress int ,
goal int ,
nickname varchar (300),
img LONGBLOB ,
userid int,
frame int
);

DESCRIBE shouhin;

SELECT * FROM shouhin;

/* ジャンル・商品名・購入日・価格・保証期間・メーカー・耐用年数・一日あたり価格・経過日数・目標達成まであと何日か・愛称 */
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES ('家電', '冷蔵庫', '2026-06-12', 20000, 1, '西芝', 5, 10000/(5*365), 3, 200, 'レイちゃん', NULL, 10000000, 1);
	
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES ('家電', '電子レンジ', '2026-06-13', 5000, 1, 'アイリスオオウチ', 5, 10000/(5*365), 3, 200, 'アタメル', NULL, 10000000, 2);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES ('家電', '掃除機', '2026-06-15', 50000, 1, 'ダイサン', 5, 50000/(5*365), 3, 200, 'バキューム', NULL, 10000000, 3);
	
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES ('家電', '扇風機', '2026-06-18', 30000, 1, '風力研究所', 5, 30000/(5*365), 3, 200, '風神', NULL, 10000000, 4);
	
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES ('家電', 'トースター', '2026-06-12', 10000, 1, 'ホカホカ', 5, 10000/(5*365), 3, 200, '朝のお供', NULL, 10000000, 1);
	
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('家電', '掃除機', '2023-09-20', 21000, 3, 'スイープリンク社', 7, 21000/(7*365), 1003, 1552, 'すいすい君', NULL, 10000001, 2);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES ('家具', 'ソファー', '2022-05-10', 26000, 1, 'コンフォート家具工房', 10, 26000/(10*365), 1502, 2148, '祖父', NULL, 10000000, 3);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('家電', 'エアコン', '2023-06-01', 48000, 5, 'エアロシステムズ', 10, 48000/(10*365), 1114, 1276, 'カチ山コチ太郎', NULL, 10000001, 4);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('ぬいぐるみ', 'サメぬい', '2024-12-24', 1600, 0, '縫い工房', 12, 1600/(12*365), 543, 3837, 'トンカチ頭', NULL, 10000000, 1);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('その他', '76', '2022-08-05', 1620000, 5, '東洋ターボ', 12, 1620000/(12*365), 1414, 2966, 'ナナロク', NULL, 10000001, 5);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('家電', '扇風機', '2024-07-12', 4200, 1, 'エアフロー技研', 6, 4200/(6*365), 708, 1482, '寒太郎', NULL, 10000000, 1);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('その他', '時計', '2024-09-22', 6800, 1, 'タイムクラフト', 10, 6800/(10*365), 636, 302, 'チックンタックン', NULL, 10000001, 3);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('家電', 'スマートフォン', '2024-10-08', 26800, 1, 'モバイルリンク', 5, 26800/(5*365), 620, 1205, '相棒', NULL, 10000000, 2);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame) 
	VALUES('その他', '自転車', '2023-04-12', 19800, 1, 'スピードライン工業', 8, 19800/(8*365), 1130, 1790, 'チャリリン・モンロー', NULL, 10000001, 3);

--/* ファイルパスはエスケープする必要あり(\を二重にする) */
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_reizouko.png') WHERE id = 1;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cooking_microwave.png') WHERE id = 2;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_soujiki_stick.png') WHERE id = 3;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_senpuki.png') WHERE id = 4;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cooking_toaster.png') WHERE id = 5;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_soujiki_stick.png') WHERE id = 6;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bg_lounge.png') WHERE id = 7;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kodai_same_helicoprion.png') WHERE id = 8;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kinoko1.jpg') WHERE id = 9;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_senpuki.png') WHERE id = 10;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\clock_1230.png') WHERE id = 11;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\smartphone.png') WHERE id = 12;
--UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bicycle_black.png') WHERE id = 13;

/* 画像の長さが返ってくれば登録できている(SELECT * FROM shouhin;をすると、とんでもないことになるのでNG！) */
SELECT id, LENGTH(img) FROM shouhin WHERE id = 1;

/* 画像登録後はこのSELECT文を実行すればOK */
SELECT id, genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, LENGTH(img), userid, frame FROM shouhin;



/* 履歴詳細DB */
create table rireki (
id int (50) AUTO_INCREMENT PRIMARY KEY,
genre varchar (200) NOT NULL,
shouhin varchar (300) NOT NULL,
buy_date date NOT NULL,
price int NOT NULL,
wperiod int ,
maker varchar (300),
life int NOT NULL,
day_price double ,
progress int ,
goal int ,
nickname varchar (300),
img LONGBLOB ,
userid int,
frame int
);

DESCRIBE rireki;

SELECT * FROM rireki;

/* ジャンル・商品名・購入日・価格・保証期間(年)・メーカー・耐用年数・一日あたり価格・経過日数・(目標達成〇✖)・愛称 */
INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', 'コーヒーメーカー', '2026-06-12', 10000, 1, 'ネフレ', 5, 10000/(5*365), 500, 200, 'カフェちゃん', NULL, 10000000, 2);
	
INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', 'PC', '2026-06-12', 300000, 3, 'ガレリオ', 5, 300000/(5*365), 600, 200, '必需品', NULL, 10000000, 3);
	
INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', 'ホットカーペット', '2026-10-06', 15000, 2, 'アイリスオーヤマ', 5, 15000/(5*365), 700, 200, '暖地面', NULL, 10000000, 4);
	
INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', '電卓機', '2023-06-20', 2000, 1, 'アイリスオーヤマ', 5, 2000/(5*365), 50, 200, '計算さん', NULL, 10000000, 5);
	
INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', 'ノートPC', '2025-12-12', 300000, 3, '富士山通', 5, 300000/(5*365), 100, 200, 'ハイスペック', NULL, 10000001, 3);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	 VALUES ('家電', '扇風機', '2026-06-12', 100000, 1, 'アイリスオーヤマ', 5, 10000/(5*365), 200, 200,  '風ちゃん', NULL, 10000000, 1);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', '冷蔵庫', '2016-04-12', 105000, 5, 'クールテック', 10, 105000/(10*365), 3950, 3950, 'ひやりん', NULL, 10000001, 1);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', '電子レンジ', '2017-03-09', 29800, 1, 'ヒートウェーブ', 8, 29800/(8*365), 3350, 3350, 'マイク', NULL, 10000000, 2);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', '掃除機', '2016-01-01', 52000, 3, 'クリーンスター', 7, 52000/(3*365), 2002, 2002, 'Mr.スター', NULL, 10000001, 3);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', '洗濯機', '2017-04-10',48000, 3, 'アクアクリン製作所', 8, 48000/(8*365), 3052,  3052,'せんたくん', NULL, 10000000, 4);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', 'トースター', '2018-02-15',6800, 1, 'ベイクテック', 6, 6800/(6*365), 1205,  1205,'パン焼ん', NULL, 10000001, 1);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家具', 'ソファー', '2015-09-01',32000, 1, 'コンフォート家具工房', 10, 32000/(10*365), 3800,  3800,'ふかふか丸', NULL, 10000000, 2);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('家電', 'エアコン', '2016-05-20',58000, 5, 'エアロシステムズ', 10, 58000/(10*365), 1944,  1944,'サム', NULL, 10000001, 3);

INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img, userid, frame)
	VALUES ('ぬいぐるみ', 'モフモフベア', '2017-12-10',2400, 0 , '縫い工房', 12, 2400/(12*365), 1080 , 1080 ,'もふぃ', NULL, 10000000, 5);

--/* ファイルパスはエスケープする必要あり(\を二重にする) */
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\drink_coffee.png') WHERE id = 1;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_PC.png') WHERE id = 2;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\denki_carpet.png') WHERE id = 3;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\dentaku_syoumen_big.png') WHERE id = 4;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_laptop.png') WHERE id = 5;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_senpuki.png') WHERE id = 6;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_reizouko.png') WHERE id = 7;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cooking_microwave.png') WHERE id = 8;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_soujiki_stick.png') WHERE id = 9;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_sentakuki.png') WHERE id = 10;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\cooking_toaster.png') WHERE id = 11;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\bg_lounge.png') WHERE id = 12;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_airconditioner.png') WHERE id = 13;
--UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\nuigurumi_bear_boroboro.png') WHERE id = 14;

/* 画像の長さが返ってくれば登録できている(SELECT * FROM shouhin;をすると、とんでもないことになるのでNG！) */
SELECT id, LENGTH(img) FROM rireki WHERE id = 1;

/* 画像登録後はこのSELECT文を実行すればOK */
SELECT id, genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, LENGTH(img), userid, frame FROM rireki;

