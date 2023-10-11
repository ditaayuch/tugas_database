CREATE DATABASE collection_directory;

CREATE TABLE album_collect(id_album INT, album_title VARCHAR(64), album_artist VARCHAR(64), album_release VARCHAR(64), album_price INT, store VARCHAR(64));
INSERT INTO album_collect(id_album, album_title, album_artist, album_release, album_price)VALUES(1, 'Emphaty', 'NCT 2018', '2018', 330000, 'kpopsale');
SELECT * FROM album_collect;
SELECT album_collect.album_title FROM album_collect;
UPDATE album_collect SET album_price=295000 WHERE id_album=4;
DELETE FROM album_collect WHERE id_album=6;
SELECT * FROM album_collect ORDER BY album_price asc;
SELECT album_title FROM album_collect WHERE album_artist='NCT 127';

CREATE TABLE book_collect (id_book INT, book_title VARCHAR(64), book_release VARCHAR(64), book_writer VARCHAR(64), book_publisher VARCHAR(64), book_price INT);
INSERT INTO book_collect(id_album, book_title, book_release, book_writer, book_publisher, book_price)VALUES(1,'The Alpha Girls Guide', '2015', 'Henry Manampiring', 'gagasmedia', 88000);
SELECT book_collect.id_book, book_collect.book_title FROM book_collect;
UPDATE book_collect SET book_price=89000 WHERE id_book=1;
DELETE FROM book_collect WHERE id=6;
SELECT * FROM book_collect ORDER BY book_price desc;
SELECT book_release FROM book_collect WHERE id_book=3;

CREATE TABLE photocard_collect (id_poca INT, poca_group_name VARCHAR(64), poca_member_name VARCHAR(64), poca_version VARCHAR(64), poca_price INT);
INSERT INTO photocard_collect(id_poca, poca_group_name, poca_member_name, poca_version, poca_price)VALUES(1, 'zerobaseone', 'Seok Matthew', 'Makestar Benefit R2', 125000);
SELECT id_poca FROM photocard_collect;
UPDATE photocard_collect SET poca_version='fancon lucky draw 50K won' WHERE id_poca=6;
DELETE FROM photocard_collect WHERE id_poca=1;
SELECT * FROM photocard_collect ORDER BY id_poca desc;
SELECT poca_version, poca_group_name FROM photocard_collect WHERE poca_price<75000; 

CREATE TABLE merchandise_collect (id_md INT, md_group_name VARCHAR(64), md_type VARCHAR(64), md_price INT);
INSERT INTO merchandise_collect(id_md, md_group_name, md_type, md_price)VALUES(1, 'jebewon', 'Fancon Necklace', 168000);
SELECT merchandise_collect.md_type FROM merchandise_collect;
UPDATE merchandise_collect SET md_price=300000 WHERE id=6;
DELETE FROM merchandise_collect WHERE id_md=5;
SELECT * FROM merchandise_collect ORDER BY id_md asc;
SELECT md_price FROM merchandise_collect WHERE md_group_name='jebewon';

CREATE TABLE store_details (id_store INT, store_name VARCHAR(64), domicile VARCHAR(64), tax INT);
INSERT INTO store_details (id_store, store_name, domicile, tax)VALUES(1, 'kpopsale', 'Jakarta Selatan', 15000);
SELECT * FROM store_details;
UPDATE store_details SET domicile='Jakarta Pusat' WHERE id_store=1;
DELETE FROM store_details WHERE id=1;
SELECT store_name FROM store_details ORDER BY tax asc;
SELECT store_name FROM store_details WHERE tax<10000;

--JOIN
SELECT album_collect.id_album AS id, album_collect.album_title, album_collect.album_artist, album_collect.album_price, album_collect.store, store_details.domicile 
FROM album_collect JOIN store_details ON album_collect.store=store_details.store_name ORDER BY id asc;

--SEARCH
SELECT * FROM book_collect WHERE book_title ILIKE '%teras%';

--pagenation on table photocard_collect
LIMIT 3
OFFSET = (page -1)*limit

--page 1
offset = 0
SELECT * FROM photocard_collect LIMIT 3 OFFSET 0;
--Hasil yang didapat adalah table yang menampilkan data baris 1-3 

--page 2 
offset = 3
SELECT * FROM photocard_collect LIMIT 3 OFFSET 3;
--Hasil yang didapat adalah table yang menampilkan data baris 4-6 
