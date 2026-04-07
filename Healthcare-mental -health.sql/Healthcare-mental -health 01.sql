-- Which department have > 15% turnover intention?-- 

use healthcare_mental_health;
SELECT 
    Department,
    ROUND((SUM(CASE WHEN Turnover_Intention = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS turnover_rate_pct,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Turnover_Intention = 'Yes' THEN 1 ELSE 0 END) AS at_risk_count
FROM workforce
GROUP BY Department
HAVING turnover_rate_pct > 15
ORDER BY turnover_rate_pct DESC;