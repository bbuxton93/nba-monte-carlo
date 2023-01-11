SELECT
    *,
    True AS latest_ratings
FROM  '/home/bbuxton/meltano-projects/nba-monte-carlo/data/data_catalog/prep/elo_post.parquet'