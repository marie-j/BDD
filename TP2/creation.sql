drop table articles cascade;
drop table fournisseurs cascade;
drop table catalogue;


CREATE TYPE colors as  ENUM('rouge','noir','argente','opaque','cyan','magenta','vert','superjaune');

drop type colors;


CREATE TABLE Articles(
aid int primary key not null,                     
anom varchar(30), 
acoul varchar(30)
);

CREATE TABLE Fournisseurs(
fid int primary key not null,
fnom varchar(30),
fad varchar(70)
);


CREATE TABLE Catalogue(
fid int not null,   
aid int not null , 
prix numeric(8,2) check (prix >=0),

foreign key (fid) references Fournisseurs
	on delete cascade
	on update cascade,
foreign key (aid) references Articles
	on delete cascade
	on update cascade
);






