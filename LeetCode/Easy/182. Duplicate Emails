-- Running on MySQL Workbench


CREATE TABLE `practice`.`person` (
  `Id` INT NOT NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`Id`));
  -- Truncate table person;
insert into `practice`.`person` (Id, Email) values ('1', 'a@b.com');
insert into `practice`.`person` (Id, Email) values ('2', 'c@d.com');
insert into `practice`.`person` (Id, Email) values ('3', 'a@b.com');

select Email
from `practice`.`person` -- all email list
group by Email -- email name only appear once, but number of appear may record
having count(Email) > 1;  -- remain only appear once
