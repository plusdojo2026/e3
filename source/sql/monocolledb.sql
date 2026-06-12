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
img BLOB 
)

DESCRIBE shouhin;

SELECT * FROM shouhin;

INSERT INTO shouhin(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) VALUES ('家電', '冷蔵庫', '2026-06-12', 10000, 90, 'アイリスオーヤマ', 5, 2.0, 3, 200, 'レイちゃん', NULL);

UPDATE shouhin SET shouhin = '電子レンジ', nickname = 'レンちゃん' WHERE id = 6;

DELETE FROM shouhin WHERE id = 6;

/* 履歴詳細DB */