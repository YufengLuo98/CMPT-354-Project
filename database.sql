drop table if exists hotel;
drop table if exists customer;
drop table if exists customerPhone;
drop table if exists employee;
drop table if exists employees;
drop table if exists supervisor;
drop table if exists booking;
drop table if exists room;
drop table if exists reservation;
drop table if exists junior;
drop table if exists deluxe;
drop table if exists presidential;


CREATE TABLE hotel
(branchID int NOT NULL,
address varchar(200) NOT NULL,
hotelName varchar(45) NOT NULL,
PRIMARY KEY(branchID)
);

CREATE TABLE customer
( customerID int AUTO_INCREMENT,
Name varchar(255) NOT NULL,
Address varchar(255) NOT NULL,
numOfVisits int NOT NULL,
Email varchar(255) NOT NULL,
PRIMARY KEY(customerID)
);

-- validate phone number before insert
CREATE TABLE customerPhone
( customerID int NOT NULL,
phoneNum varchar(10) NOT NULL,
FOREIGN KEY(customerID) REFERENCES customer(customerID),
PRIMARY KEY(customerID)
);

CREATE TABLE employee
( employeeID int NOT NULL,
name varchar(45) NOT NULL,
salary decimal(12,2) NOT NULL,
emplBranchId int NOT NULL,
FOREIGN KEY(emplBranchId) REFERENCES hotel(branchID)
PRIMARY KEY(employeeID, emplBranchId)
);

CREATE TABLE employees
(employeesID int NOT NULL,
employeeSupID int NOT NULL,
FOREIGN KEY(employeesID) REFERENCES employee(employeeID)
FOREIGN KEY(employeeSupID) REFERENCES supervisor(supervisorID)
PRIMARY KEY(employeesID, employeeSupID)
);

CREATE TABLE supervisor
(supervisorID int NOT NULL,
emplSupID int NOT NULL,
FOREIGN KEY(emplSupID) REFERENCES employee(employeeID)
PRIMARY KEY(supervisorID, emplSupID)
);

CREATE TABLE booking
(bookingID int NOT NULL,
bookCustID int NOT NULL,
bookRoomID int NOT NULL,
bookEmployeeID int NOT NULL,
roomNum varchar(3) NOT NULL,
reservationID int NOT NULL,
pricing decimal(12,2) NOT NULL,
FOREIGN KEY(bookCustID) REFERENCES customer(customerID)
FOREIGN KEY(bookEmployeeID) REFERENCES employee(employeeID),
FOREIGN KEY(bookRoomID) REFERENCES room(roomID)
PRIMARY KEY(bookingID, bookCustID, bookRoomID, bookEmployeeID)
);

CREATE TABLE room
(roomID int NOT NULL,
maxOccupancy int NOT NULL,
roomNum varchar(3) NOT NULL,
roomBranchID int NOT NULL,
FOREIGN KEY(roomBranchID) REFERENCES hotel(branchID),
PRIMARY KEY(roomID, roomBranchID)
);

CREATE TABLE reservation
(reservationID int NOT NULL,
reservCustID int NOT NULL,
reservBookID int NOT NULL,
FOREIGN KEY(reservBookID) REFERENCES booking(bookingID),
FOREIGN KEY(reservCustID) REFERENCES customer(customerID)
PRIMARY KEY(reservationID, reservBookID, reservCustID)
);

CREATE TABLE junior
(juniorRoomID int NOT NULL,
juniorDesc varchar(200) NOT NULL,
FOREIGN KEY(juniorRoomID) REFERENCES room(roomID)
PRIMARY KEY(juniorRoomID)
);

CREATE TABLE deluxe
(deluxeRoomID int NOT NULL,
deluxeDesc varchar(200) NOT NULL,
FOREIGN KEY(deluxeRoomID) REFERENCES room(roomID)
PRIMARY KEY(deluxeRoomID)
);

CREATE TABLE presidential
(presRoomID int NOT NULL,
presDesc varchar(200) NOT NULL,
FOREIGN KEY(presRoomID) REFERENCES room(roomID)
PRIMARY KEY(presRoomID)
);

INSERT INTO customer (customerID, name, address, numOfVisits, email)
VALUES 
	(1, "Jane Smith", "7 Right Lne", 2, "jane@gmail.com"), 
	(2, "Michael Lee", "2 Alpha Dr", 1, "michael@gmail.com"),
	(3, "Evan Brown", "45 Main St", 5, "evan@yahoo.com"),
	(4, "Charlotte Town", "12 Main St", 10, "charllotte@outlook.edu"),
	(5, "Nicholas Mush", "8 Alpha Dr", 4, "nicholas@gmail.com") ;
 
INSERT INTO customerPhone (customerID, phoneNum)
VALUES
	(1, "604-111-1234"),
	(2, "778-890-4532"),
	(3, "778-234-3546"),
	(4, "719-563-7342"),
	(5, "349-645-2642");
 
INSERT INTO hotel (branchId, address, hotelName)
VALUES
	(4839, "5 Left Lne", "Left Hotel"),
	(5973, "6 Alpha Dr", "Alpha Hotel"),
	(9748, "31 Main St", "Main Hotel"),
	(2873, "18 Right Lne", "Right Hotel"),
	(5921, "12 Alpha Dr", "Second Alpha Hotel");
 
 
INSERT INTO room (roomId, maxOccupancy, roomNum, roomBranchId)
VALUES
	(1001, 4, "23", 4839),
	(3202, 2, "206", 4839),
	(3207, 2, "204", 4839),
	(1038, 2, "106", 5973),
	(2111, 4, "18", 5973),
	(2113, 2, "109", 5973),
	(3033, 4, "100", 5973),
	(2009, 4, "307", 9748),
	(2010, 3, "89", 9748),
	(3111, 4, "120", 9748),
	(1012, 2, "101", 2873),
	(1101, 4, "209", 2873),
	(2017, 3, "16", 2873),
	(1800, 2, "19", 5921),
	(3025, 2, "203", 5921);
 
INSERT INTO employee (employeeID, name, salary, emplBranchId)
VALUES
	(1298, "Nate Path", 23310, 5921),
	(1082, "Michelle Moon", 25322, 5921),
	(3782, "Charlie Late", 30180, 2873),
	(2974, "Ivan Vine", 28039, 2873),
	(3924, "Lora Kate", 30890, 2873),
	(2389, "Jason Mitten", 29703, 9748),
	(4932, "Beth Smith", 33908, 9748),
	(2839, "Ben Green", 35980, 9748),
	(8734, "Shane Hat", 32890, 5973),
	(9723, "Megan Time", 27980, 5973),
	(2940, "Lin Twin", 30090, 4839);
 
INSERT INTO employees (employeesID, emplSupID)
VALUES
	(1298, 1019),
	(3782, 1047),
	(2974, 1047),
	(2389, 1082),
	(4932, 1082);
 
INSERT INTO supervisor (supervisorID, supEmplId)
VALUES
	(1019, 1082),
	(1047, 3924),
	(1082, 2839),
	(1043, 8734),
	(1065, 2940);
 
INSERT INTO booking (bookingID, bookCustID, bookRoomID, bookEmployeeID, roomNum, reservationID, pricing)
VALUE
	(10001, 1, 1001, 2940, "23", 10101, 234.97),
	(10002, 2, 3025, 1298, "203", 10102, 258.00),
	(10003, 3, 2009, 2839, "307", 10103, 300.98),
	(10004, 4, 2017, 2974, "16", 10104, 228.90),
	(10005, 5, 1038, 9723, "106", 10105, 115.00);
 
INSERT INTO reservation (reservationID, reservCustID, reservBookID)
VALUES
	(10101, 1, 10001),
	(10102, 2, 10002),
	(10103, 3, 10003),
	(10104, 4, 10004),
	(10105, 5, 10005);
 
INSERT INTO junior (juniorRoomID, junDescr)
VALUE
	(1001, ""),
	(1038, ""),
	(1012, ""),
	(1101, ""),
	(1800, "");
 
INSERT INTO deluxe (deluxeRoomID, delDescr)
VALUE
	(2009, "concierge service"),
	(2017, "concierge service"),
	(2111, "concierge service"),
	(2113, "concierge service"),
	(2010, "concierge service");
 
INSERT INTO presidential (presRoomID, presDescr)
VALUE
	(3025, "butler"),
	(3111, "butler"),
	(3202, "butler"),
	(3207, "butler"),
	(3033, "butler");
