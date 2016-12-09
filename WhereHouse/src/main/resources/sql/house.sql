drop table house;
create table house( 
	h_no    number		         primary key,
	m_id   varchar2(50)		    references   member(m_id),  --host주인
	m_name varchar2(50)		  ,   							--주인장이름
	m_phone varchar2(20)        not null,  --주인장 폰번호
	h_title varchar2(50)        not null,   --집 제목
	h_zip varchar2(20)	      	not null,           --주인장 우편번호
	h_address varchar2(1000)	      	not null,           --주인장 주소
	h_pi_x    number             , --위도
	h_pi_y    number             , --경도	
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
	h_scorecnt      number		         	default 0, --평점 준 인원 수
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
 values (house_seq.nextval,'ojh5797@naver.com','오정훈','010-3952-5797','정훈이네집',
'12345','서울시 양천구 한신아파트',10000,
'2016-11-30','2017-12-30','정후니네 집으로 찾아오세요',
5,'아파트','방하나',
'3시~11시', 10,60000,
'담배피지마세요','pil.jpg','39.0392193','125.76252410000006');


 insert into house 
(h_no,m_id,m_name,m_phone,h_title,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail,h_pi_x, h_pi_y )
 values (house_seq.nextval,'sj54770@naver.com','권성준','010-9040-4886','성주니네집',
'12345','경기도 화성시 병점동 남수원 두산아파트',10000,
'2016-11-30','2017-12-30','성주니네 집으로 찾아오세요',
5,'아파트','방하나',
'3시~11시', 10,30000,
'담배피지마세요','junghoon.jpg','39.0392193','125.76252410000006');

 insert into house 
(h_no,m_id,m_name,m_phone,h_title,
 h_zip,h_address, h_fare,
h_startdate,h_enddate, h_info,
 h_peoplecnt, h_type,h_livetype,
h_checktime, h_sale,h_salefare,
 h_rule,h_thumnail,h_pi_x, h_pi_y )
 values (house_seq.nextval,'gkdmstkfkd93@naver.com','이하은','010-1234-1234','하은이네집',
'12345','수원시 권선구 세류동 1140',10000,
'2016-11-30','2017-12-30','하으니네 집으로 찾아오세요',
5,'주택','방하나',
'3시~11시', 10,60000,
'담배피지마세요','haeun.jpg','39.0392193','125.76252410000006');

alter house h_thumnail
delete from house where m_name='권성준';


select h.h_no, h.h_fare, h.h_type, h.h_livetype, h.h_thumnail ,b.b_no
from house h , basket b
where h.h_no = b.h_no
      and b.m_id = 'ojh5797@naver.com';

delete from house;

select max(h_no)
		from house
		where m_id='powerfeel123@naver.com'
	
      