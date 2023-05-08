SELECT top_half.id, heads, bottom_half.legs, arms, bottom_half.tails,
    CASE
        WHEN heads > arms OR bottom_half.tails > bottom_half.legs THEN 'BEAST' ELSE 'WEIRDO'
        END AS species
    FROM top_half JOIN bottom_half ON top_half.id=bottom_half.id ORDER BY species;