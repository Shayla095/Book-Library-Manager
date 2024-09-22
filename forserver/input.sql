SET SERVEROUTPUT ON;
SET VERIFY OFF;



CREATE OR REPLACE TRIGGER  BookInFoInserted
after insert 
on book               

begin   
	DBMS_OUTPUT.PUT_LINE('Book Info has been published');
end;
/




ACCEPT X char PROMPT "Enter the name Of The Author = "
ACCEPT Y NUMBER PROMPT "Enter the Age Of Author = "
ACCEPT Z char PROMPT "Enter the Gender = "
ACCEPT W char PROMPT "Enter the Book That The Author will publish = "
ACCEPT U char PROMPT "Enter its genre = "
ACCEPT V NUMBER PROMPT "Enter its review = "
ACCEPT P NUMBER PROMPT "Enter its price = "

DECLARE
	
	name VARCHAR2(30);
	age int ;
	gender VARCHAR2(10);
	bookName VARCHAR2(30);
	genre VARCHAR2(30);
	price number;
	review number;
	anum NUMBER;
	bnum NUMBER;
	infonum NUMBER;
  
BEGIN

	name:='&X';
	age:=&Y;
	gender:='&Z';
	bookName:='&W';
	genre:='&U';
	review:=&V;
	price:=&P;
	
	select count(aid) into anum from author;
	select count(bid) into bnum from (select * from book union select * from book@site1);
	select count(infoid)  into infonum from bookinfo;
	
	
	insert into Author VALUES (anum+1,name,age,gender);
	insert into Book@site1 VALUES (bnum+1,bookName,anum+1);	
	insert into BookInfo VALUES (infonum+1,bnum+1,genre,review,price);	
	
	
	
	
	

	
END;
/

commit;