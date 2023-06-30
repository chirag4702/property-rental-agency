create or replace NONEDITIONABLE procedure GetPropertyRecord (ownerid in number) as
PROP_I number;
ADDRES varchar2(100);
LOCALIT varchar2(50);
HIK number;
REN NUMBER;        
CONSTR_YEA NUMBER;        
START_DAT DATE;          
END_DAT DATE;          
PLINTH_ARE NUMBER;        
TOTAL_ARE NUMBER;        
FLOO NUMBER;        
OTHER_FACILITIE VARCHAR2(50);
cursor prop_cursor is
select PROP_ID ,
ADDRESS ,
LOCALITY ,
HIKE ,
RENT ,
CONSTR_YEAR ,
START_DATE ,
END_DATE ,
PLINTH_AREA ,
TOTAL_AREA ,
FLOORS ,
OTHER_FACILITIES 
from property where owner_id = ownerid;
begin
open prop_cursor;
loop
fetch prop_cursor into 
PROP_I ,
ADDRES ,
LOCALIT ,
HIK ,
REN ,
CONSTR_YEA ,
START_DAT ,
END_DAT ,
PLINTH_ARE ,
TOTAL_ARE ,
FLOO ,
OTHER_FACILITIE;
exit when prop_cursor%notfound;
dbms_output.put_line('Prop_id: '|| PROP_I ||', Address: ' ||
ADDRES ||', Locality: ' ||
LOCALIT ||', Hike(%): ' ||
HIK ||', Rent: ' ||
REN ||', Construction year: ' ||
CONSTR_YEA ||', Start date: ' ||
START_DAT ||', End date:' ||
END_DAT ||', Plinth area: ' ||
PLINTH_ARE ||', Total area: ' ||
TOTAL_ARE ||' Number of floors: ' ||
FLOO ||', Other facilities: ' ||
OTHER_FACILITIE);
end loop;
close prop_cursor;
end;
