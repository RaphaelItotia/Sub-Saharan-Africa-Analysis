WITH growth_rates AS (
	SELECT
		Country,
		Year,
		GDP_B,
		Population_M,
		LAG(GDP_B) OVER (PARTITION BY Country ORDER BY Year) AS prev_GDP_B,
		LAG(Population_M) OVER (PARTITION BY Country ORDER BY Year) AS prev_Poplation_M
	FROM
		CombinedData
)

SELECT
	Country,
	Year,
	GDP_B,
	Population_M,
	((GDP_B - NULLIF(prev_GDP_B,0)) / NULLIF(prev_GDP_B,0)) * 100 AS gdp_growth_rate,
	((Population_M - NULLIF(prev_Poplation_M,0)) / NULLIF(prev_Poplation_M,0)) * 100 AS population_growth_rate
INTO
	growth_data
FROM
	growth_rates;

-- Calculate correlation btwn gdp growth rate and population growth rate
WITH stats AS (
	SELECT
		COUNT(*) AS n,
		SUM(gdp_growth_rate) AS sum_x,
		SUM(population_growth_rate) AS sum_y,
		SUM(gdp_growth_rate * population_growth_rate) AS sum_xy,
		SUM(gdp_growth_rate * gdp_growth_rate) AS sum_x2,
		SUM(population_growth_rate * population_growth_rate) AS sum_y2
	FROM
		growth_data
)
SELECT 
	(n * sum_xy - sum_x * sum_y) / 
	SQRT((n * sum_x2 - sum_x * sum_x) * (n * sum_y2 - sum_y * sum_y)) AS correlation
FROM
	stats;
