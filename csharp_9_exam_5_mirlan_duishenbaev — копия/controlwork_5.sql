CREATE DATABASE IF NOT EXISTS warehouse_database;

USE warehouse_database;

CREATE TABLE warehouses (
    id INT(11) NOT NULL AUTO_INCREMENT,
    warehouse VARCHAR(45) NOT NULL DEFAULT 'warehouse name',
    PRIMARY KEY (id)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE categories (
    id INT(11) NOT NULL AUTO_INCREMENT,
    category VARCHAR(45) NOT NULL DEFAULT 'name category',
    description VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY category_UNIQUE (category)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE brands (
    id INT(11) NOT NULL AUTO_INCREMENT,
    brand VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE contragents (
    id INT NOT NULL AUTO_INCREMENT,
    contragent VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
  
CREATE TABLE products (
    id INT(11) NOT NULL AUTO_INCREMENT,
    category_id INT(11) NOT NULL,
    brand_id INT(11) DEFAULT NULL,
    product VARCHAR(45) NOT NULL,
    description VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (id),
    KEY FK_category_idx (category_id),
    KEY FK_brand_idx (brand_id),
    CONSTRAINT FK_brand FOREIGN KEY (brand_id)
        REFERENCES brands (id)
        ON UPDATE CASCADE,
    CONSTRAINT FK_category FOREIGN KEY (category_id)
        REFERENCES categories (id)
        ON UPDATE CASCADE
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE actions (
    id INT(11) NOT NULL AUTO_INCREMENT,
    action_date DATETIME NOT NULL,
    product_id INT(11) NOT NULL,
    warehouse_id_in INT(11),
    warehouse_id_out INT(11),
    contragent_id INT(11),
    qty DECIMAL(10 , 3 ) NOT NULL DEFAULT '0.000',
    PRIMARY KEY (id),
    INDEX FK_product_idx (product_id),
    CONSTRAINT FK_product FOREIGN KEY (product_id)
        REFERENCES products (id),
    CONSTRAINT FK_contragent FOREIGN KEY (contragent_id)
        REFERENCES contragents (id),
    CONSTRAINT FK_warehouse_in FOREIGN KEY (warehouse_id_in)
        REFERENCES warehouses (id),
    CONSTRAINT FK_warehouse_out FOREIGN KEY (warehouse_id_out)
        REFERENCES warehouses (id)
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


INSERT INTO categories (category, description) VALUES ('Wine', 'Вино');
INSERT INTO categories (category, description) VALUES ('Vodka', 'Водка');
INSERT INTO categories (category, description) VALUES ('Whiskey', 'Виски');
INSERT INTO categories (category, description) VALUES ('Cognac', 'Коньяк');
INSERT INTO categories (category, description) VALUES ('Beer', 'Пиво');

INSERT INTO brands (brand) VALUES ('Absolut');
INSERT INTO brands (brand) VALUES ('Hennessy');
INSERT INTO brands (brand) VALUES ('Corona');
INSERT INTO brands (brand) VALUES ('Johnnie Walker');
INSERT INTO brands (brand) VALUES ('Adrianna Vineyard');

INSERT INTO contragents (contragent) VALUES ('Eric Cartman');
INSERT INTO contragents (contragent) VALUES ('Stanley Marsh');
INSERT INTO contragents (contragent) VALUES ('Kyle Broflovski');
INSERT INTO contragents (contragent) VALUES ('Kenny McCormick');

insert into warehouses (warehouse) values ('Southern');
insert into warehouses (warehouse) values ('Northern');
insert into warehouses (warehouse) values ('Western');
insert into warehouses (warehouse) values ('Eastern');

INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where category='Wine'),
(SELECT id FROM brands where brand='Adrianna Vineyard'),
'White Stones', '');
INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where category='Beer'),
(SELECT id FROM brands where brand='Corona'),
'Corona Extra', '');
INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where category='Cognac'),
(SELECT id FROM brands where brand='Hennessy'),
'Hennessy XO', '');
INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where category='Vodka'),
(SELECT id FROM brands where brand='Absolut'),
'Absolut 100', '');
INSERT INTO products (category_id, brand_id, product, description)
VALUES ((SELECT id FROM categories where category='Whiskey'),
(SELECT id FROM brands where brand='Johnnie Walker'),
'Red Label', '');

INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-02-19 15:30:00', 1, 2, null, 4, 60);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-04-02 15:30:00', 2, null, 4, 1, 100);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-05-21 15:30:00', 3, 4, 2, null, 20);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-06-03 15:30:00', 5, 2, null, 2, 200);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-06-30 15:30:00', 4, 3, null, 3, 130);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-07-20 15:30:00', 3, 2, 4, null, 50);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-09-08 15:30:00', 1, null, 3, 2, 90);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-10-06 15:30:00', 5, 4, 1, null, 160);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-10-23 15:30:00', 2, 1, null, 4, 40);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-11-18 15:30:00', 3, 2, null, 3, 250);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-12-17 15:30:00', 4, 4, 3, null, 100);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-01-08 15:30:00', 1, null, 1, 1, 110);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-03-29 15:30:00', 5, null, 2, 4, 80);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-04-15 15:30:00', 2, 2, null, 2, 130);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-05-11 15:30:00', 3, 1, null, 4, 270);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-05-12 15:30:00', 4, 3, 1, null, 60);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-06-04 15:30:00', 1, 1, 4, null, 100);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-06-09 15:30:00', 2, null, 4, 1, 150);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2021-07-02 15:30:00', 1, 2, null, 1, 300);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-07-15 15:30:00', 2, 4, null, 3, 250);
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES ('2020-12-10 15:30:00', 3, 3, null, 2, 250);

alter table warehouses
add column product_remains decimal(10,0) not null default 0 after warehouse;

UPDATE warehouses 
SET 
    product_remains = (SELECT 
            SUM(a.qty)
        FROM
            actions AS a
        WHERE
            a.warehouse_id_in = warehouses.id) - (SELECT 
            SUM(a.qty)
        FROM
            actions AS a
        WHERE
            a.warehouse_id_out = warehouses.id);