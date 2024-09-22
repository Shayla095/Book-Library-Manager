SET SERVEROUTPUT ON;
SET VERIFY OFF;


ACCEPT U NUMBER PROMPT "Enter the  Unique Code = "
ACCEPT X char PROMPT "Enter the name Of The Borrower = "
ACCEPT F NUMBER PROMPT "Enter the age = "
ACCEPT Y char PROMPT "Enter the Book = "

ACCEPT W DATE PROMPT "Enter the due date = "


DECLARE
	
	name VARCHAR2(30);
	bookName VARCHAR2(30);
	fined int;
	due date;
    borid int;
	uniid int;
	buyid int;
	age int;
	maxuni int;
	count1 int;
	maxuni2 int;
	maxuni3 int;
	temp int;
	monid int;
	z int;
BEGIN
	z:=0;
	uniid:=&U;
	name:='&X';
	age:=&F;
	bookName:='&Y';
    fined:=0;
	due:='&W';
	
	select count(borrowid) into borid from borrower@server;
	 select count(borrowid) into monid from moneyreturn@server;
	select count(buyerid) into buyid from buyerinfo@server;
	select max(uniquecode) into maxuni from buyerinfo@server;
	select max(uniquecode) into maxuni2 from borrower@server;
	select max(uniquecode) into maxuni3 from moneyreturn@server;
	
	
	
	if monid<>0 then
		for r in (select * from moneyreturn@server) loop	
			if r.uniquecode=uniid then
				DBMS_OUTPUT.PUT_LINE('Already have an borrower with this uniquecode retry again with new unique code');
					z:=z+1;
				if r.brname=INITCAP(name) THEN
					z:=z+1;
					DBMS_OUTPUT.PUT_LINE('You can not borrow any book as you are fined.');
				end if;
			end if;
			
		end loop;
	ELSIF borid<>0 THEN
		

		insert into borrower@server VALUES (borid+1,maxuni2+1,INITCAP(name) ,INITCAP(bookName),fined,due);
		
			
		

	end if;
	
	if monid<>0 and borid<>0 THEN
		
		if z=0 THEN
				insert into borrower@server VALUES (borid+1,maxuni2+1,INITCAP(name) ,INITCAP(bookName),fined,due);

		
		end if;
		
	end if;
	if borid=0 then
		
		
		if monid>0 THEN
			if maxuni2>maxuni3 THEN
				temp:=maxuni2;
			ELSE
				temp:=maxuni3;
			end if;
			insert into borrower@server VALUES (borid+1,temp+1,INITCAP(name) ,INITCAP(bookName),fined,due);
		ELSE
			insert into borrower@server VALUES (borid+1,maxuni+1,INITCAP(name) ,INITCAP(bookName),fined,due);
		end if;
		
		
	end if;


	
		
		
	
	
	
	
	

	
END;
/


