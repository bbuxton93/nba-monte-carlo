SELECT
    concat_ws('|',player_id,week) as free_agent_box_key,
    *
FROM  {{ source( 'ff_prep', 'free_agent_box' ) }}