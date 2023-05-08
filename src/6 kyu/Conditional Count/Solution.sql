SELECT EXTRACT(MONTH FROM payment_date) AS month,
    COUNT(DISTINCT payment_id) as total_count,
    SUM(amount) AS total_amount,
    COUNT(CASE WHEN staff_id=1 THEN 1 ELSE NULL END) AS mike_count,
    SUM(CASE WHEN staff_id=1 THEN amount ELSE NULL END) AS mike_amount,
    COUNT(CASE WHEN staff_id=2 THEN 1 ELSE NULL END) AS jon_count,
    SUM(CASE WHEN staff_id=2 THEN amount ELSE NULL END) AS jon_amount
FROM payment GROUP BY month;