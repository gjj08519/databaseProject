drop database if exists online_shopping;
create database online_shopping;
use online_shopping;

# Customer
create table customer 
(customer_id smallint primary key auto_increment,
customer_name varchar(30) not null
);

# Address
create table address
(address_number smallint primary key auto_increment,
customer_id smallint,
street_address varchar(30) not null,
city varchar(30) not null,
phone varchar(20) not null,
zip varchar(10) not null,
country varchar(30) not null,
foreign key(customer_id) references customer(customer_id)
);

# Appartment address
create table apt_address
(address_number smallint primary key,
apt_number smallint not null,
building varchar(20) not null,
foreign key(address_number) references address(address_number)
);

# Account
create table `account`
(account_number smallint primary key auto_increment,
customer_id smallint,
email varchar(254) not null,
password varchar(100) not null,
foreign key(customer_id) references customer(customer_id)
);

# Premium account
create table premium_account
(account_number smallint primary key,
points int not null,
foreign key(account_number) references `account`(account_number)
);

# Bank card
create table bankcard 
(bankcard_number bigint,
card_type varchar(6) not null,
cvv_code smallint not null,
expiration_date date not null,
primary key(bankcard_number)
);

# Account & Bankcard
create table linked_bankcard
(account_number smallint,
bankcard_number bigint,
primary key(account_number, bankcard_number),
foreign key(account_number) references `account`(account_number),
foreign key(bankcard_number) references bankcard(bankcard_number)
);

# Gift card
create table gift_card
(gift_card_code smallint primary key,
value decimal not null,
account_number smallint,
foreign key(account_number) references `account`(account_number)
);

# Category
create table category(
category_id smallint primary key auto_increment,
category_name varchar(20) not null unique,
parent_category_id smallint,
foreign key(parent_category_id) references category(category_id)
);

# Wishlist
create table wishlist
(category_id smallint,
account_number smallint,
primary key(category_id, account_number),
foreign key(category_id) references category(category_id),
foreign key(account_number) references `account`(account_number)
);

# Brand
create table brand
(brand_id smallint primary key auto_increment,
brand_name varchar(20) not null unique
);

# Product
create table product
(product_id smallint primary key auto_increment,
product_name varchar(100) not null unique,
product_description varchar(100) not null,
brand_id smallint not null,
foreign key(brand_id) references brand(brand_id));

# Category & Product
create table category_product
(category_id smallint,
product_id smallint,
primary key(category_id, product_id),
foreign key(category_id) references category(category_id),
foreign key(product_id) references product(product_id)
);

# Color
create table color
(color_id smallint primary key auto_increment,
color_name varchar(30) not null unique
);

# Size
create table size
(size_id smallint primary key auto_increment,
size_name varchar(30) not null unique
);

# Inventory
create table inventory(
inventory_id smallint primary key auto_increment,
product_id smallint not null,
price double not null,
item_count smallint not null,
color_id smallint,
size_id smallint,
foreign key(product_id) references product(product_id),
foreign key(color_id) references color(color_id),
foreign key(size_id) references size(size_id)
);

# Shopping cart
create table shopping_cart
(account_number smallint,
inventory_id smallint,
qty smallint not null,
primary key(account_number, inventory_id),
foreign key(account_number) references `account`(account_number),
foreign key(inventory_id) references inventory(inventory_id)
);

# Shipper
create table shipper(
shipper_id smallint primary key auto_increment,
company_name varchar(20) not null
);

# Order
create table `order`
(order_number smallint primary key auto_increment,
order_date date not null,
shipment_date date,
account_number smallint not null,
payment_method varchar(6) not null,
shipper_id smallint,
address_number smallint not null,
foreign key(account_number) references `account`(account_number),
foreign key(shipper_id) references shipper(shipper_id),
foreign key(address_number) references address(address_number)
);

# Order details
create table order_details
(order_number smallint,
inventory_id smallint,
qty smallint not null,
price double not null,
primary key(order_number, inventory_id),
foreign key(order_number) references `order`(order_number),
foreign key(inventory_id) references inventory(inventory_id)
);

# Insert data into CUSTOMER table
insert into customer(customer_name) value('Peter Parker');
insert into customer(customer_name) value('Bruce Wayne');
insert into customer(customer_name) value('Tony Stark');
insert into customer(customer_name) value('Stephen Strange');
insert into customer(customer_name) value('Steve Rogers');
insert into customer(customer_name) value('Adrian Toomes');
insert into customer(customer_name) value('Norman Osborn');
insert into customer(customer_name) value('Charles Francis Xavier');
insert into customer(customer_name) value('James Rhodes');
insert into customer(customer_name) value('Hieu Dao Le Duc');
insert into customer(customer_name) value('Thai Vu Pham');
insert into customer(customer_name) value('Jean Bart');
insert into customer(customer_name) value('Antoly Pavrok');
insert into customer(customer_name) value('Papope');
insert into customer(customer_name) value('Papa Thanh');
insert into customer(customer_name) value('Freddy Gaylord');
insert into customer(customer_name) value('Theo Uchiha');
insert into customer(customer_name) value('Bayonetta');
insert into customer(customer_name) value('Golden Darkness');
insert into customer(customer_name) value('Satos San');
insert into customer(customer_name) value('idonthaveaccountoraddress');

# select * from customer;

# Insert data into ACCOUNT table
insert into account(customer_id, email, password) value(1, 'parker@gmail.com', '1234');
insert into account(customer_id, email, password) value(8, 'xavier@gmail.com', '4235');
insert into account(customer_id, email, password) value(3, 'tony@gmail.com', '4235');
insert into account(customer_id, email, password) value(1, 'peter@gmail.com', '5678');
insert into account(customer_id, email, password) value(2, 'wayne@gmail.com', '5555');
insert into account(customer_id, email, password) value(2, 'batman@gmail.com', '4892');
insert into account(customer_id, email, password) value(3, 'stark@gmail.com', '7645');
insert into account(customer_id, email, password) value(8, 'charles@gmail.com', '5333');
insert into account(customer_id, email, password) value(5, 'steve@gmail.com', '2341');
insert into account(customer_id, email, password) value(6, 'adrian@gmail.com', '4224');
insert into account(customer_id, email, password) value(9, 'james@gmail.com', '8765');
insert into account(customer_id, email, password) value(17, 'revengetomyclan@gmail.com', '321');
insert into account(customer_id, email, password) value(4, 'stephen@gmail.com', '9876');
insert into account(customer_id, email, password) value(6, 'toomes@gmail.com', '3333');
insert into account(customer_id, email, password) value(4, 'strange@gmail.com', '2322');
insert into account(customer_id, email, password) value(10, 'DepzDaoHieu@gmail.com', '4862');
insert into account(customer_id, email, password) value(11, 'Thaivu@gmail.com', '6464645');
insert into account(customer_id, email, password) value(7, 'norman@gmail.com', '6453');
insert into account(customer_id, email, password) value(13, 'skyhigh432@gmail.com', '434334');
insert into account(customer_id, email, password) value(18, 'revengemynigs@gmail.com', '15623');
insert into account(customer_id, email, password) value(12, 'ffnf-jb@yahoo.com', '4363');
insert into account(customer_id, email, password) value(15, 'Bignut@gmail.com', '7894');
insert into account(customer_id, email, password) value(2, 'bruce@gmail.com', '2222');
insert into account(customer_id, email, password) value(16, 'thanhisgay@gmail.com', '8723');
insert into account(customer_id, email, password) value(14, 'thaipham@gmail.com', '7414');
insert into account(customer_id, email, password) value(19, 'Itsdarkinhere@gmail.com', '1621');
insert into account(customer_id, email, password) value(20, 'santodaiki@gmail.com', '312');

# select * from account;
# select * from customer c left join account a on c.customer_id = a.customer_id;

# Insert data into ADDRESS table
insert into address(customer_id, street_address, city, phone, zip, country) value(2, '1007 Mountain Drive', 'Gotham', '374685', '02435', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(2, '1007 Mountain Drive', 'Gotham', '345553', '02435', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(4, '177A Bleecker', 'New York', '674674', '10012', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(1, '20 Ingram', 'New York', '546546', '11375', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(3, '10880 Malibu Point', 'Malibu', '742456', '90265', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(9, '590 Fifth Avenue', 'New York', '134233', '10036', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(5, 'Willow', 'New York', '385372', '56473', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(9, '590 Fifth Avenue', 'New York', '678883', '10036', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(10, '420 Six Nine', 'Alahu', '486258', '48655', 'Acba');
insert into address(customer_id, street_address, city, phone, zip, country) value(14, '69 Six Nine', 'Alahu', '486555', '48755', 'Acba');
insert into address(customer_id, street_address, city, phone, zip, country) value(3, '9826 La Jolla Farms', 'La Jolla', '567829', '92037', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(7, '124 W Miller', 'New York', '432512', '14513', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(7, '124 W Miller', 'New York', '531322', '14513', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(10, '419 Six Nine', 'Alahu', '789655', '48775', 'Acba');
insert into address(customer_id, street_address, city, phone, zip, country) value(15, '140 Graymalkin Lane', 'New York', '789654', '78945', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(11, '582 Columbus Avenue Thornwood', 'New York', '574833', '10560', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(16, '33 Subida Virgen Cabeza', 'Toledo', '797444', '45004', 'Spain');
insert into address(customer_id, street_address, city, phone, zip, country) value(16, '34 Subida Virgen Cabeza', 'Toledo', '878678', '45005', 'Spain');
insert into address(customer_id, street_address, city, phone, zip, country) value(4, '177A Bleecker', 'New York', '553332', '10012', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(4, '177A Bleecker', 'New York', '783924', '10012', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(6, '73 Carroll', 'North Grafton', '765334', '01536', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(12, '11 Avenue de Guy', 'Rennes', '967823', '35000', 'France');
insert into address(customer_id, street_address, city, phone, zip, country) value(13, '675 Dalmouth', 'New York', '654253', '32422', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(8, '1407 Graymalkin Lane', 'New York', '645322', '10560', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(17, '96 Champs-Elysees', 'Paris', '432311', '31122', 'France');
insert into address(customer_id, street_address, city, phone, zip, country) value(18, '68 Six Nine', 'Alahu', '325615', '48655', 'Acba');
insert into address(customer_id, street_address, city, phone, zip, country) value(19, '67 Six Nine', 'Alahu', '452344', '48655', 'Acba');
insert into address(customer_id, street_address, city, phone, zip, country) value(20, '321 7th Avenue', 'Tokyo', '985437', '35798', 'Japan');
insert into address(customer_id, street_address, city, phone, zip, country) value(13, '675 Dalmouth', 'New York', '654525', '32422', 'USA');
insert into address(customer_id, street_address, city, phone, zip, country) value(18, '68 Six Nine', 'Alahu', '456234', '48655', 'USA');

# select * from address;
# select * from customer c left join address a on c.customer_id = a.customer_id;

# Insert data into APT_ADDRESS
insert into apt_address value(7, 569, 'Leaman Place');

# select * from address a1 left join apt_address a2 on a1.address_number = a2.address_number;

# Insert data into BANKCARD
insert into bankcard value(12345, 'credit', 123, '24-12-13');
insert into bankcard value(34234, 'debit', 657, '24-02-29');
insert into bankcard value(67890, 'debit', 345, '21-06-16');
insert into bankcard value(64234, 'credit', 234, '23-11-01');
insert into bankcard value(11111, 'credit', 555, '22-12-25');
insert into bankcard value(93847, 'credit', 678, '25-08-31');
insert into bankcard value(64362, 'debit', 567, '22-04-12');
insert into bankcard value(54362, 'debit', 345, '24-09-18');
insert into bankcard value(24452, 'credit', 233, '25-07-06');
insert into bankcard value(43212, 'debit', 135, '21-12-12');
insert into bankcard value(45512, 'debit', 168, '20-12-21');
insert into bankcard value(23423, 'credit', 777, '24-01-17');
insert into bankcard value(53422, 'credit', 254, '23-01-05');
insert into bankcard value(43523, 'debit', 653, '22-02-01');
insert into bankcard value(26732, 'credit', 767, '22-03-07');
insert into bankcard value(48625, 'debit', 486, '21-08-04');
insert into bankcard value(74125, 'credit', 321, '21-05-24');
insert into bankcard value(85718, 'debit', 593, '24-03-09');
insert into bankcard value(24532, 'debit', 534, '21-12-09');
insert into bankcard value(54233, 'credit', 111, '25-08-23');
insert into bankcard value(94544, 'credit', 432, '23-06-03');
insert into bankcard value(32546, 'credit', 167, '22-09-14');
insert into bankcard value(88888, 'debit', 169, '22-02-07');
insert into bankcard value(77693, 'debit', 543, '21-11-23');
insert into bankcard value(78932, 'credit', 798, '21-12-09');
insert into bankcard value(76548, 'debit', 482, '25-10-16');
insert into bankcard value(34526, 'debit', 456, '24-02-23');
insert into bankcard value(67657, 'debit', 786, '24-02-15');
insert into bankcard value(32253, 'debit', 877, '24-01-23');
insert into bankcard value(48658, 'debit', 763, '23-12-08');
insert into bankcard value(12365, 'credit', 486, '23-12-08');
insert into bankcard value(99999, 'credit', 166, '21-04-13');
insert into bankcard value(83467, 'debit', 123, '24-11-06');

# select * from bankcard;

# Insert data into LINKED_BANKCARD
insert into linked_bankcard value(1, 12345);
insert into linked_bankcard value(2, 34234);
insert into linked_bankcard value(3, 67890);
insert into linked_bankcard value(4, 12345);
insert into linked_bankcard value(5, 64234);
insert into linked_bankcard value(6, 11111);
insert into linked_bankcard value(7, 93847);
insert into linked_bankcard value(8, 64362);
insert into linked_bankcard value(9, 54362);
insert into linked_bankcard value(11, 24452);
insert into linked_bankcard value(12, 43212);
insert into linked_bankcard value(12, 45512);
insert into linked_bankcard value(13, 23423);
insert into linked_bankcard value(14, 53422);
insert into linked_bankcard value(15, 43523);
insert into linked_bankcard value(15, 26732);
insert into linked_bankcard value(16, 48625);
insert into linked_bankcard value(16, 74125);
insert into linked_bankcard value(17, 85718);
insert into linked_bankcard value(18, 54233);
insert into linked_bankcard value(18, 24532);
insert into linked_bankcard value(19, 94544);
insert into linked_bankcard value(20, 32546);
insert into linked_bankcard value(20, 88888);
insert into linked_bankcard value(21, 77693);
insert into linked_bankcard value(22, 78932);
insert into linked_bankcard value(22, 76548);
insert into linked_bankcard value(23, 34526);
insert into linked_bankcard value(24, 67657);
insert into linked_bankcard value(24, 32253);
insert into linked_bankcard value(25, 48658);
insert into linked_bankcard value(25, 12365);
insert into linked_bankcard value(26, 99999);
insert into linked_bankcard value(27, 83467);

# Display customer name, their account, their linked bankcard
# select * from (select c.customer_id, c.customer_name, a.account_number from customer c left join account a on c.customer_id = a.customer_id) temp1 left join (select a.account_number, l.bankcard_number from account a left join linked_bankcard l on a.account_number = l.account_number) temp2 on temp1.account_number = temp2.account_number;

# Insert data into BRAND
insert into brand(brand_name)
VALUES
('Nintendo'),
('Play-Doh'),
('AMD'),
('TEKTON'),
('Scotch'),
('Bright Starts'),
('Dyson'),
('Softsoap'),
('Gorilla'),
('Sony'),
('Solimo'),
('Rain-X'),
('Kayhoma'),
('Colgate'),
('Wrangler'),
('Soundance'),
('Speedball'),
('JanSport'),
('Tombow'),
('Multipet'),
('Wacom'),
('Lixit'),
('Hanes'),
('TOZO'),
('Apple'),
('Govee');

# select * from brand;

# Insert data into PRODUCT table BRANDS MUST ALSO BE ADDED
insert into product(product_name, product_description, brand_id) value('Play-Doh', 'Can of changable colored clay that can be molded into different shapes.', 2);
insert into product(product_name, product_description, brand_id) value('Switch', 'A game console which can switch between hand held and docked mode to play games in different ways.', 1);
insert into product(product_name, product_description, brand_id) value('Jeans', 'Durable non-flexible pants that can be worn in any situation.', 15);
insert into product(product_name, product_description, brand_id) value('Classic Crunchy and Soft Cat Treats', 'A container of treats to give cats when displaying good behavior.', 11);
insert into product(product_name, product_description, brand_id) value('Ryzen 7 5800X', 'A powerfull cpu for high end computers.', 3);
insert into product(product_name, product_description, brand_id) value('Rain-X Windshield Washer Fluid', 'Fluid to wash windshields.', 12);
insert into product(product_name, product_description, brand_id) value('Solimo Flexible Fabric Adhesive Bandages', 'Adhesive bandages to play on small cuts or scrapes.', 11);
insert into product(product_name, product_description, brand_id) value('Gumby Dog Toy', 'A pet toy shaped like a character called Gumby', 20);
insert into product(product_name, product_description, brand_id) value('Bright Starts Rattle & Shake Barbell Toy', 'Baby toy meant for ages 3 months and above that rattles and shines brightly.', 6);
insert into product(product_name, product_description, brand_id) value('Colgate Cavity Protection Toothpaste with Fluoride', 'A toothpaste to help improve the oral health of the user.', 14);
insert into product(product_name, product_description, brand_id) value('JanSport SuperBreak Backpack', 'A great light backpack for schoolbooks and other such things.', 18);
insert into product(product_name, product_description, brand_id) value('TEKTON Digital Tire Gauge', 'Device to guage the state of car tires.', 4);
insert into product(product_name, product_description, brand_id) value('Kayhoma Extra Long Cotton Stripe Thigh High Socks', 'Long colorfull socks people wear over the knee also called programing socks.', 13);
insert into product(product_name, product_description, brand_id) value('Softsoap Liquid Hand Soap, Fresh Breeze', 'A soap to wash hands with, great for stoping the spread of disease.', 8);
insert into product(product_name, product_description, brand_id) value('Animal Crossing: New Horizons', 'A calm game about living on an island for the Nintendo Switch.', 1);
insert into product(product_name, product_description, brand_id) value('Dyson V11 Animal Cordless Vacuum Cleaner', 'Machine to clean floors efficiently.', 7);
insert into product(product_name, product_description, brand_id) value('Scotch Precision Scissors', 'Scissors to cut things with.', 5);
insert into product(product_name, product_description, brand_id) value('Scotch Magic Tape', 'Clear tape to be used to fix light disconects between objects.', 5);
insert into product(product_name, product_description, brand_id) value('TEKTON 1/2 Inch Drive Click Torque Wrench', 'A wrench to apply torque force to objects.', 4);
insert into product(product_name, product_description, brand_id) value('Colgate Extra Clean Toothbrush', 'Toothbrush to clean dirty teeth with.', 14);
insert into product(product_name, product_description, brand_id) value('Hanes Men Ecosmart Fleece Sweatshirt', 'Simple sweatshirt to wear.', 23);
insert into product(product_name, product_description, brand_id) value('Gorilla Dual Temp Mini Hot Glue Gun', 'A glue gun to glue things with.', 9);
insert into product(product_name, product_description, brand_id) value('Lixit Quick Lock Bird Bath', 'A small bathing area for small pet birds to use.', 22);
insert into product(product_name, product_description, brand_id) value('Tombow Fudenosuke Brush Pen', 'Fancy pens that look like brushstrokes upon drawing them down.', 19);
insert into product(product_name, product_description, brand_id) value('JanSport Fifth Ave Fanny Pack', 'Fanny pack to be worn around waist.', 18);
insert into product(product_name, product_description, brand_id) value('TEKTON 5866 Oil Filter Pliers', 'Pliers to be used for oil filters.', 4);
insert into product(product_name, product_description, brand_id) value('Hanes Mens Short Sleeve Beefy-t', 'Shirt that covers the core region.', 23);

# select * from brand b left join product p on b.brand_id = p.brand_id;

# Insert data into CATEGORY
insert into category(category_name) value('Electronics');
insert into category(category_name) value('Games');
insert into category(category_name) value('Toys');
insert into category(category_name) value('Tools');
insert into category(category_name) value('Craft Supplies');
insert into category(category_name) value('Cleaning & Hygiene');
insert into category(category_name) value('Pet Supplies');
insert into category(category_name) value('Medicals');
insert into category(category_name) value('Clothing/Accessories');
insert into category(category_name, parent_category_id) value('Gaming Devices', 1);
insert into category(category_name, parent_category_id) value('Computer Components', 1);
insert into category(category_name, parent_category_id) value('Cleaning Devices', 1);
insert into category(category_name, parent_category_id) value('Video Games', 2);
insert into category(category_name, parent_category_id) value('Board Games', 2);
insert into category(category_name, parent_category_id) value('Toys for Children', 3);
insert into category(category_name, parent_category_id) value('Toys for Babies', 3);
insert into category(category_name, parent_category_id) value('Toys for Pets', 3);
insert into category(category_name, parent_category_id) value('Car Tools', 4);
insert into category(category_name, parent_category_id) value('Hand Tools', 4);
insert into category(category_name, parent_category_id) value('Craft Tools', 4);
insert into category(category_name, parent_category_id) value('Craft Adhesives', 5);
insert into category(category_name, parent_category_id) value('Craft Cutting', 5);
insert into category(category_name, parent_category_id) value('Craft Drawing', 5);
insert into category(category_name, parent_category_id) value('Hand Soaps', 6);
insert into category(category_name, parent_category_id) value('Washer Fluids', 6);
insert into category(category_name, parent_category_id) value('Toothpastes', 6);
insert into category(category_name, parent_category_id) value('Toothbrushes', 6);
insert into category(category_name, parent_category_id) value('Pet Food', 7);
insert into category(category_name, parent_category_id) value('Pet Toys', 7);
insert into category(category_name, parent_category_id) value('Pet Bathing', 7);
insert into category(category_name, parent_category_id) value('Bandages', 8);
insert into category(category_name, parent_category_id) value('Men Clothing', 9);
insert into category(category_name, parent_category_id) value('Women Clothing', 9);
insert into category(category_name, parent_category_id) value('Unisex Clothing', 9);
insert into category(category_name, parent_category_id) value('Unisex Accessories', 9);

# select * from category pc left join category cc on pc.category_id = cc.parent_category_id;

select * from product;
# Insert data into CATEGORY_PRODUCT
insert into category_product value(1, 3);
insert into category_product value(1, 6);
insert into category_product value(1, 17);
insert into category_product value(2, 16);
insert into category_product value(3, 1);
insert into category_product value(3, 2);
insert into category_product value(3, 9);
insert into category_product value(3, 10);
insert into category_product value(4, 13);
insert into category_product value(4, 18);
insert into category_product value(4, 20);
insert into category_product value(4, 23);
insert into category_product value(4, 27);
insert into category_product value(5, 18);
insert into category_product value(5, 19);
insert into category_product value(5, 23);
insert into category_product value(5, 25);
insert into category_product value(6, 7);
insert into category_product value(6, 11);
insert into category_product value(6, 15);
insert into category_product value(6, 21);
insert into category_product value(7, 5);
insert into category_product value(7, 9);
insert into category_product value(7, 24);
insert into category_product value(8, 8);
insert into category_product value(9, 4);
insert into category_product value(9, 12);
insert into category_product value(9, 14);
insert into category_product value(9, 22);
insert into category_product value(9, 26);
insert into category_product value(10, 3);
insert into category_product value(11, 6);
insert into category_product value(12, 17);
insert into category_product value(13, 16);
insert into category_product value(15, 1);
insert into category_product value(15, 2);
insert into category_product value(17, 9);
insert into category_product value(16, 10);
insert into category_product value(18, 13);
insert into category_product value(20, 18);
insert into category_product value(19, 20);
insert into category_product value(19, 23);
insert into category_product value(20, 23);
insert into category_product value(19, 27);
insert into category_product value(21, 19);
insert into category_product value(22, 18);
insert into category_product value(21, 23);
insert into category_product value(23, 25);
insert into category_product value(25, 7);
insert into category_product value(26, 11);
insert into category_product value(24, 15);
insert into category_product value(27, 21);
insert into category_product value(28, 5);
insert into category_product value(29, 9);
insert into category_product value(30, 24);
insert into category_product value(31, 8);
insert into category_product value(34, 4);
insert into category_product value(35, 12);
insert into category_product value(33, 14);
insert into category_product value(32, 22);
insert into category_product value(35, 26);

# select * from category c left join (select category_id, cp.product_id from category_product cp, product p where cp.product_id = p.product_id) temp on c.category_id = temp.category_id;

#Insert data into SIZE
insert into size(size_name)
VALUES
('None'),
('Extra Small'),
('Small'),
('Medium-Small'),
('Medium'),
('Medium-Large'),
('Large'),
('Extra Large'),
('All');

#Insert data into COLOR
insert into color(color_name)
VALUES
('None'),
#Whites 2-13
('White'), 
('White/Grey'),
('White/Black'),
('White/Brown'),
('White/Red'),
('White/Blue'),
('White/Yellow'),
('White/Orange'),
('White/Purple'),
('White/Green'),
('White/Pink'),
('White/Cyan'),
#Grey 14-24
('Grey'),
('Grey/Black'),
('Grey/Brown'),
('Grey/Red'),
('Grey/Blue'),
('Grey/Yellow'),
('Grey/Orange'),
('Grey/Purple'),
('Grey/Green'),
('Grey/Pink'),
('Grey/Cyan'),
#Black 25-34
('Black'),
('Black/Brown'),
('Black/Red'),
('Black/Blue'),
('Black/Yellow'),
('Black/Orange'),
('Black/Purple'),
('Black/Green'),
('Black/Pink'),
('Black/Cyan'),
#Brown 35-43
('Brown'),
('Brown/Red'),
('Brown/Blue'),
('Brown/Yellow'),
('Brown/Orange'),
('Brown/Purple'),
('Brown/Green'),
('Brown/Pink'),
('Brown/Cyan'),
#Red 44-51
('Red'),
('Red/Blue'),
('Red/Yellow'),
('Red/Orange'),
('Red/Purple'),
('Red/Green'),
('Red/Pink'),
('Red/Cyan'),
#Blue 52-58
('Blue'),
('Blue/Yellow'),
('Blue/Orange'),
('Blue/Purple'),
('Blue/Green'),
('Blue/Pink'),
('Blue/Cyan'),
#Yellow 59-64
('Yellow'),
('Yellow/Orange'),
('Yellow/Purple'),
('Yellow/Green'),
('Yellow/Pink'),
('Yellow/Cyan'),
#Orange 65-69
('Orange'),
('Orange/Purple'),
('Orange/Green'),
('Orange/Pink'),
('Orange/Cyan'),
#Purple 70-73
('Purple'),
('Purple/Green'),
('Purple/Pink'),
('Purple/Cyan'),
#Green 74-76
('Green'),
('Green/Pink'),
('Green/Cyan'),
#Pink 77-78
('Pink'),
('Pink/Cyan'),
#Cyan 79
('Cyan'),
#Rainbow 80
('Rainbow');

# Insert data into INVENTORY
insert into inventory(product_id, price, item_count, color_id, size_id)
VALUES
#Play-Doh 1
(1, 2.50, 24, 44, 1),
(1, 2.50, 12, 52, 1),
(1, 2.50, 6, 59, 1),
(1, 2.50, 12, 65, 1),
(1, 2.50, 12, 70, 1),
(1, 2.50, 6, 74, 1),
(1, 2.50, 6, 77, 1),
(1, 2.50, 3, 79, 1),
#Switch 2
(2, 429.99, 5, 45, 1),
(2, 429.99, 12, 15, 1),
#Jeans 3
(3, 23.99, 1, 52, 4),
(3, 24.99, 21, 52, 5),
(3, 25.99, 23, 52, 6),
(3, 29.99, 5, 52, 7),
(3, 23.99, 7, 25, 4),
(3, 24.99, 7, 25, 5),
(3, 26.99, 2, 25, 6),
#cat treats 4
(6, 9.99, 10, 44, 5),
(6, 13.99, 1, 44, 7),
(6, 8.99, 2, 52, 5),
(6, 12.99, 23, 52, 7),
(6, 8.99, 4, 59, 5),
(6, 12.99, 3, 59, 7),
#Ryzen 7 5800X 5
(5, 2.99, 4, 3, 1),
#Rain-X 6
(6, 19.99, 20, 65, 7),
#Flexible Fabric Adhesive Bandages 7
(7, 2.50, 3, 5, 1), #don't know anything about bandage sizes
#Gumby Dog Toy 8
(8, 7.50, 1123, 74, 5),
#Rattle & Shake Barbell Toy 9
(9, 9.99, 3, 80, 1),
#Toothpaste with Fluoride 10
(10, 5.50, 3, 7, 1),
#SuperBreak Backpack 11
(11, 25.99, 24, 2, 3),
(11, 25.99, 24, 25, 3),
(11, 25.99, 24, 44, 3),
(11, 25.99, 12, 52, 3),
(11, 25.99, 6, 59, 3),
(11, 25.99, 12, 65, 3),
(11, 25.99, 12, 70, 3),
(11, 25.99, 6, 74, 3),
(11, 25.99, 6, 77, 3),
(11, 25.99, 3, 79, 3),
#TEKTON Digital Tire Gauge 12
(12, 10.00, 32, 27, 1),
#Kayhoma Extra Long Cotton Stripe Thigh High Socks 13
(13, 8.45, 3, 4, 9),
(13, 8.45, 1, 11, 9),
#'Softsoap Liquid Hand Soap, Fresh Breeze' 14
(14, 3.59, 12, 6, 1),
#Animal Crossing: New Horizons 15
(15, 59.95, 21, 80, 1),
#Dyson V11 Animal Cordless Vacuum Cleaner 16
(16, 35.99, 342, 17, 1),
(16, 44.99, 2, 18, 1),
(16, 30.99, 100, 21, 1),
#Scotch Precision Scissors 17
(17, 4.98, 32, 74, 1),
#Scotch Magic Tape 18
(18, 3.33, 1, 11, 1),
#TEKTON 1/2 Inch Drive Click Torque Wrench 19
(19, 3.33, 23, 14, 1),
#Colgate Extra Clean Toothbrush 20
(20, 0.75, 2, 6, 1),
(20, 0.75, 4, 9, 1),
(20, 0.75, 55, 10, 1),
(20, 0.75, 33, 11, 1),
#Hanes Men Ecosmart Fleece Sweatshirt 21
(21, 10.53, 33, 2, 3),
(21, 16.32, 22, 2, 5),
(21, 19.99, 11, 2, 7),
(21, 21.53, 1, 2, 8),

(21, 10.53, 33, 14, 3),
(21, 16.32, 52, 14, 5),
(21, 19.99, 74, 14, 7),
(21, 21.53, 96, 14, 8),

(21, 10.53, 516, 25, 3),
(21, 16.32, 323, 25, 5),
(21, 19.99, 222, 25, 7),
(21, 21.53, 19, 25, 8),

(21, 10.53, 56, 35, 3),
(21, 16.32, 32, 35, 5),
(21, 19.99, 22, 35, 7),
(21, 21.53, 122, 35, 8),

(21, 10.53, 56, 44, 3),
(21, 16.32, 32, 44, 5),
(21, 19.99, 22, 44, 7),
(21, 21.53, 19, 44, 8),

(21, 10.53, 90, 52, 3),
(21, 16.32, 33, 52, 5),
(21, 19.99, 1, 52, 7),
(21, 21.53, 1, 52, 8),

(21, 10.53, 6, 59, 3),
(21, 16.32, 1, 59, 5),
(21, 19.99, 43, 59, 7),
(21, 21.53, 43, 59, 8),

(21, 10.53, 12, 65, 3),
(21, 16.32, 9, 65, 5),
(21, 19.99, 7, 65, 7),
(21, 21.53, 43, 65, 8),

(21, 10.53, 24, 70, 3),
(21, 16.32, 34, 70, 5),
(21, 19.99, 999, 70, 7),
(21, 21.53, 43, 70, 8),

(21, 10.53, 2, 74, 3),
(21, 16.32, 44, 74, 5),
(21, 19.99, 7, 74, 7),
(21, 21.53, 6, 74, 8),

(21, 10.53, 22, 77, 3),
(21, 16.32, 676, 77, 5),
(21, 19.99, 34, 77, 7),
(21, 21.53, 4, 77, 8),
#Gorilla Dual Temp Mini Hot Glue Gun 22
(22, 12.49, 82, 30, 1),
#Lixit Quick Lock Bird Bath 23
(23, 7.48, 971, 79, 1),
#Tombow Fudenosuke Brush Pen 24
(24, 2.00, 25, 79, 1),
(24, 2.00, 52, 79, 1),
#JanSport Fifth Ave Fanny Pack 25
(25, 23.22, 24, 2, 3),
(25, 23.22, 901, 25, 3),
(25, 23.22, 123, 44, 3),
(25, 23.22, 12, 52, 3),
(25, 23.22, 423, 59, 3),
(25, 23.22, 123, 65, 3),
(25, 23.22, 12, 70, 3),
(25, 23.22, 45, 74, 3),
(25, 23.22, 65, 77, 3),
(25, 23.22, 3, 79, 3),
#TEKTON 5866 Oil Filter Pliers 26
(26, 12.99, 23, 27, 1),
#Hanes Mens Short Sleeve Beefy-t 27
(27, 5.33, 33, 2, 3),
(27, 10.75, 22, 2, 5),
(27, 12.99, 11, 2, 7),
(27, 19.99, 1, 2, 8),

(27, 5.33, 33, 14, 3),
(27, 10.75, 52, 14, 5),
(27, 12.99, 74, 14, 7),
(27, 19.99, 96, 14, 8),

(27, 5.33, 516, 25, 3),
(27, 10.75, 323, 25, 5),
(27, 12.99, 222, 25, 7),
(27, 19.99, 19, 25, 8),

(27, 5.33, 56, 35, 3),
(27, 10.75, 32, 35, 5),
(27, 12.99, 22, 35, 7),
(27, 19.99, 122, 35, 8),

(27, 5.33, 56, 44, 3),
(27, 10.75, 32, 44, 5),
(27, 12.99, 22, 44, 7),
(27, 19.99, 19, 44, 8),

(27, 5.33, 90, 52, 3),
(27, 10.75, 33, 52, 5),
(27, 12.99, 1, 52, 7),
(27, 19.99, 1, 52, 8),

(27, 5.33, 6, 59, 3),
(27, 10.75, 1, 59, 5),
(27, 12.99, 43, 59, 7),
(27, 19.99, 43, 59, 8),

(27, 5.33, 12, 65, 3),
(27, 10.75, 9, 65, 5),
(27, 12.99, 7, 65, 7),
(27, 19.99, 43, 65, 8),

(27, 5.33, 24, 70, 3),
(27, 10.75, 34, 70, 5),
(27, 12.99, 999, 70, 7),
(27, 19.99, 43, 70, 8),

(27, 5.33, 2, 74, 3),
(27, 10.75, 44, 74, 5),
(27, 12.99, 7, 74, 7),
(27, 19.99, 6, 74, 8),

(27, 5.33, 22, 77, 3),
(27, 10.75, 676, 77, 5),
(27, 12.99, 34, 77, 7),
(27, 19.99, 4, 77, 8);
drop procedure if exists Change_itemCount;
delimiter //
create procedure Change_itemCount()
begin
    declare i int default 1;
    set @lastRow = (select count(*) from inventory );
    while i <= @lastRow do
        if i<20 then
        UPDATE inventory SET item_count = item_count + i*100 where inventory_id =i;
        else 
        UPDATE inventory SET item_count = item_count + i*10 where inventory_id =i;
        end if;
        set i = i + 1;
    end while;
end //
delimiter ;

call Change_itemCount()


# select p.product_name, c.color_name, s.size_name, i.item_count from product p, inventory i, color c, size s where p.product_id = i.product_id and i.color_id = c.color_id and i.size_id = s.size_id;

# Insert data into SHOPPING_CART
insert into shopping_cart(account_number, inventory_id, qty) value(1, 22, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(1, 12, 10);
insert into shopping_cart(account_number, inventory_id, qty) value(1, 122, 5);
insert into shopping_cart(account_number, inventory_id, qty) value(1, 86, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(2, 10, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(2, 20, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(2, 30, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(3, 77, 5);
insert into shopping_cart(account_number, inventory_id, qty) value(3, 92, 4);
insert into shopping_cart(account_number, inventory_id, qty) value(4, 77, 3);
insert into shopping_cart(account_number, inventory_id, qty) value(4, 66, 8);
insert into shopping_cart(account_number, inventory_id, qty) value(5, 33, 9);
insert into shopping_cart(account_number, inventory_id, qty) value(5, 88, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(5, 99, 8);
insert into shopping_cart(account_number, inventory_id, qty) value(6, 122, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(7, 122, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(8, 122, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(8, 100, 5);
insert into shopping_cart(account_number, inventory_id, qty) value(8, 112, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(9, 122, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(10, 122, 8);
insert into shopping_cart(account_number, inventory_id, qty) value(11, 72, 6);
insert into shopping_cart(account_number, inventory_id, qty) value(11, 22, 9);
insert into shopping_cart(account_number, inventory_id, qty) value(12, 52, 10);
insert into shopping_cart(account_number, inventory_id, qty) value(13, 12, 4);
insert into shopping_cart(account_number, inventory_id, qty) value(14, 129, 62);
insert into shopping_cart(account_number, inventory_id, qty) value(14, 22, 67);
insert into shopping_cart(account_number, inventory_id, qty) value(15, 22, 4);
insert into shopping_cart(account_number, inventory_id, qty) value(16, 128, 6);

# select * from account a left join shopping_cart sc on a.account_number = sc.account_number;
# select * from (select p.product_name, i.inventory_id, c.color_name, s.size_name, i.item_count from product p, inventory i, color c, size s where p.product_id = i.product_id and i.color_id = c.color_id and i.size_id = s.size_id) i left join (select sc.inventory_id, a.account_number from account a, shopping_cart sc where a.account_number = sc.account_number) sc on i.inventory_id = sc.inventory_id;

# Insert data into SHIPPER
insert into shipper(company_name) value('DHL');
insert into shipper(company_name) value('Postaplus');
insert into shipper(company_name) value('DTDC');
insert into shipper(company_name) value('FedEx');
insert into shipper(company_name) value('EMS');
insert into shipper(company_name) value('TNT Express');
insert into shipper(company_name) value('UPS');
insert into shipper(company_name) value('Aramex');
insert into shipper(company_name) value('Deliveryquote');
insert into shipper(company_name) value('Delivery');
insert into shipper(company_name) value('TopOne');
insert into shipper(company_name) value('Fantuan');
insert into shipper(company_name) value('ShunFeng');
insert into shipper(company_name) value('Sudi');
insert into shipper(company_name) value('Xiehe');

select * from linked_bankcard;
# Insert data into ORDER
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-18','2020-12-02',27,'debit',15,30);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-18','2020-12-02',22,'debit',13,3);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-18','2020-12-02',7,'debit',6,13);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-18','2020-12-02',12,'debit',15,22);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-20','2020-12-03',3,'debit',1,13);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-20','2020-12-03',4,'debit',1,16);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-20','2020-12-03',6,'debit',1,19);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-20','2020-12-04',8,'debit',1,23);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-20','2020-12-04',10,'debit',2,9);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-20','2020-12-04',9,'debit',15,30);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-21','2020-12-06',7,'debit',13,10);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-21','2020-12-06',17,'debit',4,20);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-21','2020-12-06',18,'debit',3,8);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-21','2020-12-06',19,'debit',1,9);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-22','2020-12-06',20,'debit',1,11);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-22','2020-12-08',26,'debit',14,15);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-22','2020-12-08',25,'debit',13,18);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-22','2020-12-08',24,'debit',12,19);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-23','2020-12-09',23,'debit',11,13);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-23','2020-12-09',22,'debit',10,16);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-23','2020-12-09',21,'debit',9,29);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-23','2020-12-09',20,'debit',8,3);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-24','2020-12-10',21,'debit',7,28);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-24','2020-12-1',22,'debit',6,13);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-24','2020-12-10',25,'debit',5,26);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-25','2020-12-10',17,'debit',4,25);
insert into `order`(order_date,shipment_date,account_number,payment_method,shipper_id,address_number)value('2020-11-25','2020-12-10',16,'debit',3,23);

# select * from `account` a left join `order` o on a.account_number = o.account_number;

# Insert data into ORDER_DETAILS
insert into order_details(order_number,inventory_id,qty,price)value('1','157',16,22.98);
insert into order_details(order_number,inventory_id,qty,price)value('1','33',10,29.88);
insert into order_details(order_number,inventory_id,qty,price)value('2','23',8,14.94);
insert into order_details(order_number,inventory_id,qty,price)value('3','33',26,29.88);
insert into order_details(order_number,inventory_id,qty,price)value('4','45',6,41.38);
insert into order_details(order_number,inventory_id,qty,price)value('5','56',9,18.76);
insert into order_details(order_number,inventory_id,qty,price)value('6','58',5,24.75);
insert into order_details(order_number,inventory_id,qty,price)value('7','77',8,22.98);
insert into order_details(order_number,inventory_id,qty,price)value('8','47',55,35.63);
insert into order_details(order_number,inventory_id,qty,price)value('9','142',5,6.13);
insert into order_details(order_number,inventory_id,qty,price)value('10','132',4,14.94);
insert into order_details(order_number,inventory_id,qty,price)value('11','89',1,22.98);
insert into order_details(order_number,inventory_id,qty,price)value('12','100',11,8.60);
insert into order_details(order_number,inventory_id,qty,price)value('13','130',9,6.13);
insert into order_details(order_number,inventory_id,qty,price)value('14','103',25,26.70);
insert into order_details(order_number,inventory_id,qty,price)value('15','101',16,2.30);
insert into order_details(order_number,inventory_id,qty,price)value('16','14',17,34.48);
insert into order_details(order_number,inventory_id,qty,price)value('17','7',12,2.87);
insert into order_details(order_number,inventory_id,qty,price)value('18','2',14,2.87);
insert into order_details(order_number,inventory_id,qty,price)value('19','1',16,2.87);
insert into order_details(order_number,inventory_id,qty,price)value('20','44',18,68.93);
insert into order_details(order_number,inventory_id,qty,price)value('21','9',11,494.38);
insert into order_details(order_number,inventory_id,qty,price)value('22','3',9,2.87);
insert into order_details(order_number,inventory_id,qty,price)value('23','66',3,24.75);
insert into order_details(order_number,inventory_id,qty,price)value('24','5',11,2.87);
insert into order_details(order_number,inventory_id,qty,price)value('25','88',12,18.76);
insert into order_details(order_number,inventory_id,qty,price)value('26','7',16,2.87);
insert into order_details(order_number,inventory_id,qty,price)value('27','17',20,31.03);

# select * from inventory i left join order_details od on i.inventory_id = od.inventory_id;
select * from inventory;
# Insert data into PREMIUM_ACCOUNT
insert into premium_account value(1, 17);
insert into premium_account value(2, 124);
insert into premium_account value(3, 100);
insert into premium_account value(4, 50);
insert into premium_account value(5, 230);
insert into premium_account value(6, 140);
insert into premium_account value(7, 940);
insert into premium_account value(8, 150);
insert into premium_account value(9, 60);
insert into premium_account value(10, 830);
insert into premium_account value(11, 250);
insert into premium_account value(15, 250);
insert into premium_account value(20, 20);
insert into premium_account value(21, 440);
insert into premium_account value(22, 750);
insert into premium_account value(23, 0);
insert into premium_account value(24, 0);
insert into premium_account value(25, 35);
insert into premium_account value(26, 235);
insert into premium_account value(27, 21);

# select * from account a left join premium_account pa on a.account_number = pa.account_number;

# Insert data into GIFT_CARD
insert into gift_card value(200, 50, 1);
insert into gift_card value(203, 100, 5);
insert into gift_card value(123, 25, 5);
insert into gift_card value(130, 50, 8);
insert into gift_card value(300, 150, 9);
insert into gift_card value(90, 10, 12);
insert into gift_card value(20, 10, 9);
insert into gift_card value(900, 150, 27);
insert into gift_card value(453, 15, 20);
insert into gift_card value(310, 100, 21);
insert into gift_card value(230, 150, 15);
insert into gift_card value(45, 250, 25);
insert into gift_card value(814, 50, 19);
insert into gift_card value(154, 50, 3);
insert into gift_card value(132, 150, 24);
insert into gift_card value(376, 120, 4);
insert into gift_card value(67, 150, 26);
insert into gift_card value(49, 50, 13);
insert into gift_card value(169, 500, 17);
insert into gift_card value(550, 450, 22);

# select * from account a left join gift_card g on a.account_number = g.account_number;

# Insert data into WISHLIST
insert into wishlist value(1, 3);
insert into wishlist value(2, 5);
insert into wishlist value(3, 11);
insert into wishlist value(4, 11);
insert into wishlist value(5, 3);
insert into wishlist value(5, 1);
insert into wishlist value(8, 20);
insert into wishlist value(8, 23);
insert into wishlist value(9, 10);
insert into wishlist value(10, 20);
insert into wishlist value(11, 9);
insert into wishlist value(11, 17);
insert into wishlist value(11, 27);
insert into wishlist value(12, 13);
insert into wishlist value(13, 14);
insert into wishlist value(14, 23);
insert into wishlist value(15, 12);
insert into wishlist value(23, 4);
insert into wishlist value(24, 25);
insert into wishlist value(30, 3);

# Display all orders and order details of all customers, including
# the quantity and price paid for every item in the order and the total price paid for each order:
select *, (select sum(od1.qty * od1.price) from order_details od1 where od.`Order No.` = od1.order_number group by od1.order_number) 'Total Order Price' from
(select c.customer_name 'Customer', a.account_number from customer c, account a where c.customer_id = a.customer_id) c,
(select `Order No.`, `Product Name`, `Color`, `Size`, `Unit Price`, `Qty`, `Account No.`, `Order Date`, `Shipment Date`, `Shipper ID`, `Company`, `Apt.`, `Building`, `Address`, `Phone`, `Unit Price` * `Qty` 'Total Unit Price'
from (select i.inventory_id, p.product_name 'Product Name', c.color_name 'Color', s.size_name 'Size'
from product p, inventory i, color c, size s 
where p.product_id = i.product_id and i.color_id = c.color_id and i.size_id = s.size_id) i,
(select o.*, od.inventory_id, od.qty 'Qty', od.price 'Unit Price' from 
(select o.order_number 'Order No.', o.account_number 'Account No.', o.order_date 'Order Date', o.shipment_date 'Shipment Date',
sh.shipper_id 'Shipper ID', sh.company_name 'Company',
a.apt_number 'Apt.', a.building 'Building', concat(a.street_address, ', ', a.city, ', ', a.country, ', ', a.zip) 'Address', a.phone 'Phone'
from `order` o, shipper sh, (select a1.address_number, a2.apt_number, a2.building, a1.street_address, a1.city, a1.country, a1.zip, a1.phone from address a1 left join apt_address a2 on a1.address_number = a2.address_number) a 
where o.shipper_id = sh.shipper_id and o.address_number = a.address_number) o, 
order_details od 
where o.`Order No.` = od.order_number) od
where i.inventory_id = od.inventory_id) od
where c.account_number = od.`Account No.` order by `Order No.`;

# Display the frequency distribution of how many orders were
# placed by how many customers. Name your columns as 'number of orders' and 'number of customers'.
select `No. of orders`, count(noOfOrders.customer_id) 'No. of customers' from 
(select c.customer_id, count(o.order_number) 'No. of orders' from (select c.customer_id, a.account_number from customer c left join account a on c.customer_id = a.customer_id) c left join 
`order` o on c.account_number = o.account_number group by c.account_number) noOfOrders group by `No. of orders`;

# PART 5: ROLES AND PERMISSIONS
/*Drops the new Roles if they already exist*/
DROP ROLE IF EXISTS registered_customer, administrator;

/*Create New Roles:
1. Registered Cutomer: Should only be able to see the things that are part of the normal things
2. Administrator: Able to view and change anything (Full perms)*/
CREATE ROLE registered_customer, administrator;

/*Grant permissions to the newly made registered_customer*/
#Allow customers to see the brands, colors, catagories and sizes available
GRANT SELECT ON brand TO registered_customer;
GRANT SELECT ON color TO registered_customer;
GRANT SELECT ON size TO registered_customer;
GRANT SELECT ON category TO registered_customer;

#Allow customers to see the products and inventory
GRANT SELECT ON category_product TO registered_customer;
GRANT SELECT ON product TO registered_customer;
GRANT SELECT ON inventory TO registered_customer;

#Account and Customer and Premium Account. view backs it up so that it can only see it's own
GRANT SELECT, UPDATE(email, password) ON account TO registered_customer;
GRANT SELECT, UPDATE(customer_name) ON customer TO registered_customer;
GRANT SELECT ON premium_account TO registered_customer;

#Allow to see the current bankcard and gift card (view should only show cards that they own)
GRANT SELECT ON gift_card TO registered_customer;
GRANT SELECT, INSERT, UPDATE ON linked_bankcard TO registered_customer;

#Addresses (view should only show their own address)
GRANT SELECT, INSERT, UPDATE(apt_number,building) ON apt_address TO registered_customer;
GRANT SELECT, INSERT, UPDATE(street_address,city,phone,zip, country) ON address TO registered_customer;

#Wishlist and shopping list (view should only show their own shopping list)
GRANT SELECT ON wishlist TO registered_customer;
GRANT SELECT, UPDATE(inventory_id, qty) ON shopping_cart TO registered_customer; 
#NOTICE ME: since custumers should be able to remove items from their cart it might be smart to add the right to delete them and insert new ones though I'm not too sure.

#Order and Order Details  (view should only show their own orders)
GRANT SELECT ON order_details TO registered_customer;
GRANT SELECT(order_number, order_date, shipment_date, account_number, payment_method, address_number) ON `order` TO registered_customer; #hides supplier ids
/*Grant permissions to the newly made administrator*/
GRANT ALL ON * TO administrator;

/*Drops Users if They Exist*/
#DROP USER IF EXISTS joe, sam, bill, yuu, olivia, lily, james;

/*Creates Users (Keep in mind the following names are examples and should be changed to better fit the existing accounts. It is also viable just to make 2 users 1 for admin and one for cutomer)*/
#CREATE USER joe, sam, olivia, james IDENTIFIED BY 'registered_customer_password';
#CREATE USER bill, yuu, lily IDENTIFIED BY 'administrator_password';

/*Gives Users Roles*/
#GRANT registered_customer TO joe, sam, olivia, james;
#GRANT administrator TO bill, yuu, lily;

/*Sets Default Roles*/
#SET DEFAULT ROLE registered_customer TO joe, sam, olivia, james;
#SET DEFAULT ROLE administrator TO bill, yuu, lily;

# ADD A NEW CUSTOMER
drop procedure if exists add_customer;
delimiter //
create procedure add_customer(in customerName varchar(30))
begin
	insert into customer(customer_name) value(customerName);
end //
delimiter ;

# call add_customer('New customer');
# select * from customer where customer_name = 'New customer';

# CREATE A NEW ACCOUNT
drop procedure if exists create_account;
delimiter //
create procedure create_account(in customerId smallint, 
								in email varchar(254), 
                                in `password` varchar(100))
begin
	# if this customer already had an account using this email address
	if not exists (select 1 from account a where a.customer_id = customerId and a.email = email) then
		insert into account(customer_id, email, password) value(customerId, email, `password`); 
		SET @sqlStatement = CONCAT('CREATE USER "', email,'" IDENTIFIED BY "', password,'"');
		PREPARE stmt FROM @sqlStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        SET @sqlStatement = CONCAT('GRANT registered_customer to "', email,'"');
        PREPARE stmt FROM @sqlStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;
        SET @sqlStatement = CONCAT('set default role registered_customer to "', email,'"');
        PREPARE stmt FROM @sqlStatement; EXECUTE stmt; DEALLOCATE PREPARE stmt;
	else signal sqlstate '43095' set message_text = 'You already had an account using this email address';
	end if;
end //
delimiter ;

# drop user if exists 'abc@gmail.com';
# call create_account(22, 'abc@gmail.com', '123');
# select * from account where customer_id = 22;
# SELECT user FROM mysql. user;
# show grants for 'abc@gmail.com';

# INSERT A NEW PRODUCT
drop procedure if exists insert_product;
delimiter //
create procedure insert_product(in productName varchar(100), 
								in description varchar(100), 
                                in brandName varchar(20))
begin
    # if this brand does not exist
    if not exists (select 1 from brand where brand_name = brandName) then
		# create new brand
		insert into brand (brand_name) value (brandName);
	end if;
	
    insert into product (product_name, product_description, brand_id) value(productName, description, (select brand_id from brand where brand_name = brandName));
end //
delimiter ;

# call insert_product('New product', 'abc', 'brand');
# select * from brand where brand_name = 'brand';
# select * from product where product_name = 'New product';

# ADD A PRODUCT TO INVENTORY
drop procedure if exists add_to_inventory;
delimiter //
create procedure add_to_inventory(in productName varchar(100), 
								  in color varchar(30), 
                                  in size varchar(30), 
                                  in price double, 
                                  in availableQty smallint)
begin
	set @productId = (select product_id from product where product_name = productName);
    if @productId is null then
		signal sqlstate '43096' set message_text = 'This product does not exist. You need to create this product first';
	end if;
    
    if not exists (select 1 from color where color_name = color) then
		# create new color
		insert into color (color_name) value (color);
	end if;
    
    if not exists (select 1 from size where size_name = size) then
		# Insert new size
		insert into size (size_name) value (size);
	end if;
    
    if price < 0 then
		signal sqlstate '43096' set message_text = 'Price cannot be negative';
	end if;
    
    if availableQty < 0 then
		signal sqlstate '43096' set message_text = 'Available quantity cannot be negative';
	end if;
    
    insert into inventory (product_id, price, item_count, color_id, size_id) value(@productId, price, availableQty, (select color_id from color where color_name = color), (select size_id from size where size_name = size));
end //
delimiter ;

# call add_to_inventory('New product', 'color', 'size', 1, 1);

# SET UP PAYMENT METHOD
drop procedure if exists setup_payment_method;
delimiter //
create procedure setup_payment_method(in accountNumber smallint, in paymentMethod varchar(6), out result tinyint)
begin
	# if at least a suitable card is found
	if exists (select 1 from linked_bankcard lk, bankcard b where account_number = accountNumber and lk.bankcard_number = b.bankcard_number and card_type = paymentMethod) then
		set result = 1;
	end if;
end //
delimiter ;

# set @result = 0;
# call setup_payment_method(1, 'debit', @result);
# call setup_payment_method(1, 'credit', @result);
# select @result;

# BEGIN AN ORDER
drop procedure if exists begin_order;
delimiter //
create procedure begin_order(in accountNumber smallint,
							 in paymentMethod varchar(6),
                             in orderDate date,
                             in addressNumber smallint)
begin
	set @result = 0;
    call setup_payment_method(accountNumber, paymentMethod, @result);
    if @result is null then
		signal sqlstate '43097' set message_text = 'No suitable card is found for this payment method';
	elseif @result = 1 then
		set @customerIdOfThisAccount = (select customer_id from account where account_number = accountNumber);
        set @customerIdOfThisAddress = (select customer_id from address where address_number = addressNumber);
		if (@customerIdOfThisAccount != @customerIdOfThisAddress) then
			signal sqlstate '43097' set message_text = 'Account and Address do not match';
		end if;
        
        insert into `order`(order_date, account_number, payment_method, address_number) value(orderDate, accountNumber, paymentMethod, addressNumber);
    end if;
end //
delimiter ;

# call begin_order(1, 'debit', curdate(), 1);
# call begin_order(1, 'credit', curdate(), 4);

# ADD ITEM TO ORDER
drop procedure if exists add_to_order;
delimiter //
create procedure add_to_order(in orderNumber smallint,
							  in inventoryId smallint,
                              in quantity smallint)
begin
	set @originalPrice = (select price from inventory where inventory_id = inventoryId);
	set @recalculatedPrice = @originalPrice + 0.15 * @originalPrice;
	insert into order_details value(orderNumber, inventoryId, quantity, @recalculatedPrice);
end //
delimiter ;

# CHECKOUT SHOPPING CART
drop procedure if exists checkout_shopping_cart;
delimiter //
create procedure checkout_shopping_cart(in orderNumber smallint,
									    in accountNumber smallint)
checkout:begin
	declare i int default 0;
    
    set @lastRow = (select count(*) from shopping_cart where account_number = accountNumber);
	if @lastRow = 0 then
		leave checkout;
	end if;

	while i < @lastRow do
		set @inventoryId = (select inventory_id from shopping_cart where account_number = accountNumber limit i, 1);
		set @quantity = (select qty from shopping_cart where account_number = accountNumber limit i, 1);
		call add_to_order(orderNumber, @inventoryId, @quantity);
		set i = i + 1;
	end while;
end //
delimiter ;

# select * from order_details;
# begin;
#    call begin_order(1, 'credit', curdate(), 4);
    # get the latest order
#    set @orderNumber = (select max(order_number) from `order`);
#    call checkout_shopping_cart(@orderNumber, 1);
# commit;
# select * from order_details;

# PART 4: INDEXES
create index idx_inventory_price_productId_inventoryId on inventory(price, product_id, inventory_id);

# query looks up for price in 'where' clause first 
# -> put price at first
# query then looks up for product_id and then inventory_id in 'order by' clause 
# -> put product_id at second, inventory_id at last

#select inventory_id, product_id
#from inventory
#where price between 5 and 10
#order by product_id, inventory_id;

create index idx_order_orderDate_orderNum ON `order` (order_date, order_number);

# query looks up for order_date in 'where' clause first
# -> put order_date ar first
# query then looks up for order_number in 'select' clause after
# -> put order_number at last

#select order_number, order_date
#from `order`
#where order_date between '2020-11-20' and '2020-11-22';

# PART 6: VIEWS
# Registered Customer has the right to know every information about the their order such as:  order number,product name,price,quantity and shipping details

DROP VIEW IF EXISTS RegisteredCustomer;
CREATE VIEW RegisteredCustomer AS
SELECT
AC.account_number,
O.order_number,
P.product_name,
B.brand_name,
C.color_name,
S.size_name,
I.price 'Price (before tax)',
OD.qty,
SP.company_name 'Shipping Company',
O.shipment_date,
concat(
A.street_address,',',
A.city,',',
A.country,'  ',
A.zip) 'Shipping Address',
A.phone
FROM `account` AC,`order` O,product P,inventory I,brand B,color C,size S,order_details OD,shipper SP,address A
WHERE AC.account_number=O.account_number AND O.address_number=A.address_number AND O.order_number=OD.order_number AND I.inventory_id=OD.inventory_id AND I.product_id=P.product_id AND 
O.shipper_id=SP.shipper_id AND I.color_id=C.color_id AND I.size_id=S.size_id and p.brand_id=B.brand_id
WITH CHECK OPTION;
# select * from RegisteredCustomer where account_number =3;


# A fedex_manager should only see shippers that work for FedEx

#create role fedex_manager;

drop view if exists fedex_manager_on_shipper;
create view fedex_manager_on_shipper as
select * from shipper where company_name = 'FedEx'
with check option;

#grant all on fedex_manager_on_shipper to fedex_manager;
#drop user if exists freddy;
#create user freddy identified by 'fedex';
#grant fedex_manager to freddy;
#set default role fedex_manager to freddy;

# select * from fedex_manager_on_shipper;



# PART 7: TRIGGERS
# check item availability before inserting into order_details
drop trigger if exists check_inventory_availibity;
delimiter //
Create trigger check_inventory_availibity
before insert on order_details
for each row
begin
	if (select item_count from inventory where inventory_id = new.inventory_id) < new.qty then
		signal sqlstate '43098' set message_text = 'Not enough items';
	end if;
end //
delimiter ;

# Decrease item count after inserting into order_details
DROP TRIGGER IF EXISTS decrease_qty_inventory;
delimiter //
CREATE TRIGGER decrease_qty_inventory AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
	UPDATE inventory SET item_count = item_count - new.qty WHERE
	inventory_id=(SELECT inventory_id FROM order_details WHERE inventory_id = NEW.inventory_id);
END //
delimiter ;

# select * from order_details;
# select * from inventory where inventory_id = 155;
# insert into order_details value(1, 155, 1, 20);
# insert into order_details value(2, 155, 677, 20);