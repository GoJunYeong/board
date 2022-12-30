create table board(
idx int not null auto_increment,
title varchar(100) not null,
writer varchar(100) not null,
content varchar(1000) not null,
indate datetime default now(),
count int default 0,

primary key(idx));

create table member(
id varchar(50) not null,
pw varchar(50) not null,
nick varchar(50),
primary key(id));



create table comment ( 
idx int not null,
cno int not null auto_increment,
writer varchar(100) not null,
content varchar(1000) not null,
indate datetime default now(),
primary key(cno),
FOREIGN KEY (idx)REFERENCES board(idx));

insert into comment(idx, writer, content)
    values(99, '테스트댓글', '테스트 작성자');




drop table comment

select * from comment





drop table board








insert into board(title, writer, content)
values('스프링 게시판 만들기1', '고준영','스프링 게시판1');

insert into board(title, writer, content)
values('스프링 게시판 만들기2', '관리자','스프링 게시판2');

  








select * from board;
drop table board;






select * from member;
drop table member;