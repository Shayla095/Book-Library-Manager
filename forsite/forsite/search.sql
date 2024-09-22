SET SERVEROUTPUT ON;
SET VERIFY OFF;


CREATE OR REPLACE PACKAGE pack AS
	
	--FUNCTION duration(A1 IN NUMBER,Z IN OUT NUMBER,p IN OUT NUMBER,q IN OUT NUMBER)
	--RETURN NUMBER;
	
	PROCEDURE searching(B IN Out varchar2,q in out number);
	
END pack;
/


CREATE OR REPLACE PACKAGE BODY pack AS
	
	PROCEDURE searching(B IN Out varchar2,q in out number)
	IS
	
				
		
	BEGIN
	
	
	
			
			FOR R IN (select * from book union select * from book@server) LOOP
				
				if R.bname=B THEN
					q:=r.bid;
					FOR m IN (select * from bookinfo@server) LOOP
						
						if m.bid=q THEN
							DBMS_OUTPUT.PUT_LINE(R.bname);
							DBMS_OUTPUT.PUT_LINE(m.bgenre);
							DBMS_OUTPUT.PUT_LINE(m.breview);
							DBMS_OUTPUT.PUT_LINE(m.bprice);
							exit;
						end if;
						
						
					end loop;
					Exit;
				end if; 		
				
				
			end loop;
		
		
		
		
		
		
	END searching;
	
END pack;
/



ACCEPT X char PROMPT "Enter the Book Name = "


DECLARE
  A VARCHAR2(30);
  B VARCHAR2(30);
  C NUMBER ;
  Z NUMBER ;
   p NUMBER;
   q NUMBER;
   
   name varchar2(30);
	nobook exception;
 
  
  
BEGIN
	
	

	z:=0;
	
	name:='&X';
	
	for r in (select * from book union select * from book@server) loop
		
	 if r.bname=INITCAP(name) then
		z:=z+1;
		pack.searching(name,q);
		exit;		
	 end if;
	end loop;
	
	if z=0 THEN
		RAISE nobook;
	end if;

			
EXCEPTION

	WHEN nobook THEN
		DBMS_OUTPUT.PUT_LINE('No book found of this name');

						


	
END;
/


commit;