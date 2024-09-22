SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PACKAGE pack AS
	
	FUNCTION total(id in out NUMBER,count1 in out NUMBER,taka in out NUMBER,discount in out number)
	RETURN NUMBER;

	
	PROCEDURE printing(id in out NUMBER);
	
END pack;
/


CREATE OR REPLACE PACKAGE BODY pack AS

	FUNCTION total(id in out NUMBER,count1 in out NUMBER,taka in out NUMBER,discount in out number)
	RETURN NUMBER
	IS
	BEGIN
	

	
		for r in (select * from buy@server b join bookinfo@server bi on b.bid=bi.bid) LOOP
			if r.buyerid=id THEN
				count1:=count1+1;
				taka:=taka+r.bprice;
				
			end if;
			
		end loop;
		
		if taka>200 then 
			--DBMS_OUTPUT.PUT_LINE('For buying over 200 taka you will get 20% discount:');
			discount:=taka-(taka*(20/100));
			
			
		end if ;
	
		return taka; 
	END total;
	

	
	PROCEDURE printing(id in out NUMBER)
	IS
	
				
		
	BEGIN
	
	
			
			for r in (select * from buy@server b join (select * from book union select * from book@server) bi on b.bid=bi.bid) LOOP
				if r.buyerid=id THEN
					DBMS_OUTPUT.PUT_LINE(r.bname);
					
				end if;
			
			end loop;
			
		
		
		
		
		
	END printing;
	
END pack;
/






ACCEPT X char PROMPT "Enter the name Of The Buyer = "


DECLARE
	name VARCHAR2(30);
	totalPrice NUMBER;
	id NUMBER;
	taka NUMBER;
	count1 NUMBER;
	discount number;
  
BEGIN

	name:='&X';
	count1:=0;
	taka:=0;
	discount:=0;
	select buyerid into id from BuyerInfo@server where buyername=INITCAP(name);
	
	totalPrice:=pack.total(id,count1,taka,discount);
	
	DBMS_OUTPUT.PUT_LINE(name || ' bought about ' || count1 || ' books ');
	DBMS_OUTPUT.PUT_LINE(' Total price of the books he bought until now is ' || totalPrice || ' TAKA ');
	DBMS_OUTPUT.PUT_LINE('Books ' || name ||' bought '|| ' are: ');
	pack.printing(id);
	
	if discount<>0 THEN
		DBMS_OUTPUT.PUT_LINE('For buying over 200 taka you will get 20% discount:');
		DBMS_OUTPUT.PUT_LINE('After discount the price is :' || discount);
	end if;
	
			
	
	
	
	
	

	
END;
/



commit;