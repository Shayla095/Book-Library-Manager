SET SERVEROUTPUT ON;
SET VERIFY OFF;





ACCEPT X char PROMPT "Enter the name = "
ACCEPT Y NUMBER PROMPT "Enter the Age = "
ACCEPT Z NUMBER PROMPT "Enter the book id you want to buy = "



DECLARE
	
	boughtid int;
	name VARCHAR2(30);
	boughtage int;
	uniqid int;
	bookid int;
	age int;
  
BEGIN

	name:='&X';
	age:=&Y;
	bookid:=&Z;
	select count(buyerid) into boughtid from buyerinfo@server;
	select max(uniquecode) into uniqid from buyerinfo@server;
	
	insert into buyerinfo@server VALUES (boughtid+1,name,age,uniqid+1);
	insert into buy@server VALUES (boughtid+1,bookid);
	
	
	
	
	
	

	
END;
/


commit;