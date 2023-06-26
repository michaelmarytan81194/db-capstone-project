create procedure CancelOrder (order_id_input int)
	delete from orders
	where orderid = order_id_input