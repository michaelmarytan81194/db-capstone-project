CREATE DEFINER=`root`@`localhost` PROCEDURE `mydb`.`GetMaxQuantity`()
begin
select max(quantity) from orders order by orderid;
end