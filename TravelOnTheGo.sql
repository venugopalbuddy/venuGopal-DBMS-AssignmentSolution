 /* 1)*/ create table Passenger(passenger_name varchar(255),
         Category varchar(255),
         Gender varchar(255),boarding_city varchar(255),
         destination_city varchar(255),
         distance int,bus_type varchar(255));
 
        create table price(bus_type varchar(255),distance int,price int);
 
        desc passenger;
        desc price;
 
 /* 2)*/  
   insert into passenger values("sejel","ac","f","bengaluru","chennai",350,"Sleeper");
   insert into passenger values("anmol","non-ac","m","mumbai","hyderabad",700,"sitting");
   insert into passenger values("pallavi","ac","f","panaji","bangalore",600,"sleeper");
   insert into passenger values("khusboo","ac","f","chennai","mumbai",1500,"sleeper");
   insert into passenger values("udit","non-ac","m","trivandrum","panaji",1000,"sleeper");
   insert into passenger values("ankur","ac","m","nagpur","hyderabad",500,"sitting");
   insert into passenger values("Hemant","non-ac","m","panaji","mumbai",700,"sleeper");
   insert into passenger values("manish","non-ac","m","hyderabad","bengaluru",500,"sleeper");
   insert into passenger values("piyush","ac","m","pune","nagpur",700,"sitting");
   
   insert into price values("sleeper",350,770);
   insert into price values("sleeper",500,1100);
   insert into price values("sleeper",600,1320);
   insert into price values("sleeper",700,1540);
   insert into price values("sleeper",1000,2200);
   insert into price values("sleeper",1200,2640);
   insert into price values("sleeper",1500,2700);
   insert into price values("sitting",500,620);
   insert into price values("sitting",600,744);
   insert into price values("sitting",700,868);
   insert into price values("sitting",1000,1240);
   insert into price values("sitting",1200,1488);
   insert into price values("sitting",1500,1860);
   
   select *from passenger;
   select *from price;
   
   
   
  /* 3)*/ select count(gender) as count_of_gender,gender from passenger where distance >=600 group by gender;
   
   
  /* 4*/ select min(price) as minimum_ticket_price_for_sleeper,bus_type from price where bus_type="sleeper";
   
   
  /* 5)*/ select passenger_name from passenger where passenger_name like "s%";
   
   /* 6)*/select passenger_name,boarding_city,passenger.bus_type,price from passenger join price on passenger.distance=price.distance and passenger.bus_type=price.bus_type group by passenger_name;
   
   /* 7)*/ select passenger_name,price from passenger join price on passenger.distance=price.distance and passenger.bus_type=price.bus_type where passenger.bus_type="sitting" and passenger.distance=1000;
   
   /* 8)*/ select bus_type,price from price where distance =(select distance from passenger where passenger_name like "%pallavi%") group by bus_type;
   
   /* 9)*/ select count(distance) as count,distance  from passenger group by distance order by distance desc;
   
   /* 10)*/ select passenger_name,(distance*100)/(select sum(distance) from passenger) as percentage_of_distance_traveled from passenger group by passenger_name;
   
   
   /* 11)*/select distance,price, if(price>1000,"Expensive",if(price<1000 and price>500,"Average Cost","cheap")) as 'Category' from price ;