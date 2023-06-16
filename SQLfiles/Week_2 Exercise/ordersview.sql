create or replace
algorithm = UNDEFINED view `mydb`.`ordersview` as
select
	`o`.`orderid` as `orderid`,
	`o`.`quantity` as `quantity`,
	`o`.`sales` as `sales`
from
	`mydb`.`orders` `o`
where
	(`o`.`quantity` > 2);