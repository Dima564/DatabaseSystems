DROP DATABASE IF EXISTS cafe_Menu;
CREATE DATABASE cafe_Menu;
USE cafe_Menu;

CREATE TABLE Dish 
(
	DishId int AUTO_INCREMENT PRIMARY KEY ,
	DishName varchar(50) NOT NULL
);


CREATE TABLE Product
(
	ProductId int AUTO_INCREMENT PRIMARY KEY ,
	ProductName varchar(50) NOT NULL,
	ProductManufacturer varchar(50)
);

CREATE TABLE DishContent 
(
	DishId int,
	ProductId int,
	Amount int,
	CONSTRAINT Fk_DishContent_DishId FOREIGN KEY (DishId)
	REFERENCES Dish(DishId),
	CONSTRAINT Fk_DishContent_ProductId FOREIGN KEY (ProductId)
	REFERENCES Product(ProductId)
);

CREATE TABLE Menu 
(
	DishId int,
	WeekDay varchar(10),
	Portions int ,

	CONSTRAINT Fk_Menu_DishId FOREIGN KEY (DishId)
	REFERENCES Dish(DishId),

	CONSTRAINT ChkMenu_WeekDay CHECK 
	(
		WeekDay IN ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')
	)

);


INSERT INTO Dish (DishName) values ('Salmon Steak');
INSERT INTO Dish (DishName) values ('Shrimp Creole');
INSERT INTO Dish (DishName) values ('Tomato Puff Pastry');
INSERT INTO Dish (DishName) values ('Lobster Mac and Cheese');
INSERT INTO Dish (DishName) values ('Lettuce Salad with Avocado');
INSERT INTO Dish (DishName) values ('Triple-Decker Strawberry Cake');
INSERT INTO Dish (DishName) values ('Gnocchi with Sage, Butter and Parmesan');
INSERT INTO Dish (DishName) values ('Bacon Wrapped Scallops');

INSERT INTO Product (ProductName,ProductManufacturer) values('Milk','Molochnik');
INSERT INTO Product (ProductName,ProductManufacturer) values('Egg','Chicken');
INSERT INTO Product (ProductName,ProductManufacturer) values('Sugar','Cane');
INSERT INTO Product (ProductName,ProductManufacturer) values('Lobster','Ocean'); 
INSERT INTO Product (ProductName,ProductManufacturer) values('Strawberry','Granny');
INSERT INTO Product (ProductName,ProductManufacturer) values('Flour','Wheat');
INSERT INTO Product (ProductName,ProductManufacturer) values('Tomato','Granny');
INSERT INTO Product (ProductName,ProductManufacturer) values('Onion','Granny');
INSERT INTO Product (ProductName,ProductManufacturer) values('Cheese','Cow');
INSERT INTO Product (ProductName,ProductManufacturer) values('Pasta','Wheat'); 
INSERT INTO Product (ProductName,ProductManufacturer) values('Mushroom','ForestGump');
INSERT INTO Product (ProductName,ProductManufacturer) values('Lemon','Jungle');
INSERT INTO Product (ProductName,ProductManufacturer) values('Lettuce','WebVan');
INSERT INTO Product (ProductName,ProductManufacturer) values('Salmon','Ocean');
INSERT INTO Product (ProductName,ProductManufacturer) values('Parmesan','Cow');
INSERT INTO Product (ProductName,ProductManufacturer) values('Bacon','Cow');
INSERT INTO Product (ProductName,ProductManufacturer) values('Paprica','WebVan');
INSERT INTO Product (ProductName,ProductManufacturer) values('Shrimps','Ocean');
INSERT INTO Product (ProductName,ProductManufacturer) values('Avocado','WebVan');

INSERT INTO DishContent (DishId,ProductId,Amount) values(1,8,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(1,12,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(1,14,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(2,8,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(2,2,2);
INSERT INTO DishContent (DishId,ProductId,Amount) values(2,6,300);
INSERT INTO DishContent (DishId,ProductId,Amount) values(2,17,3);
INSERT INTO DishContent (DishId,ProductId,Amount) values(3,7,5);
INSERT INTO DishContent (DishId,ProductId,Amount) values(3,8,2);
INSERT INTO DishContent (DishId,ProductId,Amount) values(3,9,200);
INSERT INTO DishContent (DishId,ProductId,Amount) values(3,17,2);
INSERT INTO DishContent (DishId,ProductId,Amount) values(3,12,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(4,4,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(4,8,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(4,12,3);
INSERT INTO DishContent (DishId,ProductId,Amount) values(4,13,20);
INSERT INTO DishContent (DishId,ProductId,Amount) values(5,13,100);
INSERT INTO DishContent (DishId,ProductId,Amount) values(5,17,2);
INSERT INTO DishContent (DishId,ProductId,Amount) values(5,9,50);
INSERT INTO DishContent (DishId,ProductId,Amount) values(5,19,2);
INSERT INTO DishContent (DishId,ProductId,Amount) values(6,12,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(6,1,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(6,2,12);
INSERT INTO DishContent (DishId,ProductId,Amount) values(6,3,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(6,5,21);
INSERT INTO DishContent (DishId,ProductId,Amount) values(6,6,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,1,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,2,15);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,3,13);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,6,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,15,13);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,12,12);
INSERT INTO DishContent (DishId,ProductId,Amount) values(7,11,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(8,8,1);
INSERT INTO DishContent (DishId,ProductId,Amount) values(8,16,300);

INSERT INTO Menu (DishId,WeekDay,Portions) values(1,'Thursday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(2,'Wednesday',12);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Monday',3);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Wednesday',53);
INSERT INTO Menu (DishId,WeekDay,Portions) values(5,'Thursday',54);
INSERT INTO Menu (DishId,WeekDay,Portions) values(6,'Monday',23);
INSERT INTO Menu (DishId,WeekDay,Portions) values(7,'Wednesday',12);
INSERT INTO Menu (DishId,WeekDay,Portions) values(8,'Thursday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(1,'Saturday',34);
INSERT INTO Menu (DishId,WeekDay,Portions) values(2,'Monday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Sunday',34);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Thursday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(5,'Tuesday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(6,'Monday',54);
INSERT INTO Menu (DishId,WeekDay,Portions) values(7,'Sunday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(8,'Saturday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(1,'Monday',12);
INSERT INTO Menu (DishId,WeekDay,Portions) values(2,'Monday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Friday',43);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Friday',13);
INSERT INTO Menu (DishId,WeekDay,Portions) values(5,'Sunday',23);
INSERT INTO Menu (DishId,WeekDay,Portions) values(6,'Monday',99);
INSERT INTO Menu (DishId,WeekDay,Portions) values(7,'Friday',43);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Saturday',2);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Monday',12);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Monday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(2,'Friday',43);
INSERT INTO Menu (DishId,WeekDay,Portions) values(5,'Friday',13);
INSERT INTO Menu (DishId,WeekDay,Portions) values(7,'Sunday',23);
INSERT INTO Menu (DishId,WeekDay,Portions) values(6,'Monday',99);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Friday',43);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Saturday',2);
INSERT INTO Menu (DishId,WeekDay,Portions) values(6,'Monday',12);
INSERT INTO Menu (DishId,WeekDay,Portions) values(5,'Monday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(7,'Friday',43);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Friday',13);
INSERT INTO Menu (DishId,WeekDay,Portions) values(4,'Sunday',23);
INSERT INTO Menu (DishId,WeekDay,Portions) values(1,'Monday',99);
INSERT INTO Menu (DishId,WeekDay,Portions) values(1,'Friday',43);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Saturday',2);
INSERT INTO Menu (DishId,WeekDay,Portions) values(5,'Tuesday',3);
INSERT INTO Menu (DishId,WeekDay,Portions) values(6,'Tuesday',30);
INSERT INTO Menu (DishId,WeekDay,Portions) values(7,'Tuesday',23);
INSERT INTO Menu (DishId,WeekDay,Portions) values(3,'Tuesday',1);
INSERT INTO Menu (DishId,WeekDay,Portions) values(2,'Tuesday',2);

SELECT DISTINCT Product.ProductManufacturer FROM (
	Menu JOIN DishContent 
	ON Menu.DishId = DishContent.DishId
	JOIN Product 
	ON DishContent.ProductId = Product.ProductId)
WHERE Menu.WeekDay = 'Tuesday'
ORDER BY Product.ProductManufacturer;


SELECT SUM(DishContent.Amount) AS Total 
FROM (
Menu JOIN DishContent
ON Menu.DishId = DishContent.DishId);



 SELECT COUNT(Product.ProductName) AS Amount FROM
 DishContent JOIN Product
 ON DishContent.ProductId = Product.ProductId
 WHERE Product.ProductName = 'Onion';


SELECT Product.ProductManufacturer, COUNT(DishContent.Amount) AS Quantity FROM
Menu JOIN DishContent
ON Menu.DishId = DishContent.DishId
JOIN Product
ON DishContent.ProductId = Product.ProductId
GROUP BY ProductManufacturer
ORDER BY Quantity DESC
LIMIT 1;


-- SELECT * FROM Dish;
-- SELECT * FROM Product;
-- SELECT WeekDay, DishId FROM Menu GROUP BY WeekDay, DishId;s