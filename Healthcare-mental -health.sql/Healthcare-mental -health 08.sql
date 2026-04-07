-- show me all key mental health metrics in one clean table foe the board meeting-- 

use healthcare_mental_health;

select
count(*) as total_employee,
round(avg(stress_level), 1) as average_stress,
round(avg( mental_health_absences), 1) as average_absences,
round(sum( case when turnover_intention ='yes' then 1 else 0 end)*100.0/count(*) , 1) as turnover_pct,
round(count( case when Acess_to_EAPs = 'yes' then 1 else 0 end)* 100.0/count(*) , 1)as eap_coverage_pct
from workforce;