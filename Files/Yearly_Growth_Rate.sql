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
FROM
	growth_rates;
