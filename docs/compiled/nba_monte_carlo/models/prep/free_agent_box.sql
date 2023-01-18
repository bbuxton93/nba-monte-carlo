SELECT
    concat_ws('|',player_id,week) as free_agent_box_key,
    *
FROM  '/home/bbuxton/meltano-projects/nba-monte-carlo/data/data_catalog/raw/free_agent_box.parquet'