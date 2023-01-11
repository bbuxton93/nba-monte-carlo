
with unnested as (
SELECT
first_name,
last_name,
hire_date,

unnest(from_json(seasons, '["json"]')) as season_json
    --  
     -- hire_date
FROM  {{ source( 'cfb_prep', 'coaches' ) }}

)
,
make_columns AS (

select 
first_name
,last_name
,hire_date
,json_extract_string(season_json, 'school') as school
,json_extract_string(season_json, 'year') as year
,json_extract_string(season_json, 'games') as games
,json_extract_string(season_json, 'wins') as wins
,json_extract_string(season_json, 'ties') as ties
,json_extract_string(season_json, 'preseason_rank') as preseason_rank
,json_extract_string(season_json, 'postseason_rank') as postseason_rank
,json_extract_string(season_json, 'srs') as srs
,json_extract_string(season_json, 'sp_overall') as sp_overall
,json_extract_string(season_json, 'sp_offense') as sp_offense
,json_extract_string(season_json, 'sp_defense') as sp_defense

from unnested
)

select * from make_columns