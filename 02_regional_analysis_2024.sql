-- Project: Tuberculosis in England
-- Analysis: Regional variation in TB notifications, 2024
-- Purpose: Compare notification rates and counts across UKHSA regions.

-- 1. Rank regions by notification rate

SELECT
    Region,
    TB_Notifications,
    Notification_Rate_Per_100000
FROM tb_regional_2024
ORDER BY Notification_Rate_Per_100000 DESC;


-- 2. Calculate the difference between the highest
-- and lowest regional notification rates

SELECT
    MAX(Notification_Rate_Per_100000) AS Highest_Rate,
    MIN(Notification_Rate_Per_100000) AS Lowest_Rate,
    ROUND(
        MAX(Notification_Rate_Per_100000) -
        MIN(Notification_Rate_Per_100000),
        2
    ) AS Absolute_Difference,
    ROUND(
        MAX(Notification_Rate_Per_100000) /
        MIN(Notification_Rate_Per_100000),
        2
    ) AS Highest_to_Lowest_Ratio
FROM tb_regional_2024;
