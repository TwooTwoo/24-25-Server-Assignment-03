/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
select *
from student join major using(major_id)
where major_name = '소프트웨어공학전공' and gender = 'male';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
select title, price
from book
where price > 30000
order by price desc;

-- 3. 모든 학생의 수를 조회하세요
select count(*) as '모든 학생 수'
from student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
select count(*) as '책의 개수'
from book
where author = '김영한' or author = '이일민';

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

-- Create(1개 이상)

create table consumer (
consumer_id int primary key,				-- id 
consumer_name varchar(300),					-- 소비자 이름
visit_history date,							-- 방문날짜																											
buying_icecream_id int,						-- 사간 아이스크림 id(외래키) 
foreign key (buying_icecream_id) references icecream(icecream_id) on delete set null
);


insert into consumer
values (1, '김준', '2024-10-09', 4);
insert into consumer
values (2, '채경완', '2024-10-31', 1);
insert into consumer
values (3, '김동균', '2024-10-07', 5);
insert into consumer
values (4, '김우진', '2024-10-08', 6);
insert into consumer
values (5, '최인호', '2024-10-09', 22);
insert into consumer
values (6, '권지후', '2024-10-02', 26);
insert into consumer
values (7, '김기웅', '2024-10-07', 29);
insert into consumer
values (8, '김보민',  '2024-10-06', 17);
insert into consumer	
values (9, '김태우', '2024-10-05', 13);
insert into consumer
values (10, '박대경', '2024-10-09', 18);
insert into consumer
values (11, '박세은', '2024-10-01', 19);
insert into consumer
values (12, '송인석', '2024-10-09', 11);
insert into consumer
values (13, '송하은', '2024-10-08', 22);
insert into consumer
values (14, '어경빈', '2024-09-30', 1);
insert into consumer
values (15, '윤준석', '2024-10-08', 3);
insert into consumer
values (16, '정상화', '2024-10-09', 14);
insert into consumer
values (17, '조유성', '2024-10-04', 11);
insert into consumer
values (18, '현정빈', '2024-10-09', 12);

create table icecream(
icecream_id int primary key,			-- id
icecream_name varchar(100),				-- 아이스크림 이름
price int ,								-- 가격
expiration_date date,					-- 유통기한
stock_quantity varchar(100)				-- 재고량
);

-- icecream table insert문
insert into icecream
values(1, '엄마는 외계인', 3900, '2024-10-07', 'sold_out');
insert into icecream
values(2, '애플 민트', 3900, '2024-12-17', '5kg');
insert into icecream
values(3, '아몬드 봉봉', 1000000000, '2025-02-18', '2kg');
insert into icecream
values (4, '청포도 샤베트', '3900', '2024-11-11', '10kg');
insert into icecream
values (5, '월넛', '3900', '2025-02-01', '12kg');
insert into icecream
values (6, '자몬카 아몬드 훠지', '3900', '2025-10-31', '16kg');
insert into icecream
values (7, '초콜릿', '3900', '2025-06-23', '10kg');
insert into icecream
values (8, '피스타치오 아몬드', '3900', '2024-10-12', '13kg');
insert into icecream
values (9, '그린티', '3900', '2025-01-14', '12kg');
insert into icecream
values (10, '초콜릿 무스', '3900', '2025-09-12', '6kg');
insert into icecream
values (11, '바닐라', '3900', '2025-02-21', '15kg');
insert into icecream
values (12, '바람과함께사라지다', '3900', '2024-01-07', '4kg');
insert into icecream
values (13, '31요거트', '3900', '2025-03-03', '5kg');
insert into icecream
values (14, '베리베리 스트로베리', '3900', '2025-05-14', '7kg');
insert into icecream
values (15, '오래오 쿠키앤 크림', '3900', '2025-07-07', 'sold_out');
insert into icecream
values (16, '사랑에 빠진 딸기', '3900', '2025-04-07', '2kg');
insert into icecream
values (17, '슈팅스타', '3900', '2025-10-07', '5kg');
insert into icecream
values (18, '체리쥬빌레', '3900', '2024-12-25', '9kg');
insert into icecream
values (19, '레인보우샤베트','3900', '2024-10-28', '4kg');
insert into icecream
values (20, '민트초콜릿 칩', '3900', '2025-01-01', 'sold_out');
insert into icecream
values (21, '뉴옥치즈케이크', '3900', '2025-10-07', '2kg');
insert into icecream
values (22, '망고탱고', '3900', '2025-10-07', '3kg');
insert into icecream
values (23, '피치 요거트', '3900', '2024-10-27', '1kg');
insert into icecream
values (24, '이상한나라의 슈팅스타', '3900', '2025-02-22', '2kg');
insert into icecream
values (25, '리콜라 레몬민트 샤베트', '3900', '2024-12-07', '1kg');
insert into icecream
values (26, '수박 hero', '3900', '2025-05-07', '3kg');
insert into icecream
values (27, '나주베 소르베', '3900', '2025-06-07', '1kg');
insert into icecream
values (28, '우주 라이크 봉봉', '3900', '2025-10-07', 'sold_out');
insert into icecream
values (29, '블루 서퍼 비치', '3900', '2024-10-07', '1kg');


-- Read(1개 이상)
select *   					
from consumer c join icecream i on (c.buying_icecream_id = i.icecream_id);

select consumer_name
from consumer
where visit_history = '2024-10-09';

-- Update(1개 이상)
SET sql_safe_updates = 0;

update icecream
set stock_quantity = '3kg'
where icecream_id = 15;

update consumer
set buying_icecream_id = 13
where consumer_id = 12;

-- Delete(1개 이상)
delete from consumer 
where visit_history = '2024-10-08';

delete from icecream
where icecream_id =29;
