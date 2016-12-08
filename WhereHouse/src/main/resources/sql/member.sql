drop table member;

create table member(
	m_id varchar2(50) primary key,
	m_no number not null,
	m_name varchar2(50) not null,
	m_pass varchar2(50) not null,
	m_phone varchar2(50) not null,
	m_score number default 0,
	m_regdate date default sysdate,
	m_dropdate date,
	m_scorecnt number default 0
);

drop table member_grade;
create table member_grade(
	r_no number not null,
	m_id varchar(50) not null,
	g_score number not null,
	primary key(r_no,m_id)
);

drop sequence member_seq;

create sequence member_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
select * from member;


SELECT h_no
     , SQRT( POWER(( 37.4784059 - pi_x) * 110979.309, 2)
           + POWER((126.88102909999999 - pi_y) *  88907.949, 2)
           ) z
  FROM wido
     , (SELECT     37.4784059 v_x    -- 기준좌표-위도
             ,    126.88102909999999 v_y    -- 기준좌표-경도
             , 110979.309     r_x    -- 위도-거리 환산계수
             ,  88907.949     r_y    -- 경도-거리 환산계수
             ,    1000.000     v_z    -- 검색반경
          FROM dual
        )
 WHERE SQRT( POWER((v_x - pi_x) * r_x, 2)
           + POWER((v_y - pi_y) * r_y, 2)
           ) <= v_z
   AND pi_x BETWEEN v_x - v_z / r_x AND v_x + v_z / r_x
   AND pi_y BETWEEN v_y - v_z / r_y AND v_y + v_z / r_y
 ORDER BY z
;

--37.4784059 , 126.88102909999999 현재 gps(가산)


create table wido(
h_no number,
pi_x varchar2(50), 
pi_y varchar2(50)
);

insert into wido (h_no, pi_x, pi_y) values ('1','37.47944','126.88113');
insert into wido (h_no, pi_x, pi_y) values ('2','37.48012','126.88146');
insert into wido (h_no, pi_x, pi_y) values ('3','37.48082','126.88177');
insert into wido (h_no, pi_x, pi_y) values ('4','37.48168','126.88234');
insert into wido (h_no, pi_x, pi_y) values ('5','37.48261','126.88304');

select count(*)
from member_grade
where r_no=1

