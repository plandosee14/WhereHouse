drop table house;
create table house( 
	h_no    number		         primary key,
	m_id   varchar2(50)		    references   member(m_id),  --host����
	m_name varchar2(50)		  ,   							--�������̸�
	m_phone varchar2(20)        not null,  --������ ����ȣ
	h_title varchar2(50)        not null,   --�� ����
	h_zip varchar2(20)	      	not null,           --������ �����ȣ
	h_address varchar2(1000)	      	not null,           --������ �ּ�
	h_pi_x    number             , --����
	h_pi_y    number             , --�浵	
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
	h_scorecnt      number		         	default 0, --���� �� �ο� ��
	h_avgscore      number(1,2) 			default 0,
	h_rightscore      number		      	default 0,
	h_cleanscore      number		     	default 0,
	h_checkscore      number	     		default 0,
	h_commuscore      number		     	default 0
);


drop sequence house_seq;
create sequence house_seq
start with 13
increment by 1
nocycle
nocache;

select * from house;
select house_seq.currval from dual;

 insert into house 
(h_no,m_id,m_name,m_phone,h_title,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail,h_pi_x, h_pi_y )
 values (house_seq.nextval,'ojh5797@naver.com','������','010-3952-5797','�����̳���',
'12345','����� ��õ�� �ѽž���Ʈ',10000,
'2016-11-30','2017-12-30','���Ĵϳ� ������ ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,60000,
'�������������','pil.jpg','39.0392193','125.76252410000006');


 insert into house 
(h_no,m_id,m_name,m_phone,h_title,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail,h_pi_x, h_pi_y )
 values (house_seq.nextval,'sj54770@naver.com','�Ǽ���','010-9040-4886','���ִϳ���',
'12345','��⵵ ȭ���� ������ ������ �λ����Ʈ',10000,
'2016-11-30','2017-12-30','���ִϳ� ������ ã�ƿ�����',
5,'����Ʈ','���ϳ�',
'3��~11��', 10,30000,
'�������������','junghoon.jpg','39.0392193','125.76252410000006');

 insert into house 
(h_no,m_id,m_name,m_phone,h_title,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail,h_pi_x, h_pi_y )
 values (house_seq.nextval,'gkdmstkfkd93@naver.com','������','010-1234-1234','�����̳���',
'12345','������ �Ǽ��� ������ 1140',10000,
'2016-11-30','2017-12-30','�����ϳ� ������ ã�ƿ�����',
5,'����','���ϳ�',
'3��~11��', 10,60000,
'�������������','haeun.jpg','39.0392193','125.76252410000006');

alter house h_thumnail
delete from house where m_name='�Ǽ���';


select h.h_no, h.h_fare, h.h_type, h.h_livetype, h.h_thumnail ,b.b_no
from house h , basket b
where h.h_no = b.h_no
      and b.m_id = 'ojh5797@naver.com';

delete from house;

select max(h_no)
		from house
		where m_id='powerfeel123@naver.com'
	
      