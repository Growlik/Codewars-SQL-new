WITH RECURSIVE count_item AS (
  SELECT C.id,
  C.parent,
  (SELECT COUNT(i.id) FROM items AS i WHERE i.category_id = C.id) AS total
  FROM categories AS C
  ), h AS
  (SELECT ID, parent, total
  FROM count_item 
  WHERE ID NOT IN (SELECT parent FROM categories WHERE parent IS NOT null)
  UNION ALL
  SELECT C.id, C.parent, C.total + h.total AS total
  FROM h
  JOIN count_item AS C ON h.parent = C.id)
SELECT ID, SUM(total)::INT AS total
FROM h
GROUP BY ID
ORDER BY ID
;