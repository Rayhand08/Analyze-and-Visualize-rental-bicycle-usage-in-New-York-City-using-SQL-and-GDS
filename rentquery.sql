--1 Total number of trips that occurred
select count(start_station_id) as total_perjalanan
from `bigquery-public-data.new_york_citibike.citibike_trips`
where start_station_id is not null;

--2 Average trip duration
select round(avg(tripduration)) as ratarata_durasi
from `bigquery-public-data.new_york_citibike.citibike_trips`
where start_station_id is not null;

--3 Average number of trips per day
with perhari_table AS (
select date(starttime) as tanggal,
       count(start_station_id) as jumlah
  from `bigquery-public-data.new_york_citibike.citibike_trips`
  where start_station_id is not null
  group by 1
  order by 1 ASC
) 
select round(avg(jumlah)) as rata_rata_perhari
from perhari_table;

--4 Average number of bicycles used per day 
with sepeda_table as (
  select count(distinct bikeid) as jumlah,
         date(starttime) as tanggal
  from `bigquery-public-data.new_york_citibike.citibike_trips`
  where start_station_id is not null
  group by 2
  order by 2 ASC
) 
select ROUND(avg(jumlah)) as rata_rata_sepeda
from sepeda_table;