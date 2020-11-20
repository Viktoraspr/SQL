use traukiniai;

insert into country (code_country, name_country) values
('LTU', 'Lietuva'), ('USA', 'United states'), ('IT', 'Italy'), ('ES', 'Spain');

insert into miestas(name_miestas) values
('Vilnius'), ('Kaunas'), ('Šiauliai'), ('Klaipėda'), ('Radviliškis'), ('Jonava'), ('Vievis'), ('Kaišiadorys');

insert into stotis(name_stotis, id_miestas) values
('Vilnius geležinkelio stotis', 1), ('Kauno geležinkelio stotis', 2), ('Šiaulių geležinkelio stotis', 3), 
('Klaipėdos geležinkelio stotis', 4), ('Radviliškio geležinkelio stotis', 5), 
('Jonavos geležinkelio stotis', 6), ('Jonavos Achemos stotis', 6);

insert into gamintojas(gamintojas, id_country) values
('General Electrics', 2), ('Italy trains', 3);

insert into lokomotyvas_krovininis(modelis, unikalus_numeris, max_krovinio_svoris, id_gamintojas) values
('S1', '19130151M', 1000, 1), ('I1', '19130153M', 1100, 2), 
('S2', '19130151Z', 1500, 1), ('I2', '19230151M', 8500, 2);

insert into lokomotyvas_keleivinis(modelis, unikalus_numeris, max_sedimos_vietos, id_gamintojas, galia) values
('E1', '219130151M', 100, 1, 10000), ('IE1', '219130251M', 95, 2, 11000), 
('E2', '219930151M', 120, 1, 12000), ('IE2', '219930151Z', 85, 2, 12500);

insert into lokomotyvas(nr_keleivinis) values
('219130151M'), ('219130251M'), ('219930151M'), ('219930151Z');

insert into lokomotyvas(nr_krovininis) values
('19130151M'), ('19130153M'), ('19130151Z'), ('19230151M');


insert into bilietas(bilieto_tipas, bilieto_naudojimas, bilieto_kaina) values
('sėdimas', 'vienkartinis', 20.50), ('sėdimas', 'vienkartinis', 20.50), ('sėdimas', 'vienkartinis', 10.25),
('sėdimas', 'vienkartinis', 0), ('sėdimas', 'vienkartinis', 20.50), ('sėdimas', 'vienkartinis', 10.25);

insert into vagonai_keleiviniai(id_vagonas, id_gamintojas, modelis, vagono_tipas, 
vagono_svoris, 	max_keleiviu_vietos) values
('KL06116Z', 1, 'KEL1', 'Kupe', 12000, 30), ('KL81116A', 2, 'KEL2', 'Sedimos vietos', 13000, 185), 
('KL06116A', 1, 'KEL3', 'Sedimos vietos', 15000, 140), ('KL06156A', 2, 'KEL4', 'Kupe', 18500, 40);


insert into vagonai_kroviniai(id_vagonas, modelis, vagono_tipas, id_gamintojas, vagono_svoris, 
								max_krovinio_svoris) values
('VAG161661M', 'KEL1', 'krovininis-skystas', 1, 12000, 30000), 
('IAG161661Z', 'KEL2', 'krovininis-birus', 1, 13000, 28000), 
('VAG195661Z', 'KEL3', 'krovininis-birus', 2, 15000, 35000), 
('IAG181861Z', 'KEL4', 'krovininis-skystas', 2, 18500, 40000);

insert into vagonai(id_keleivinis) values 
('KL06116Z'),('KL06116A'),('KL81116A'),('KL06156A');

insert into vagonai(id_krovininis) values 
('VAG161661M'),('IAG161661Z'),('VAG195661Z'),('IAG181861Z');

insert into traukinio_sastatas(id_sastatas, id_vagonas) values
(1, 'VAG161661M'), (1, 'IAG161661Z'), (1, 'VAG195661Z'), 
(1, 'IAG181861Z');

insert into traukinio_sastatas(id_sastatas, nr_lokomotyvas) values
(1, '19130153M');

insert into traukinio_sastatas(id_sastatas, id_vagonas) values
(2, 'KL06116Z'), (2, 'KL81116A'), (2, 'KL06116A'), 
(2, 'KL06156A');

insert into traukinio_sastatas(id_sastatas, nr_lokomotyvas) values
(2, '219130151M');

insert into kelio_atkarpa(id_kelio_atkarpa, kelio_atkarpa, isvykimo_stotis, atvykimo_stotis, 
keliones_trukme_minutes, atstumai_km) values
(1, "Vilnius-Kaunas", 1, 2, 57, 105),
(2, "Kaunas-Jonava(miestas)", 2, 6, 25, 30 ),
(3, "Jonava(miestas)-Klaipėda", 6, 4, 128, 220);

insert into marsrutai(id_marsrutas, name_marsrutas, id_kelio_atkarpa, eiles_numeris) values
(1, "Vilnius-Kaunas-Jonava-Klaipėda", 1, 1),
(1, "Vilnius-Kaunas-Jonava-Klaipėda", 2, 2),
(1, "Vilnius-Kaunas-Jonava-Klaipėda", 3, 3);

insert into keliones(nr_sastatas, id_marsrutai, isvykimo_laikas, atvykimo_laikas) values
(1, 1, '2020-12-01 10:30', '2020-12-31 14:30'),
(2, 1, '2020-12-02 12:30', '2020-12-31 16:30'),
(1, 1, '2020-12-03 14:30', '2020-12-31 18:30'),
(1, 1, '2020-12-04 16:30', '2020-12-31 20:30'), 
(2, 1, '2020-12-05 18:30', '2020-12-31 22:30');

insert into keliones_bilietai(id_keliones, id_bilietas) values
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (3, 1), (3, 2), (3, 3), (3, 4), (3, 5);

insert into keliones_kroviniai(id_keliones, krovinio_tipas, svoris) values
(2, 'Malkos', 500000), (5, 'Anglys', 800000);


