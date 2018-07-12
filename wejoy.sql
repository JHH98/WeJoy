create table post (
	ps_id Number primary key,
	content varchar2(300) not null,
	image   varchar2(50) not null
)

CREATE SEQUENCE ps_seq INCREMENT BY 1 START WITH 1 MAXVALUE 99999
CREATE SEQUENCE ps_id2 INCREMENT BY 2 START WITH 1 MAXVALUE 99999
ALTER TABLE post ADD(reg_date Date); 
ALTER TABLE post ADD(read_count Number); 
ALTER TABLE post ADD(likes Number); 
ALTER TABLE post ADD(mm_id Number); 
ALTER TABLE post ADD(del varchar(1)); 
ALTER TABLE post add foreign key(mm_id) references member(mm_id);
ALTER TABLE post add foreign key(hobby_id) references ps_hob(hobby_id);
alter table post ADD (hobby_id Number); 
ALTER TABLE post RENAME COLUMN image to stored_ig_name;
ALTER TABLE post RENAME COLUMN hobby_id to hobby_name;
ALTER TABLE post ADD(ig_size Number); 

ALTER TABLE post ADD(ip varchar2(20)); 
alter table post drop(hobby_id);

ALTER TABLE post ADD(origin_ig_name varchar2(300)); 
ALTER TABLE post ADD(subject varchar2(50)); 
ALTER TABLE post ADD(hobby_id Number); 
ALTER TABLE member ADD(email varchar2(50)); 
alter table post modify(mm_id varchar2(50));
alter table post modify(mm_id varchar2(50));
alter table post modify(hobby_name varchar2(50));
alter table comments modify(replyer varchar2(50));

ALTER TABLE member ADD(del varchar2(1)); 
create table member(
	mm_id varchar2(50) primary key,
	password varchar2(50) not null,
	name varchar2(50) not null
);

create table hobby(
	hobby_id number(10) primary key,
	hobby_name varchar(50) not null,
	img varchar2(50) not null
);


create table mem_hob (
	mm_id varchar(50) references member(mm_id),
	hobby_id number(10) references hobby(hobby_id),
	primary key (mm_id,hobby_id)
);

create table ps_hob (
	ps_id Number references post(ps_id),
	hobby_id number(10) references hobby(hobby_id),
	primary key (ps_id,hobby_id)
);

create table like_func (
	ps_id Number references post(ps_id),
	mm_id varchar(50),
	primary key (ps_id)
);

delete from like_func

insert into hobby values(1,'스포츠','스포츠.jpg');
insert into hobby values(2,'건강&피트니스','건강&피트니스.jpg');
insert into hobby values(3,'과학&자연','과학&자연.jpg');
insert into hobby values(4,'예술','예술.jpg');
insert into hobby values(5,'여행','여행.jpg');
insert into hobby values(6,'디자인','디자인.jpg');
insert into hobby values(7,'사진','사진.jpg');
insert into hobby values(8,'그림','그림.jpg');
insert into hobby values(9,'음악','음악.jpg');
insert into hobby values(10,'첨단기술','첨단기술.jpg');
insert into hobby values(11,'요리&음식','요리&음식.jpg');
insert into hobby values(12,'역사','역사.jpg');
insert into hobby values(13,'패션','패션.jpg');


create table comments (
	rno number primary key,  -- 댓글번호
	bno number references post(ps_id), -- 게시글번호
	replyer number references member(mm_id),    -- 댓글작성자
	replytext varchar2(500) , --  댓글
	regdate date,			  -- 작성일
	del char(1) -- 삭제여부
);
drop table member CASCADE CONSTRAINT;
delete from post CASCADE CONSTRAINT Purge;
ALTER TABLE comments RENAME COLUMN bno to pno;

CREATE SEQUENCE mm_id INCREMENT BY 1 START WITH 1 MAXVALUE 99999


ALTER TABLE post DROP COLUMN hobby_name;