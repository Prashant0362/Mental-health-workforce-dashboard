-- which workplace factor ( heavy workload, safety concerns, etc) causes highest stress by department?-- 

use healthcare_mental_health;

select 
Department,
workplace_factor,
round(Avg ( stress_level), 2) as avg_stress,
count(*) as employee_count,
rank() over (partition by department order by avg( stress_level) desc ) as stress_rank
from workforce
group by department, workplace_factor
having employee_count >= 10 
order by department, stress_rank
limit 10 ;