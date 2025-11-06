-- 1) Total expenditure by area and cuisine
SELECT city, area, cuisine, SUM(order_count * price) AS estimated_revenue
FROM zomato
GROUP BY city, area, cuisine
ORDER BY estimated_revenue DESC;

-- 2) Top popular items in South Delhi
SELECT restaurant_name, menu_item, SUM(order_count) AS total_orders
FROM zomato
WHERE city = 'South Delhi'
GROUP BY restaurant_name, menu_item
ORDER BY total_orders DESC
LIMIT 20;

-- 3) Gold membership adoption
SELECT city, area,
  COUNT(CASE WHEN is_gold_member = 1 THEN 1 END) AS gold_orders,
  COUNT(*) AS total_orders,
  (CAST(COUNT(CASE WHEN is_gold_member = 1 THEN 1 END) AS FLOAT)/COUNT(*))*100 AS pct_gold
FROM zomato
GROUP BY city, area
ORDER BY pct_gold DESC;
