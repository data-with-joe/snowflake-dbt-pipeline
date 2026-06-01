WITH base AS (
    SELECT * FROM {{ ref('silver_game_sales') }}
)

SELECT
    publisher,
    COUNT(*)                        AS total_games,
    ROUND(SUM(total_sales), 2)      AS total_sales,
    ROUND(AVG(critic_score), 2)     AS avg_critic_score,
    COUNT(DISTINCT genre)           AS genres_covered,
    COUNT(DISTINCT console)         AS platforms_covered,
    MIN(release_year)               AS first_release_year,
    MAX(release_year)               AS last_release_year
FROM base
WHERE publisher IS NOT NULL
GROUP BY publisher
ORDER BY total_sales DESC