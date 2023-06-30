create or replace NONEDITIONABLE PROCEDURE SearchPropertyForRent(prop_city in varchar2)as
PROP_ID1 NUMBER;             
ADDRESS1                    VARCHAR2(20) ;
CONSTRUCTION_YEAR1          NUMBER       ;
RENT1                       NUMBER       ;
HIKE_PERCENT1               NUMBER       ;
START_DATE1                 DATE         ;
END_DATE1                   DATE         ;
TOTAL_AREA1                 NUMBER       ;
PLINTH_AREA1                NUMBER       ;
FLOORS#1                    NUMBER       ;
OTHER_FACILITIES1           VARCHAR2(20) ;
cursor prop_cursor is
((select PROP_ID from property where locality=prop_city)MINUS(SELECT P.PROP_ID FROM PROPERTY P,PROPERTY_TENANT PT WHERE P.PROP_ID=PT.PROP_ID AND P.LOCALITY=prop_city AND PT.END_DATE>CURRENT_DATE)) ;

begin
open prop_cursor;
loop
fetch prop_cursor into PROP_ID1;
SELECT
ADDRESS ,
CONSTR_YEAR ,
RENT ,
HIKE ,
START_DATE ,
END_DATE ,
TOTAL_AREA ,
PLINTH_AREA ,
FLOORS ,
OTHER_FACILITIES INTO
ADDRESS1,
CONSTRUCTION_YEAR1 ,
RENT1 ,
HIKE_PERCENT1 ,
START_DATE1 ,
END_DATE1 ,
TOTAL_AREA1 ,
PLINTH_AREA1 ,
FLOORS#1 ,
OTHER_FACILITIES1 FROM PROPERTY WHERE PROP_ID=PROP_ID1;
exit when prop_cursor%notfound;
dbms_output.put_line('Prop_id: '||PROP_ID1 ||', Address: '|| ADDRESS1 ||', Construction Year: '|| CONSTRUCTION_YEAR1 ||', Rent: '|| RENT1 ||', Hike(%): '|| HIKE_PERCENT1 ||', Start Date: '|| START_DATE1 ||', End Date: '|| END_DATE1 ||', Total Area: '|| TOTAL_AREA1 || ', Plinth Area: '||PLINTH_AREA1 || ', Floors: '||FLOORS#1 || ', Other facilities: '||OTHER_FACILITIES1);
end loop;
close prop_cursor;
end;
