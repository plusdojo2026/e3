/* ログインDB */


/* 購入診断DB */


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
INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) VALUES ('家電', '冷蔵庫', '2026-06-12', 10000, 90, 'アイリスオーヤマ', 5, 2.0, 3, 200, 'レイちゃん', NULL);

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