
    
    

select
    matchup_key as unique_field,
    count(*) as n_records

from "main"."main"."matchup_results"
where matchup_key is not null
group by matchup_key
having count(*) > 1


