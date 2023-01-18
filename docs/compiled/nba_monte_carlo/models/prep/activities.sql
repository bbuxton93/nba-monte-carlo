with start as (
SELECT 
    concat_ws('|',player_id,activity_type,epoch_ms(activity_time)) as activity_key,
       team,
       activity_type,
       player,
       player_id,
       zero,
       epoch_ms(activity_time) as activity_time 
     
FROM  '/home/bbuxton/meltano-projects/nba-monte-carlo/data/data_catalog/raw/activities.parquet'
),

weeks_create as (
select *,
       CASE when activity_time < '2022-09-12T23:59:59' then 1
            when activity_time > timestamp '2022-09-12T23:59:59'  and activity_time < timestamp '2022-09-12T23:59:59' + interval 7 days  then 2 
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 7 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 14 days  then 3
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 14 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 21 days  then 4
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 21 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 28 days  then 5
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 28 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 35 days  then 6
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 35 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 42 days  then 7
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 42 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 49 days  then 8
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 49 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 56 days  then 9
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 56 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 63 days  then 10
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 63 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 70 days  then 11
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 70 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 77 days  then 12
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 77 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 84 days  then 13
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 84 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 91 days  then 14
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 91 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 98 days  then 15
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 98 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 105  days  then 16
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 105 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 112  days  then 17
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 112 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 119  days  then 18
            when activity_time > timestamp '2022-09-12T23:59:59' + interval 119 days AND activity_time < timestamp '2022-09-12T23:59:59' + interval 126  days  then 19
ELSE 'none' END::INT as week 
from start
)
select * from weeks_create