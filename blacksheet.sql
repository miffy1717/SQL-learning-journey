select name, maxfoodprice from (select * from rest order by experience desc) order by maxfoodprice limit 4

select * from rest order by maxfoodprice desc

select name, maxfoodprice, experience from (select * from rest order by maxfoodprice desc limit 4) as expensive order by experience 