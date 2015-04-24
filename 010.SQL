SELECT Printer.model, price
FROM Printer
where Printer.price  = (select max(price) from printer)

