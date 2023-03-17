use moviedb;

# Write a SQL query to find the actor who were cast in the movie 'Annie Hall'. 
# Return actor first name, last name and role.

select * from actors;
select * from movie_cast;
select * from movie;


select actors.act_fname, actors.act_lname, movie_cast.role
from actors 
inner join movie_cast on actors.act_id = movie_cast.act_id 
inner join movie on movie_cast.mov_id=movie.mov_id 
where mov_title='Annie Hall';

# write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. 
#Return director first name, last name and movie title.

select * from director;
select * from movie;
select* from movie_direction;


select director.dir_fname, director.dir_lname, movie.mov_title 
from director 
inner join movie_direction on director.dir_id=movie_direction.dir_id 
inner join movie on movie_direction.mov_id= movie.mov_id
where mov_title='Eyes Wide Shut';


#find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.

select *from director;
select * from movie;
select* from movie_direction;
select * from  movie_cast;

select director.dir_fname, director.dir_lname, movie_cast.role
from  director 
inner join movie_direction 
on director.dir_id=movie_direction.dir_id 
inner JOIN movie on movie_direction.mov_id=movie.mov_id
inner join movie_cast on movie_cast.mov_id=movie.mov_id 
where role='Sean Maguire';
  
#find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.). 
#Return actor first name, last name, movie title and release year. 

select*from actors;
select * from movie;
select * from movie_cast;

select actors.act_fname, actors.act_lname, movie.mov_title, movie.mov_year
from actors 
inner join movie_cast on actors.act_id=movie_cast.act_id
inner join movie on movie_cast.mov_id=movie.mov_id
where mov_year not between 1990 and 2000;

#find the directors with the number of genres of movies. Group the result set on director first name, last name and generic title.
#Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of 
#genres of movies.

select * from director;
select* from movie_genres;
select* from movie_direction;
select* from genres;


select dir_fname, dir_lname, gen_title, count(gen_title)
from director 
inner join movie_direction on director.dir_id=movie_direction.dir_id
inner join movie_genres on movie_direction.mov_id=movie_genres.mov_id 
inner join genres on movie_genres.gen_id=genres.gen_id
group by dir_fname, dir_lname, gen_title
Order by dir_fname asc,dir_lname asc;






