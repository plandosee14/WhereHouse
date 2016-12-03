drop table reservation;
create table reservation(
	r_no number		primary key,--�����ȣ
	h_no number		references house(h_no), --���ҹ�ȣ
	m_id varchar2(50)	references member(m_id), --����ȸ�����̵�
	r_startdate date    not null, --������۳�¥
	r_enddate   date    not null, --���� ����¥
	r_fare      number  not null, --���������� ���
	r_peoplecnt    number not null, --�����ο�
	r_state        number default 0, --����Ϸ� '0', �� �ٳ�� '1'
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
values (reservation_seq.nextval, 27,'powerfeel123@naver.com','2016-12-01','2016-12-03',600000,1);

insert into reservation (r_no, h_no, m_id, r_startdate, r_enddate, r_fare, r_peoplecnt)
values (reservation_seq.nextval, 22,'ojh5797@naver.com','2016-12-01','2016-12-03',600000,1);

select * from house;


select r.r_no, h.h_no, r.r_startdate, r.r_enddate, r.r_fare, r.r_peoplecnt, h.h_thumnail, h.m_phone
		from house h, reservation r
		where h.h_no = r.h_no
      		and r.m_id = 'ojh5797@naver.com';