create table training."user" (
	id int4 primary key,
	name varchar(50),
	mobile_number int,
	email_id varchar(100),
	password varchar(20),
	OTP int
);


CREATE TABLE training."user_order" (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    category VARCHAR(100),
    product_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES training."user"(id)
);


create table payment
(
	id int4 primary key,
	order_id Integer,
	user_id Integer,
	payment_id Integer,
	amount Integer,
	Txn_number Integer,
    Foreign key (order_id) references training."user_order"(id),
	Foreign key (user_id) references training."user"(id)
);


--     Perform the CURD operation in the above table 
--     Insert operation 


INSERT INTO "user" (id, name, mobile_number, email_id, password, OTP)
VALUES
  (1, 'Jon', 1234, 'jon@gmail.com', 'john@1234', 2314),
  (2, 'Roy', 5678, 'roy@gmail.com', 'roy@6987', 6897),
  (3, 'Alice', 2345, 'alice@gmail.com', 'alice@2345', 3456),
  (4, 'Mark', 3456, 'mark@gmail.com', 'mark@3456', 4567),
  (5, 'Sara', 4567, 'sara@gmail.com', 'sara@4567', 5678),
  (6, 'David', 5678, 'david@gmail.com', 'david@5678', 6789),
  (7, 'Emma', 6789, 'emma@gmail.com', 'emma@6789', 7890),
  (8, 'Leo', 7890, 'leo@gmail.com', 'leo@7890', 8901),
  (9, 'Nina', 8901, 'nina@gmail.com', 'nina@8901', 9012),
  (10, 'Chris', 9012, 'chris@gmail.com', 'chris@9012', 1123),
  (11, 'Olivia', 1123, 'olivia@gmail.com', 'olivia@1123', 2234),
  (12, 'Ryan', 2234, 'ryan@gmail.com', 'ryan@2234', 3345),
  (13, 'Sophia', 3345, 'sophia@gmail.com', 'sophia@3345', 4456),
  (14, 'Daniel', 4456, 'daniel@gmail.com', 'daniel@4456', 5567),
  (15, 'Mia', 5567, 'mia@gmail.com', 'mia@5567', 6678);

-- Upadate operation 

update "user"
set email_id = 'update@gmail.com',
	OTP = 7654
	WHERE name = 'Mark';
select * FROM user;

-- Similarily we are also perform the other required changes in the table


-- Read Operation 
-- For the specific columns

select name ,email_id from "user";
-- For the whole table
select * from "user";


-- Now we are storing the data in our user_order table and perform the operation

INSERT INTO training."user_order" (id, user_id, category, product_name)
VALUES
  (101,1,'Fruit','Banana'),
  (202,2,'Food','Rice'),
  (303,3,'Fruit','Apple'),
  (404,11,'Food','Bread'),
  (505,5,'Fruit','Orange'),
  (606,6,'Food','Pasta'),
  (707,7,'Fruit','Mango'),
  (808,8,'Food','Cheese'),
  (909,9,'Fruit','Grapes'),
  (102,10,'Fruit','Mango');


SELECT * FROM training."user";
SELECT * FROM training."user_order";


-- Now we are storing the data in our payment table and perform the operation

INSERT INTO payment
(id, order_id, user_id, payment_id, amount, Txn_number)
VALUES
  (1, 101, 1, 10001, 120, 900001),
  (2, 202, 2, 10002, 250, 900002),
  (3, 303, 3, 10003, 180, 900003),
  (4, 404, 11, 10004, 90, 900004),
  (5, 505, 5, 10005, 150, 900005),
  (6, 606, 6, 10006, 220, 900006),
  (7, 707, 7, 10007, 175, 900007),
  (8, 808, 8, 10008, 300, 900008),
  (9, 909, 9, 10009, 200, 900009),
  (10, 102, 10, 10010, 160, 900010);


select * from training."payment";


-- Now we are doing the task 2 
-- create a mdm table and making category table including (id and category_name) in it.
-- Now delete column category from user_order table.
-- Create reltion in order table with category table.

create table training.mdm_category
(
	category_id int4 primary key,
	category_name varchar(50)
	
--  Foreign key (id) REFERENCES training."user_order"(id);
);

select * from mdm_category;
-- we are deleting the column from the uder-order table

alter table user_order
drop column category;

select * from user_order;

-- Now making the relation with user_order table and category table

INSERT INTO training.mdm_category (category_id, category_name)
values
  (1,'Fresh fruits'),
  (2,'Daily food items'),
  (51,'Fresh fruits'),
  (52,'Daily food items');

select * from mdm_category;

alter table "user_order" 
add column category_id int;



insert into "user_order" (category_id) VALUES (61);
select * from "user_order";





alter table mdm_category 
add column user_order_id BIGINT;


alter table training.mdm_category
add  FOREIGN KEY (category_id) REFERENCES training."user_order"(category_id);














