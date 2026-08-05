--ข้อ1
select	
	TitleOfCourtesy,FirstName,LastName,Title,City
from employees
where City =  'London'
order by FirstName asc

--ข้อ2
select
	ProductID,ProductName,UnitPrice,UnitsInStock
from Products
where UnitsInStock < 30
order by UnitsInStock desc


--ข้อ3 
select 
	CustomerID, CompanyName, Phone, Country
from Customers where country in ('Sweden','Germany','France','Spain','UK')
order by country asc


--ข้อ4
select * from Customers
where Fax is null


--ข้อ5
Select * from Products
where UnitsInStock < ReorderLevel and UnitsOnOrder > 0


--ข้อ6 
select firstName, lastname
from Employees
where year (HireDate) = 1993


--ข้อ7 
Select * from Products
where UnitPrice between 50 and 100


--ข้อ8
Select * from Customers
where CompanyName like 'M%'


--ข้อ9.ข้อมุลลูกค้าที่มีตำแหน่ง
Select * from Customers
where ContactTitle like '%manager%'






--เปลี่ยนไปใช้ Minimart
--ต้องการจำนวนสินค้าม ราคาเฉลี่ยม ราคาสูงสุดม ราคาตำ่สุดม จำนวนสินค้ารวมทั้งหมด
Select Count(*) as จำนวน,
avg (UnitPrice) as ราคาเฉลี่ย,
max (UnitPrice) as ราคาสูงสุด,
min (UnitPrice) as ราคาต่ำสุด,
sum (UnitsInStock) as จำนวนสินค้ารวมทั้งหมด
from Products 
where CategoryID = 1
--
select CategoryID,count(*) as จำนวน from Products
group by CategoryID
--ใบเสร็จแต่ละใบ มียอดเท่าใด
select ReceiptID, sum(UnitPrice*Quantity) as ยอดเงินรวม
from details
group by ReceiptID

--สินค้าแต่ละหมวดหมู่มีจำนวนกี่ชนิด ต้องการเฉพาะหมวดหมู่ที่มี มากกว่า 2 ชนิดสินค้า
SELECT CategoryID,COUNT(*) AS จำนวน from Products
GROUP BY CategoryID
HAVING COUNT(*) >= 2
--ใบเสร็จแต่ละใบ มียอดเงินรวมเท่าใด ต้องการเฉพาะยอดเงินรวมในใบเสร็จ ต่ำกว่า 100
SELECT ReceiptID,sum(UnitPrice*Quantity) AS ยอดเงินรวม 
from Details
GROUP BY ReceiptID
HAVING sum(UnitPrice*Quantity) <100

--โจทย์ทดลอง group by และ having ใน Northwind 
--แสดงชื่อประเทสของลูกค้า และจำนวนลูกค้าในแต่ละประเทศ แสดงเฉพาะประเทศที่มีจำนวนลูกค้า มากกว่า 3 ราย
select country, count(*) as จำนวนลูกค้า from customers
group by country
having count(*)> 3
order by count(*) desc
--แสดงเลขที่ใบเสร็จ และจำนวนรายการที่ขายในแต่ละใบเสร็จ แสดงเฉพาะใบเสร็จที่มี 1 รายการขาย (order details)
--ต้องการเฉพาะ 5 รายการล่าสุด
select orderID, count(*) as จำนวนรายการ from [Order Details]
group by orderID
having count(*) =1

--รหัสหมวดหมู่สินค้า ราคาเฉลี่ย ราคาสูงสุด ราคาต่ำสุด เฉพาะ สินค้าที่มาจากผู้จำหน่ายรหัส 1-10
-- แสดงเฉพาะสินค้าที่มีราคาเฉลี่ยต่ำกว่า 20
select categoryID, avg(UnitPrice) as ราคาเฉลี่ย,max(Unitprice) as ราคาสูงสุด, min(Unitprice) as ราคาต่ำสุด
from Products
where SupplierID < 10
group by CategoryID
having avg(UnitPrice) < 20

--จากตาราง order ต้องการรหัสพนักงาน และ จำนวนใบเสร็จที่รับผิดชอบ เฉพาะรายการที่เกิดขึ้นในปี 1997
--เลือกมาเฉพาะรายการที่ส่งสินค้าไปประเทศ USA
--ให้เลือกเฉพาะพนักงานที่ขายได้ตั้งแต่ 10 รายการขึ้นไป
select EmployeeID, count(*) as จำนวนใบเส็จ
from orders
where year(orderdate)=1997 and ShipCountry = 'USA'
group by EmployeeID
having count(*) >=10

-----------------------------------------------------------
SELECT 
    CategoryID,
    COUNT(*) AS ProductCount
FROM dbo.Products
GROUP BY CategoryID;



