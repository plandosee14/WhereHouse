drop table house;
create table house(
	h_no    number		         primary key,
	m_id   varchar2(50)		    references   member(m_id),
	m_name varchar2(50)		  ,
	h_address varchar2(1000)	      	not null,
	h_fare	              number     	  	not null,
	h_startdate 	      date		    	not null,
	h_enddate   	      date		    	not null,
	h_info      varchar2(3000)		  	not null,
	h_peoplecnt              number		     	not null,
	h_type         varchar2(1000)		not null,
	h_checktime  varchar2(1000)			not null,
	h_sale           number     		    , 
	h_salefare      number(2,2)     	,         --할인된 가격
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