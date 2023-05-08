SELECT data->> 'first_name' AS first_name, data->> 'last_name' AS last_name,
    EXTRACT(YEAR FROM AGE(now(), (data->> 'date_of_birth')::date))::integer AS age,
        CASE
            WHEN data->> 'private'='true' THEN 'Hidden'
            WHEN data->> 'private' = 'false' AND data#>> '{email_addresses, 0}' ISNULL THEN 'None'
            ELSE data#>> '{email_addresses, 0}'
          END AS email_address
      FROM users
    ORDER BY first_name, last_name;