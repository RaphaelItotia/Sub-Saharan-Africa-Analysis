# Analyzing African economic and demographic trends.

## Objective: 
Analyze and visualize the relationship between GDP and Population growth across different African countries and years. Identify trends and correlations in the economic and demographic data. 

Through this project I honed my skills;
- Data cleaning and transformation
- Data visualization
- Statistics
- Data modelling
- Problem-solving
- Communication

## Data description:
I gathered the GDP in billions(US dollars) and population in millions datasets of African countries classified as the Sub-Saharan from [IMF website](https://www.imf.org/en/Publications/WEO/weo-database/2024/April).

I converted the datasets to an analyzable format using Python:
- [GDP](Files/convert_GDP.ipynb)
- [Population](Files/convert_pop.ipynb)

where the final structure was 

GDP dataset:
Columns: 
- Country - Names of the African countries.
- Year - Each year a record taken.
- GDP(B) - Holds the GDP values of each country every year.

Population dataset:
Columns:
- Country
- Year
- Population(M)
  
---------------

Loaded the datasets into a database in SQL server,

prepared the datasets for easy analysis by [combining them](Files/CREATE_VIEW.sql),

calculated the [gdp per capita](Files/GDP_per_Capita.sql),

did a [trend analysis](Files/Trend_analysis.sql),

calculated [yearly growth rates](Files/Yearly_Growth_Rate.sql),

[correlation](Files/Correlation_analysis.sql) between population growth rate and GDP's, 

before diving into visualization using Power BI.
