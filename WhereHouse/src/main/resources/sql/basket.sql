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

select (b_no, h_no, m_id) from basket;