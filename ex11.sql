CREATE TABLE Hotels(
HotelID integer PRIMARY KEY,
Overallrating double,
AvgPrice varchar,
URL varchar);

CREATE TABLE Reviews(
ReviewID integer PRIMARY KEY,
Author varchar,
Content varchar,
Date varchar,
NoReader integer,
NoHelpful integer,
Overall integer,
Value integer,
Rooms integer,
Location integer,
Cleanliness integer,
CheckIn integer,
Service integer,
BusinessService integer,
HotelID integer,
FOREIGN KEY(HotelID) REFERENCES Hotels(HotelID));
