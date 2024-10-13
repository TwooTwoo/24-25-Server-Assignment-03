/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
select s.*
from major m join student s
on m.major_id = s.major_id
where major_name = '소프트웨어공학전공' and gender = 'male';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
select title, price
from book
where price > 30000
order by price desc;

-- 3. 모든 학생의 수를 조회하세요
select count(*) as count_student
from student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
select count(*) count_book
from book
where author IN('김영한','이일민');


/*
과제 B:
1. 자신만의 데이터베이스를 만드세요.
	- 주제 무관(2주차 과제에 사용한 주제를 재사용해도 상관 없습니다)
    - 한 주제에 대해 데이터베이스를 구성하되, 테이블을 2개 이상 사용해야 합니다(반드시 기본키-외래키로 테이블을 연결할 필요는 없습니다)
	- 예시) 학교 데이터베이스 구성 -> 학생 테이블, 전공 테이블 사용
2. 1번에서 만든 데이터베이스를 통해 CRUD 질의문을 만드세요
	- Create, Read, Update, Delete에 각각 1개 이상의 질의문을 만들어야 합니다
    - Read, Update, Delete는 기본키를 이용한 질의문을 사용해도 좋고, 본인만의 방식으로 자유롭게 만드셔도 좋습니다.
*/
-- 자신만의 데이터베이스 만들기(테이블 2개 이상 생성)
create table movie(
movie_id int primary key,
movie_title varchar(100),
director varchar(100),
release_year year
);

create table actor(
actor_id int primary key,
actor_name varchar(100),
gender varchar(100),
birthday date
);

-- Create(1개 이상)
insert into movie(movie_id, movie_title, director, release_year)
values(1,'파묘','장재현',2024);

insert into movie(movie_id, movie_title, director, release_year)
values(2,'대도시의 사랑법','이언희',2024),
(3,'올드보이','박찬욱',2003),
(4,'전우치','최동훈',2009);

insert into movie
values(5, '외계+인 1부','최동훈',2022),
(6, '외계+인 2부', '최동훈',2024);

insert into actor(actor_id, actor_name, gender, birthday)
values(1, '김고은', 'female', '1991-07-02');

insert into actor(actor_id, actor_name, gender, birthday)
values(2, '최민식', 'male', '1962-04-27');

insert into actor(actor_id, actor_name, gender, birthday)
values(3, '유해진', 'male', '1970-01-04');

insert into actor(actor_id, actor_name, gender, birthday)
values(4, '이도현', 'male', '1995-04-11');

insert into actor
values(5, '강동원', 'male', '1990-01-18');

-- Read(1개 이상)
select * from actor;

select * 
from actor 
where year(birthday) between 1991 and 1996; 

select movie_title, release_year
from movie
where director = '최동훈';

-- Update(1개 이상)
-- safe mode를 끄는 명령어
SET SQL_SAFE_UPDATES = 0;

update movie 
set movie_title = '암살', release_year = 2015
where movie_id = 6;

update actor
set birthday = '1981-01-18'
where actor_id = 5;

-- Delete(1개 이상)
delete from movie
where director = '이언희';

delete from actor
where gender = 'female';
