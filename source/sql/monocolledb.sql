/* ログインDB */
CREATE TABLE login (
id int (50) AUTO_INCREMENT PRIMARY KEY,
password varchar (50) NOT NULL
);

/* TODO: テストデータとしてINSERT文を複数作成する必要あり */
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
day_price double /* 価格÷耐用年数で求める、表示時はint型にする */
);

SELECT * FROM diagnosis;

/* TODO: テストデータとしてINSERT文を複数作成する必要あり */
/* 10件 */
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('マイコン炊飯器', 10000, 7 ,10000/(7*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('小型炊飯器', 6000, 5, 6000/(5*365));

INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('ワイヤレスイヤホン', 15000, 4, 15000/(4*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('安ワイヤレスイヤホン', 3000, 1, 3000/(1*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('有線イヤホン', 8000, 3, 8000/(3*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('90L冷蔵庫', 24800, 6, 24800/(6*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('スマートフリッジ140L', 39800, 8, 39800/(8*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('卓上ミニ扇風機', 2980, 3, 2980/(3*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('サイレントフロー', 4980, 4, 4980/(4*365));
	
INSERT INTO diagnosis (shouhin, money, use_year, day_price) 
	VALUES('エアサーキュレーター', 7480, 5, 7480/(5*365));

/* 削除 */
DELETE FROM diagnosis WHERE id = 4;



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
img LONGBLOB 
);

DESCRIBE shouhin;

SELECT * FROM shouhin;

/* TODO: テストデータとしてINSERT文を複数作成する必要あり */
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) 
	VALUES ('家電', '冷蔵庫', '2026-06-12', 10000, 90, 'アイリスオーヤマ', 5, 10000/(5*365), 3, 200, 'レイちゃん', NULL);
	
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) 
	VALUES ('家電', '電子レンジ', '2026-06-13', 10000, 90, 'アイリスオーヤマ', 5, 10000/(5*365), 3, 200, 'アタメル', NULL);

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) 
	VALUES ('家電', '掃除機', '2026-06-15', 50000, 90, 'アイリスオーヤマ', 5, 50000/(5*365), 3, 200, 'すいすい君', NULL);
	
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) 
	VALUES ('家電', '扇風機', '2026-06-18', 30000, 90, 'アイリスオーヤマ', 5, 30000/(5*365), 3, 200, '風神', NULL);
	
/* ファイルパスはエスケープする必要あり(\を二重にする) */
UPDATE shouhin SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_reizouko.png') WHERE id = 1;

/* 画像の長さが返ってくれば登録できている(SELECT * FROM shouhin;をすると、とんでもないことになるのでNG！) */
SELECT id, LENGTH(img) FROM shouhin WHERE id = 1;

/* 画像登録後はこのSELECT文を実行すればOK */
SELECT id, genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname FROM shouhin;

DELETE FROM shouhin WHERE id = 6;

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
img LONGBLOB 
);

DESCRIBE rireki;

SELECT * FROM rireki;

/* TODO: テストデータとしてINSERT文を複数作成する必要あり */
INSERT INTO rireki(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) VALUES ('家電', '扇風機', '2026-06-12', 100000, 90, 'アイリスオーヤマ', 5, 2.0, 3, 200, '風ちゃん', NULL);

/* ファイルパスはエスケープする必要あり(\を二重にする) */
UPDATE rireki SET img = LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\kaden_reizouko.png') WHERE id = 1;

/* 画像の長さが返ってくれば登録できている(SELECT * FROM shouhin;をすると、とんでもないことになるのでNG！) */
SELECT id, LENGTH(img) FROM rireki WHERE id = 1;

/* 画像登録後はこのSELECT文を実行すればOK */
SELECT id, genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname FROM rireki;

DELETE FROM rireki WHERE id = 6;