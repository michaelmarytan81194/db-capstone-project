prepare GetOrderDetail from 'select orderid, quantity, sales from orders where customerid = ?';
set @cus_id = 1
execute GetOrderDetail usign @cus_id