
{% set load_tables = ["activities", "draft", "free_agent_box","matchup_results","player_box","player_season","results","teams"] %}



SELECT
    *
FROM  {{ source( 'cfb_prep', 'calendar' ) }}