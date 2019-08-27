SELECT Hotels.HotelID FROM Reviews, Hotels WHERE Hotels.HotelID=Reviews.HotelID AND Hotels.OverallRating>3 GROUP BY Reviews.HotelID HAVING AVG(Reviews.Cleanliness)>=4.5;
