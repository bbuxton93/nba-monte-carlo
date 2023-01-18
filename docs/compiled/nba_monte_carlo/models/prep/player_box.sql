SELECT
    concat_ws('|',player_id,week) as player_box_key,
    *
FROM  '/home/bbuxton/meltano-projects/nba-monte-carlo/data/data_catalog/raw/player_box.parquet'