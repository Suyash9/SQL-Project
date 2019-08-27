INSERT INTO Hotels SELECT HotelID, Overallrating, AvgPrice, URL FROM HotelReviews;

INSERT INTO Reviews SELECT ReviewID, HotelID, Author, Content, Date, NoReader, NoHelpful, Overall, Value, Rooms, Location, Cleanliness, CheckIn, Service, BusinessService FROM HotelReviews;

DROP TABLE HotelReviews;
