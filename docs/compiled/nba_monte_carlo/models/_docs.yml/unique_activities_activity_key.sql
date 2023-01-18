
    
    

select
    activity_key as unique_field,
    count(*) as n_records

from "main"."main"."activities"
where activity_key is not null
group by activity_key
having count(*) > 1


