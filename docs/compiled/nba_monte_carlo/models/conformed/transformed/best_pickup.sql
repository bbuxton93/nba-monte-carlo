with SortedResults as
(
    select *
        , ROW_NUMBER() over(partition by player,team    order by activity_time  asc) as RowNum

    from  "main"."main"."activities"

)
,
segments as (
select 
s.week
,s.activity_type
    , s.player
    ,s.team
    , sum(case when slot_position<>'BE' then c.points end) as points_1
,s.RowNum

from SortedResults s
join main.player_box  c on c.player_name = s.player and c.week >= s.week
 --and c.player_name = 'Browns D/ST'
group by s.week
,s.activity_type
    , s.player
    ,s.team,s.RowNum
order by team,s.week ,player,RowNum 
)

select 
--week
--activity_type
     player
    ,team
  --  ,RowNum
  -- ,COALESCE(sum(case when activity_type='DROPPED' then points_1  END ),0) as test_sub
  -- ,sum(case when activity_type LIKE '%ADDED' then points_1 END)  as test_add
,sum(case when activity_type LIKE '%ADDED' then points_1 END) - COALESCE(sum(case when activity_type='DROPPED' then points_1  END ),0) as points_after_acquisition
FROM segments
group by 1,2