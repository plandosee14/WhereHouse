drop table comment;
create table comment(
	c_no number		primary key,
	m_no varchar2(50)	references member(m_no),
	m_name varchar2(50)	references member(m_name),
	h_no varchar2(50)	references house(h_no),
	c_content varchar(1500) not null,
	c_regdate date		default sysdate,
	c_modifydate date	default sysdate
);


drop sequence comment_seq;
create sequence comment_seq
start with 1
increment by 1
nocycle
nocache;

drop table basket;
create table basket(
	b_no number		primary key,
	h_no number		references house(h_no),
	m_id varchar2(50)	references member(m_id)
);


drop sequence basket_seq;
create sequence basket_seq
start with 1
increment by 1
nocycle
nocache;


