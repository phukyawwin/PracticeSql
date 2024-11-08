select [Doctor],[Professor],[Singer],[Actor] from
(select ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) row_num, name,occupation from occupations) as source
pivot 
( MIN([Name]) FOR occupation in ([Doctor],[Professor],[Singer],[Actor])) as pvt;