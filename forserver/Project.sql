Drop TABLE Book CASCADE CONSTRAINTS;
Drop TABLE Author CASCADE CONSTRAINTS;
Drop TABLE BookInfo CASCADE CONSTRAINTS;
Drop TABLE BuyerInfo CASCADE CONSTRAINTS;
Drop TABLE Buy CASCADE CONSTRAINTS;
Drop TABLE Recycle CASCADE CONSTRAINTS;
Drop TABLE borrower CASCADE CONSTRAINTS;
Drop TABLE moneyreturn CASCADE CONSTRAINTS;


CREATE TABLE Author(
	aid int, 
	aname varchar2(30), 
	age int,
	gender VARCHAR2(10),
    PRIMARY KEY(aid));


CREATE TABLE Book(
	bid int, 
	bname varchar2(30), 
	aid int, 
    PRIMARY KEY(bid));


CREATE TABLE BookInfo(
	infoid int,
	bid int,
	bgenre VARCHAR2(30),
	breview int,
	bprice int,
	PRIMARY KEY(infoid));
	
CREATE TABLE BuyerInfo (
	buyerid int,
	buyername VARCHAR2(30),
	buyerage int,
	uniquecode int,
	PRIMARY KEY(buyerid));
	
CREATE TABLE Buy(
	buyerid int,
	bid int);
	

CREATE TABLE Recycle(
	infoid int,
	bid int,
	bgenre VARCHAR2(30),
	breview int,
	bprice int);
	
	
CREATE TABLE borrower(
	borrowid int,
	uniquecode int,
	brname VARCHAR2(30),
	bname varchar2(30),
	fined int,
	duedate date);
		
	
	
CREATE TABLE moneyreturn(
	borrowid int,
	uniquecode int,
	brname VARCHAR2(30),
	bname varchar2(30),
	fined int,
	duedate date);	
	

		


commit;



