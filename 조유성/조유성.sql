/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
      select s.name, s.major_id, s.gender, m.major_name
      from student s join major m on s.major_id=m.major_id
      where gender='male' AND major_name='소프트웨어공학전공';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
      select title,price
      from book
      where price>3000
      order by price desc;

-- 3. 모든 학생의 수를 조회하세요
     select count(*) as '학생 수'
     from student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
     select count(*) as '조건에 맞는 책의 개수'
     from book
     where author='김영한' or author='이일민';



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
movie_db라는 데이터 베이스를 만들고, 아래의 명령을 수행하여 테이블 2개를 생성해 보았습니다.
   CREATE TABLE movie (
    movie_id INT PRIMARY KEY,         
    movie_name VARCHAR(255),
    release_date VARCHAR(255)
);
CREATE TABLE actors (
    actor_id INT PRIMARY KEY,        
    name VARCHAR(255),            
    birth_date DATE,                
    nationality VARCHAR(100)          
);


-- Create(1개 이상)
   insert into movie
   values
   (1,'Tenet','2020-08-20'),
   (2, 'The Dark Knight', '2008-07-18'),
   (3, 'Interstellar', '2014-11-07'),
   (4, 'The Matrix', '1999-03-31'),
   (5, 'Parasite', '2019-05-30'),
   (6, 'Avengers: Endgame', '2019-04-26'),
   (7, 'Joker', '2019-10-04'),
   (8, 'Gladiator', '2000-05-05'),
   (9, 'The Lord of the Rings: The Return of the King', '2003-12-17'),
   (10, 'Forrest Gump', '1994-07-06'),
   (11, 'The Shawshank Redemption', '1994-09-23'),
   (12, 'Pulp Fiction', '1994-10-14'),
   (13, 'The Godfather', '1972-03-24'),
   (14, 'Titanic', '1997-12-19'),
   (15, 'Star Wars: A New Hope', '1977-05-25');
   
   insert into actors
   values
   (1,'조유성','1999-06-18','한국'),
   (2,'이승호','1999-11-11','한국'),
   (3,'박상민','1999-06-15','한국'),
   (4,'박용현','1999-1-18','한국');

-- Read(1개 이상)
   select *
   from movie
   where movie_name='Tenet';
   
   select *
   from movie
   where movie_id>3;
   
   select *
   from actors
   where nationality='한국';

-- Update(1개 이상)
   UPDATE movie
   SET movie_name = '테넷'
   WHERE movie_id = 1;

   UPDATE actors
   SET birth_date = '1998-12-25'
   WHERE actor_id = 2;


-- Delete(1개 이상)

   DELETE FROM movie
   WHERE movie_id = 10;

   DELETE FROM actors
   WHERE actor_id = 3;

