--1Q--

CREATE DATABASE ecommerce;
USE ecommerce;
select * from users_data;
--3Q--

desc users_data;

-4Q--

select * from users_data limit 100;

--5Q--

select count(distinct(country)) Distinct_country, count(distinct(language)) Distinct_language from users_data;

--6Q--

select gender,sum(socialNBFollowers) Followers from users_data group by gender;

--7Q (a)--

select count(type) Total_users from users_data where hasProfilePicture = 'TRUE';

--7Q (b)--

select count(type) Total_users from users_data where hasAnyApp = 'TRUE';

--7Q (c)--

select count(type) Total_users from users_data where hasAndroidApp = 'TRUE';

--7Q (d)--

select count(type) Total_users from users_data where hasIosApp = 'TRUE';

--8Q Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
 (Hint: consider only those users having at least 1 product bought.)

select country,count(productsBought) Total_Number_of_Buyers from users_data 
where productsBought > 0 group by country order by Total_Number_of_Buyers desc;

--9Q Calculate the total number of sellers for each country and sort the result in 
ascending order of total number of sellers. (Hint: consider only those users having at least 1 product sold.)

select country, count(productsSold) Total_number_of_sellers from users_data 
where productsSold = 1 group by country order by Total_number_of_sellers asc;

--10 Q Display name of top 10 countries having maximum products pass rate.

select country, max(productsPassRate) from users_data 
group by country order by count(productsPassRate) desc limit 10;

--11Q Calculate the number of users on an ecommerce platform for different language choices.

select language,count(type) Number_of_users from users_data group by language;

--12Q 

--13Q

--14Q Which country is having maximum number of buyers?

select country, count(productsBought) Number_of_Buyers from users_data group by country order by Number_of_Buyers desc;

--15Q List the name of 10 countries having zero number of sellers.

select country, count(productsSold) number_of_sellers from users_data 
where productsSold = 0 group by country order by number_of_sellers desc limit 10;

--16Q Display record of top 110 users who have used ecommerce platform recently.

select identifierHash,country,gender,daysSinceLastLogin 
from users_data order by daysSinceLastLogin asc limit 110; 

--17Q Calculate the number of female users those who have not logged in since last 100 days.

select gender,count(type) from users_data where daysSinceLastLogin >= 100 and gender = 'F';

--18Q Display the number of female users of each country at ecommerce platform.

select country,gender,count(type) from users_data 
where gender = 'F' group by country; 

--19Q Display the number of male users of each country at ecommerce platform.

select country,gender,count(type) from users_data 
where gender = 'M' group by country;

--20Q Calculate the average number of products sold and bought
 on ecommerce platform by male users for each country.

select country,gender,count(type),avg(productsSold),avg(productsBought) from users_data
where gender = 'M' group by country;
