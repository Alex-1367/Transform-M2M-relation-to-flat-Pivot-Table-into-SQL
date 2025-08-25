CREATE VIEW `hotelinfo` AS
SELECT `h`.`HotelID` AS `HotelID`,
       `h`.`HotelName` AS `HotelName`,
       `h`.`Address` AS `Address`,
       `h`.`Phone` AS `Phone`,
       `h`.`Email` AS `Email`,
       `h`.`ContactPerson` AS `ContactPerson`,
       `t`.`TownName` AS `TownName`,
       `t`.`TownID` AS `TownID`,
       `ho`.`Name` AS `OrganizerName`,
       `ho`.`organizerId` AS `organizerId`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'SNGL') THEN coalesce(`hrt2`.`Capacity`, 0)
                ELSE 0
            END)) AS `SNGL_Rooms`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'SNGL') THEN `hrt`.`roomID`
                ELSE NULL
            END)) AS `SNGL_RoomTypeID`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'DBL') THEN coalesce(`hrt2`.`Capacity`, 0)
                ELSE 0
            END)) AS `DBL_Rooms`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'DBL') THEN `hrt`.`roomID`
                ELSE NULL
            END)) AS `DBL_RoomTypeID`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'TWIN') THEN coalesce(`hrt2`.`Capacity`, 0)
                ELSE 0
            END)) AS `TWIN_Rooms`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'TWIN') THEN `hrt`.`roomID`
                ELSE NULL
            END)) AS `TWIN_RoomTypeID`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'TRPL') THEN coalesce(`hrt2`.`Capacity`, 0)
                ELSE 0
            END)) AS `TRPL_Rooms`,
       max((CASE
                WHEN (`hrt`.`room_type` = 'TRPL') THEN `hrt`.`roomID`
                ELSE NULL
            END)) AS `TRPL_RoomTypeID`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'Breakfast') THEN 1
                ELSE 0
            END)) AS `Breakfast_Available`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'Breakfast') THEN `hmt`.`mealID`
                ELSE NULL
            END)) AS `Breakfast_MealTypeID`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'Lunch') THEN 1
                ELSE 0
            END)) AS `Lunch_Available`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'Lunch') THEN `hmt`.`mealID`
                ELSE NULL
            END)) AS `Lunch_MealTypeID`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'Dinner') THEN 1
                ELSE 0
            END)) AS `Dinner_Available`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'Dinner') THEN `hmt`.`mealID`
                ELSE NULL
            END)) AS `Dinner_MealTypeID`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'ALL INC') THEN 1
                ELSE 0
            END)) AS `ALL_INC_Available`,
       max((CASE
                WHEN (`hmt`.`meal_type` = 'ALL INC') THEN `hmt`.`mealID`
                ELSE NULL
            END)) AS `ALL_INC_MealTypeID`,
       count(DISTINCT `hrt2`.`RoomTypeID`) AS `TotalRoomTypes`,
       count(DISTINCT `hmt2`.`MealTypeID`) AS `TotalMealTypes`,
       sum(`hrt2`.`Capacity`) AS `TotalCapacity`,
       `h`.`CreatedAt` AS `CreatedAt`,
       `h`.`UpdatedAt` AS `UpdatedAt`,
       `h`.`IsActive` AS `IsActive`
FROM ((((((`hotels` `h`
           LEFT JOIN `towns` `t` on((`h`.`ToTown` = `t`.`TownID`)))
          LEFT JOIN `hotelorganizer` `ho` on((`h`.`ToHotelOrganizer` = `ho`.`organizerId`)))
         LEFT JOIN `hotel_room_types` `hrt2` on((`h`.`HotelID` = `hrt2`.`HotelID`)))
        LEFT JOIN `hotelroomtype` `hrt` on((`hrt2`.`RoomTypeID` = `hrt`.`roomID`)))
       LEFT JOIN `hotel_meal_types` `hmt2` on((`h`.`HotelID` = `hmt2`.`HotelID`)))
      LEFT JOIN `hotelmealtype` `hmt` on((`hmt2`.`MealTypeID` = `hmt`.`mealID`)))
GROUP BY `h`.`HotelID`,
         `h`.`HotelName`,
         `h`.`Address`,
         `h`.`Phone`,
         `h`.`Email`,
         `h`.`ContactPerson`,
         `t`.`TownName`,
         `t`.`TownID`,
         `ho`.`Name`,
         `ho`.`organizerId`,
         `h`.`CreatedAt`,
         `h`.`UpdatedAt`,
         `h`.`IsActive
