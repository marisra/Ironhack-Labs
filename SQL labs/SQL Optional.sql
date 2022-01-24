-- Optional

-- In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? 
-- Show the results sorted by the district_id in ascending order.
select district_id, count(client_id) from client where district_id < 10 group by district_id order by district_id;

-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
select type, count(card_id) from card group by type order by count(card_id) DESC;

-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
select account_id, sum(amount) from loan group by account_id order by sum(amount) DESC limit 10;

-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
select date, count(loan_id) from loan where date < 930907 group by date order by date DESC;

-- In the loan table, for each day in December 1997, count the number of loans issued for each unique 
-- loan duration, ordered by date and duration, both in ascending order. You can ignore days without any 
-- loans in your output.
select date, duration, count(loan_id) from loan 
where date between 971201 and 971231 
group by date, duration 
order by date, duration;

-- In the trans table, for account_id 396, sum the amount of transactions for each type 
-- (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, 
-- named as total_amount. Sort alphabetically by type.
select account_id, type, sum(amount) as total_amount from trans where account_id = 396 group by type order by type;

-- From the previous output, translate the values for type to English, rename the column to transaction_type, 
-- round total_amount down to an integer
select account_id, replace(replace(type, "PRIJEM", "incoming"), "VYDAJ", "outgoing") as transaction_type, 
floor(sum(amount)) as total_amount from trans 
where account_id = 396 
group by account_id, type 
order by type;




