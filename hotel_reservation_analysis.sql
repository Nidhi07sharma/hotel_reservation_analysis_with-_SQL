create database Hotel_reservation_analysis;
use Hotel_reservation_analysis;
select *from `hotel reservation dataset`;

##1. What is the total number of reservations in the dataset?
select count(booking_status) as total_number_of_reservation from `hotel reservation dataset`;

##2. Which meal plan is the most popular among guests
select type_of_meal_plan,count(type_of_meal_plan) as most_popular from `hotel reservation dataset` 
group by type_of_meal_plan order by most_popular desc ;


##3. What is the average price per room for reservations involving children?
select avg_price_per_room from `hotel reservation dataset` 
where no_of_children > 0 ;

##4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select substring(arrival_date, -4) as year_wise,count(*) from `hotel reservation dataset`
where substring(arrival_date, -4) = '2018'  group by year_wise;

##5. What is the most commonly booked room type?
select room_type_reserved,count(*) as room_count from `hotel reservation dataset` 
group by room_type_reserved order by room_count desc ;

##6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(no_of_weekend_nights) from `hotel reservation dataset` 
where no_of_weekend_nights > 0 ;

##7. What is the highest and lowest lead time for reservations?
select max(lead_time) as highest_lead,min(lead_time) as lowest_lead from `hotel reservation dataset`;
 
 ##8. What is the most common market segment type for reservations?
 select market_segment_type,count(*) as segment_count from `hotel reservation dataset` 
group by market_segment_type order by segment_count desc ;

##9. How many reservations have a booking status of "Confirmed"?
select count(booking_status) as total_number_of_reservation from `hotel reservation dataset` 
where booking_status='Not_Canceled';

##10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_number_adult,sum(no_of_children) as total_number_kid
from `hotel reservation dataset`; 

##11. What is the average number of weekend nights for reservations involving children?
select round(avg(no_of_weekend_nights),2) as avg_weekend_reservation from `hotel reservation dataset`
where no_of_children > 0;

## 12. How many reservations were made in each month of the year?
SELECT DATE_FORMAT(STR_TO_DATE(arrival_date, '%d-%m-%Y'), '%m-%Y') AS year_month_,
COUNT(*) AS reservation_count FROM `hotel reservation dataset`
GROUP BY year_month_
ORDER BY year_month_;

##13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,avg(no_of_weekend_nights +no_of_week_nights)as avg_night 
from `hotel reservation dataset` group by room_type_reserved;

##14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select count(no_of_children) as no_of_children,room_type_reserved,count(room_type_reserved) as reservation_count, 
avg(avg_price_per_room) as avg_price from `hotel reservation dataset` where no_of_children > 0
group by room_type_reserved order by count(room_type_reserved) desc;

## 15. Find the market segment type that generates the highest average price per room.
select market_segment_type, max(avg_price_per_room) as highest_price
from `hotel reservation dataset` group by  market_segment_type order by highest_price desc;