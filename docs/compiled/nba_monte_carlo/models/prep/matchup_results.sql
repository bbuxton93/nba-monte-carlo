SELECT
    concat_ws('|',team_id,week) as matchup_key,
    *
FROM  '/home/bbuxton/meltano-projects/nba-monte-carlo/data/data_catalog/raw/matchup_results.parquet'