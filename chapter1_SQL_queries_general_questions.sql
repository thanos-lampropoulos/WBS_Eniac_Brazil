USE magist;

/*Question 1*/

SELECT COUNT(DISTINCT order_id)
FROM orders;

/*Question 2*/

SELECT COUNT(order_status)
FROM orders
WHERE order_status = "delivered";

SELECT COUNT(order_status)
FROM orders
WHERE NOT order_status IN ("delivered", "shipped");

SELECT COUNT(order_status)
FROM orders
WHERE order_status = "canceled";

/*Question 3*/

SELECT order_purchase_timestamp
FROM orders
ORDER BY order_purchase_timestamp;

SELECT COUNT(order_purchase_timestamp), YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
FROM orders
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp);

/*Question 4*/

SELECT COUNT(DISTINCT product_id)
FROM products;

/*Question 5*/

SELECT COUNT(product_id) as counter, product_category_name
FROM products
GROUP BY product_category_name
ORDER BY counter DESC;

/*Question 6*/

SELECT *
FROM order_items;

SELECT DISTINCT order_item_id
FROM order_items;

SELECT COUNT(DISTINCT order_items.product_id)
FROM order_items INNER JOIN products ON order_items.product_id = products.product_id
WHERE order_items.order_item_id >= 1;

SELECT COUNT(DISTINCT product_id)
FROM order_items
WHERE order_item_id >= 1;

/*Question 7*/

SELECT DISTINCT product_id, price
FROM order_items
ORDER BY price ASC
LIMIT 1;

SELECT DISTINCT product_id, price
FROM order_items
ORDER BY price DESC
LIMIT 1;

/*Question 8*/

SELECT * 
FROM order_payments;

SELECT DISTINCT order_id, payment_value
FROM order_payments
WHERE payment_value > 0
ORDER BY payment_value ASC
LIMIT 10;

SELECT DISTINCT order_id, payment_value
FROM order_payments
WHERE payment_value > 0
ORDER BY payment_value DESC
LIMIT 10;

/*Question 3.1.1*/

SELECT DISTINCT product_category_name
FROM products;

SELECT DISTINCT product_category_name_english
FROM product_category_name_translation
ORDER BY product_category_name_english ASC;

/*Question 3.1.2*/

SELECT COUNT(DISTINCT order_items.product_id)
FROM order_items
LEFT JOIN orders ON order_items.order_id = orders.order_id
LEFT JOIN products ON order_items.product_id = products.product_id
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
WHERE orders.order_status = "delivered"
AND product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts");

SELECT COUNT(DISTINCT order_items.product_id)
FROM order_items
LEFT JOIN orders ON order_items.order_id = orders.order_id
LEFT JOIN products ON order_items.product_id = products.product_id
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
WHERE orders.order_status = "delivered";

SELECT COUNT(order_items.product_id)
FROM order_items
LEFT JOIN orders ON order_items.order_id = orders.order_id
LEFT JOIN products ON order_items.product_id = products.product_id
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
WHERE orders.order_status = "delivered"
AND product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts");
    
SELECT COUNT(order_items.product_id)
FROM order_items
LEFT JOIN orders ON order_items.order_id = orders.order_id
LEFT JOIN products ON order_items.product_id = products.product_id
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
WHERE orders.order_status = "delivered";

/*Question 3.1.3*/

SELECT ROUND(AVG(price), 2)
FROM order_items;

SELECT ROUND(AVG(price), 2)
FROM order_items
LEFT JOIN orders ON order_items.order_id = orders.order_id
LEFT JOIN products ON order_items.product_id = products.product_id
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
WHERE orders.order_status = "delivered"
AND product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts");
    
/*Question 3.1.4*/

SELECT COUNT(order_items.product_id), order_items.price,
CASE WHEN COUNT(order_items.product_id) > 10 THEN "item is popular" ELSE "indifferent" END AS Popularity	
FROM order_items
LEFT JOIN orders ON order_items.order_id = orders.order_id
LEFT JOIN products ON order_items.product_id = products.product_id
LEFT JOIN product_category_name_translation ON products.product_category_name = product_category_name_translation.product_category_name
WHERE orders.order_status = "delivered"
AND product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts")
GROUP BY order_items.price HAVING order_items.price > 100
ORDER BY order_items.price DESC;

/*Question 3.2.1*/

SELECT YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
FROM orders
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp);

/*Question 3.2.2*/

SELECT COUNT(DISTINCT seller_id)
FROM sellers;

SELECT COUNT(DISTINCT seller_id)
FROM sellers
LEFT JOIN order_items USING(seller_id)
LEFT JOIN products USING(product_id)
LEFT JOIN product_category_name_translation USING(product_category_name)
WHERE product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts");

/*Question 3.2.3*/

SELECT * from order_items
ORDER BY order_id;

SELECT ROUND(SUM(price), 2)
FROM order_items;

SELECT ROUND(SUM(price), 2)
FROM order_items
LEFT JOIN sellers USING(seller_id)
LEFT JOIN products USING(product_id)
LEFT JOIN product_category_name_translation USING(product_category_name)
WHERE product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts");

/*Question 3.2.4*/

SELECT ROUND(SUM(price), 2), YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
FROM order_items
LEFT JOIN orders USING(order_id)
GROUP BY YEAR(orders.order_purchase_timestamp), MONTH(orders.order_purchase_timestamp)
ORDER BY YEAR(orders.order_purchase_timestamp), MONTH(orders.order_purchase_timestamp);

SELECT ROUND(SUM(price), 2), YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
FROM order_items
LEFT JOIN orders USING(order_id)
LEFT JOIN sellers USING(seller_id)
LEFT JOIN products USING(product_id)
LEFT JOIN product_category_name_translation USING(product_category_name)
WHERE product_category_name_english IN (
	"air_conditioning",
    "audio",
    "computers", 
    "computers_accessories", 
    "consoles_games", 
    "costruction_tools_tools",
    "electronics",
    "fixed_telephony",
    "home_appliances",
    "home_appliances_2",
    "pc_gamer",
    "small_appliances",
    "small_appliances_home_oven_and_coffee",
    "tablets_printing_image",
    "telephony",
    "watches_gifts")
GROUP BY YEAR(orders.order_purchase_timestamp), MONTH(orders.order_purchase_timestamp)
ORDER BY YEAR(orders.order_purchase_timestamp), MONTH(orders.order_purchase_timestamp);

/*Question 3.3.1*/

SELECT AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp))
FROM orders;

/*Question 3.3.2*/

SELECT order_estimated_delivery_date, order_delivered_customer_date, DATEDIFF(order_estimated_delivery_date,
		order_delivered_customer_date) AS punctuality,
CASE WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 0 THEN "late"
	WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) IS NULL THEN "-"
	ELSE "on-time"
END AS verdict 
FROM orders;

SELECT COUNT(t.verdict)
FROM
(SELECT order_estimated_delivery_date, order_delivered_customer_date, DATEDIFF(order_estimated_delivery_date,
		order_delivered_customer_date) AS punctuality,
CASE WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 0 THEN "late"
	WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) IS NULL THEN "-"
	ELSE "on-time"
END AS verdict 
FROM orders) as t
WHERE t.verdict = "late";

SELECT COUNT(t.verdict)
FROM
(SELECT order_estimated_delivery_date, order_delivered_customer_date, DATEDIFF(order_estimated_delivery_date,
		order_delivered_customer_date) AS punctuality,
CASE WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 0 THEN "late"
	WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) IS NULL THEN "-"
	ELSE "on-time"
END AS verdict 
FROM orders) as t
WHERE t.verdict = "on-time";

SELECT COUNT(t.verdict)
FROM
(SELECT order_estimated_delivery_date, order_delivered_customer_date, DATEDIFF(order_estimated_delivery_date,
		order_delivered_customer_date) AS punctuality,
CASE WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 0 THEN "late"
	WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) IS NULL THEN "-"
	ELSE "on-time"
END AS verdict 
FROM orders) as t;

/*Question 3.3.3*/
-- needs correction
SELECT COUNT(t.verdict)
FROM
(SELECT order_estimated_delivery_date, order_delivered_customer_date, DATEDIFF(order_estimated_delivery_date,
		order_delivered_customer_date) AS punctuality,
CASE WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 0 THEN "late"
	WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) IS NULL THEN "-"
	ELSE "on-time"
END AS verdict, product_weight_g
FROM orders
LEFT JOIN order_items USING(order_id)
LEFT JOIN products USING(product_id)
) as t
WHERE t.verdict = "on-time"
AND t.product_weight_g > 5000
GROUP BY products.product_id;

SELECT 



/* finding out how long magist needs to process the orders internally */

SELECT AVG(DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp))
FROM orders;

/* finding out percentage of internally delayed orders */

SELECT COUNT(t.verdict)
FROM
(SELECT order_delivered_carrier_date, order_purchase_timestamp,
		DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) AS delay,
CASE WHEN DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) > 2 THEN "late"
	 WHEN DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) IS NULL THEN "-"
	 ELSE "ok"
END AS verdict 
FROM orders) as t
WHERE t.verdict = "late";

SELECT COUNT(t.verdict)
FROM
(SELECT order_delivered_carrier_date, order_purchase_timestamp,
		DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) AS delay,
CASE WHEN DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) > 2 THEN "late"
	 WHEN DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) IS NULL THEN "-"
	 ELSE "ok"
END AS verdict 
FROM orders) as t
WHERE t.verdict = "ok";

SELECT COUNT(t.verdict)
FROM
(SELECT order_delivered_carrier_date, order_purchase_timestamp,
		DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) AS delay,
CASE WHEN DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) > 2 THEN "late"
	 WHEN DATEDIFF(order_delivered_carrier_date, order_purchase_timestamp) IS NULL THEN "-"
	 ELSE "ok"
END AS verdict 
FROM orders) as t;
