CREATE OR REPLACE VIEW Book_Info AS
select bname,bgenre,breview,bprice from (SELECT * FROM book 
UNION 
SELECT * FROM book@server)w
join bookinfo@server bi
on w.bid=bi.bid;

select * from Book_Info;

CREATE OR REPLACE VIEW Author_Published AS
SELECT aname, age, gender FROM author@server;


select * from Author_Published;

