system���� �α���

create user og identified by og;
grant create session to og;	
grant create table to og;	
grant create view to og;	
grant create procedure to og;	
grant create sequence to og;	
alter user og default tablespace users;	
alter user og quota unlimited on users;	


create table member (
    id VARCHAR2(20) CONSTRAINT id_pk PRIMARY KEY,
    password VARCHAR2(20),
    name VARCHAR2(20),
    phone VARCHAR2(12),
    email VARCHAR2(50),
    address VARCHAR2(50),
    reg_date DATE
    );
    
create table product (
    tema VARCHAR2(30) CONSTRAINT tema_pk PRIMARY KEY,
    content VARCHAR2(500),
    fileName VARCHAR2(100),
    startdate DATE,
    enddate DATE,
    restdate DATE
    );
create table loc (
    locName VARCHAR2(30) CONSTRAINT locName_pk PRIMARY KEY,
    locFileName VARCHAR2(100)
    );
    
create table booking (
    tema CONSTRAINT tema_fk REFERENCES product(tema),
    locName CONSTRAINT locName_fk REFERENCES loc(locName),
    id VARCHAR2(20),
    name VARCHAR2(20),
    phone VARCHAR2(12),
    note VARCHAR2(300),
    bookDate DATE,
    time DATE
    );
    
create table board (
    num NUMBER CONSTRAINT num_pk PRIMARY KEY,
    writer VARCHAR2(20),
    subject VARCHAR2(100),
    content VARCHAR2(500),
    email VARCHAR2(50),
    readcount NUMBER,
    password VARCHAR2(20),
    ref NUMBER,
    re_step NUMBER,
    re_level NUMBER,
    ip VARCHAR2(20),
    reg_date DATE,
    del CHAR(1) DEFAULT 'n'
    );
   
create table replyBoard (
	rno NUMBER CONSTRAINT rno_pk primary key, 
	bno CONSTRAINT bno_fk references board(num),
	replytext VARCHAR2(500),
	replyer VARCHAR2(50), 
	reg_date DATE,	
	updatedate DATE,	
	del CHAR(1) default 'n' 
    );
    
 create table reviewboard (
    num NUMBER CONSTRAINT rvnum_pk PRIMARY KEY,
    writer VARCHAR2(20),
    subject VARCHAR2(100),
    content VARCHAR2(500),
    email VARCHAR2(50),
    readcount NUMBER,
    password VARCHAR2(20),
    fileName VARCHAR2(100),
    ref NUMBER,
    re_step NUMBER,
    re_level NUMBER,
    ip VARCHAR2(20),
    reg_date DATE,
    del CHAR(1) DEFAULT 'n'
    );  
    
    create table reviewReplyBoard (
	rno number CONSTRAINT rvrno_pk primary key, 
	bno CONSTRAINT rvbno_fk references reviewboard(num),
	replytext VARCHAR2(500),
	replyer VARCHAR2(50), 
	reg_date DATE,	
	updatedate DATE,	
	del CHAR(1) default 'n' 
    );
    
    create table notice (
    num NUMBER CONSTRAINT ntnum_pk PRIMARY KEY,
    writer VARCHAR2(20),
    subject VARCHAR2(100),
    content VARCHAR2(500),
    email VARCHAR2(50),
    readcount NUMBER,
    password VARCHAR2(20),
    ip VARCHAR2(20),
    reg_date DATE,
    del CHAR(1) DEFAULT 'n'
    );
    
create table noticeReplyBoard (
	rno NUMBER CONSTRAINT ntrno_pk primary key, 
	bno CONSTRAINT ntbno_fk references notice(num),
	replytext VARCHAR2(500),
	replyer VARCHAR2(50), 
	reg_date DATE,	
	updatedate DATE,	
	del CHAR(1) default 'n' 
    );
    
create table qa (
    num NUMBER CONSTRAINT qanum_pk PRIMARY KEY,
    writer VARCHAR2(20),
    subject VARCHAR2(100),
    content VARCHAR2(500),
    email VARCHAR2(50),
    readcount NUMBER,
    password VARCHAR2(20),
    ref NUMBER,
    re_step NUMBER,
    re_level NUMBER,
    ip VARCHAR2(20),
    reg_date DATE,
    del CHAR(1) DEFAULT 'n'
    );
    