create database if not exists traukiniai;
use traukiniai;
drop tables if exists bilietas, bilietaslog, country, countrylog, gamintojas, gamintojaslog, 
			kelio_atkarpa, kelio_atkarpalog, keliones, kelioneslog, lokomotyvas, lokomotyvaslog,
            marsrutai, marsrutailog, miestas, miestaslog, stotis, stotislog, 
            traukinio_sastatas, traukinio_sastataslog, vagonai, vagonailog,
            keliones_bilietai, keliones_bilietailog, keliones_kroviniai, keliones_kroviniailog,
            vagonai_kroviniai, vagonai_kroviniailog, vagonai_keleiviniai, vagonai_keleiviniailog,
            lokomotyvas_keleivinis, lokomotyvas_keleivinislog, 
            lokomotyvas_krovininis, lokomotyvas_krovininislog;

create table if not exists country (
id_country int primary key auto_increment,
code_country varchar (5) not null unique, 
name_country varchar (30) not null unique, 
index (code_country, name_country)
);

create table if not exists miestas (
    id_miestas int primary key auto_increment,
    name_miestas varchar(50) not null,
    id_country int default '1', #Duomenys bus užpildyti taip, kad Lietuva būtų 1
    index (name_miestas), 
    foreign key (id_country) references country(id_country) on update cascade on delete restrict
);

create table if not exists stotis (
    id_stotis int primary key auto_increment,
    name_stotis varchar(50) not null,
    id_miestas int not null,
    constraint UC_Stotis unique (name_stotis, id_miestas),
    index (name_stotis),
    foreign key (id_miestas) references miestas(id_miestas) on update cascade on delete restrict
);

create table if not exists bilietas (
id_bilietas int primary key auto_increment,
bilieto_tipas varchar(20) not null check (bilieto_tipas in ('stovimas', 'sėdimas')), 
bilieto_naudojimas varchar(20) not null check (bilieto_naudojimas in ('vienkartinis', 'daugkartinis')), 
bilieto_kaina int
);

create table if not exists kelio_atkarpa (
id_kelio_atkarpa int primary key,
kelio_atkarpa varchar(250) not null,
isvykimo_stotis int not null, 
atvykimo_stotis int not null, 
keliones_trukme_minutes int,
atstumai_km int not null, 
index (kelio_atkarpa, id_kelio_atkarpa), 
foreign key (isvykimo_stotis) references stotis(id_stotis) on update cascade on delete restrict,
foreign key (atvykimo_stotis) references stotis(id_stotis) on update cascade on delete restrict
);

create table if not exists marsrutai(
id_marsrutas int,
name_marsrutas varchar(200),
id_kelio_atkarpa int not null,
eiles_numeris int not null, 
foreign key (id_kelio_atkarpa) references kelio_atkarpa(id_kelio_atkarpa) on update cascade on delete restrict,
index (name_marsrutas)
);

create table if not exists gamintojas(
id_gamintojas int primary key auto_increment, 
gamintojas varchar(50) not null, 
kontaktinis_asmuo varchar(50), 
el_pastas varchar(50),
telefono_nr int, 
id_country int, 
foreign key (id_country) references country(id_country) on update cascade on delete restrict, 
index(gamintojas)
 );

create table if not exists lokomotyvas_keleivinis(
unikalus_numeris varchar(100) primary key,
modelis varchar(100) not null,
id_gamintojas int not null, 
galia int not null,
max_sedimos_vietos int,
foreign key (id_gamintojas) references gamintojas(id_gamintojas) on update cascade on delete restrict,
index(unikalus_numeris)
);

create table if not exists lokomotyvas_krovininis(
unikalus_numeris varchar(100) primary key,
id_gamintojas int not null, 
modelis varchar(100) not null, 
max_krovinio_svoris int,
foreign key (id_gamintojas) references gamintojas(id_gamintojas) on update cascade on delete restrict,
index(unikalus_numeris)

);
create table if not exists lokomotyvas (
  id_lokomotyvas int primary key auto_increment,
  nr_lokomotyvas varchar(100) as 
  (case  
     when nr_keleivinis is not null then nr_keleivinis 
     else nr_krovininis   
	end),
  nr_keleivinis varchar(100) unique,
  nr_krovininis varchar(100) unique,
  constraint unique (nr_lokomotyvas, nr_keleivinis, nr_krovininis), -- UNIQUE permits NULLs
  constraint check (nr_keleivinis is not null or nr_krovininis is not null),
  foreign key (nr_keleivinis) references lokomotyvas_keleivinis(unikalus_numeris),
  foreign key (nr_krovininis) references lokomotyvas_krovininis(unikalus_numeris),
  index(nr_lokomotyvas)
);

create table if not exists vagonai_kroviniai(
id_vagonas varchar(100) primary key,
modelis varchar(100) not null,
vagono_tipas varchar(50) not null check(vagono_tipas in ('krovininis-birus', 'krovininis-skystas')),
id_gamintojas int, foreign key (id_gamintojas) references gamintojas(id_gamintojas), 
vagono_svoris int not null, 
max_krovinio_svoris int not null,
index(id_vagonas),
foreign key (id_gamintojas) references gamintojas(id_gamintojas)
);

create table if not exists vagonai_keleiviniai(
id_vagonas varchar(100) primary key,
id_gamintojas int, 
modelis varchar(100) not null, 
vagono_tipas varchar(50) not null check(vagono_tipas in ('Kupe', 'Sedimos vietos')),
vagono_svoris int not null,
max_keleiviu_vietos int not null,
foreign key (id_gamintojas) references gamintojas(id_gamintojas), 
index(modelis, vagono_tipas)
);

create table if not exists vagonai(
  id_vagonas int primary key auto_increment,
  nr_vagonas varchar(100) as 
  (case  
     when id_keleivinis is not null then id_keleivinis 
     else id_krovininis   
	end),
  id_keleivinis varchar(100),
  id_krovininis varchar(100),
  constraint unique (nr_vagonas, id_keleivinis, id_krovininis), -- UNIQUE permits NULLs
  constraint check (id_keleivinis is not null or id_krovininis is not null),
  foreign key (id_keleivinis) references vagonai_keleiviniai(id_vagonas),
  foreign key (id_krovininis) references vagonai_kroviniai(id_vagonas)
);

create table if not exists traukinio_sastatas(
id_sastatas integer, 
sastato_vienetai varchar(100) as 
  (case  
     when nr_lokomotyvas is not null then nr_lokomotyvas
     else id_vagonas   
	end), 
nr_lokomotyvas varchar(100), 
id_vagonas varchar(100)
);

create table if not exists keliones(
id_keliones int primary key auto_increment,
nr_sastatas integer not null, 
id_marsrutai int not null, 
isvykimo_laikas datetime not null, 
atvykimo_laikas datetime not null
);

create table keliones_bilietai(
id_keliones int not null, 
id_bilietas int, 
foreign key (id_keliones) references keliones(id_keliones) on update cascade on delete restrict,
foreign key(id_bilietas) references bilietas(id_bilietas) on update cascade on delete restrict,
index(id_keliones, id_bilietas),
primary key (id_keliones, id_bilietas)
);

create table keliones_kroviniai(
id_keliones int, 
krovinio_tipas varchar(100),
svoris int,
foreign key (id_keliones) references keliones(id_keliones),
primary key (id_keliones, krovinio_tipas, svoris)
);