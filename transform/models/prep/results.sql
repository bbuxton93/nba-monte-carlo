SELECT
    concat_ws('|',team_name,week) as results_key,
    *
FROM  {{ source( 'ff_prep', 'results' ) }}