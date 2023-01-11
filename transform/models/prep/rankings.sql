SELECT
    *
FROM  {{ source( 'cfb_prep', 'rankings' ) }}