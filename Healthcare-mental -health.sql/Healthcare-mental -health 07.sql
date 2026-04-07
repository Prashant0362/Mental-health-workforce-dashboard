-- who are out top 20% most absenct employees? target them for intervention!

use healthcare_mental_health;


-- Create ranked table
CREATE TEMPORARY TABLE top_absentees AS
SELECT 
    Employee_ID,
    Employee_Type,
    Department,
    Mental_Health_Absences,
    NTILE(5) OVER (ORDER BY Mental_Health_Absences DESC) AS absence_quintile
FROM workforce;

-- Show TOP 20% (Group 1)
SELECT * FROM top_absentees 
WHERE absence_quintile = 1
ORDER BY Mental_Health_Absences DESC 
LIMIT 10;

