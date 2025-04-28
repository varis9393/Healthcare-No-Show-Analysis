-- No-Show Rate by Weekday
SELECT 
    DATENAME(WEEKDAY, appointment_date) AS weekday,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) AS total_no_shows,
    ROUND(
        SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS no_show_percentage
FROM appointments
GROUP BY DATENAME(WEEKDAY, appointment_date)
ORDER BY no_show_percentage DESC;

-- Age Group No-Show Trend
SELECT 
    CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate
FROM appointments
GROUP BY 
    CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 35 THEN '18-35'
        WHEN age BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END
ORDER BY no_show_rate DESC;
