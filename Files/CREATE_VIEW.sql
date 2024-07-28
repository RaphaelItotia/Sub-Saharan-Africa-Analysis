CREATE VIEW CombinedData AS
SELECT 
	g.Country,
	g.Year,
	g.GDP_B,
	p.Population_M
FROM
	dbo.[GDP(B)] g
INNER JOIN
	dbo.[Population(M)] p
ON
	g.Country = p.Country AND g.Year = p.Year;