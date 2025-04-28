# Healthcare Appointment No-Show Analysis

**Objective**  
Analyze patterns in patient no-shows to help a healthcare provider reduce appointment gaps and improve resource allocation.

**Tools Used**  
- SQL (joins, filters, aggregations)  
- Power BI (data visualization, slicers, KPIs)  
- Python (Pandas, for data cleaning and exploration)

**Dataset**  
Simulated dataset with 100k+ rows containing appointment dates, patient demographics, and no-show status.

**Key Questions**  
- Which days have the highest no-show rates?
- Are age, gender, or appointment type related to attendance?
- How can scheduling be optimized?

**Highlights**  
- Found no-show rate peaked on Fridays (26%)  
- Identified younger patients as higher-risk for missing appointments  
- Built Power BI dashboard with filters for date, clinic, and patient group

**Sample SQL Query**
```sql
SELECT
    appointment_day,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) AS total_no_shows,
    ROUND(
        SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS no_show_percentage
FROM appointments
GROUP BY appointment_day
ORDER BY no_show_percentage DESC;
