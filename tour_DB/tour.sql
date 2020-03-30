use db_tour;
create table destinationPlace(
                                destination_id int not null,
                                destination_name varchar(50),
                                description varchar(255),
                                averagePrice float,
                                city_id varchar(50)
);

select * from destinationPlace;
create table users(
                                user_id int not null,
                                user_name varchar(50),
                                identify int,
                                birthday date,
                                city_id varchar(50)
);
create table city(
    city_id int not null,
    city_name varchar(50)
);

create table Tour(
    tour_id int not null ,
    tour_code int,
    tour_type varchar(50),
    date_Start date,
    date_Done date
);

create table TypeTour(
    type_id int not null ,
    type_code int,
    type_name varchar(50)
);

create table TourBill(
    tour_id int not null,
    user_id int,
    status varchar(255)
);

alter table tour rename column city_id to City_ID;
alter table destinationPlace add primary key (destination_id);
alter table tour add primary key (tour_id);
alter table tourbill add primary key (tour_id);
alter table typetour add primary key (type_id);
alter table tourbill add primary key (user_id);


alter table tour add column price float;
alter table tourbill add primary key (id);

alter table tourbill add foreign key (user_id) references users(user_id);

alter table tour modify tour_type int;
alter table destinationPlace add foreign key (city_id) references city(city_id);

alter table tour add foreign key (tour_type) references typetour(type_id);
alter table tour drop column price;

-- count number of tours in other cities;
select city.city_name, count(City_ID) as tourNum from tour join city on tour.City_ID= city.id group by city.city_name;
-- number of tours after March;
select count(date_Start) as 'tourNum' from tour where date_Start > '2020-03-01';
-- number of tours done during April;
select count(date_Done) as 'tourNum' from tour where month(date_Done) = '04';
