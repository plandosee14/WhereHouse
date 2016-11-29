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


insert into basket(b_no, h_no, m_id) values(basket_seq.nextval, 19, 'powerfeel123@naver.com');
insert into basket(b_no, h_no, m_id) values(basket_seq.nextval, 20, 'ojh5797@naver.com');

		select b_no, h_no, m_id
		from basket
		where m_id='ojh5797@naver.com'