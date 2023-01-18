
    
    

select
    player_box_key as unique_field,
    count(*) as n_records

from "main"."main"."player_box"
where player_box_key is not null
group by player_box_key
having count(*) > 1


