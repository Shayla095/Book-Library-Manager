SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE TRIGGER UpdatingPrice 
BEFORE UPDATE 
OF bprice
ON BookInfo
FOR EACH ROW
DECLARE
	A BookInfo.infoid%TYPE;
	B BookInfo.bid%TYPE;
	C BookInfo.bgenre%TYPE;
	D BookInfo.breview%TYPE;
	E BookInfo.bprice%TYPE;
BEGIN
	A := :OLD.infoid;
	B := :OLD.bid;
	C := :OLD.bgenre;
	D := :OLD.breview;
	E := :OLD.bprice;
	INSERT INTO recycle VALUES(A, B, C,D,E);
	DBMS_OUTPUT.PUT_LINE('Price has been updated');

END;
/



ACCEPT X char PROMPT "Enter the name Of The Book = "
ACCEPT Y number PROMPT "Enter the price = "


DECLARE
	name VARCHAR2(30);
	Price NUMBER;
	id NUMBER;
	taka NUMBER;
	count1 NUMBER;
  
BEGIN

	name:='&X';
	Price:=&Y;
	count1:=0;
	taka:=0;
	select bid into id from (select * from book union select * from book@site1) where bname=INITCAP(name);
	

	update bookinfo set bprice=Price where bid=id;				
			
			
			
	
	
	
	
	

	
END;
/

commit;