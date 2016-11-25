drop table member;

create table member(
	m_id varchar2(50) primary key,
	m_no number not null,
	m_name varchar2(50) not null,
	m_pass varchar2(20) not null,
	m_phone varchar2(20) not null,
	m_score number default 0,
	m_regdate date default sysdate,
	m_dropdate date,
	m_scorecnt number default 0
);

drop sequence member_seq;

create sequence mmember_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
select * from member;
