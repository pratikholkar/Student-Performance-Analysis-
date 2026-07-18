SELECT TOP 20 * FROM students


--Q1. How many students are present in the dataset?
SELECT COUNT (*) AS total_students
FROM students


--Q2. How many students belong to each department?
SELECT department,
COUNT (*) AS total_students
FROM students
GROUP BY department
ORDER BY total_students DESC;


--Q3. What is the average CGPA of students in each department?
SELECT department,
ROUND(AVG(current_cgpa),2) AS avg_cgpa
FROM students
GROUP BY department
ORDER BY avg_cgpa DESC;

--Q4. What is the average attendance percentage of students in each department?
SELECT department,
ROUND(AVG(attendance_percentage),2) AS avg_attendance
from students
GROUP BY department
ORDER BY avg_attendance;


--Q5. Which students currently have active backlogs?
SELECT
student_id,
department,
current_cgpa,
active_backlogs
FROM students
WHERE active_backlogs > 0
ORDER BY active_backlogs DESC;


--Q6. Which departments have the highest number of backlogs?
SELECT department,
SUM(active_backlogs) AS total_backlogs
FROM students
GROUP BY department
ORDER BY total_backlogs DESC;


--Q7. What is the distribution of students based on academic status?
SELECT academic_status, 
COUNT(*) AS total_stud FROM students 
GROUP BY academic_status 
ORDER BY total_stud DESC;


--Q8. How many students have completed internships?
SELECT internship_status,
COUNT(*) AS total_students
FROM students
GROUP BY internship_status;


--Q9. Which internship domains are most popular among students?
SELECT internship_domain,
COUNT(*) AS total_students
FROM students 
WHERE internship_status = 'Yes'
GROUP BY internship_domain 
ORDER BY total_students DESC;


--Q10. What is the average number of certifications completed by students in each academic year?
SELECT academic_year,
ROUND(AVG(certification_count),2) AS average_certification 
FROM students
GROUP BY academic_year
ORDER BY average_certification DESC;


--Q11. Who are the top 10 students based on CGPA?
SELECT TOP 10
student_id,
department,
current_cgpa
FROM students
ORDER BY current_cgpa DESC;


--Q12. Which students are academically at risk?
SELECT *
FROM students
WHERE academic_status = 'At Risk'
ORDER BY current_cgpa ;



--Q13. What ia Average CGPA of Students in Each Department?
SELECT department,
ROUND (AVG(current_cgpa),2) AS average_cgpa
FROM students
GROUP BY department
ORDER BY average_cgpa DESC;


--Q14. What is Average Attendance Percentage in Each Department?
SELECT department,
ROUND (AVG(attendance_percentage),2) AS average_attendance
FROM students
GROUP BY department
ORDER BY average_attendance DESC;


--Q15. Which Departments Having Highest Active Backlogs?
SELECT department,
SUM(active_backlogs) AS total_backlogs
FROM students
GROUP BY department
ORDER BY total_backlogs DESC;


--Q16. Distribution of Students Based on their Academic Status.
SELECT academic_status,
COUNT(*) AS total_students
FROM students
GROUP BY academic_status
ORDER BY total_students DESC;


--Q17. Which Students Completed Internships?
SELECT internship_status,
COUNT (*) total_students
FROM students
GROUP BY internship_status;


--Q18. Which Internship Domains are Most Popular to Students?
SELECT internship_domain,
COUNT (*) AS total_students
FROM students
WHERE internship_status = 'Yes'
GROUP BY  internship_domain
ORDER BY total_students DESC;


--Q19. What is Average Number of Certifications Completed by Students in each Academic Year?
SELECT academic_year,
ROUND (AVG(certification_count),2) AS average_certification
FROM students
GROUP BY academic_year
ORDER BY average_certification DESC;


--Q20. Which Students Rank in Top 10 Based on their CGPA?
SELECT TOP 10
student_id,
department,
current_cgpa,
attendance_percentage
FROM students
ORDER BY 
current_cgpa DESC,
attendance_percentage DESC;


--Q21. Which departments have the highest average placement package?
SELECT department,
ROUND(AVG(placement_package_lpa),2) AS average_placement_package
FROM students
WHERE placement_status = 'Placed'
GROUP BY department
ORDER BY average_placement_package DESC;


--Q22. What percentage of students are placed?
SELECT 
    ROUND((COUNT(CASE WHEN placement_status = 'Placed' THEN 1 END) * 100.0) / COUNT(*), 2) AS placement_percentage 
FROM students
ORDER BY placement_percentage DESC;


--Q23. What is placement rate by department?
SELECT
    department,
    COUNT(*) AS total_students,
    COUNT(CASE WHEN placement_status = 'Placed' THEN 1 END) AS placed_students,
    ROUND(COUNT(CASE WHEN placement_status = 'Placed' THEN 1 END) * 100.0 / COUNT(*), 2) AS placement_rate
FROM students
GROUP BY department
ORDER BY placement_rate DESC;


--Q24. Which companies hired the highest number of students?
SELECT placement_company, 
COUNT (*) AS total_students
FROM students
WHERE placement_status = 'Placed'
GROUP BY placement_company
ORDER BY total_students DESC;


--Q25. Which students have both excellent attendance and excellent academic performance?
SELECT
student_id,
department,
current_cgpa,
attendance_percentage
FROM students
WHERE current_cgpa >= 8
      AND attendance_percentage >= 90
      AND active_backlogs >= 0
ORDER BY current_cgpa DESC;


--Q26. What is the average CGPA according to attendance category?
SELECT attendance_category,
ROUND (AVG(current_cgpa),2) AS average_cgpa
FROM students
GROUP BY attendance_category
ORDER BY average_cgpa DESC;


--Q27. Which skill level category has the highest average CGPA?
SELECT skill_level,
ROUND(AVG(current_cgpa),2) AS average_cgpa
FROM students
GROUP BY skill_level
ORDER BY average_cgpa DESC;


--Q28. Which project domains are most commonly chosen by students?
SELECT project_domain,
COUNT (*) AS total_students
FROM students
GROUP BY project_domain
ORDER BY total_students DESC;


--Q29. Which students have completed the highest number of certifications?
SELECT
student_id,
department,
current_cgpa,
certification_count
FROM students
ORDER BY
certification_count DESC,
current_cgpa DESC;


--Q20. Create a risk score combining multiple factors.
SELECT
    student_id,
    department,
    current_cgpa,
    attendance_percentage,
    active_backlogs,

    CASE
        WHEN current_cgpa < 6.5
             AND attendance_percentage < 75
             AND active_backlogs > 0
        THEN 'High Risk'

        WHEN current_cgpa < 7
             OR active_backlogs > 0
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS risk_level

FROM students;


--Q31. What is average resume score by department?
SELECT
    department,
    COUNT(*) AS total_students,
    ROUND(AVG(resume_score), 2) AS average_resume_score,
    MAX(resume_score) AS highest_resume_score,
    MIN(resume_score) AS lowest_resume_score
FROM students
GROUP BY department
ORDER BY average_resume_score DESC;
