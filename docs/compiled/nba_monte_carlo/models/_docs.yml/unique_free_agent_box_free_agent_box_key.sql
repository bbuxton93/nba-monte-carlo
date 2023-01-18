
    
    

select
    free_agent_box_key as unique_field,
    count(*) as n_records

from "main"."main"."free_agent_box"
where free_agent_box_key is not null
group by free_agent_box_key
having count(*) > 1


