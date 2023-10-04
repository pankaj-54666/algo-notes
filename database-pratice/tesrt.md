# docker setup
option1: spin-up a docker instance of postgresql to test on terminal.
option2: install postgresql on corresponding os.

# table creation

install postgresql & pgadmin.
table creation command.
alter table command.

table with column constrain:    not null field, SERIAL, string, VARCHAR, boolean, enum?
alter table column name.
alter table column constrain.

create two table with fk relationship.
alter fk constrain.

effect of cascade key on table creation


# data insertion
insert data into table.
insert data having fk constrain.
debug:  insertion fail issue. (due to constrain violation)

insert bulk data.
insert without fk exist in different table & review the database error.

update a row.
delete a row.
cascade delete for fk.

write out mybatis code for : insertion,deletion and update.
in mybatis return appropriate iteams after operation.

# mastering search1

search from employee table, who have kumar as their last name.
search from employee and department table to print the department of ramesh.
    - use JOIN statement
    - use WHERE clause

- search consecutive log file : LCxyz

self join examples.
join two table. (INNER,LEFT,RIGHT,OUTER) (draw diagram depicting its visualization)

use GROUP BY to get all exercise in a workout as commma seperated string. (hint:check workout-app project)

give one example each where: left join is required, right join is required.

using GROUP BY and MAX, find MAX salary of employee.

# exercise1
TODO: list down leetcode and other problems which you want to pratice later here.

# mastering search2

Use of HAVING with GROUP BY : having helps filtering after the group by has been done.
operators in query: (+,-,*,/)
window function
aggregator functions : MAX,SUM,MIN,AVG
GROUP BY : Date(month, year)

useful functions: ROUND


# mastering subquery

helpful for cleaner query: 
## subquery : query inside another query
subquery can go at various places like in the FORM clause(works like a table), in the WHERE clause (with operator, IN keyworks)

subquery in WHERE
    - subquery with single row
    - subquery with multiple rows
    - subquery with multiple column

subquery in FROM clause

subquery in SELECT clause

nested query vs correlated query 
> a correlated query is a type of nested query, where the outer query cannot run indepedently of the inner query.


    

## views



userful keyworks: LIMIT

# exercise2
currency conversion problem from ms3 (l05)


# triggers

#







# Exercise
