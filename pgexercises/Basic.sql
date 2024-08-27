--https://pgexercises.com/

--Retrieve everything from a table
--How can you retrieve all the information from the cd.facilities table?

select * from cd.facilities;

--Retrieve specific columns from a table
--You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

select name,membercost from cd.facilities;

--Control which rows are retrieved
--How can you produce a list of facilities that charge a fee to members?

select * from cd.facilities where membercost<>0;

-Control which rows are retrieved - part 2
--How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility
--name, member cost, and monthly maintenance of the facilities in question.

select facid,name,membercost,monthlymaintenance from cd.facilities 
where membercost<>0 and membercost<(monthlymaintenance/50);

--Basic string searches
--How can you produce a list of all facilities with the word 'Tennis' in their name?

select * from cd.facilities where name like '%Tennis%';

--Matching against multiple possible values
--How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

select * from cd.facilities where facid in (1,5);

--Classify results into buckets
--How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? 
--Return the name and monthly maintenance of the facilities in question.

select name,
case 
	when monthlymaintenance<100 then 'cheap'
	else 'expensive' End as cost
from cd.facilities;

--Working with dates
--How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.

select memid,surname,firstname,joindate
from cd.members
where joindate>='2012-09-01';

--Removing duplicates, and ordering results
--How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.

select distinct surname
from cd.members order by surname limit 10;

--Combining results from multiple queries
--You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!

select surname
from cd.members
union 
select name as surname
from cd.facilities;

--Simple aggregation
--You'd like to get the signup date of your last member. How can you retrieve this information?

select max(joindate) from cd.members;

--More aggregation
--You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?

select firstname,surname,joindate from cd.members order by joindate desc limit 1;

select firstname,surname,joindate from cd.members 
where joindate=
(select max(joindate) from cd.members);

--Retrieve the start times of members' bookings
--How can you produce a list of the start times for bookings by members named 'David Farrell'?

select b.starttime
from cd.members m
inner join cd.bookings b on m.memid=b.memid
where concat(firstname,' ',surname)='David Farrell';

--Work out the start times of bookings for tennis courts
--How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
-- Return a list of start time and facility name pairings, ordered by the time.
select b.starttime,f.name
from cd.bookings b
inner join cd.facilities  f 
on b.facid=f.facid
where date(starttime)='2012-09-21' and Lower(name) like '%tennis court%'
order by starttime

--Produce a list of all members who have recommended another member
--How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, 
--and that results are ordered by (surname, firstname).

select distinct mem.firstname,mem.surname
from cd.members mem
inner join cd.members rec
on mem.memid=rec.recommendedby
order by mem.surname,mem.firstname;


--Produce a list of all members, along with their recommender
--How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

select mem.firstname memfname,mem.surname mensname,rec.firstname recfname,rec.surname recsname
from cd.members mem
left join cd.members rec on mem.recommendedby=rec.memid
order by mensname,memfname;

--Produce a list of all members who have used a tennis court
--How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted 
--as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.

select distinct concat(firstname,' ' ,surname) as member,fac.name 
from cd.bookings b
inner join cd.facilities  fac on b.facid=fac.facid and name like 'Tennis Court%'
inner join cd. members men on b.memid=men.memid
order by member,fac.name 

--Produce a list of costly bookings
--How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs to
-- members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member
-- formatted as a single column, and the cost. Order by descending cost, and do not use any subqueries.
