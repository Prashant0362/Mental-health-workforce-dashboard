-- Does acess to employee Assistance programs (EAPs) reduce absences by departments?

USE healthcare_mental_health;

SELECT 
    Department,
    ROUND(AVG(CASE WHEN Acess_to_EAPs = 'Yes' THEN Mental_Health_Absences END), 1) AS eap_yes_avg,
    ROUND(AVG(CASE WHEN Acess_to_EAPs = 'No' THEN Mental_Health_Absences END), 1) AS eap_no_avg,
    COUNT(CASE WHEN Acess_to_EAPs = 'Yes' THEN 1 END) AS eap_yes_count,
    COUNT(CASE WHEN Acess_to_EAPs = 'No' THEN 1 END) AS eap_no_count
FROM workforce
GROUP BY Department
HAVING eap_yes_avg IS NOT NULL AND eap_no_avg IS NOT NULL  -- Both groups exist
ORDER BY (eap_no_avg - eap_yes_avg) DESC;