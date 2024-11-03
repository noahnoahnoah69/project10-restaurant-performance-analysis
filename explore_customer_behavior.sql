-- 1. Combine the menu_items and order_details tables into a single table.

SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?

SELECT mi.item_name, mi.category, COUNT(od.order_details_id) AS num_purchases 
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY 3 DESC;

-- Findings:
-- The most ordered item is Hamburger in the American category with 622 total purchases.
-- The least ordered item is Chicken Tacos in the Mexican category with 123 total purchases.

-- 3. What were the top 5 orders that customers spent the most money?

SELECT od.order_id, SUM(mi.price) as total_spend 
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY 2 DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the results?

SELECT mi.category, COUNT(od.item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE od.order_id = 440
GROUP BY mi.category
ORDER BY 2 DESC;

-- Findings:
-- It seems that Italian food is highly favored in this order.

-- 5. View the details of the top 5 highest spend orders. What insights can you gather from the results?

SELECT mi.category, COUNT(od.item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE od.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY 1, 2;

-- Findings:
-- Italian food does play a major role.
