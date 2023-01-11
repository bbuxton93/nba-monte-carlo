
with unnested as (
SELECT     
       id,
       "homeTeam",
       "homeScore",
       "awayTeam",
       "awayScore",
       week,
       "homeConference",
       "awayConference",
       season,
       "seasonType",
       "startDate",
        unnest(from_json(lines, '["json"]')) as lines_json
FROM  {{ source( 'cfb_prep', 'lines' ) }}
)

,
make_columns AS (

select 
       id,
       "homeTeam",
       "homeScore",
       "awayTeam",
       "awayScore",
       week,
       "homeConference",
       "awayConference",
       season,
       "seasonType",
       "startDate"
,json_extract_string(lines_json, 'provider') as provider
,json_extract_string(lines_json, 'spread') as spread
,json_extract_string(lines_json, 'formattedSpread') as formatted_spread
,json_extract_string(lines_json, 'spreadOpen') as spread_open
,json_extract_string(lines_json, 'overUnder') as over_under
,json_extract_string(lines_json, 'overUnderOpen') as over_under_open
,json_extract_string(lines_json, 'homeMoneyline') as home_moneyline
,json_extract_string(lines_json, 'awayMoneyline') as away_moneyline

from unnested
)

select * from make_columns