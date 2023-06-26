-- mydb.highorders source

create or replace
algorithm = UNDEFINED view `mydb`.`highorders` as
select
    `c`.`customerid` as `customerid`,
    `c`.`customersname` as `customersname`,
    `o`.`orderid` as `orderid`,
    `o`.`sales` as `sales`,
    `i`.`name` as `name`,
    `m`.`cuisine` as `cuisine`
from
    (((`mydb`.`customers` `c`
join `mydb`.`orders` `o` on
    ((`c`.`customerid` = `o`.`customerid`)))
join `mydb`.`menuitems` `i` on
    ((`o`.`itemid` = `i`.`itemid`)))
join `mydb`.`menus` `m` on
    ((`i`.`menuid` = `m`.`menuid`)))
where
    (`o`.`sales` > 150);