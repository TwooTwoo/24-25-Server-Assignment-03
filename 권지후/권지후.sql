/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요

	SELECT *
    FROM student s
    JOIN major m 
    ON s.major_id = m.major_id
    WHERE s.gender = 'male' AND m.major_name = '소프트웨어공학전공';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)

	SELECT title, price
	FROM book
	WHERE price >30000
    ORDER BY price desc;

-- 3. 모든 학생의 수를 조회하세요

	SELECT count(*)
	FROM student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요

	SELECT count(*)
	FROM book
	WHERE author = '김영한' or author = '이일민';


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
-- 음악 데이터 베이스 구성 (앨범 테이블, 가수테이블)
	CREATE TABLE singer (
	singer_id int primary key,
	name varchar(300),
	num_members int
	);

	CREATE TABLE album (
    album_id INT PRIMARY KEY,
    title VARCHAR(300),
    price INT,
    singer_id INT,  
    CONSTRAINT album_singer_fk FOREIGN KEY (singer_id) REFERENCES singer(singer_id) 
	);



-- Create(1개 이상)

	INSERT INTO singer
	VALUES(1, '뉴진스', 5);

	insert into singer
	VALUES(2, '에스파', 4);

	INSERT INTO album
	VALUES(1, '어텐션', 17900, 1);

	INSERT INTO album
	VALUES(2, 'omg', 22900, 1 );

	INSERT INTO album
	VALUES(3, 'Armageddon', 24000, 1 );


-- Read(1개 이상)

	SELECT *
	FROM album
	WHERE album_id = 3;

	SELECT *
	FROM singer
	WHERE singer_id = 1;

-- Update(1개 이상)

	SET SQL_SAFE_UPDATES = 0;

	UPDATE album
	SET singer_id = 2;

-- Delete(1개 이상)

	DELETE FROM album
	WHERE album_id = 2;
    
	DELETE FROM album
    WHERE album_id = 1;
    
    DELETE FROM singer
    WHERE singer_id = 1;