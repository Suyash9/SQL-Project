CREATE INDEX ReviewsHotel ON Reviews(HotelID);

CREATE INDEX ReviewDate ON Reviews(HotelID, Date);

CREATE INDEX Author ON Reviews(Author); 

CREATE INDEX PriceAndRating ON Hotels(AvgPrice, Overallrating);

CREATE INDEX Helpful ON Reviews(HotelID, NoHelpful);
