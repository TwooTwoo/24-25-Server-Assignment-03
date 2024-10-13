/*과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
select * 
from student join major using(major_id)
where major_name = '소프트웨어공학전공' AND gender = 'male';


-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
select title ,price
from book
where price >=30000
order by price desc;

-- 3. 모든 학생의 수를 조회하세요
select count(*)
from student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
select count(*)
from book
where author IN ('김영한','이일민')