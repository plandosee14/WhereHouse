drop table comments;
create table comments(
	c_no number		primary key,
	m_no number		not null,
	m_name varchar2(50)	not null,
	h_no number	references house(h_no),
	c_content varchar(1500) not null,
	c_regdate date		default sysdate,
	c_modifydate date	default sysdate
);
select * from house;
select * from MEMBER;
select * from COMMENTS;

insert into comments(c_no, m_no, m_name, h_no, c_content) 
values (comments_seq.nextval, 71, 'ø¿¡§»∆', 23, '¡π∑¡ø‰');

drop sequence comments_seq;
create sequence comments_seq
start with 1
increment by 1
nocycle
nocache;

delete from comments;



