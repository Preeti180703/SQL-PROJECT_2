/* 1] Write a query where it should contain all the data of the 
movies which were released after 1995 having their movie 
duration greater than 120 and should be including A in their 
movie title.*/

select * 
from movie
where mov_year > 1995
and mov_time > 120 
and mov_title like '%A%';
 
/* 2] Write an SQL query to find the actors who played a role in the 
movie 'Chinatown'.  Fetch all the fields of actor table. (Hint: Use 
the IN operator) */

select *
from actor 
where act_id in 
(select act_id from cast where
 mov_id=(select mov_id from movie where mov_title='chinatown'));


/* 3] Write an SQL query for extracting the data from the ratings 
table for the movie who got the maximum number of ratings. */

select * 
from ratings
where num_o_ratings=(select max(num_o_ratings) from ratings);

/* 4] Write an SQL query to determine the Top 7 movies which were 
released in United Kingdom. Sort the data in ascending order 
of the movie year. */


select * 
from movie
where mov_rel_country='uk'
order by mov_dt_rel asc
limit 7;

/* 5] Set the language of movie language as 'Chinese' for the movie 
which has its existing language as Japanese and their movie 
year was 2001. */

update movie 
set mov_lang='chinese'
where mov_lang='japanese'
and mov_year=2001;

select * from movie;


/* 6] Print genre title, maximum movie duration and the count the 
number of movies in each genre. */


select g.gen_title , max(m.mov_time) as max_duration , count(m.mov_id) as total_movie
from movie_genres as mg
join movie as m using(mov_id)
join genres as g 
on mg.gen_id=g.gen_id
group by g.gen_title;


/* 7] Create a view which should contain the first name, last name, 
title of the movie & role played by particular actor. */

create view actor_movie_role5 as 
select a.act_fname,a.act_lname ,m.mov_title,c.role
from actor as a
join cast as c
on a.act_id=c.act_id
join movie as m
on c.mov_id=m.mov_id;

select * from actor_movie_role5
where act_fname = 'james' and act_lname = 'Stewart';


# 8] Display the movies that were released before 31st March 1995. 

select mov_title,mov_dt_rel
from movie
where mov_dt_rel < '1995/03/3' ;


/* 9] Write a query which fetch the first name, last name & role 
played by the actor where output should all exclude Male 
actors.*/

select a.act_fname,a.act_lname,c.role
from actor as a
join cast as c
on a.act_id=c.act_id
where a.act_gender<>'m';

/* 10] Insert five rows into the cast table where the ids for movie 
should be 936,939,942,930,941 and their respective roles 
should be Darth Vader, Sarah Connor, Ethan Hunt, Travis 
Bickle, Antoine Doinel & their actor ids should be set up as 
126,140,135,131,144.*/


insert into cast (act_id,mov_id,role) values
(126,936,'darth vader'),
(140,939,'sarah connor'),
(135,942,'ethan hunt'),
(131,930,'travis bickle'),
(144,941,'antoine doine');

select * from cast;