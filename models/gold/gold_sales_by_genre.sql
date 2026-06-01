WITH base AS (
    SELECT * FROM {{ ref('silver_game_sales') }}
)

SELECT
    genre,
    COUNT(*)                        AS total_games,
    ROUND(SUM(total_sales), 2)      AS total_sales,
    ROUND(SUM(na_sales), 2)         AS na_sales,
    ROUND(SUM(jp_sales), 2)         AS jp_sales,
    ROUND(SUM(pal_sales), 2)        AS pal_sales,
    ROUND(AVG(critic_score), 2)     AS avg_critic_score
FROM base
WHERE genre IS NOT NULL
GROUP BY genre
ORDER BY total_sales DESC