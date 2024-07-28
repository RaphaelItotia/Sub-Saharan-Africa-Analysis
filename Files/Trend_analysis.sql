SELECT
	Country,
	Year,
	GDP_B,
	Population_M,
	COALESCE((GDP_B * 1e9) / NULLIF((Population_M * 1e6),0),0) AS gdp_per_capita  -- NULLIF to return 'NULL' if population is zero. COALESCE to convert 'NULL' results back to zero.
FROM
	CombinedData
ORDER BY
	Country, Year;