SELECT
    *
FROM  {{ source( 'cfb_prep', 'teams' ) }}