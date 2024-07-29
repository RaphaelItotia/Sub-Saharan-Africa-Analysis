# Analyzing African economic and demographic trends.

## Objective: 
Analyze and visualize the relationship between GDP and Population growth across different African countries and years. Identify trends and correlations in the economic and demographic data. 

Through this project I honed my skills;
- Data cleaning and transformation
- Data visualization
- Statistics
- Data modeling
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

prepared the datasets for easy analysis by [combining them](Files/CREATE_VIEW.sql), calculated the [gdp per capita](Files/GDP_per_Capita.sql), did a [trend analysis](Files/Trend_analysis.sql), calculated [yearly growth rates](Files/Yearly_Growth_Rate.sql), [correlation](Files/Correlation_analysis.sql) between population growth rate and GDP's, before diving into visualization using Power BI.

I connected the SQL database to Power BI and first did a Data Modeling;
- I created an active country to country relationship from *CombinedData* table to other tables.
- An inactive year to year relationship from *CombinedData* table to other tables to avoid ambiguity. Activated by creating measures and implementing USERELATIONSHIP() function in DAX.

![](Files/modeling.gif)

## Data Visualization

Having plotted gdp, population, and gdp per capita, I identified some trends.

For instance,

**Trends for GDP and population growth in Central Africa:**

Angola being the leading in GDP by 2024, there is a downward trend from 2017(122.02B) to 2020(57.14B) but then a recovery and grew up to 122.83B by 2022 before facing another down trend that is currently at 92.12B 

For the population growth, it has a consistent upward trend from 1980(8.27M) to 2024(37.89M)

![](Files/ne.gif)

Although Sao tome is lagging by 2024, there is a consistent upward trend from 2015(0.26B) to date(0.75B)

It's population still experiencing an upward trend since 1980(0.09M) now at (0.24M) _mmmh... still a small figure_ 

![](Files/sao.gif)

-------

For Angola and Sao tome, GDP and population appear not to be moving together. This means there is no much positive relationship between the two.

-------
