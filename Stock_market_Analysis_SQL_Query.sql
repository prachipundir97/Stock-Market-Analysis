create database Assignment;
use Assignment;

/* Imported the CSV files in table(MySQL) */

-- Creating bajaj1 table(which contains the date, close price, 20 Day MA and 50 Day MA)
create table bajaj1 as select str_to_date(`Date`, '%d-%M-%Y') as `Date`, `Close Price` as `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 19 preceding) as `20 Day MA`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 49 preceding) as `50 Day MA` from bajaj;
/*-----------------------------------------------------------------------------------------------------*/
-- Creating eicher1 table(which contains the date, close price, 20 Day MA and 50 Day MA)
create table eicher1 as select str_to_date(`Date`, '%d-%M-%Y') as `Date`, `Close Price` as `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 19 preceding) as `20 Day MA`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 49 preceding) as `50 Day MA` from eicher;
/*-----------------------------------------------------------------------------------------------------*/
-- Creating hero1 table (which contains the date, close price, 20 Day MA and 50 Day MA)
create table hero1 as select str_to_date(`Date`, '%d-%M-%Y') as `Date`, `Close Price` as `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 19 preceding) as `20 Day MA`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 49 preceding) as `50 Day MA` from hero;
/*-----------------------------------------------------------------------------------------------------*/
-- Creating infosys1 table(which contains the date, close price, 20 Day MA and 50 Day MA)
create table infosys1 as select str_to_date(`Date`, '%d-%M-%Y') as `Date`, `Close Price` as `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 19 preceding) as `20 Day MA`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 49 preceding) as `50 Day MA` from infosys;
/*-----------------------------------------------------------------------------------------------------*/
-- Creating tcs1 table(which contains the date, close price, 20 Day MA and 50 Day MA)
create table tcs1 as select str_to_date(`Date`, '%d-%M-%Y') as `Date`, `Close Price` as `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 19 preceding) as `20 Day MA`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 49 preceding) as `50 Day MA` from tcs;
/*----------------------------------------------------------------------------------------------------*/
-- Creating tvs1 table(which contains the date, close price, 20 Day MA and 50 Day MA)
create table tvs1 as select str_to_date(`Date`, '%d-%M-%Y') as `Date`, `Close Price` as `Close Price`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 19 preceding) as `20 Day MA`, 
avg(`Close Price`) over (order by str_to_date(`Date`, '%d-%M-%Y') rows 49 preceding) as `50 Day MA` from tvs;
/*----------------------------------------------------------------------------------------------------*/
-- Creating master table table(which contains the date and close price of all the six stocks)
create table `master` 
select b.`Date` as `Date`, b.`Close Price` as `Bajaj`, tc.`Close Price` as `TCS`, tv.`Close Price` as `TVS`,
 i.`Close Price` as `Infosys`, e.`Close Price` as `Eicher`, h.`Close Price` as `Hero` from bajaj1 b
		inner join tcs1 tc using(`Date`)
		inner join tvs1 tv using (`Date`)
		inner join infosys1 i using(`Date`)
		inner join  eicher1 e using(`Date`) 
		inner join hero1 h using(`Date`);



-- Now using bajaj1 table to create bajaj2 table(in order to generate buy and sell values in signal column)
create table bajaj2 as 
SELECT `Date`, `Close Price`,
		case 
				WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
				WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
				ELSE 'HOLD' 
		end as `Signal`
FROM assignment.bajaj1;
/*--------------------------------------------------------------------------------------------------------*/
-- Now using eicher1 table to create eicher2 table(in order to generate buy and sell values in signal column)
create table eicher2 as 
SELECT `Date`, `Close Price`,
		case 
				WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
				WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
				ELSE 'HOLD' 
		end as `Signal`
FROM assignment.eicher1;
/*--------------------------------------------------------------------------------------------------------*/
-- Now using hero1 table to create hero2 table(in order to generate buy and sell values in signal column)
create table hero2 as 
SELECT `Date`, `Close Price`,
		case 
				WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
				WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
				ELSE 'HOLD' 
		end as `Signal`
FROM assignment.hero1;
/*--------------------------------------------------------------------------------------------------------*/
-- Now using infosys1 table to create infosys2 table(in order to generate buy and sell values in column signal)
create table infosys2 as 
SELECT `Date`, `Close Price`,
		case 
				WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
				WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
				ELSE 'HOLD' 
		end as `Signal`
FROM assignment.infosys1;
/*--------------------------------------------------------------------------------------------------------*/
-- Now using tcs1 table to create tcs2 table(in order to generate buy and sell values in signal column)
create table tcs2 as 
SELECT `Date`, `Close Price`,
		case 
				WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
				WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
				ELSE 'HOLD' 
		end as `Signal`
FROM assignment.tcs1;
/*--------------------------------------------------------------------------------------------------------*/
-- Using tvs1 table to create tvs2 table(in order to generate buy and sell values in signal column)
create table tvs2 as 
SELECT `Date`, `Close Price`,
		case 
				WHEN `20 Day MA` > `50 Day MA` AND LAG(`20 Day MA`) over() < LAG(`50 Day MA`) over() THEN 'BUY'
				WHEN `20 Day MA` < `50 Day MA` AND LAG(`20 Day MA`) over() > LAG(`50 Day MA`) over() THEN 'SELL'
				ELSE 'HOLD' 
		end as `Signal`
FROM assignment.tvs1;

-- Dropping function (using if exists to avoid error in case function doesn't exist)
DROP function IF EXISTS Assignment.signalForTheDay;

-- Now creating a User defined function 'signalForTheDay'(which takes the date as input returning the value(signal)for the particular day for the Bajaj stock) 
delimiter $$
create function signalForTheDay ( given_date varchar(10) )
returns varchar(4)
deterministic
begin
declare signal_value varchar(4);
select `Signal` into signal_value from bajaj2 where date=STR_TO_DATE(given_date, "%Y-%m-%d");
return signal_value;
end$$ 
delimiter ;

-- Now fetching the BUY/SELL/HOLD value(Signal) for desired dates
select signalForTheDay('2015-05-18') as `Signal`; -- BUY
select signalForTheDay('2015-05-21') as `Signal`; -- HOLD
select signalForTheDay('2015-08-24') as `Signal`; -- SELL
/*---------------------------------------------------------------------*/
select signalForTheDay('2015-10-19') as `Signal`; -- BUY
select signalForTheDay('2015-11-05') as `Signal`; -- HOLD
select signalForTheDay('2015-12-11') as `Signal`; -- SELL
/*---------------------------------------------------------------------*/
select signalForTheDay('2015-12-15') as `Signal`; -- BUY
select signalForTheDay('2015-12-21') as `Signal`; -- HOLD
select signalForTheDay('2015-12-23') as `Signal`; -- SELL