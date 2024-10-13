create table LoL_Champion(
champion_id int primary key,
champion_name varchar(30),
champion_type varchar(30),
champion_line varchar(30)
);

insert into LoL_Champion
values ( 1, '탈론', '암살자', '미드');

insert into LoL_Champion
values ( 2, '사이온', '탱커', '탑');

insert into LoL_Champion
values ( 3, '카직스', '암살자', '정글');

insert into LoL_Champion
values ( 4, '카이사', '원딜', '바텀');

insert into LoL_Champion
values ( 5, '블리츠크랭크', '서폿', '바텀');

insert into LoL_Champion
values ( 6, '아칼리', '암살자', '미드');

create table champion_skills(
champion_id int primary key,
Q_skill varchar(30),
W_skill varchar(30),
E_skill varchar(30),
R_skill varchar(30)
);

insert into champion_skills
values ( 1, '녹서스식 외교', '갈퀴손', '암살자의 길', '그림자 공격');

insert into champion_skills
values ( 2, '대량 학살 강타', '영혼의 용광로', '학살자의 포효', '멈출 수 없는 맹공');

insert into champion_skills
values ( 3, '공포 감지', '공허의 가시', '도약', '공허의 습격');

insert into champion_skills
values ( 4, '이케시아 폭우', '공허추적자', '고솟 충전', '사냥본능');

insert into champion_skills
values ( 5, '로켓 손', '폭주', '강철 주먹', '정전기장');

insert into champion_skills
values ( 6, '오연투척검', '황혼의 장막', '표장곡예', '무결처형');

select *
from lol_champion
where champion_id = 1;

SET SQL_SAFE_UPDATES = 0;

update lol_champion
set champion_type = '브루저'
where champion_id = 1;

delete from lol_champion
where champion_id = 6;




