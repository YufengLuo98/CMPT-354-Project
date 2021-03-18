CREATE TABLE hotel
(branchID int NOT NULL,
address varchar(200) NOT NULL,
hotelName varchar(45) NOT NULL,
PRIMARY KEY(branchID)
);

CREATE TABLE customer
( customerID int NOT NULL,
Address varchar(255) NOT NULL,
Name varchar(255) NOT NULL,
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
employeeBranchID int NOT NULL,
FOREIGN KEY(employeeBranchID) REFERENCES hotel(branchID)
PRIMARY KEY(employeeID, employeeBranchID)
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
supEmployeeID int NOT NULL,
FOREIGN KEY(supEmployeeID) REFERENCES employee(employeeID)
PRIMARY KEY(supervisorID, supEmployeeID)
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
reservationCustID int NOT NULL,
reservationBookID int NOT NULL,
FOREIGN KEY(reservationBookID) REFERENCES booking(bookingID),
FOREIGN KEY(reservationCustID) REFERENCES customer(customerID)
PRIMARY KEY(reservationID, reservationBookID, reservationCustID)
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