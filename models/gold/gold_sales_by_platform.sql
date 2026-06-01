WITH base AS (
    SELECT * FROM {{ ref('silver_game_sales') }}
)

SELECT
    console,
    COUNT(*)                        AS total_games,
    ROUND(SUM(total_sales), 2)      AS total_sales,
    ROUND(SUM(na_sales), 2)         AS na_sales,
    ROUND(SUM(jp_sales), 2)         AS jp_sales,
    ROUND(SUM(pal_sales), 2)        AS pal_sales,
    ROUND(AVG(critic_score), 2)     AS avg_critic_score,
    MIN(release_year)               AS first_release_year,
    MAX(release_year)               AS last_release_year
FROM base
WHERE console IS NOT NULL
GROUP BY console
ORDER BY total_sales DESC