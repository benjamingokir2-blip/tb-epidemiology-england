-- Project: Tuberculosis in England
-- Analysis: Annual notification trends, 2015–2024
-- Purpose: Examine changes in TB notification counts and rates.

-- 1. Annual notification trends and year-on-year changes

SELECT
    Year,
    TB_Notifications,
    Notification_Rate_Per_100000,

    LAG(TB_Notifications) OVER (ORDER BY Year)
        AS Previous_Year_Notifications,

    TB_Notifications -
        LAG(TB_Notifications) OVER (ORDER BY Year)
        AS Change_in_Notifications,

    ROUND(
        (
            TB_Notifications -
            LAG(TB_Notifications) OVER (ORDER BY Year)
        ) * 100.0 /
        LAG(TB_Notifications) OVER (ORDER BY Year),
        2
    ) AS Percentage_Change_in_Notifications,

    ROUND(
        Notification_Rate_Per_100000 -
        LAG(Notification_Rate_Per_100000) OVER (ORDER BY Year),
        2
    ) AS Change_in_Notification_Rate

FROM tb_table
WHERE Year BETWEEN 2015 AND 2024
ORDER BY Year;
