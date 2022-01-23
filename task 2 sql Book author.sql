create database Library
use Library
create table Books (
Id int primary key identity,
Name nvarchar(30) check(Len(Name) between 2 and 100),
PageCount int check (PageCount>=10)
)

create table Authors(
Id int primary key identity,
Name nvarchar(30),
Surname nvarchar(30)
)

alter table Books add AuthorId int 

--Id, Name, PageCount ve AuthorFullName columnlarinin valuelarini qaytaran bir view yaradin

create view  usp_StudentInfo
as
select b.Id,b.Name,b.PageCount,a.Name+a.Surname 'AuthorFullName' from Books b
join Authors a
on b.AuthorId=a.Id

select * from  usp_StudentInfo

---Gonderilmis axtaris deyirene gore hemin axtaris deyeri name ve ya authorFullNamelerinde olan Book-lari Id, Name, PageCount, AuthorFullName columnlari seklinde gostern procedure yazin
---islemedi---
create procedure usp_GetStu(@Value1 nvarchar(30))
as
BEGIN
select b.Id,b.Name,b.PageCount,(a.Name + ''+a.Surname)'Author full name' from Books b 
join Authors a 
on b.AuthorId=a.Id
where b.Name like '%'+'@Value1'+'%' or a.Name like '%'+'@Value1'+'%' or a.Surname like '%'+'@Value1'+'%'
END

exec usp_GetStu 'Sim'



----Authors tableinin insert, update ve deleti ucun (her biri ucun ayrica) procedure yaradin

create procedure usp_Insert(@Name nvarchar(30),@Surname nvarchar(30) )
as
insert into  Authors  values(@Name,@Surname)

Exec usp_Insert 'Altan','Ibrahimli'

create procedure usp_Update (@NameNew nvarchar(40),@NewSurname nvarchar(40),@AuthorsId int)
as 
Update Authors
set Name=@NameNew,Surname=@NewSurname where Id=@AuthorsId

exec usp_Update 'Mesud' , 'Mirzezade',1

create procedure usp_Delete (@AuthorsId int)
as 
Delete Authors where Id=@AuthorsId

exec usp_Delete 2


---Authors-lari Id,FullName,BooksCount,MaxPageCount seklinde qaytaran view yaradirsiniz Id-
create view usp_GetAuthorInfo_name
as
select a.Id,(a.Name+''+a.Surname) 'FullName',Count((a.Name+''+a.Surname)) 'BooksCount', Max(b.PageCount) 'MaxPageCount'  from Authors a
join Books b 
on b.AuthorId=a.Id
group by (a.Name+''+a.Surname) , a.Id

select * from usp_GetAuthorInfo_name