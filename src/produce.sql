create table products(
                         Id int auto_increment primary key,
                         productCode varchar(50) not null ,
                         productName varchar(50) not null ,
                         productPrice int not null ,
                         productAmount int not null ,
                         productStatus bit not null
);
ALTER TABLE products ADD UNIQUE INDEX (productCode);
ALTER TABLE products ADD   Index  CompositeIndex(productName,productPrice);
EXPLAIN SELECT *FROM products WHERE productCode = 'C05';
create view vw_products as select productCode,productName,productPrice,productStatus FROM products ;
SELECT * FROM vw_products;
UPDATE vw_products SET productCode = 'ABC' WHERE productCode= 'C05';

DELIMITER //
CREATE PROCEDURE PRODUCTS()
BEGIN
SELECT *FROM products;
end //


DELIMITER //
CREATE PROCEDURE ADDPRODUCTS()
BEGIN
INSERT INTO products VALUE (3,'C07','XE ĐẠP',100,10,1);
end //
CALL ADDPRODUCTS();
DELIMITER //
CREATE PROCEDURE EDITPRODUCTFOCUSID( codeProcduct varchar(50) ,newcodePRODUCT VARCHAR(50))
begin
update  products SET productCode = newcodePRODUCT where productCode = codeProcduct;
end //
call EDITPRODUCTFOCUSID('ABC','C05');

DELIMITER //
CREATE PROCEDURE DELETEPRODUCTFOCUSID( Ids int)
begin
delete from products where Id = Ids;
end //
call DELETEPRODUCTFOCUSID(1);



