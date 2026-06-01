# Snowflake + dbt Games Sales Pipeline

## Overview
    An end-to-end ELT pipeline built with Snowflake and dbt (data build tool) using a real world video game sales dataset spanning 1971 to 2024. Demonstrates the modern data stack pattern of loading raw data into a cloud warehouse and transforming it entirely using SQL based dbt models.

## Dataset

    Source: Video game sales dataset (maven analytics)
    Size: 64,016 games
    Coverage: 1971 to 2024
    Columns: title, console, genre, publisher, developer, critic score, regional sales (NA, JP, PAL, Other)

## Architecture
    Raw CSV (64,016 rows)
            
    Snowflake RAW schema   (source table)
            
    Bronze layer           (raw copy with ingestion timestamp)
            
    Silver layer           (cleaned, typed, enriched)
            
    Gold layer             (aggregated analytics models)

## Tech Stack

    Warehouse: Snowflake
    Transformation: dbt Core
    Language: SQL
    Pipeline pattern: ELT (transform inside the warehouse)

## dbt Models
    Model                    Layer            Description
    bronze_game_sales        Bronze            Raw copy of source data with ingestion timestamp
    silver_game_sales        Silver            Cleaned titles, standardised genres, parsed dates, handled nulls
    gold_sales_by_genre      Gold              Total and regional sales aggregated by genre
    gold_sales_by_platform   Gold              Sales and game counts aggregated by console platform
    gold_top_publishers      Gold              Publisher rankings by total sales, platforms, and genres covered

## Silver Transformations

    Standardised genre, publisher and developer casing with INITCAP
    Replaced null sales values with 0 using COALESCE
    Parsed release and update dates using TRY_TO_DATE
    Extracted release year for time-based analysis
    Filtered out rows with null titles

## Data Quality

  dbt tests applied on Silver layer.  Not null checks on title, console, genre and total_sales
  Identified that critic_score is 90% null and total_sales is 70% null. Documented and handled deliberately rather than dropped

## Key Concepts Demonstrated

### Modern ELT stack — Snowflake + dbt
    SQL-based transformations inside a cloud warehouse
    dbt model dependencies using ref() and source()
    Layered transformation (Bronze → Silver → Gold)
    Data quality testing with dbt tests
    dbt documentation and lineage graph generation

### Notes
Built as part of a data engineering portfolio to demonstrate the Snowflake + dbt stack — the most commonly requested tool combination in modern data engineering job postings.

