drop table reservation;
create table reservation(
	r_no number		primary key,--�����ȣ
	h_no number		references house(h_no), --���ҹ�ȣ
	m_id varchar2(50)	references member(m_id), --����ȸ�����̵�
	r_startdate date    not null, --������۳�¥
	r_enddate   date    not null, --���� ����¥
	r_fare      number  not null, --���������� ���
	r_peoplecnt    number not null, --�����ο�
	r_state        number default 0, --����Ϸ� '0', �� �ٳ�� '1' , �򰡿Ϸ� '2' 
	r_sysdate    date default sysdate --�����Ϸ��� �ð�
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
values (reservation_seq.nextval, 44,'plandosee14@gmail.com','2016-12-15','2016-12-17',140000,1);

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