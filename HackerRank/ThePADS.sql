select name +'('+ substring(occupation,1,1)+')' from occupations order by name;
select CONCAT('There are a total of ',count(occupation),' ',lower(occupation),'s.') 
from  occupations group by occupation
ORDER BY COUNT(OCCUPATION), OCCUPATION;