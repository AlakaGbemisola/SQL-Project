#PROFIT ANALYSIS

#1. Within the space of the last three years, what was the profit
#worth of the breweries, inclusive of the anglophone and the francophone territories?
select sum(PROFIT)
from international_breweries;

#2. Compare the total profit between these two territories in order for the territory manager, Mr. Stone made a strategic decision
#that will aid profit maximization in 2020.
select
case 
when COUNTRIES in ('Ghana', 'Nigeria') 
then 'Anglophone'
when COUNTRIES in ('Togo', 'Benin', 'Senegal')
then 'Francophone'
else 'Unknown'
end as territory,
sum(PROFIT) as total_profit
from international_breweries
group by territory;

#3. Country that generated the highest profit in 2019
select COUNTRIES, sum(PROFIT) as total_profit
from international_breweries
where YEARS = 2019
group by COUNTRIES
order by total_profit desc
limit 1;

#4. Help him find the year with the highest profit
select YEARS, sum(PROFIT) as total_profit
from international_breweries
group by YEARS
order by total_profit desc
limit 1;

#5. What was the minimum profit in the month of December 2018?
select YEARS, MONTHS, min(PROFIT) as minimum_profit
from international_breweries
where YEARS = 2018 and MONTHS = 'December';

#BRAND ANALYSIS

#1. Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries
 select BRANDS, sum(QUANTITY) as total_quantity
 from international_breweries
 where YEARS in (2018, 2019)
 and COUNTRIES in ('Togo', 'Benin', 'Senegal')
 group by BRANDS
 order by total_quantity desc
 limit 3;
 
#2. Find out the top two choice of consumer brands in Ghana
select BRANDS, sum(QUANTITY) as total_consumption
from international_breweries
where COUNTRIES = 'Ghana'
group by BRANDS
order by total_consumption desc
limit 2;

#3. Favorites malt brand in Anglophone region between 2018 and 2019
select BRANDS, sum(QUANTITY) as total_consumption
from international_breweries
where YEARS in (2018, 2019)
and BRANDS like '%malt%'
and COUNTRIES in ('Ghana', 'Nigeria')
group by BRANDS
order by total_consumption desc
limit 1;

#4. Which brands sold the highest in 2019 in Nigeria
select BRANDS, sum(QUANTITY) as total_consumption
from international_breweries
where YEARS = 2019
and COUNTRIES in ('Nigeria')
group by BRANDS
order by total_consumption desc
limit 1;

#5. Beer consumption in Nigeria
select BRANDS, sum(QUANTITY) as total_consumption
from international_breweries
where COUNTRIES in ('Nigeria')
and BRANDS not like '%malt%'
group by BRANDS
order by total_consumption desc;

#COUNTRY ANALYSIS

#1. Country with the highest consumption of beer
select COUNTRIES, sum(QUANTITY) as highest_consumption
from international_breweries
where BRANDS not like '%malt%'
group by COUNTRIES
order by highest_consumption desc;

#2. Country with the highest consumption of malt.
select COUNTRIES, sum(QUANTITY) as highest_consumption
from international_breweries
where BRANDS like '%malt%'
group by COUNTRIES
order by highest_consumption desc