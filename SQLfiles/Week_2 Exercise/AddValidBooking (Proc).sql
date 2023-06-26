create procedure AddValidBooking (in date_input date, in table_no_input int, in customer_id_input int)
begin
	start transaction;
	select bookingid into @id from bookings order by bookingid desc limit 1;
	set @id = @id +1; -- Thêm 1 ID mới vào Bookings (BookingID);
	IF EXISTS(SELECT * FROM bookings WHERE bookingdate = date_input AND tableno = table_no_input)
	-- ở bước này, chọn ra các tuple row mà trùng vs 2 tham số của cột được truyền vào
	then 
	select concat("Table", table_no_input, "is already booked - booking cancelled") as Booking_Status;
	rollback; -- Bảo đảm rằng ko làm thay đổi database
	else 
	insert into bookings(bookingid, bookingdate, tableno, customerid)
	values(@id, date_input, table_no_input, customer_id_input);
	commit;
	select concat("Booking for table ", table_no_input, " on ", date_input, " of Customer ", customer_id_input, " was done!" );
	end if;
end

CALL mydb.AddValidBooking('2022-10-13', 3, 2)


