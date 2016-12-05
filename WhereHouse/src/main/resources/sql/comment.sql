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
select * from house_grade;

insert into comments(c_no, m_no, m_name, h_no, c_content) 
values (comments_seq.nextval, 71, 'ø¿¡§»∆', 23, '¡π∑¡ø‰');

drop sequence comments_seq;
create sequence comments_seq
start with 1
increment by 1
nocycle
nocache;

delete from comments;

create table house_grade(
	h_no number references house(h_no),
	r_no number references reservation(r_no),
	g_rightscore number not null,
	g_cleanscore number not null,
	g_checkscore number not null,
	g_commuscore number not null,
	
	primary key(h_no, r_no)
);



