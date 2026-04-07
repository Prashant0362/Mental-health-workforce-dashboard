-- "Which employees have stress levels WORSE than their department average?"-- 
Use healthcare_mental_health;
Select 
Employee_ID,
Employee_type,
department,
stress_level,
round(avg(stress_level) over (Partition by department), 2) as dept_avg_stress,
case when stress_level > avg(stress_level) over (partition by department)
then 'high risk'
else 'Normal'
end as risk_status
from workforce
order by ( stress_level - avg(stress_level) over (partition by department)) desc, department;