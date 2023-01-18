
    
    

select
    results_key as unique_field,
    count(*) as n_records

from "main"."main"."results"
where results_key is not null
group by results_key
having count(*) > 1


