SELECT
    *
FROM  {{ source( 'cfb_prep', 'calendar' ) }}