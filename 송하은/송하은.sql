/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
SELECT * FROM student
JOIN major using(major_id)
WHERE major_name='소프트웨어공학전공' AND gender='male';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
SELECT title "책의 이름", price "가격"
FROM book
WHERE price >= 30000
ORDER BY price DESC;

-- 3. 모든 학생의 수를 조회하세요
SELECT count(*) "총 학생 수" FROM student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
SELECT count(*) "저자 이름이 '김영한' 혹은 '이일민'인 책의 개수"
FROM book
WHERE author='김영한' OR author='이일민';

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
create table user (
                      id BIGINT primary key,
                      name TEXT,
                      email TEXT
);
create table board (
                       id BIGINT PRIMARY KEY,
                       title TEXT,
                       content TEXT,
                       writer TEXT,
                       writeDate date,
                       userId BIGINT,
                       FOREIGN KEY(userId) REFERENCES user(id)
);

-- Create(1개 이상)
insert into user values(100,'백번이','my1@com');
insert into user values(200,'이백번이','my2@com');
insert into user values(300,'삼백번이','my3@com');
insert into user values(400,'사백번이','my4@com');
insert into user values(500,'오백번이','my5@com');

insert into board values(1,'게시물1','본문1','작성자1','2024-10-07',100);
insert into board values(2,'게시물2','본문2','작성자2','2024-10-07',100);
insert into board values(3,'게시물3','본문3','작성자3','2024-10-07',200);
insert into board values(4,'게시물4','본문4','작성자4','2024-10-07',400);
insert into board values(5,'게시물5','본문5','작성자5','2024-10-07',200);
insert into board values(6,'게시물6','본문6','작성자6','2024-10-07',500);

-- Read(1개 이상)
-- 1. 전체 board 조회
SELECT * FROM board;

-- 2. 게시판 title 이 '게시물2' 인 유저의 이메일 조회
SELECT email
FROM board b JOIN user u
    ON b.userId = u.id
WHERE b.title='게시물2';

-- Update(1개 이상)
-- 1. title 이 '게시물2' 인 게시물의 작성자 이름을 '송하은'으로 바꾼다.
UPDATE board
SET writer='송하은'
WHERE title='게시물2';

-- 2. user 의 name 이 '백번이' 인 사람의 name을 '송하은'으로 바꾼다.
UPDATE board
SET writer='송하은'
WHERE title='게시물2';

-- Delete(1개 이상)
-- 1. user name 이 '이백번이' 인 사람의 게시물을 삭제한다.
DELETE FROM board
WHERE userId = (SELECT id FROM user WHERE name='이백번이');

-- 2. writer 이름에 '작성자'가 들어간 게시물들을 모두 지운다.
DELETE FROM board
WHERE writer LIKE '%작성자%';
