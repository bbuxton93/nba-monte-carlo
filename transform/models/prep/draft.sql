SELECT
    *
FROM  {{ source( 'ff_prep', 'draft' ) }}