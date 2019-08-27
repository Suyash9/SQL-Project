#!/bin/bash
>hotelreviews.sql
sqlite3 hotels.db <<EOF

DROP TABLE IF EXISTS HotelReviews;

CREATE TABLE HotelReviews(
HotelID integer NOT NULL,
ReviewID integer NOT NULL,
OverallRating double NOT NULL,
AvgPrice varchar NOT NULL,
URL varchar,
Author varchar NOT NULL,
Content varchar,
Date varchar NOT NULL,
NoReader integer NOT NULL,
NoHelpful integer NOT NULL,
Overall integer NOT NULL,
Value integer,
Rooms integer,
Location integer,
Cleanliness integer,
CheckIn integer,
Service integer,
BusinessService integer,
PRIMARY KEY (HotelID, ReviewID));

EOF


for file in $1/*;
do
    HotelID=$(basename $file |  sed -e 's/\.dat//g' -e 's/.*_//g')
    OverallRating=$(grep "Overall Rating" $file  | cut -c17-)
    AvgPrice=$(grep "Avg. Price" $file | cut -c13-)
    URL=$(grep \<URL\> $file | cut -c6-)
    Author=($(grep \<Author\> $file | cut -c9- | sed -r 's/ //g'))
    Content=($(grep \<Content\> $file | cut -c10- | sed -r 's/ //g'))
    Date=($(grep \<Date\> $file | cut -c7- | sed -r 's/ //g'))
    Reader=($(grep "No. Reader" $file | cut -c13-))
    Helpful=($(grep "No. Helpful" $file | cut -c14-))
    Overall=($(grep \<Overall\> $file | cut -c10-))
    Value=($(grep \<Value\> $file | cut -c8-))
    Rooms=($(grep \<Rooms\> $file | cut -c8-))
    Location=($(grep \<Location\> $file | cut -c11-))
    Clean=($(grep \<Cleanliness\> $file | cut -c14-))
    Checkin=($(grep "<Check in / front desk>" $file | cut -c24-))
    Service=($(grep \<Service\> $file | cut -c10-))
    Bservice=($(grep "Business service" $file | cut -c19-))

    length=${#Author[@]}
    for((i = 0; i < $length; i++));
    do
        echo "INSERT INTO HotelReviews (HotelID, OverallRating, AvgPrice, URL, ReviewID, Author, Content, Date, NoReader, NoHelpful, Overall, Value, Rooms, Location, Cleanliness, CheckIn, Service, BusinessService) VALUES (\"$HotelID\", \"$OverallRating\", \"$AvgPrice\", \"$URL\", \"$i\", \"${Author[i]}\, \"${Content[i]}\", \"${Date[i]}\", \"${Reader[i]}\", \"${Helpful[i]}\", \"${Overall[i]}\", \"${Value[i]}\", \"${Rooms[i]}\", \"${Location[i]}\", \"${Clean[i]}\", \"${Checkin[i]}\", \"${Service[i]}\", \"${Bservice[i]}\");" >> hotelreviews.sql
    done
done

