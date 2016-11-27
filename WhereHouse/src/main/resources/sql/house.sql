drop table house;
create table house(
	h_no    number		         primary key,
	m_id   varchar2(50)		    references   member(m_id),  --host����
	m_name varchar2(50)		  ,   							--�������̸�
	h_zip varchar2(20)	      	not null,           --������ �����ȣ
	h_address varchar2(1000)	      	not null,           --������ �ּ�
	h_fare	              number     	  	not null,		--1�ڴ� ���
	h_startdate 	      date		    	not null,		--
	h_enddate   	      date		    	not null,
	h_info      varchar2(3000)		  	not null,
	h_peoplecnt              number		     	not null,
	h_type         varchar2(1000)		not null,
	h_checktime  varchar2(1000)			not null,
	h_sale           number     		    , 
	h_salefare      number(2,2)     	,         --���ε� ����
	h_rule     varchar2(3000)	 	not null,
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
