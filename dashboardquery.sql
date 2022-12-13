-- Dashboard Query

-- Dashboard 1
select date(starttime) tanggal_trip,
       name,
	   tripduration,
       bikeid,
       gender,
	   start_station_latitude,
	   start_station_longitude,
       count(*) total_trip,
       count(distinct bikeid) total_sepeda
from `bigquery-public-data.new_york_citibike.citibike_trips`  a
left join `bigquery-public-data.new_york_citibike.citibike_stations` b
on a.start_station_id = b.station_id
where tripduration is not null
group by 1,2,3,4,5,6,7
order by 1 ASC;

-- Dashboard 2
select date(starttime) tanggal_trip,
       name,
	   tripduration,
       bikeid,
       gender,
	   start_station_latitude,
	   start_station_longitude,
       count(*) total_trip,
       count(distinct bikeid) total_sepeda
from `bigquery-public-data.new_york_citibike.citibike_trips`  a
left join `bigquery-public-data.new_york_citibike.citibike_stations` b
on a.start_station_id = b.station_id
where tripduration is not null
group by 1,2,3,4,5,6,7
order by 1 ASC;

