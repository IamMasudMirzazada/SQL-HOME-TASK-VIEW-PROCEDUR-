insert into Brands values ('Redmi')
insert into Notebooks values ('MacBook Pro',6000,1),('Galaxy Book',3000,2),('null',0,3)
insert into Phones values ('13 Pro',3700,1),('Galaxy S21',2500,2),('Note 10T',2100,3)
----3) Notebooks Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.
select n.Name,n.Price,b.Name 'BrandName' from Brands b
join Notebooks n 
on b.Id=n.BrandsId
---4) Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.
select  p.Name,p.Price,b.Name 'BrandName' from Brands b
join Phones p on
p.BrandsId=b.Id

---5) Brand Adinin Terkibinde s Olan Butun Notebooklari Cixardan Query.
select * from Brands b
join Notebooks n on
n.BrandsId=b.Id where b.Name like '%m%'

--6) Qiymeti 2000 ve 5000 arasi ve ya 5000 den yuksek Notebooklari Cixardan Query.
select * from Brands b
join Notebooks n on
n.BrandsId=b.Id where (Price BETWEEN 2000 AND 5000) or Price>5000

---7) Qiymeti 1000 ve 1500 arasi ve ya 1500 den yuksek Phonelari Cixardan Query.
select * from Brands b
join Phones p on
p.BrandsId=b.Id where (Price BETWEEN 1000 AND 1500) or Price>1500

---8) Her Branda Aid Nece dene Notebook Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.
select b.Name 'BrandName' ,COUNT( b.Name) 'Count'  from Brands b
join Notebooks n on
n.BrandsId=b.Id   
Group by b.Name
 
 ---9) Her Branda Aid Nece dene Phone Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

select b.Name 'BrandName' , Count(b.name) 'Count' from Brands b 
join Phones p on 
p.BrandsId=p.Id 
Group by b.Name

 ---10) Hem Phone Hem de Notebookda Ortaq Olan Name ve BrandId Datalarni Bir Cedvelde Cixardan Query.
select p.Name 'BrandName', p.BrandsId  from Phones p
 intersect
 select n.Name 'BrandName', n.BrandsId   from Notebooks n
  
 ---11) Phone ve Notebook da Id, Name, Price, ve BrandId Olan Butun Datalari Cixardan Query.
 Select p.Id,p.Name,p.Price,P.BrandsId from Phones p 
 union
 Select n.Id,n.Name,n.Price,n.BrandsId from Notebooks n

 --12) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalari Cixardan Query.
  Select p.Id,p.Name,p.Price,P.BrandsId 'BrandName' from Phones p 
 union
 Select n.Id,n.Name,n.Price,n.BrandsId 'BrandName' from Notebooks n

 
---13) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalarin Icinden Price 1000-den Boyuk Olan Datalari Cixardan Query.
 
  select tbl.Id,tbl.Name,tbl.Price,b.Name 'brand name' from (
 
					 Select p.Id,p.Name,p.Price,P.BrandsId  from Phones p    
					union
					Select n.Id,n.Name,n.Price,n.BrandsId  from Notebooks n 

				) as tbl
join Brands b
on tbl.BrandsId=b.Id 

 ----14) Phones Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) ve Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olan Datalari Cixardan Query.Misal
  select b.Name 'BrandName' ,   SUM(p.Price) 'Totalprice' , COUNT(b.name) 'ProductCount'  from  Brands b
join Phones p  on 
b.Id=p.BrandsId
Group by b.Name
----15 tam yaza bilmedim
SELECT b.Name 'BrandName',  Sum(p.Price)'TotalPrice',Count(b.name) 'ProductCount' from Brands b 
join Notebooks p on
p.BrandsId=b.Id
group by b.Name
Having Count(b.Name)>3

 


