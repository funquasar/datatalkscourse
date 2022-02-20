SELECT 
    EXTRACT(month FROM pickup_datetime), 
    count(*) 
FROM 
    `dtc-de-339119.production.fact_fhv_trips` 
GROUP BY 
    EXTRACT(month FROM pickup_datetime)
ORDER BY
    1