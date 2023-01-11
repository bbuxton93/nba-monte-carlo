SELECT
    *
FROM  {{ source( 'cfb_prep', 'conferences' ) }}