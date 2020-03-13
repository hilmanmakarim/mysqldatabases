-- Memunculkan list database
SHOW DATABASES;

-- Membuat database baru
CREATE DATABASE coffe_store;

-- Memilih database untuk dioperasikan
USE coffe_store;

-- Munculkan list table pada suatu database
SHOW TABLES;

-- Membuat table
--  AUTO_INCREMENT : Akan bertambah secara otomatis
-- PRIMARY KEY : Data bersifat unique
-- DECIMAL(3,2) : Tiga digit angka total, dengan 2 digit di belakang koma
CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    price DECIMAL(3,2),
    origin VARCHAR(30)
);

-- ENUM hanya boleh menyimpan value sesuai yang ada di list
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
    CONSTRAINT FK_ProductId
    FOREIGN KEY (product_id) REFERENCES products(id)
    ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT FK_CustomerId
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    ON DELETE SET NULL ON UPDATE RESTRICT
);

-- Menambah kolom baru (location : kolom terakhir)
ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

-- Menambah kolom baru (location : ditentukan)
ALTER TABLE customers
ADD COLUMN address VARCHAR(30) AFTER gender;

-- Menghapus kolom
ALTER TABLE products
DROP COLUMN coffee_origin;

ALTER TABLE customers
DROP COLUMN address;

-- Rename Column
ALTER TABLE customers CHANGE `sex` `gender` ENUM('M','F');

-- Melihat deskripsi dari sebuah table 
DESC products;

-- Inser data
-- INSERT INTO <table_name> (<list_of_column) VALUES (<list_of_value>)

INSERT INTO products (name, price, origin)
VALUES ('Espresso', 2.50, 'Brazil');

INSERT INTO products (price, origin, name)
VALUES (3.00, 'Brazil', 'Macchiato');

INSERT INTO products (name,price,origin)
VALUES
('Cappuccino',3.50,'Costa Rica'),
('Latte',3.50,'Indonesia'),
('Americano',3.00,'Brazil'),
('Flat White',3.50,'Indonesia'),
('Filter',3.00,'India');

-- Update Data
-- Ubah origin  pada kolom products yang memiliki id 7
UPDATE products
SET origin = 'Sri Lanka'
WHERE id = 7;

-- Agar dapat menggunakan semua kolom untuk keyword 'WHERE'
SET SQL_SAFE_UPDATES = 0;

UPDATE products
SET price=3.25, origin='Ethiopia'
WHERE name='Americano';

UPDATE products
SET origin = 'Colombia'
WHERE origin = 'Brazil';

-- Delete Data
DELETE FROM products
WHERE origin = 'Brazil';

-- Delete All Products
DELETE FROM products;

INSERT INTO orders (product_id,customer_id,order_time) VALUES (1,1,'2017-01-01 08-02-11'),(1,2,'2017-01-01 08-05-16'),(5,12,'2017-01-01 08-44-34'),(3,4,'2017-01-01 09-20-02'),(1,9,'2017-01-01 11-51-56'),(6,22,'2017-01-01 13-07-10'),(1,1,'2017-01-02 08-03-41'),(3,10,'2017-01-02 09-15-22'),(2,2,'2017-01-02 10-10-10'),(3,13,'2017-01-02 12-07-23'),(1,1,'2017-01-03 08-13-50'),(7,16,'2017-01-03 08-47-09'),(6,21,'2017-01-03 09-12-11'),(5,22,'2017-01-03 11-05-33'),(4,3,'2017-01-03 11-08-55'),(3,11,'2017-01-03 12-02-14'),(2,23,'2017-01-03 13-41-22'),(1,1,'2017-01-04 08-08-56'),(3,10,'2017-01-04 11-23-43'),(4,12,'2017-01-05 08-30-09'),(7,1,'2017-01-06 09-02-47'),(3,18,'2017-01-06 13-23-34'),(2,16,'2017-01-07 09-12-39'),(2,14,'2017-01-07 11-24-15'),(4,5,'2017-01-08 08-54-11'),(1,1,'2017-01-09 08-03-11'),(6,20,'2017-01-10 10-34-12'),(3,3,'2017-01-10 11-02-11'),(4,24,'2017-01-11 08-39-11'),(4,8,'2017-01-12 13-20-13'),(1,1,'2017-01-14 08-27-10'),(4,15,'2017-01-15 08-30-56'),(1,7,'2017-01-16 10-02-11'),(2,10,'2017-01-17 09-50-05'),(1,1,'2017-01-18 08-22-55'),(3,9,'2017-01-19 09-00-19'),(7,11,'2017-01-19 11-33-00'),(6,12,'2017-01-20 08-02-21'),(3,14,'2017-01-21 09-45-50'),(5,2,'2017-01-22 10-10-34'),(6,24,'2017-01-23 08-32-19'),(6,22,'2017-01-23 08-45-12'),(6,17,'2017-01-23 12-45-30'),(2,11,'2017-01-24 08-01-27'),(1,1,'2017-01-25 08-05-13'),(6,11,'2017-01-26 10-49-10'),(7,3,'2017-01-27 09-23-57'),(7,1,'2017-01-27 10-08-16'),(3,18,'2017-01-27 10-13-09'),(4,19,'2017-01-27 11-02-40'),(3,10,'2017-01-28 08-03-21'),(1,2,'2017-01-28 08-33-28'),(1,12,'2017-01-28 11-55-33'),(1,13,'2017-01-29 09-10-17'),(6,6,'2017-01-30 10-07-13'),(1,1,'2017-02-01 08-10-14'),(2,14,'2017-02-02 10-02-11'),(7,10,'2017-02-02 09-43-17'),(7,20,'2017-02-03 08-33-49'),(4,21,'2017-02-04 09-31-01'),(5,22,'2017-02-05 09-07-10'),(3,23,'2017-02-06 08-15-10'),(2,24,'2017-02-07 08-27-26'),(1,1,'2017-02-07 08-45-10'),(6,11,'2017-02-08 10-37-10'),(3,13,'2017-02-09 08-58-18'),(3,14,'2017-02-10 09-12-40'),(5,4,'2017-02-10 11-05-34'),(1,2,'2017-02-11 08-00-38'),(3,8,'2017-02-12 08-08-08'),(7,20,'2017-02-12 09-22-10'),(1,1,'2017-02-13 08-37-45'),(5,2,'2017-02-13 12-34-56'),(4,3,'2017-02-14 08-22-43'),(5,4,'2017-02-14 09-12-56'),(3,5,'2017-02-15 08-09-10'),(6,7,'2017-02-15 09-05-12'),(1,8,'2017-02-15 09-27-50'),(2,9,'2017-02-16 08-51-12'),(3,10,'2017-02-16 13-07-46'),(4,11,'2017-02-17 08-03-55'),(4,12,'2017-02-17 09-12-11'),(5,10,'2017-02-17 11-41-17'),(6,18,'2017-02-17 13-05-56'),(7,19,'2017-02-18 08-33-27'),(1,17,'2017-02-19 08-12-31'),(1,1,'2017-02-20 09-50-17'),(3,5,'2017-02-20 09-51-29'),(4,6,'2017-02-20 10-43-39'),(3,1,'2017-02-21 08-32-17'),(1,1,'2017-02-21 10-30-11'),(3,2,'2017-02-21 11-08-45'),(4,3,'2017-02-22 11-46-32'),(2,15,'2017-02-22 13-35-16'),(6,13,'2017-02-23 08-34-48'),(4,24,'2017-02-24 08-32-03'),(2,13,'2017-02-25 08-03-12'),(7,17,'2017-02-25 09-34-23'),(7,23,'2017-02-25 11-32-54'),(5,12,'2017-02-26 11-47-34'),(6,4,'2017-02-27 12-12-34'),(1,1,'2017-02-28 08-59-22');

-- ALTER TABLE orders 
-- DROP FOREIGN KEY FK_ProductId;

-- ALTER TABLE orders 
-- DROP FOREIGN KEY FK_CustomerId;

-- ALTER TABLE orders  
-- ADD CONSTRAINT FK_ProductId
--     FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE;
--     
-- ALTER TABLE orders  
-- ADD CONSTRAINT FK_CustomerId
--     FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE;
--     
-- TRUNCATE TABLE orders;
    
DESC orders;

-- Melihat data
SELECT * FROM orders;

-- READ DATA
-- SELECT <column_name> FROM <table_name>
SELECT * FROM customers; 
SELECT last_name FROM customers;
SELECT last_name, phone_number FROM customers;

-- WHERE CONDITION
SELECT * FROM products
WHERE origin = 'Colombia';

-- AND
SELECT * FROM products
WHERE price = 3.00
AND origin = 'Colombia';

-- OR
SELECT * FROM products
WHERE price = 3.00
OR origin = 'Colombia';

-- PERBANDINGAN (>, <, >=, <=)
SELECT * FROM products
WHERE price <= 3.00;

-- NULL VALUES
-- Customer yang tidak memiliki nomor telfon 
SELECT * FROM customers
WHERE phone_number IS NULL;
-- Customer yang tidak memiliki nama belakang namun memiliki nomor telfon
SELECT * FROM customers
WHERE phone_number IS NOT NULL AND last_name IS NULL;

-- EXERCISE

-- Tampilkan nama depan, nomor telfon dan gender untuk mereka yang memiliki nama belakang 'Bluth'
-- dan seorang perempuan
select first_name, phone_number , gender from customers
where last_name = 'Bluth' and gender = 'F';

-- Tampilkan nama product, harga, dan asal untuk mereka yang  harga di atas 3.00
-- atau berasal dari sri lanka
select * from products
where price > 3.00 or origin = 'Sri Lanka';

-- Tampilkan seluruh kolom dari customer
-- untuk mereka yang laki - laki dan tidak memiliki nomor telfon
select * from customers
where gender = 'M' and phone_number IS NULL;

-- In & Not In
-- Customer yg memiliki nama belakang Bluth atau Taylor atau Armstrong
SELECT * FROM customers
WHERE last_name in ('Bluth', 'Taylor', 'Armstrong');
-- WHERE last_name = 'Bluth' or last_name = 'Taylor' or last_name ='Armstrong'

-- Customer yg memiliki nama belakang bukan Katie atau John atau George
SELECT * FROM customers
WHERE first_name not in ('Katie', 'John', 'George');

-- Between
-- Transaksi dari tanggal satu hingga tujuh januari
SELECT * FROM orders
WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07';

 SELECT * FROM orders
 WHERE customer_id BETWEEN 5 AND 11;
 
 -- LIKE (case insensitive)
 -- % , angka dan karakter apapun dan berapun jumlahnya
 -- _ , hanya satu karakter
 
 -- Customer yang nama belakang mengandung huruf O
 SELECT * FROM customers
 WHERE last_name LIKE '%o%';
 
-- Cutomer dengan nama belakangnya setelah huruf o hanya ada boleh satu karakter
SELECT * FROM customers
WHERE last_name LIKE '%o_';

-- Customer dengan nama belakangnya setelah huruf o hanya ada boleh dua karakter
SELECT * FROM customers
 WHERE last_name LIKE '%o__';
 
 -- Customer huruf terakhir di nama belakang adalah huruf 'n'
  SELECT * FROM customers
 WHERE last_name LIKE '%n';
 
 -- Product yang memiliki harga dimana digit pertamanya adalah angka 3
 SELECT * FROM products
 WHERE  price LIKE '3%';
 
-- Order By ( ASC or DESC , default ASC )

-- Urutkan data secara ascending berdasarkan harga
SELECT * FROM products
ORDER BY price;

-- Urutkan data secara descending berdasarkan harga
SELECT * FROM products
ORDER BY price DESC;

-- Banyaknya order yang dilakukan oleh customer dg id 1 dan diurutkan scr ascending
SELECT * FROM orders
WHERE customer_id = 1
ORDER BY order_time;

-- EXERCISE
-- Tampilkan nama product dan harga dari semua product
-- dengan asal dari indonesia atau colombia, kemudian diurutkan berdasarkan name
select name, price from products
where origin in ('Indonesia','Colombia')
order by name;

-- Tampilkan semua kolom untuk order di bulan februari
-- untuk customer dengan id 2, 4, 6, atau 8
select * from orders
where customer_id in (2, 4, 6, 8)
and order_time like '2017-02-%';

-- Tampilkan nama depan, nomor telfon, dan nama belakang untuk customer
-- yang nama belakang mengandung kata 'ar'
select first_name, phone_number, last_name from customers
where last_name like '%ar%';

-- Alias
SELECT name AS `Nama kopi`, price AS `Harga`, origin AS `Asal` from products;

-- LIMIT
SELECT * FROM products
WHERE price > 2.00
LIMIT 3;

-- Tiga product termahal
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

-- Tampilkan product termahal urutan 3 sampai 5
SELECT * FROM products
ORDER BY price DESC
LIMIT 3 OFFSET 2;


-- DISTINCT
-- Menampilkan data secara unique

SELECT origin FROM products;
SELECT DISTINCT origin FROM products;

SELECT price, origin FROM products;
SELECT DISTINCT price, origin FROM products;


-- FRIDAY EXERCISE

-- Tampilkan nama produk, harga, dan origin namun rename kolom price menjadi retail_price

-- Tampilkan nama belakang secara unique dan diurutkan secara ascending

-- Tampilkan product id secara unique untuk order yang dilakukan customer dengan id 2 selama bulan januari

-- Tampilkan 3 order pertama yang dilakukan oleh customer dengan id 1 di bulan feburari 2017

-- Tampilkan semua kolom, 5 order terakhir yang dilakukan user dengan id 1













