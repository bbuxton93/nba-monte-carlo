SELECT
    concat_ws('|',team_id,week) as matchup_key,
    *
FROM  {{ source( 'ff_prep', 'matchup_results' ) }}