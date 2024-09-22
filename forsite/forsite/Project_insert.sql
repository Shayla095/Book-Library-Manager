
DROP TABLE Book CASCADE CONSTRAINTS;
CREATE TABLE Book(
	bid int, 
	bname varchar2(30), 
	aid int, 
    PRIMARY KEY(bid));







insert into BOOK VALUES (11,'Jochona O Jononir Golpo',11); 		
insert into BOOK VALUES (12,'Turtles All The Way Down',12);			
insert into BOOK VALUES (13,'Looking For Alaska',13); 				
insert into BOOK VALUES (14,'Hopeless',14); 							
insert into BOOK VALUES (15,'Chander Pahar',15); 		
insert into BOOK VALUES (16,'Debi',16); 								
insert into BOOK VALUES (17,'Sea Prayer',17); 						
insert into BOOK VALUES (18,'Chokher Bali',18);					
insert into BOOK VALUES (19,'Baksho Rahashya',19);					
insert into BOOK VALUES (20,'It Ends With Us',20);	


commit;