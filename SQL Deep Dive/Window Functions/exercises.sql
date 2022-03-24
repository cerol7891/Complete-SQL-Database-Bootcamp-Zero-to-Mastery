/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/
SELECT continent, sum(population) as "total population" 
from "public"."country"
group by continent

order by "total population" desc

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

SELECT
  DISTINCT continent,
  sum(population) OVER(
  partition by continent) as "continent population",
    concat(round((sum(population::float4) over(
    partition by continent)/sum(population::float4) over())*100),'%') as "percentage"
FROM "public"."country"

order by "continent population" DESC

/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

SELECT  
    distinct regions.name as "region", 
    count(towns.name) over(
    partition by "regions"."name") as "town" 
from "public"."regions"
inner join "public"."towns"
on regions.code=towns.department
