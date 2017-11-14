.open prob1.db
.headers on
.mode column
.width 50

select name from people where name like 'John %' limit 10;

select title, year from movies where year is not NULL order by year asc limit 5;

select avg(runtime) from movies where year = 1963;

select title from movies where id in 
(
	select movie_id from ratings where rating in 
	(select max(rating) from ratings)
	limit 10
);

select title from movies where id in 
(
	select movie_id from cast_members where person_id in 
	(select id from people where name == 'Daniel Craig')
	limit 10
);

select avg(runtime) from movies 
where id in (select movie_id from ratings where rating > 9.0); 

select count(person_id) from cast_members where movie_id in 
(
	select id from movies 
	where runtime in (select max(runtime) from movies)
);

select name from people where id in 
(
	select person_id
	from directors 
	group by person_id
	having count(movie_id) in 
	(
		select count(movie_id)
		from directors 
		group by person_id
		order by count(movie_id) desc
		limit 1
	)
);

select name1 as dir_name, name2 as cst_name from 
(
	(select id as id1, name as name1 from people)
	cross join
	(select id as id2, name as name2 from people)
)
where (id1, id2) in 
(
	select directors.person_id as dir_id, cast_members.person_id as cst_id from 
	(
		directors
		inner join
		cast_members
		on directors.movie_id = cast_members.movie_id and directors.person_id != cast_members.person_id
	) 
	group by directors.person_id, cast_members.person_id 
	having count(*) in 
	(
		select count(*) as cnt from 
		(
			directors
			inner join
			cast_members
			on directors.movie_id = cast_members.movie_id and directors.person_id != cast_members.person_id
		)
		group by directors.person_id, cast_members.person_id
		order by count(*) desc
		limit 1
	)
);

select name from people where id in
(
	select person_id from
	(
		select person_id, year
		from cast_members, movies 
		where cast_members.movie_id = movies.id
	)
	group by person_id
	having max(year) - min(year) in
	(
		select max(year) - min(year) from 
		(
			select person_id, year
			from cast_members, movies 
			where cast_members.movie_id = movies.id
		)
		group by person_id
		order by max(year) - min(year) desc
		limit 1
	)
);

create table numbers(data int);
insert into numbers values(0);

create view pairs as
select pid1, pid2 from
(
	(select movie_id as mid1, person_id as pid1 from cast_members)
	inner join
	(select movie_id as mid2, person_id as pid2 from cast_members)
	on mid1 = mid2 and pid1 != pid2
);

alter table people add column bacon_degree int;
update people set bacon_degree = NULL;
update people set bacon_degree = 0 where name ='Kevin Bacon';

pragma recursive_triggers = on;
create temp trigger bacon_degree_update
after update of data on numbers
when new.data < 3
begin
	update people set bacon_degree = new.data + 1
	where bacon_degree is null and id in
	(
		select pid1 from pairs, people
		where pairs.pid2 = people.id and people.bacon_degree = new.data 
		group by pid1
	);
	update numbers set data = data + 1;
end;

update numbers set data = 0;
select name, bacon_degree from people where name in ('Sean Connery', 'Humphrey Bogart', 'Shirley Temple');

drop trigger bacon_degree_update;
