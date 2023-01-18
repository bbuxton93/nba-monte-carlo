SELECT
    concat_ws('|',team_name,week) as results_key,
    *
FROM  '/home/bbuxton/meltano-projects/nba-monte-carlo/data/data_catalog/raw/results.parquet'