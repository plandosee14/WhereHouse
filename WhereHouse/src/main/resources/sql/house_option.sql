drop table house_option;

create table house_option(
	o_no number primary key, --옵션번호
	h_no number not null  references  house(h_no), --숙소번호
	o_name varchar2(50) not null --옵션이름

);


drop  sequence house_option_seq;
create sequence house_option_seq
start with 1
increment by 1
nocycle
nocache;


	o_air  varchar2(1) not null, --에어컨
	o_kitchen  varchar2(1) not null, --주방
	o_park  varchar2(1) not null, --주차장
	o_smoke  varchar2(1) not null, --흡연
	o_washer  varchar2(1) not null, --세탁기
	o_cook  varchar2(1) not null, --조리도구
	o_toiletries  varchar2(1) not null, --세면도구
	o_tv  varchar2(1) not null, --tv
	o_wifi  varchar2(1) not null --와이파이