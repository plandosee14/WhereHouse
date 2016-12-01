drop table reservation;
create table reservation(
	r_no number		primary key,--예약번호
	h_no number		references house(h_no), --숙소번호
	m_id varchar2(50)	references member(m_id), --예약회원아이디
	r_startdate date    not null, --예약시작날짜
	r_enddate   date    not null, --예약 끝날짜
	r_fare      number  not null, --할인적용한 요금
	r_peoplecnt    number not null, --예약인원
	r_state        number default 0, --예약완료 '0', 집 다녀옴 '1'
	r_sysdate    date default sysdate --결제완료한 시간
);


drop sequence reservation_seq;
create sequence reservation_seq
start with 1
increment by 1
nocycle
nocache;

select * from reservation;

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 27,'powerfeel123@naver.com','2016-12-01','2016-12-03',600000,1);