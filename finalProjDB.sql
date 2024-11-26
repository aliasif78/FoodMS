create table Account
(
    accountID numeric(3),
    dateCreated varchar(20),
    userName varchar (20),
    password varchar(30),
    primary key (accountID)
);

create table Menu
(
	menuID numeric(3),
    primary key (menuID)    
);

create table Cart
(
	totalItems numeric(3),
    totalPrice double,
    cartID numeric(3),
    primary key (cartID)
);

create table FoodItems
(
	itemID numeric(3),
    foodName varchar(20),
    description varchar (100),
    price double,
    menuID numeric(3),
    cartID numeric(3),
    primary key (itemID),
    foreign key (cartID) references Cart(cartID) on delete cascade,
    foreign key (menuID) references Menu(menuID) on delete cascade
);

create table Admin
(
	name varchar(50),
    phno varchar (13),
    email varchar(40),
	cnic numeric(14),
    accountID numeric(3),
    primary key (cnic),
    foreign key (accountID) references account(accountID) on delete cascade
);

create table Restaurant
(
	name varchar(50),
    phno varchar (13),
    email varchar(40),
	resAddress varchar(50),
    rating double,
    resID numeric(3),
    authorize varchar(5),
    accountID numeric (3),
    menuID numeric(3),
    adminCnic numeric(14),
    primary key (resID),
    foreign key (accountID) references Account(accountID) on delete cascade,
    foreign key (menuID) references Menu(menuID) on delete cascade,
    foreign key (adminCnic) references Admin(cnic) on delete cascade
);

create table Customer
(
	name varchar(50),
    phno varchar (13),
    email varchar(40),
	cusAddress varchar(50),
    cusID numeric(3),
    accountID numeric(3),
	adminCnic numeric(14),
    cartID numeric(3),
    primary key(cusID),
    foreign key (cartID) references Cart(cartID) on delete cascade,
    foreign key (accountID) references Account(accountID) on delete cascade,
    foreign key (adminCnic) references Admin(cnic) on delete cascade
);

create table Rider
(
	name varchar(50),
    phno varchar (13),
    email varchar(40),
	licenseNo numeric(13),
    riderID numeric(3),
    riderAuthorize varchar(5),
    accountID numeric(3),
    adminCnic numeric(14),
    primary key (riderID),
    foreign key (accountID) references Account(accountID) on delete cascade,
    foreign key (adminCnic) references Admin(cnic) on delete cascade
);

create table RiderFeedback
(
	rating double,
    comments varchar (150),
    recommendation varchar (5),
    riderID numeric(3),
    cusID numeric(3),
    foreign key (cusID) references Customer(cusID) on delete cascade,
    foreign key (riderID) references Rider (riderID) on delete cascade
);

create table RestaurantFeedback
(
	rating double,
    comments varchar (150),
    recommendation varchar (5),
    resID numeric(3),
    cusID numeric(3),
    foreign key (cusID) references Customer(cusID) on delete cascade,
    foreign key (resID) references Restaurant(resID) on delete cascade
);

create table Orders
(
	orderID numeric(3),
    dateCreated varchar (30),
    orderStatus varchar(10),
    cusID numeric(3),
    resID numeric(3),
    riderID numeric (3),
    primary key (orderID),
    foreign key (cusID) references Customer(cusID) on delete cascade,
    foreign key (resID) references Restaurant(resID) on delete cascade,
    foreign key (riderID) references Rider(riderID) on delete cascade
);

create table cardPayment
(
	cardNumber numeric (16),
    expirayDate varchar (10),
    cvvNumber numeric(3),
    cusID numeric(3),
    primary key (cardNumber),
    foreign key (cusID) references Customer(cusID) on delete cascade
);

create table Bill
(
	orderFee double,
    deliveryFee double,
    tax double,
    subTotal double,
    billID numeric(3),
    orderID numeric (3),
    cusID numeric(3),
    primary key (billID),
    foreign key (orderID) references Orders(orderID) on delete cascade,
    foreign key (cusID) references Customer(cusID) on delete cascade
);


insert into Account values (1, "20-11-22", "abdSaq", "abd123");
insert into Admin values ("Abdullah", "03215162770", "jhash", 25262, 1);

insert into Account values (2, "20-11-22", "rest1", "hehe");
insert into Menu values (1);
insert into Restaurant values ("res1", "03215162778", "jhdsaffa", "Isb", 0.0, 1, "no", 2, 1, 25262);

insert into Account values (3, "20-11-22", "rest2", "heda");
insert into Menu values (2);
insert into Restaurant values ("res2", "03215162778", "jhdsaffa", "Isb", 0.0, 2, "no", 3, 2, 25262);

insert into Account values (4, "20-11-22", "rid1", "lol1");
insert into Rider values ("rid1", "03215162778", "jhdsaffa", 6372, 1, "no", 4, 25262);

insert into Account values (5, "20-11-22", "cust1", "haha");
insert into Cart values (0, 0.0, 1);
insert into Customer values ("cust1", "03215162778", "jhdsaffa", "Isb", 1, 5, 25262, 1);

select * from Rider;
select * from Restaurant;
select * from Customer;
select * from Orders;
select * from fooditems;
select * from Account;
select * from Cart;
SELECT * FROM FoodItems ORDER BY itemID DESC LIMIT 1;

update FoodItems set cartID = NULL WHERE cartID = 1;

insert into Orders values (1, "26-11-22", "new", 1, 1, NULL);
insert into Orders values (2, "26-11-22", "new", 2, 3, NULL);
insert into Orders values (3, "26-11-22", "new", 2, 3, NULL);
insert into Orders values (4, "26-11-22", "new", 1, 1, NULL);

















