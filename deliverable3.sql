drop table if exists test;
create table test (
  username varchar(50),
  password varchar(16),
  PRIMARY KEY (username, password)
);

insert into test values ("admin1","admin1"), ("customerRep","customerRep");