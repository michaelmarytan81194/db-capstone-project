-- mydb.frequent_ordered_item source

create or replace
algorithm = UNDEFINED view `mydb`.`frequent_ordered_item` as
select
    `mydb`.`menuitems`.`name` as `name`
from
    `mydb`.`menuitems`
where
    `mydb`.`menuitems`.`itemid` in (
    select
        `mydb`.`orders`.`itemid`,
        count(`mydb`.`orders`.`itemid`)
    from
        `mydb`.`orders`
    group by
        `mydb`.`orders`.`orderid`
    having
        (count(`mydb`.`orders`.`itemid`) > 2));