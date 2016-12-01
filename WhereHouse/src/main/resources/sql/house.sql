drop table house;
create table house( 
	h_no    number		         primary key,
	m_id   varchar2(50)		    references   member(m_id),  --host����
	m_name varchar2(50)		  ,   							--�������̸�
	m_phone varchar2(20)        not null,  --������ ����ȣ
	h_zip varchar2(20)	      	not null,           --������ �����ȣ
	h_address varchar2(1000)	      	not null,           --������ �ּ�
	h_fare	              number     	  	not null,		--1�ڴ� ���
	h_startdate 	      date		    	not null,		--
	h_enddate   	      date		    	not null,
	h_info      varchar2(3000)		  	not null,
	h_peoplecnt              number		     	not null, --�ִ�����ο�
	h_type         varchar2(1000)		not null, --������(����Ʈ, ��������, )
	h_livetype     varchar2(1000)		not null, --�������� (����ü, �Ž�, ��)   
	h_checktime  varchar2(1000)			not null, --üũ�� üũ�ƿ��ð�
	h_sale           number     		    ,  --���η�
	h_salefare      number    	,         --���ε� ����
	h_rule     varchar2(3000)	 	not null, --��Ģ
	h_thumnail varchar2(3000)		not null,
	h_state        number		              default 0,
	h_scorecnt      number		         	default 0,
	h_avgscore      number(1,2) 			default 0,
	h_rightscore      number		      	default 0,
	h_cleanscore      number		     	default 0,
	h_checkscore      number	     		default 0,
	h_commuscore      number		     	default 0
);


drop sequence house_seq;
create sequence house_seq
start with 1
increment by 1
nocycle
nocache;

select * from house;

insert into house (h_no,) values();



--���ɼ�
drop table hoption;
create table hoption(
   o_no number primary key,
   o_name varchar2(200) not null
);


drop  sequence house_seq;
create sequence hoption_seq
start with 1
increment by 1
nocycle
nocache;

create table house_option(
 h_no   number   references    house(h_no),
 o_no   number   references    hoption(o_no),
 PRIMARY  KEY (h_no,o_no)
);


 alter table house add(h_zip varchar2(20) not null);
 alter table house add(h_livetype  varchar2(1000)  not null);
 alter table house add(h_salefare  varchar2(1000)  not null);
 alter table house add(m_phone varchar2(20)   not null);
  alter table house modify(h_salefare number not null);
  
  
 insert into tbl_user (id, upw, uname) values ('soonsir','1234','����');

 insert into house 
(h_no,m_id,m_name,m_phone,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'ojh5797@naver.com','������','010-3952-5797',
'12345','����� ��õ��',200000,
'2016-11-30','2017-12-30','�����̳� ������ ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,45000,
'�������������','test_thumnail1.jpg');

 insert into house 
(h_no,m_id,m_name,m_phone,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'ojh5797@naver.com','������','010-3333-4444',
'12345','����� ����� �߰����б�',50000,
'2016-11-30','2017-12-30','�����̳� ������ ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,45000,
'�������������','test_thumnail1.jpg');

 insert into house 
(h_no,m_id,m_name,m_phone,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'ojh5797@naver.com','������','010-3333-4444',
'12345','����� ��õ�� ��5��',50000,
'2016-11-30','2017-12-30','�����̳� ������  �� ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,45000,
'�������������','test_thumnail1.jpg');

 insert into house 
(h_no,m_id,m_name,m_phone,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'ojh5797@naver.com','������','010-3333-4444',
'12345','����� ��õ�� ��5��',50000,
'2016-11-30','2017-12-30','�����̳� ������  �� ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,45000,
'�������������','test_thumnail1.jpg');

 insert into house 
(h_no,m_id,m_name,m_phone,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'daunee94@naver.com','���ٿ�','010-3333-4444',
'12345','������ �Ǽ��� �Ǽ���',70000,
'2016-11-30','2017-12-30','�ٿ��̳� ������  �� ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,63000,
'�������������','test_thumnail1.jpg');

 insert into house 
(h_no,m_id,m_name,m_phone,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'dmddo888@gmail.com','������','010-3333-4444',
'12345','������ �Ǽ��� �Ǽ���',70000,
'2016-11-30','2017-12-30','�����̳� ������  �� ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,63000,
'�������������','test_thumnail1.jpg');

select h.h_no, h.h_fare, h.h_type, h.h_livetype, h.h_thumnail ,b.b_no
from house h , basket b
where h.h_no = b.h_no
      and b.m_id = 'ojh5797@naver.com';

delete from house ;
      