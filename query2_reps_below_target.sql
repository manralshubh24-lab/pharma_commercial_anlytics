SELECT 
    r.rep_name,
    SUM(f.revenue_inr) AS total_revenue,
    SUM(f.target_revenue) AS total_target,
    ROUND(SUM(f.revenue_inr)/SUM(f.target_revenue)*100, 2) AS achievement_pct
FROM fact_sales f
JOIN dim_rep r ON f.rep_id = r.rep_id
GROUP BY r.rep_name
having achievement_pct < 95
ORDER BY achievement_pct ASC;
