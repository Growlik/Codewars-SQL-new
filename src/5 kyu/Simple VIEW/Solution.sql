CREATE VIEW members_approved_for_voucher AS
    SELECT members.id, members.name, members.email, SUM(products.price) AS total_spending
  FROM members
  JOIN sales ON sales.member_id=members.id
  JOIN products ON products.id=sales.product_id
  WHERE sales.department_id IN (
    SELECT sales.department_id
      FROM sales
      INNER JOIN products ON products.id = sales.product_id
      GROUP BY sales.department_id
      HAVING SUM(products.price) > 10000
  )
  GROUP BY members.id, members.name, members.email
  HAVING SUM(products.price) > 1000
  ORDER BY members.id;

SELECT * FROM members_approved_for_voucher;