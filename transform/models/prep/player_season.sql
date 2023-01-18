SELECT
    *
FROM  {{ source( 'ff_prep', 'player_season' ) }}