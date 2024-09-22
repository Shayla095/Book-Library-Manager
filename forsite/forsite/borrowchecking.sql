SET SERVEROUTPUT ON;
SET VERIFY OFF;




CREATE OR REPLACE PACKAGE pack AS
	
	PROCEDURE printing(id in out NUMBER);
	
	PROCEDURE deleting(id in out NUMBER);
	
END pack;
/


CREATE OR REPLACE PACKAGE BODY pack AS

	

	
	PROCEDURE printing(id in out NUMBER)
	IS
	
				
		
	BEGIN
	
		
		update  moneyreturn@server  set fined=100 where uniquecode=id;
		
	END printing;
	
	PROCEDURE deleting(id in out NUMBER)
	IS
	
				
		
	BEGIN
	
		
		delete from borrower@server where uniquecode=id;
		pack.printing(id);
		
		
	END deleting;
	
END pack;
/





DECLARE
	
	boughtid int;
	name VARCHAR2(30);
	boughtage int;
	limitdate date;
	testdate date;
	checkdate int;
	id NUMBER;
	fine int;
  
BEGIN
	
	
	
	for r in (select * from borrower@server) loop
		
		select to_date(r.duedate,'DD-MM-YY')-trunc(sysdate) into checkdate from dual;
		if checkdate<0 THEN
			DBMS_OUTPUT.PUT_LINE('Unique id: '||r.uniquecode || ' day remained: ' || 'No Time Remained');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Unique id: '||r.uniquecode || ' day remained: ' || checkdate);
		
		end if; 
		fine:=r.fined;
		id:=r.uniquecode;
		
		if checkdate<0 THEN
			insert into moneyreturn@server VALUES (r.borrowid,id,r.brname ,r.bname,r.fined,r.duedate);
			pack.deleting(id);
		end if;
		
	end loop;
	
	
	

	
END;
/

commit;