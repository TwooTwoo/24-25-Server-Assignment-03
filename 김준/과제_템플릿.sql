show databases;
use hello;
show tables;
/* 
과제 A:
주어진 요구사항에 맞게 SQL 질의문을 만드세요
강의 자료로 주어진 테이블을 통해 만드시면 됩니다.
 */
-- 1. 전공 이름이 '소프트웨어공학전공'인 남학생을 모두 조회하세요
SELECT *
FROM student JOIN major USING(major_id)
WHERE major_name = '소프트웨어공학전공' AND gender = 'male';

-- 2. 30000원이 넘는 책의 이름과 가격을 조회하세요(가격에 대해 내림차순으로 정렬해야 합니다)
SELECT title '책의 이름', price '책의 가격'
FROM book
WHERE price > 30000
ORDER BY price DESC;

-- 3. 모든 학생의 수를 조회하세요
SELECT COUNT(*) AS '모든 학생의 수'
FROM student; 

-- 4. 저자 이름이 '김영한' 혹은 '이일민'인 책의 개수를 조회하세요
SELECT COUNT(*) '김영한 혹은 이일민이 작성한 책의 개수'
FROM book
WHERE author LIKE '%김영한%' OR author LIKE '%이일민%';
-- WHERE author IN ('김영한', '이일민) 도 가능

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

-- 제조사 테이블
-- 핸드폰 모델 테이블과 핸드폰 스펙 테이블에서 외래키로 참조하고 있는 칼럼이 있으므로 Manufacturer테이블을 먼저 만들어야 한다.
CREATE TABLE Manufacturer (
    manufacturer_name VARCHAR(20) PRIMARY KEY,
    location VARCHAR(20)
);

-- 핸드폰 모델 정보 저장 테이블
CREATE TABLE PhoneModel (
	model_id VARCHAR(20) PRIMARY KEY,
    model_name VARCHAR(20),
    manufacturer_name VARCHAR(20),
    price INT,
    -- Manufacturer 테이블의 manufacturer_name 을 참조하는 외래키로 지정
    FOREIGN KEY(manufacturer_name) REFERENCES Manufacturer(manufacturer_name)
);

-- 핸드폰 스펙 정보 저장 테이블
CREATE TABLE PhoneSpecs (
	model_id VARCHAR(20),
    processor VARCHAR(20) NOT NULL,
    ram SMALLINT DEFAULT 8,
    storage SMALLINT DEFAULT 128,
    battery_capacity SMALLINT,
    os VARCHAR(10),
    -- PhoneModel 테이블의 model_id를 참조하는 외래키로 지정
    CONSTRAINT fk_PhoneSpecs_PhoneModel FOREIGN KEY (model_id) REFERENCES PhoneModel(model_id)
);


INSERT INTO Manufacturer
VALUES('APPLE', 'California');

INSERT INTO Manufacturer
VALUES('SAMSUNG', 'Suwon');



INSERT INTO PhoneModel
VALUES('A3102', 'iPhone 15 Pro', 'APPLE', 1550000);

INSERT INTO PhoneModel
VALUES('A3287', 'iPhone 16 Pro', 'APPLE', 1550000);

INSERT INTO PhoneModel
VALUES('SM-S911N', 'Galaxy S23', 'SAMSUNG', 1155000);

INSERT INTO PhoneModel
VALUES('SM-S2921N', 'Galaxy S24', 'SAMSUNG', 1155000);

INSERT INTO PhoneModel
VALUES('SM-F741N', 'Galaxy Z Filp6', 'SAMSUNG', 1488200);



INSERT INTO PhoneSpecs
VALUES('A3102','A17 PRO', 8, 128, 3274, 'iOS 17.0.2');

INSERT INTO PhoneSpecs
VALUES('A3287','A18 PRO', 8, 128, 3582, 'iOS 18');

INSERT INTO PhoneSpecs
VALUES('SM-S911N','SD8 Gen 2', 8, 128, 3900, 'ANDROID 13');

INSERT INTO PhoneSpecs
VALUES('SM-S911N','Exynos 2400', 8, 256, 4000, 'ANDROID 14');

INSERT INTO PhoneSpecs
VALUES('SM-F741N','SD8 Gen 3', 12, 256, 4000, 'ANDROID 14');



-- Read(1개 이상)
-- 삽입 확인
SELECT * FROM Manufacturer;
SELECT * FROM PhoneModel;
SELECT * FROM PhoneSpecs;

-- 배터리 용량 내림차순 조회
SELECT *
FROM PhoneSpecs
ORDER BY battery_capacity DESC;

-- join을 이용한 램이 8기가인 핸드폰의 이름과 가격 조회
SELECT PM.model_name '램이 8기인 핸드폰의 이름', PM.price '가격'
FROM PhoneSpecs PS JOIN PhoneModel PM USING(model_id)
WHERE PS.ram = 8;

-- 애플 제품들의 가격의 합
SELECT CONCAT('총 ', sum(price), ' 원') AS '애플 제품들의 가격의 합'
FROM PhoneSpecs PS JOIN PhoneModel PM ON PS.model_id = PM.model_id
WHERE PM.manufacturer_name = 'APPLE';

-- 제조사별 모델명 + 배터리 용량(스칼라 서브쿼리 연습)
SELECT (SELECT PM.manufacturer_name
		FROM PhoneModel PM
		WHERE PM.model_id = PS.model_id) '제조사 이름',
		(SELECT PM.model_name
		 FROM PhoneModel PM
         WHERE PM.model_id = PS.model_id) '모델명',
         PS.battery_capacity '배터리 용량'
FROM PhoneSpecs PS;

-- 제조사별 storage가 128 이하인 제품의 개수 (인라인 뷰 이용)
SELECT PM.manufacturer_name '제조사', count(PS.model_id) '저장공간이 128 이하인 제품의 개수'
FROM (SELECT *
	  FROM PhoneSpecs PS
	  WHERE storage <= 128) PS JOIN PhoneModel PM ON PS.model_id = PM.model_id
GROUP BY PM.manufacturer_name;

-- Update(1개 이상)

-- TRANSACTION 사용 연습
START TRANSACTION;

UPDATE PhoneSpecs
SET ram = 8, storage = 128
WHERE model_id = 'A3287';

SAVEPOINT r8s128;

UPDATE PhoneSpecs
SET ram = 12, storage = 256
WHERE model_id = 'A3287';
-- 업데이트 내역 확인
SELECT * FROM PhoneSpecs;

SAVEPOINT r12s256;

UPDATE PhoneSpecs
SET ram = 16, storage = 512
WHERE model_id = 'A3287';

SAVEPOINT r16s512;

-- ROLLBACK 연습
ROLLBACK TO r12s256;

-- ROLLBACK 연습2
ROLLBACK TO r8s128;

-- ROLLBACK 연습3
-- 이전 순서로 ROLLBACK 할 때 이후의 SAVEPOINT들은 모두 삭제되기 때문에 해당 시점으로는 롤백 불가능
ROLLBACK TO r16s512;

-- 현재 상태 확인
SELECT * FROM PhoneSpecs;

COMMIT;



-- Delete(1개 이상)

-- 트랜잭션 시작
START TRANSACTION;
-- 현재 상태 세이브
SAVEPOINT nothing_deleted_table;

/* 
MySQL WORKBENCH의 SQL_SAFE_UPDATES의 역할
1. WHERE절 없는 UPDATE/DELETE 방지(default)
2. 사용자가 설정을 통해 특정 조건에서 특정 쿼리가 방지되도록 커스터마이징 가능
	ex) 대규모 테이블에 조건 없이 SELECT 쿼리 실행 방지
*/
-- SQL_SAFE_UPDATES 가 1 이라서 삭제 불가
DELETE FROM PhoneSpecs;

-- SQL_SAFE_UPDATES 모드 해제
/*
트랙잭션 안에서 SQL_SAFE_UPDATES을 0으로 바꾼 뒤 커밋하지 않으면 어떻게 될까?
SQL_SAFE_UPDATES는 세션 즉, 계정 단위로 영향을 미치는 명령어이다.
즉, root로 들어갔다면 root connection(root 세션)에, hello로 들어갔다면 hello connection에 영향을 미친다.
따라서 commit 하지 않아도 0인 상태가 유지된다.
*/
SET SQL_SAFE_UPDATES = 0;

-- 다시 DELETE 시도
DELETE FROM PhoneSpecs;

-- DELETE 적용 확인
SELECT * FROM PhoneSpecs;

-- 테이블 원래 상태로 롤백
ROLLBACK TO nothing_deleted_table;

-- 조건을 선택해서 삭제
DELETE FROM PhoneSpecs
WHERE ram = 8;
-- 확인
SELECT * FROM PhoneSpecs;

-- 테이블 원래 상태로 롤백
ROLLBACK TO nothing_deleted_table;

-- 커밋
COMMIT;

-- 커밋했으므로 롤백 불가
ROLLBACK TO nothing_deleted_table;

