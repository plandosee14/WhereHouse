drop table reservation;
create table reservation(
	r_no number		primary key,--예약번호
	h_no number		references house(h_no), --숙소번호
	m_id varchar2(50)	references member(m_id), --예약회원아이디
	r_startdate date    not null, --예약시작날짜
	r_enddate   date    not null, --예약 끝날짜
	r_fare      number  not null, --할인적용한 요금
	r_peoplecnt    number not null, --예약인원
	r_state        number default 0, --예약완료 '0', 집 다녀옴 '1' , 평가완료 '2' 
	r_sysdate    date default sysdate --결제완료한 시간
);



where mid = #{mid}
     and h_no =#{h_no}
     and r_state == 1
     
drop sequence reservation_seq;
create sequence reservation_seq
start with 1
increment by 1
nocycle
nocache;

select * from reservation;

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 66,'plandosee14@gmail.com','2016-12-19','2016-12-21',45000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 66,'plandosee14@gmail.com','2016-12-21','2016-12-22',15000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 9,'ojh5797@naver.com','2016-12-04','2016-12-05',45000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 9,'ojh5797@naver.com','2016-12-06','2016-12-07',45000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 11,'ojh5797@naver.com','2016-12-08','2016-12-09',40000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 11,'ojh5797@naver.com','2016-12-08','2016-12-09',40000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 11,'ojh5797@naver.com','2016-12-08','2016-12-09',40000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 11,'ojh5797@naver.com','2016-12-08','2016-12-09',40000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 11,'ojh5797@naver.com','2016-12-08','2016-12-09',40000,1);



delete reservation

select * from house;


select r.r_no, h.h_no, r.r_startdate, r.r_enddate, r.r_fare, r.r_peoplecnt, h.h_thumnail, h.m_phone
		from house h, reservation r
		where h.h_no = r.h_no
      		and r.m_id = 'ojh5797@naver.com';
      		

      		--트리거
create or replace trigger h_state_update
after insert on reservation
for each row
begin 
   update house set h_state=1
      where (h_enddate-h_startdate)<=h_rdays and
       h_no = :new.h_no;
end;
/