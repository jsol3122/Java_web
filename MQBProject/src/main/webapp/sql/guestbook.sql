테이블 작성
create table guestbook(
seq   number primary key,
name  varchar2(30),
email  varchar2(30),
homepage  varchar2(35),
subject  varchar2(500) not null,
content  varchar2(4000) not null,
logtime  date);

시퀀스
create sequence seq_guestbook nocycle nocache;