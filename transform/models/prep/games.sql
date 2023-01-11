SELECT
    *
FROM  {{ source( 'cfb_prep', 'games' ) }}