CREATE EXTENSION pg_trgm;
CREATE INDEX prospects_idx ON prospects USING gin(full_name gin_trgm_ops);
SELECT C.first_name,
       C.last_name,
       C.credit_limit AS old_limit,
       MAX(P.credit_limit) AS new_limit
FROM customers C, prospects P
WHERE P.full_name ILIKE '%' ||C.first_name || '%'
AND P.full_name ILIKE '%' || C.last_name || '%'
AND P.credit_limit > C.credit_limit
GROUP BY C.first_name, C.last_name, C.credit_limit
ORDER BY first_name;