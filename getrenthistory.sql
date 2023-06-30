create or replace NONEDITIONABLE procedure GetRentHistory(pid in number) is
tid number;
tname varchar2(20);
tage number;
s_date date;
e_date date;
rent_paid number;
agency_com number;
hike_rent number;
cursor history_cursor is
select P.tenant_id,name,age,P.start_date,P.end_date,P.rent,P.agency_commission,P.yearly_hike from Property_Tenant P,Tenant T,User_Details where P.tenant_id=T.tenant_id and T.tenant_id=aadhar and P.prop_id=pid;
begin
open history_cursor;
loop 
fetch history_cursor into tid,tname,tage,s_date,e_date,rent_paid,agency_com,hike_rent;
exit when history_cursor%notfound;
dbms_output.put_line('Tenant ID: '||tid||', TENANT NAME: '||tname||', TENANT AGE: '||tage||', START DATE: '||s_date||', END_DATE: '||e_date||', RENT PAID: '||rent_paid||', AGENCY COMMISION: '||agency_com||', HIKE(%): '||hike_rent);
end loop;
close history_cursor;
end;
