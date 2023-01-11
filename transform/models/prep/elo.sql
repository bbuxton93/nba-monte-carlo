SELECT
    *
FROM  {{ source( 'cfb_prep', 'elo' ) }}