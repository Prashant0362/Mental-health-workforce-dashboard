-- Average absences by stress level + burnout frequency-- 
use healthcare_mental_health;
select
stress_level,
Burnout_frequency,
round(Avg( Mental_Health_Absences), 1)  As avg_absences,
count(*) as employee_count
From workforce
Group By Stress_level, burnout_frequency 
order By Stress_level Desc , avg_absences Desc limit 10;