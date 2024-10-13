/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
select *
from student join major
using (major_id)
where major_name= '소프트웨어공학전공' and gender = 'male';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
select title, price
from book
where 30000 < price;

-- 3. 모든 학생의 수를 조회하세요
select count(*)
from student;

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
select count(*)
from boproductorderscustomercustomerordersproductok
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
-- 고객테이블
create table customer (
customer_id int primary key,
name varchar(100),
email varchar(100),
phone_number varchar(100),
address varchar(100)
);

-- 상품 테이블
create table product (
productproductcustomer_id int primary key,
name varchar(100),
price int
);

-- 주문 테이블
create table orders (
orders_id int primary key,
customer_id int,
amount int, 
foreign key (customer_id) references customer(customer_id)
);

-- Create(1개 이상)
insert into customer (customer_id, name, email, phone_number, address)
values (1, '어경빈', 'eukyungbin@gmail.com', 010-5534-4980, '서울');

insert into customer (customer_id, name, email, phone_number, address)
values (2, '어경철', 'eukyungcheol@gmail.com', 010-5521-8066, '동탄');

insert into product (product_id, name, price)
values (1, '반바지', 5000);

insert into orders (orders_id, customer_id, amount)
values (1, 1, 5);

insert into orders (orders_id, customer_id, amount)
values (2, 2, 1);


-- Read(1개 이상)
select *
from customer;

-- Update(1개 이상)
set sql_safe_updates = 0;
update product
set name = '반팔티'
where product_id = 1;

-- Delete(1개 이상)
delete from orders
where customer_id = '2';



