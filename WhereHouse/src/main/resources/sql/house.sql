drop table house;
create table house(
	b_no number		primary key,
	h_no number		references house(h_no),
	m_id varchar2(50)	references member(m_id)
);


drop sequence house_seq;
create sequence house_seq
start with 1
increment by 1
nocycle
nocache;

select * from house;