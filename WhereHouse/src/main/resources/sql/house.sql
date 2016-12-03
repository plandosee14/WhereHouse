drop table house;
create table house( 
	h_no    number		         primary key,
	m_id   varchar2(50)		    references   member(m_id),  --host주인
	m_name varchar2(50)		  ,   							--주인장이름
	m_phone varchar2(20)        not null,  --주인장 폰번호
	h_zip varchar2(20)	      	not null,           --주인장 우편번호
	h_title varchar2(50)        not null,   --집 제목
	h_pi_x    number             not null, --위도
	h_pi_y    number             not null, --경도	
	h_address varchar2(1000)	      	not null,           --주인장 주소
	h_fare	              number     	  	not null,		--1박당 요금
	h_startdate 	      date		    	not null,		--
	h_enddate   	      date		    	not null,
	h_info      varchar2(3000)		  	not null,
	h_peoplecnt              number		     	not null, --최대숙박인원
	h_type         varchar2(1000)		not null, --집유형(아파트, 전원주택, )
	h_livetype     varchar2(1000)		not null, --숙소유형 (집전체, 거실, 방)   
	h_checktime  varchar2(1000)			not null, --체크인 체크아웃시간
	h_sale           number     		    ,  --할인률
	h_salefare      number    	,         --할인된 가격
	h_rule     varchar2(3000)	 	not null, --규칙
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



--집옵션
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
 alter table house add(h_title varchar2(100)   not null);
  alter table house modify(h_salefare number not null);

  
  alter table house add(h_title number not null);  
  alter table house add(h_pi_x number not null);
  alter table house add(h_pi_y number not null);
  
 insert into tbl_user (id, upw, uname) values ('soonsir','1234','순실');

 insert into house 
(h_no,m_id,m_name,m_phone,m_title,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail)
 values (house_seq.nextval,'powerfeel123@naver.com','최필한','010-7735-4621','필한이네집',
'12345','인천시 계양구 태산아파트',10000,
'2016-11-30','2017-12-30','필하니네 집으로 찾아오세요',
5,'아파트','방하나',
'3시~11시', 10,45000,
'담배피지마세요','test_thumnail1.jpg');




select h.h_no, h.h_fare, h.h_type, h.h_livetype, h.h_thumnail ,b.b_no
from house h , basket b
where h.h_no = b.h_no
      and b.m_id = 'ojh5797@naver.com';

delete from house ;
      