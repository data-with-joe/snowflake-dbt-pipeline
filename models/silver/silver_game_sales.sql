WITH base AS (
    SELECT * FROM {{ ref('bronze_game_sales') }}
),

cleaned AS (
    SELECT
        title,
        console,
        INITCAP(genre)                          AS genre,
        INITCAP(publisher)                      AS publisher,
        INITCAP(developer)                      AS developer,
        critic_score,
        COALESCE(total_sales, 0)                AS total_sales,
        COALESCE(na_sales, 0)                   AS na_sales,
        COALESCE(jp_sales, 0)                   AS jp_sales,
        COALESCE(pal_sales, 0)                  AS pal_sales,
        COALESCE(other_sales, 0)                AS other_sales,
        TRY_TO_DATE(release_date)               AS release_date,
        TRY_TO_DATE(last_update)                AS last_update,
        YEAR(TRY_TO_DATE(release_date))         AS release_year,
        CURRENT_TIMESTAMP()                      AS processed_at
    FROM base
    WHERE title IS NOT NULL
)

SELECT * FROM cleaned