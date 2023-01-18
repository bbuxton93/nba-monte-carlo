SELECT
    *
FROM  {{ source( 'ff_prep', 'teams' ) }}