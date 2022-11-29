-- Q1) DDL Queries --  
-- Creating the database --
create database if not exists ecommerce_store;
-- Using the created Database --
use ecommerce_store;
-- Creating table Supplier --
create table if not exists supplier(
	supp_id int unsigned primary key,
    supp_name varchar(50) not null,
    supp_city varchar(50) not null,
    supp_phone varchar(50) not null
);
-- Creating table customer --
create table if not exists customer (
	cus_id int unsigned primary key,
    cus_name varchar(20) not null,
    cus_phone varchar(15) not null,
    cus_email varchar(30) not null unique,
    cus_city varchar(30) not null,
    cus_gender enum('M','F') not null
);
-- Creating table Catogory --
create table if not exists catogory (
	cat_id int unsigned primary key,
    cat_name varchar(20) not null,
    parent_cat_id int unsigned,
    foreign key(parent_cat_id) references catogory(cat_id)
);
-- Creating table product -- 
create table if not exists product (
	pro_id int unsigned primary key,
    pro_name varchar(50) not null default "dummy",
    pro_desc varchar(100) not null,
    cat_id int unsigned not null,
    foreign key(cat_id) references catogory(cat_id)
);
-- Creating table supplier_pricing
create table if not exists supplier_pricing (
	pricing_id int unsigned primary key,
    pro_id int unsigned not null,
    supp_id int unsigned not null,
    supp_price int unsigned not null default 0,
    foreign key (pro_id) references product(pro_id),
    foreign key (supp_id) references supplier(supp_id)
);
-- Creating table order --
create table if not exists `order`(
	ord_id int unsigned primary key,
	ord_amount int not null,
	ord_date date not null,
	cus_id int unsigned not null,
	pricing_id int unsigned not null,
	foreign key(cus_id) references customer(cus_id),
	foreign key(pricing_id) references supplier_pricing(pricing_id)
);
 -- Creating table rating --
 create table if not exists rating(
	rat_id int unsigned primary key,
    ord_id int unsigned not null,
    rat_stars int not null,
    foreign key(ord_id) references `order`(ord_id)
);

-- DML Queries --

-- Q2) Inserting Table Values --

-- Inserting values into supplier table --
INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

-- Inserting values into customer table --
INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"aakash@gmail.com","DELHI",'M');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"aman@gmail.com","NOIDA",'M');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"neha@yahoo.com","MUMBAI",'F');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"megha@gmail.com","KOLKATA",'F');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"pulkit@gmail.com","LUCKNOW",'M');

-- Inserting values into Catogory table --
INSERT INTO catogory VALUES( 1,"BOOKS",1);
INSERT INTO catogory VALUES(2,"GAMES",2);
INSERT INTO catogory VALUES(3,"GROCERIES",3);
INSERT INTO catogory VALUES (4,"ELECTRONICS",4);
INSERT INTO catogory VALUES(5,"CLOTHES",5);

-- Inserting values into product table --
INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

-- Inserting values into supplier_pricing table --
INSERT INTO supplier_pricing VALUES(1,1,2,1500);
INSERT INTO supplier_pricing VALUES(3,5,1,3000);
INSERT INTO supplier_pricing VALUES(4,2,3,2500);
INSERT INTO supplier_pricing VALUES(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

-- Inserting values into order table --
INSERT INTO `order`(ord_id,ord_amount,ord_date,cus_id,pricing_id) VALUES (101,1500,"2021-10-06",2,1),
(102,1000,"2021-10-12",3,5),
(103,30000,"2021-09-16",5,3),
(104,1500,"2021-10-05",1,1),
(105,3000,"2021-08-16",4,3),
(106,1450,"2021-08-18",1,9),
(107,789,"2021-09-01",3,7),
(108,780,"2021-09-07",5,6),
(109,3000,"2021-09-10",5,3),
(110,2500,"2021-09-10",2,4),
(111,1000,"2021-09-15",4,5),
(112,789,"2021-09-16",4,7),
(113,31000,"2021-09-16",1,8),
(114,1000,"2021-09-16",3,5),
(115,3000,"2021-09-16",5,3),
(116,99,"2021-09-17",2,14);

-- Inserting values into rating table --

INSERT INTO rating VALUES(1,101,4);
INSERT INTO rating VALUES(2,102,3);
INSERT INTO rating VALUES(3,103,1);
INSERT INTO rating VALUES(4,104,2);
INSERT INTO rating VALUES(5,105,4);
INSERT INTO rating VALUES(6,106,3);
INSERT INTO rating VALUES(7,107,4);
INSERT INTO rating VALUES(8,108,4);
INSERT INTO rating VALUES(9,109,3);
INSERT INTO rating VALUES(10,110,5);
INSERT INTO rating VALUES(11,111,3);
INSERT INTO rating VALUES(12,112,4);
INSERT INTO rating VALUES(13,113,2);
INSERT INTO rating VALUES(14,114,1);
INSERT INTO rating VALUES(15,115,1);
INSERT INTO rating VALUES(16,116,0);


-- Query Solutions --

-- Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. --
-- Solution --
select  c.cus_gender as Customer_Gender, count(*) as Order_Count, sum(o.ord_amount) as Total_Sum_of_Orders_above_3000 
from customer as c 
inner join `order` as o on o.cus_id = c.cus_id 
where ord_amount >= 3000 
group by c.cus_gender;
 
-- Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2. --
-- Solution --
select o.ord_id as Order_id, p.pro_name as Product_Name, o.ord_amount as Order_Amount, o.ord_date as Order_Date, o.cus_id as Customer_id
from product as p, supplier_pricing as s, `order` as o 
where s.pricing_id = o.pricing_id and s.pro_id = p.pro_id and o.cus_id = 2;

-- Q5) Display the Supplier details who can supply more than one product. --
-- Solution --
select supplier.* from supplier where supplier.supp_id in
(select supp_id from supplier_pricing 
group by supp_id having count(supp_id)>1) 
group by supplier.supp_id;

-- Q6) Find the least expensive product from each category and print the table with category id, name, product name and price of the product. --
-- Solution --
select c.cat_id as Catogory_id, c.cat_name as Catogory_Name, p.pro_name as Product_Name, min(s.supp_price) as Price_Of_Product 
from catogory as c, product as p, supplier_pricing as s 
where c.cat_id = p.cat_id and s.pro_id = p.pro_id 
group by c.cat_id order by c.cat_id asc;

-- Q7) Display the Id and Name of the Product ordered after “2021-10-05”. --
-- Solution --
select p.pro_id as Product_id, p.pro_name as Product_Name, o.ord_date as Order_Date 
from product as p, supplier_pricing as s, `order` as o 
where s.pro_id = p.pro_id and o.pricing_id = s.pricing_id 
and o.ord_date > '2021-10-05';

-- Q8) Display customer name and gender whose names start or end with character 'A'. --
-- Solution --
select cus_name as Customer_Name, cus_gender as Customer_Gender 
from customer 
where cus_name like 'A%' or cus_name like '%A';

-- Q9) Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent  Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. --
-- Solution --

-- Creating the Stored Procedure --
DELIMITER &&
create procedure TypeOfServiceForSupplier()
BEGIN
select su.supp_id as Supplier_Id, su.supp_name as Supplier_Name, avg(r.rat_stars) as Average_Rating,
case
when avg(r.rat_stars) = 5 then 'Excellent Service'
when avg(r.rat_stars) > 4 then 'Good Service'
when avg(r.rat_stars) > 2 then 'Average Service'
else 'Poor Service'
end as Type_of_Service
from supplier as su, rating as r, supplier_pricing as s, `order` as o 
where r.ord_id = o.ord_id and o.pricing_id = s.pricing_id and s.supp_id = su.supp_id
group by su.supp_id 
order by su.supp_id asc;
END&&
DELIMITER ;
-- Calling the Stored Procedure -- 
call TypeOfServiceForSupplier();
  





