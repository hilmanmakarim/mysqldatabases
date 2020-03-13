-- Memuncukan list database 
SHOW DATABASES;

-- Membuat database baru 
CREATE DATABASE coffee_store;

-- Memilih database untuk dioperasikan
USE coffee_store; 

-- Memunculkan list table pada suatu database
show tables;

-- Membuat table
-- VARCHAR adalah nama lain string 
-- AUTO_INCREMENT : akan bertambah secara otomatis
-- PRIMARY KEY : Data bersifat Unique
-- DECIMAL (3, 2) : Tiga digit angka dengan dua digit angka dibelakang koma 
CREATE TABLE products(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(30),
    Price DECIMAL(3,2),
    Origin VARCHAR(30)
); 

-- ENUM hanya boleh menyimpan value serial
CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender ENUM('M', 'F'),
    phone_number VARCHAR(11)
); 

CREATE TABLE orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    order_time DATETIME,
    CONSTRAINT FK_productid FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT FK_customerid FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL ON UPDATE RESTRICT
);

SHOW TABLES;

-- MENAMBAH KOLOM BARU (LOCATION : KOLOM TERAKHIR)
ALTER TABLE products ADD COLUMN coffee_origin VARCHAR(30);

-- MENAMBAH KOLOM BARU (LOCATION : DITENTUKAN)
ALTER TABLE customers ADD COLUMN address VARCHAR(30) AFTER gender;

-- MENGHAPUS KOLOM
ALTER TABLE products DROP COLUMN coffee_origin;

-- MENGHAPUS KOLOM
ALTER TABLE customers DROP COLUMN address;

-- RENAME COLUMN
ALTER TABLE customers CHANGE `sex` `gender` ENUM('M', 'F');

-- MELIHAT DESKRIPSI DARI SEBUAH TABLE
DESC productFK_productids;

-- INSERT DATA
-- INSERT INTO <table_name> (<list_of_column>) VALUES (<list_of_values>)
INSERT INTO products (name, price, origin) VALUES
('Espresso', 2.50, 'Brazil' );

INSERT INTO products (price, origin, name) VALUES (3.00, 'Brazil', 'Macchiato');
INSERT INTO products (name, price, origin) VALUES 
('Cappucino', 3.50, 'Costa Rica' ),
('Latte', 3.50, 'Indonesia' ),
('Americano', 3.00, 'Brazil' ),
('Flat White', 3.50, 'Indonesia' ),
('Filter', 3.00, 'Indonesia' );

-- UPDATE DATA
-- UBAH ORIGIN PADA KOOM PRODUCTS YANG MEMILIKI ID 7
UPDATE products SET origin = 'Sri Lanka' WHERE id = 7;
-- AGAR DAPAT MENGGUNAKAN SEMUA KOLOM UNTUK KEYWORD 'WHERE'
SET SQL_SAFE_UPDATES = 0;
UPDATE products SET price=3.25, origin='Ethiopia' WHERE name='Americano';

UPDATE products SET origin='Colombia' WHERE origin= 'Brazil';

-- DELETE DATA
-- DELETE FROM products WHERE origin='Brazil';
-- DELETE FROM customers WHERE id=48;
-- DELETE ALL
-- DELETE FROM products;

ALTER TABLE orders  DROP FOREIGN KEY FK_ProductId;

-- ALTER TABLE orders  DROP FOREIGN KEY FK_CustomerId;

-- ALTER TABLE orders ADD CONSTRAINT FK_ProductId
  --  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE;
    
-- ALTER TABLE orders  ADD CONSTRAINT FK_CustomerId
--    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE;
    
-- TRUNCATE TABLE products;

-- INSERT INTO customers (first_name, last_name, gender, phone_number) VALUES ('Chris','Martin','M','01123147789'),('Emma','Law','F','01123439899'),('Mark','Watkins','M','01174592013'),('Daniel','Williams','M',NULL),('Sarah','Taylor','F','01176348290'),('Katie','Armstrong','F','01145787353'),('Michael','Bluth','M','01980289282'),('Kat','Nash','F','01176987789'),('Buster','Bluth','M','01173456782'),('Charlie',NULL,'F','01139287883'),('Lindsay','Bluth','F','01176923804'),('Harry','Johnson','M',NULL),('John','Smith','M','01174987221'),('John','Taylor','M',NULL),('Emma','Smith','F','01176984116'),('Gob','Bluth','M','01176985498'),('George','Bluth','M','01176984303'),('Lucille','Bluth','F','01198773214'),('George','Evans','M','01174502933'),('Emily','Simmonds','F','01899284352'),('John','Smith','M','01144473330'),('Jennifer',NULL,'F',NULL),('Toby','West','M','01176009822'),('Paul','Edmonds','M','01966947113');
-- INSERT INTO orders (product_id,customer_id,order_time) VALUES (1,1,'2017-01-01 08-02-11'),(1,2,'2017-01-01 08-05-16'),(5,12,'2017-01-01 08-44-34'),(3,4,'2017-01-01 09-20-02'),(1,9,'2017-01-01 11-51-56'),(6,22,'2017-01-01 13-07-10'),(1,1,'2017-01-02 08-03-41'),(3,10,'2017-01-02 09-15-22'),(2,2,'2017-01-02 10-10-10'),(3,13,'2017-01-02 12-07-23'),(1,1,'2017-01-03 08-13-50'),(7,16,'2017-01-03 08-47-09'),(6,21,'2017-01-03 09-12-11'),(5,22,'2017-01-03 11-05-33'),(4,3,'2017-01-03 11-08-55'),(3,11,'2017-01-03 12-02-14'),(2,23,'2017-01-03 13-41-22'),(1,1,'2017-01-04 08-08-56'),(3,10,'2017-01-04 11-23-43'),(4,12,'2017-01-05 08-30-09'),(7,1,'2017-01-06 09-02-47'),(3,18,'2017-01-06 13-23-34'),(2,16,'2017-01-07 09-12-39'),(2,14,'2017-01-07 11-24-15'),(4,5,'2017-01-08 08-54-11'),(1,1,'2017-01-09 08-03-11'),(6,20,'2017-01-10 10-34-12'),(3,3,'2017-01-10 11-02-11'),(4,24,'2017-01-11 08-39-11'),(4,8,'2017-01-12 13-20-13'),(1,1,'2017-01-14 08-27-10'),(4,15,'2017-01-15 08-30-56'),(1,7,'2017-01-16 10-02-11'),(2,10,'2017-01-17 09-50-05'),(1,1,'2017-01-18 08-22-55'),(3,9,'2017-01-19 09-00-19'),(7,11,'2017-01-19 11-33-00'),(6,12,'2017-01-20 08-02-21'),(3,14,'2017-01-21 09-45-50'),(5,2,'2017-01-22 10-10-34'),(6,24,'2017-01-23 08-32-19'),(6,22,'2017-01-23 08-45-12'),(6,17,'2017-01-23 12-45-30'),(2,11,'2017-01-24 08-01-27'),(1,1,'2017-01-25 08-05-13'),(6,11,'2017-01-26 10-49-10'),(7,3,'2017-01-27 09-23-57'),(7,1,'2017-01-27 10-08-16'),(3,18,'2017-01-27 10-13-09'),(4,19,'2017-01-27 11-02-40'),(3,10,'2017-01-28 08-03-21'),(1,2,'2017-01-28 08-33-28'),(1,12,'2017-01-28 11-55-33'),(1,13,'2017-01-29 09-10-17'),(6,6,'2017-01-30 10-07-13'),(1,1,'2017-02-01 08-10-14'),(2,14,'2017-02-02 10-02-11'),(7,10,'2017-02-02 09-43-17'),(7,20,'2017-02-03 08-33-49'),(4,21,'2017-02-04 09-31-01'),(5,22,'2017-02-05 09-07-10'),(3,23,'2017-02-06 08-15-10'),(2,24,'2017-02-07 08-27-26'),(1,1,'2017-02-07 08-45-10'),(6,11,'2017-02-08 10-37-10'),(3,13,'2017-02-09 08-58-18'),(3,14,'2017-02-10 09-12-40'),(5,4,'2017-02-10 11-05-34'),(1,2,'2017-02-11 08-00-38'),(3,8,'2017-02-12 08-08-08'),(7,20,'2017-02-12 09-22-10'),(1,1,'2017-02-13 08-37-45'),(5,2,'2017-02-13 12-34-56'),(4,3,'2017-02-14 08-22-43'),(5,4,'2017-02-14 09-12-56'),(3,5,'2017-02-15 08-09-10'),(6,7,'2017-02-15 09-05-12'),(1,8,'2017-02-15 09-27-50'),(2,9,'2017-02-16 08-51-12'),(3,10,'2017-02-16 13-07-46'),(4,11,'2017-02-17 08-03-55'),(4,12,'2017-02-17 09-12-11'),(5,10,'2017-02-17 11-41-17'),(6,18,'2017-02-17 13-05-56'),(7,19,'2017-02-18 08-33-27'),(1,17,'2017-02-19 08-12-31'),(1,1,'2017-02-20 09-50-17'),(3,5,'2017-02-20 09-51-29'),(4,6,'2017-02-20 10-43-39'),(3,1,'2017-02-21 08-32-17'),(1,1,'2017-02-21 10-30-11'),(3,2,'2017-02-21 11-08-45'),(4,3,'2017-02-22 11-46-32'),(2,15,'2017-02-22 13-35-16'),(6,13,'2017-02-23 08-34-48'),(4,24,'2017-02-24 08-32-03'),(2,13,'2017-02-25 08-03-12'),(7,17,'2017-02-25 09-34-23'),(7,23,'2017-02-25 11-32-54'),(5,12,'2017-02-26 11-47-34'),(6,4,'2017-02-27 12-12-34'),(1,1,'2017-02-28 08-59-22');
-- Melihat data
SELECT * FROM products;
SELECT * FROM orders;

-- READ DATA
SELECT * FROM customers; -- semua kolom
SELECT last_name FROM customers; -- salah satu kolom
SELECT last_name, phone_number FROM customers;

-- Where Condition
SELECT * FROM products WHERE origin ='Colombia';

-- AND
SELECT * FROM products WHERE price = 3.00 AND origin='Colombia';

-- OR
SELECT * FROM products WHERE price = 3.00 OR origin='Colombia';

-- perbandingan (>, <, >=, <=)
SELECT * FROM products WHERE price <= 3.00;

-- null
-- CUSTOMER YANG TIDAK MEMILIKI NOMOR TELFON
SELECT * FROM customers WHERE phone_number IS NULL;
-- CUSTOMER YANG TIDAK MEMILIKI NAMA BELAKANG NAMUN MEMILIKI NOMOR TELFON
SELECT * FROM customers WHERE phone_number IS NOT NULL AND last_name IS NULL;

-- exercise
-- Tampilkan nama depan, nomor telfon dan gender
-- untuk mereka yang memiliki nama belakang 'bluth'
-- dan seorang perempuan

SELECT first_name, phone_number, gender FROM customers WHERE last_name = 'Bluth' and gender = 'F' ;

-- tampilkan nama product, harga, dan asal untuk mereka yang harga di atas 3.00 atau berasal dari sri lanka
SELECT name, price, origin FROM products WHERE price > 3.00 or origin = 'Sri lanka' ;

-- tampilkan seluruh kolom dari customer untuk mereka yang laki-laki dan tidak memiliki nomor telfon
SELECT * FROM customers WHERE gender = 'M' AND phone_number IS NULL;

-- in & no in

-- SELECT * FROM customers WHERE last_name = 'Bluth' OR last_name = 'TAYLOR' or last_name = 'Armstrong';
SELECT * FROM customers WHERE last_name in ('Bluth', 'Taylor', 'Armstrong');

SELECT * FROM customers WHERE first_name not in ('Katie', 'John', 'George');

-- between
-- transaksi dari tanggal 1 sampe tanggal 7 bulan januari tahun 2017
SELECT * FROM orders WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07';

SELECT * FROM orders WHERE customer_id BETWEEN 5 and 11;

-- LIKE (CASE INSENSITIVE)
-- % , ANGKA DAN KARAKTER APAPUN
-- _ , HANYA SATU KARAKTER

-- customer yang nama belakang mengandung huruf o
SELECT * FROM customers WHERE last_name like '%o%';

SELECT * FROM customers WHERE last_name like '%o_';

-- PRODUCT YANG MEMILIKI HARGA DIMANA DIGIT PERTAMANYA ADALAH ANGKA 3

SELECT * FROM products WHERE price LIKE '3%';

-- ORDER BY (ASCENDING OR DESCENDING, DEFAULT ASCENDING)
-- Urutkan data secara ascending berdasarkan harga
SELECT * FROM products ORDER BY price;

-- Urutkan data secara descending berdasarkan harga
SELECT * FROM products ORDER BY price DESC;

-- penggabungan where dan order
-- BANYAKNYA ORDER YANG DILAKUKAN OLEH CUSTOMER DG ID 1 DAN DIURUTKAN SECARA ASCENDING
SELECT * FROM orders WHERE customer_id=1 ORDER BY order_time;

-- EXERCISE
-- TAMPILKAN NAMA PRODUCT DAN HARGA DARI SEMUA PRODUCT DENGAN ASAL DARI INDONESIA ATAU COLOMBIA, KEMUDIAN DIURUTKAN BERDASARKAN NAME
SELECT name, price FROM products WHERE origin in ('Indonesia', 'Colombia') ORDER BY name;

-- TAMPILKAN SEMUA KOLOM UNTUK ORDER DI BULAN FEBRUARI UNTUK CUSTOMER DENGAN ID 2, 4, 6 ATAU 8
SELECT * FROM orders WHERE customer_id in (2, 4, 6, 8) AND order_time BETWEEN '2017-02-01' AND '2017-03-01' ; -- atau bisa pakai like '2017-02-%'

-- TAMPILLAN NAMA DEPAN, NOMOR TELFON, DAN NAMA BELAKANG UNTUK CUSTOMER YANG NAMA BELAKANG MENGANDUNG KATA 'AR'
SELECT first_name, phone_number, last_name FROM customers WHERE last_name like '%AR%';

-- ALIAS
SELECT name AS `Nama kopi`, price AS `Harga`, origin AS `Asal` from products;

-- LIMIT
SELECT * FROM products WHERE price > 2.00 LIMIT 3;
-- TAMPILKAN PRODUK TERMAHAL DARI PERINGKAT 3 KE 5
-- OFFSET UNTUK MENGABAIKAN DATA ATAU SKIP 
SELECT * FROM products ORDER BY price DESC LIMIT 3 OFFSET 2;

-- LIMA PRODUK TERMAHAL
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- DISTINCT

SELECT origin FROM products;

SELECT DISTINCT origin FROM products;

SELECT price,origin from products;


-- FRIDAY EXERCISE
-- Tampilkan nama produk, harga, dan origin namun rename kolom price menjadi retail_price
SELECT name, price AS `Retail Price`, origin from products;

-- Tampilkan nama belakang secara unique dan diurutkan secara ascending
SELECT DISTINCT last_name FROM customers ORDER BY last_names; 

-- Tampilkan product id secara unique untuk order yang dilakukan customer dengan id 2 selama bulan januari
SELECT DISTINCT product_id FROM orders WHERE customer_id=2 AND order_time LIKE'2017-01-%';

-- Tampilkan 3 order pertama yang dilakukan oleh customer dengan id 1 di bulan feburari 2017
SELECT * FROM orders WHERE customer_id in (1) AND order_time LIKE '2017-02-%' ORDER BY order_time LIMIT 3;

-- Tampilkan semua kolom, 5 order terakhir yang dilakukan user dengan id 1
SELECT * FROM orders WHERE customer_id in (1) ORDER BY order_time DESC LIMIT 5;

-- JOIN
SELECT products.name, orders.order_time FROM orders JOIN products ON orders.product_id= products.id ORDER BY orders.order_time;

-- Tanggall berapa saja product Espresso di order selama bulan februari
SELECT products.name, orders.order_time FROM products JOIN orders ON products.id =orders.product_id WHERE products.name = 'Espresso' AND orders.order_time;

SELECT p.name, o.order_time FROM orders o JOIN products p ON o.product_id = p.id WHERE p.name ='Espresso' and o.order_time LIKE '2017-02-%';

-- TAMPILKAN NAMA, HARGA, NAMA DEPAN, NAMA BELAKANG, WAKTU ORDER UNTUK CUSTOMER ANG MEMILIKI NAMA BELAKANG 'MARTIN' UNTUK MENURUT WAKTU ORDER
SELECT c.first_name, c.last_name, p.name, p.price, o.order_time FROM customers c
JOIN orders o on c.id = o.customer_id
JOIN products p on p.id = o.product_id
WHERE last_name='Martin' ORDER BY o.order_time;

-- cara kedua
SELECT c.first_name, c.last_name, p.name, p.price, o.order_time
FROM orders o JOIN (customers c, products p) on c.id = o.customer_id AND p.id = o.product_id
WHERE last_name='Martin' ORDER BY o.order_time;

-- tampilkan semua
SELECT * FROM customers c
JOIN orders o on c.id = o.customer_id
JOIN products p on p.id = o.product_id;

-- TAMPILKAN ORDER ID, NAMA DEPAN, NAMA BELAKANG, NO TLP, UNTUK YANG MEMBELI 'LATTE'
SELECT o.id, c.first_name, c.last_name, c.phone_number -- , p.name
FROM orders o JOIN (customers c, products p) on c.id = o.customer_id AND p.id = o.product_id
WHERE name='Latte';

-- TAMPILKAN NAMA PRODUCT, WAKTU ORDER, UNTUK 'FILTER' YANG TERJUAL ANTARA 15 JANUAR - 14 FEBRUARI
SELECT p.name, o.order_time 
FROM orders o JOIN (customers c, products p) on c.id = o.customer_id AND p.id = o.product_id
WHERE name='Filter' AND order_time BETWEEN '2017-01-15' AND '2017-02-15';

-- TAMPILKAN NAMA PRODUCT, HARGA, WAKTU ORDER YANG DIBELI OLEH WANITA PADA 15 JANUARI -- 14 FEBRUARI, DIURUTKAN BERDASRKAN WAKTU ORDER
SELECT p.name, p.price, o.order_time
FROM orders o JOIN (customers c, products p) on c.id = o.customer_id AND p.id = o.product_id
WHERE gender='F' AND order_time BETWEEN '2017-01-15' AND '2017-02-15' ORDER BY order_time;

-- COUNT
-- BANYAKNYA DATA CUSTOMERS
-- SELECT count(first_name) from customers;
