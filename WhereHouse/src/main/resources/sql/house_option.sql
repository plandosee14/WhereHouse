drop table house_option;

create table house_option(
	o_no number primary key, --�ɼǹ�ȣ
	h_no number not null  references  house(h_no), --���ҹ�ȣ
	o_name varchar2(50) not null --�ɼ��̸�

);


drop  sequence house_option_seq;
create sequence house_option_seq
start with 1
increment by 1
nocycle
nocache;


	o_air  varchar2(1) not null, --������
	o_kitchen  varchar2(1) not null, --�ֹ�
	o_park  varchar2(1) not null, --������
	o_smoke  varchar2(1) not null, --��
	o_washer  varchar2(1) not null, --��Ź��
	o_cook  varchar2(1) not null, --��������
	o_toiletries  varchar2(1) not null, --���鵵��
	o_tv  varchar2(1) not null, --tv
	o_wifi  varchar2(1) not null --��������