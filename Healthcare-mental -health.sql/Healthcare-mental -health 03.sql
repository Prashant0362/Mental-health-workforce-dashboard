-- Which job role have the most unhappy workers ?

use healthcare_mental_health;

with unhappy_counts as (
select
Employee_Type,
count(*) as unhappy_workers
from workforce
where job_satisfaction < 3
group by Employee_type
)
select 
Employee_type,
unhappy_workers,
row_number() over (order by unhappy_workers desc ) as problem_rank
from unhappy_counts 
order by problem_rank ;