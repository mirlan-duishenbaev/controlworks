#query 1
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in = 2
GROUP BY p.product
ORDER BY p.product;


#query 2
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_out = 3
GROUP BY p.product
ORDER BY p.product;

#query 3
USE warehouse_database;
SELECT 
    c.category AS Category, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    categories AS c ON p.category_id = c.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in = 4
GROUP BY c.category
ORDER BY c.category;


#query 4
USE warehouse_database;
SELECT 
    b.brand AS Brand, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    brands AS b ON p.brand_id = b.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in = 2
GROUP BY b.brand
ORDER BY b.brand;


#query 5
USE warehouse_database;
START TRANSACTION;
SET @date = '2021-07-10 11:00:00';
SET @product = 3;
SET @warehouse = 2;
SET @contragent = 1;
SET @qty = 300;
INSERT INTO actions (action_date, product_id, warehouse_id_in, warehouse_id_out, contragent_id, qty)
VALUES (@date, @product, @warehouse, null, @contragent, @qty);
UPDATE warehouses 
SET  product_remains = (SELECT 
            SUM(a.qty)
        FROM
            actions AS a
        WHERE
            a.warehouse_id_in = warehouses.id)
            - (SELECT 
            SUM(a.qty)
        FROM
            actions AS a
        WHERE
            a.warehouse_id_out = warehouses.id)
WHERE id=@warehouse;
COMMIT;
SELECT 
    *
FROM
    warehouses
WHERE
    id = 2;
SELECT 
    *
FROM
    actions
WHERE
    warehouse_id_in = 2
        AND action_date = '2021-07-10 11:00:00';
SELECT 
    p.product AS Product,
    SUM(a.qty) - (SELECT 
            SUM(a.qty)
        FROM
            actions AS a
        WHERE
            action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-11 11:00:00'
                AND a.warehouse_id_out = 2) AS Remains
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
WHERE
    action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-11 11:00:00'
        AND a.warehouse_id_in = 2
GROUP BY p.product
ORDER BY p.product;


#query 6
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    contragents AS c ON a.contragent_id = c.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in IS NOT NULL
        AND a.contragent_id = 2
GROUP BY p.product
ORDER BY p.product;


#query 7
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    contragents AS c ON a.contragent_id = c.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in = 2
        AND a.contragent_id = 2
GROUP BY p.product
ORDER BY p.product;


#query 8
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    contragents AS c ON a.contragent_id = c.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_out = 3
        AND a.contragent_id = 2
GROUP BY p.product
ORDER BY p.product;


#query 9
USE warehouse_database;
SELECT 
    c.contragent AS Contragent, SUM(a.qty) AS 'Total Qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    contragents AS c ON a.contragent_id = c.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in IS NOT NULL
        AND a.product_id = 1
GROUP BY c.contragent
ORDER BY Qty DESC;


#query 10
USE warehouse_database;
SELECT 
    c.contragent AS Contragent, SUM(a.qty) AS 'Total Qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
        INNER JOIN
    contragents AS c ON a.contragent_id = c.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_out IS NOT NULL
        AND a.product_id = 1
GROUP BY c.contragent
ORDER BY Qty DESC;


#query 11
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total Qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_in = 4
        AND a.contragent_id IS NULL
GROUP BY p.product
ORDER BY p.product;


#query 12
USE warehouse_database;
SELECT 
    p.product AS Product, SUM(a.qty) AS 'Total Qty'
FROM
    actions AS a
        INNER JOIN
    products AS p ON a.product_id = p.id
WHERE
    a.action_date BETWEEN '2020-02-19 15:30:00' AND '2021-07-02 15:30:00'
        AND a.warehouse_id_out = 4
        AND a.contragent_id IS NULL
GROUP BY p.product
ORDER BY p.product;