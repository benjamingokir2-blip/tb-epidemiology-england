-- Project: Tuberculosis in England
-- Analysis: TB notification rates by deprivation decile, 2019–2024
-- Purpose: Examine the absolute and relative inequality
-- between the most and least deprived deciles.

-- 1. Compare notification rates in Decile 1 and Decile 10

SELECT
    Year,

    MAX(CASE WHEN IMD_Decile = 1
        THEN Notification_Rate END) AS Most_Deprived_Rate,

    MAX(CASE WHEN IMD_Decile = 10
        THEN Notification_Rate END) AS Least_Deprived_Rate,

    ROUND(
        MAX(CASE WHEN IMD_Decile = 1
            THEN Notification_Rate END)
        -
        MAX(CASE WHEN IMD_Decile = 10
            THEN Notification_Rate END),
        2
    ) AS Absolute_Gap,

    ROUND(
        MAX(CASE WHEN IMD_Decile = 1
            THEN Notification_Rate END)
        /
        MAX(CASE WHEN IMD_Decile = 10
            THEN Notification_Rate END),
        2
    ) AS Rate_Ratio

FROM tb_deprivation
WHERE IMD_Decile IN (1, 10)
GROUP BY Year
ORDER BY Year;


-- 2. Examine notification rates across all deprivation deciles

SELECT
    Year,
    IMD_Decile,
    Notification_Rate,
    Lower_CI,
    Upper_CI
FROM tb_deprivation
ORDER BY Year, IMD_Decile;
