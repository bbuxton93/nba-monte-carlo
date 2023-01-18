
    
    

select
    player_id as unique_field,
    count(*) as n_records

from "main"."main"."draft"
where player_id is not null
group by player_id
having count(*) > 1


