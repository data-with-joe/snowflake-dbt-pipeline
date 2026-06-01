SELECT
    img,
    title,
    console,
    genre,
    publisher,
    developer,
    critic_score,
    total_sales,
    na_sales,
    jp_sales,
    pal_sales,
    other_sales,
    release_date,
    last_update,
    CURRENT_TIMESTAMP() AS ingested_at
FROM {{ source('raw', 'game_sales') }}