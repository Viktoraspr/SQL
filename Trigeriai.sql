use traukiniai;

CREATE TABLE bilietaslog LIKE bilietas; 
ALTER TABLE bilietaslog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE bilietaslog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE bilietaslog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE bilietaslog MODIFY COLUMN id_bilietas INT DEFAULT 0;
ALTER TABLE bilietaslog DROP PRIMARY KEY;
ALTER TABLE bilietaslog ADD PRIMARY KEY (id_bilietas, change_time );

CREATE TRIGGER bilietaslog_insert AFTER INSERT ON bilietas
FOR EACH ROW 
INSERT INTO bilietaslog VALUES (
NEW.id_bilietas,NEW.bilieto_tipas,NEW.bilieto_naudojimas,NEW.bilieto_kaina,
'I',now(),USER());

CREATE TRIGGER bilietaslog_update AFTER UPDATE ON bilietas
FOR EACH ROW
INSERT INTO bilietaslog VALUES (
 NEW.id_bilietas,NEW.bilieto_tipas,NEW.bilieto_naudojimas,NEW.bilieto_kaina,
'U',now(),USER());

CREATE TRIGGER bilietaslog_delete AFTER DELETE ON bilietas
FOR EACH ROW
INSERT INTO bilietaslog VALUES (
 OLD.id_bilietas,OLD.bilieto_tipas,OLD.bilieto_naudojimas,OLD.bilieto_kaina,
'D',now(),USER());

CREATE TABLE countrylog LIKE country; 
ALTER TABLE countrylog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE countrylog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE countrylog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE countrylog MODIFY COLUMN id_country INT DEFAULT 0;
ALTER TABLE countrylog DROP PRIMARY KEY;
ALTER TABLE countrylog ADD PRIMARY KEY (id_country, change_time );

CREATE TRIGGER countrylog_insert AFTER INSERT ON country
FOR EACH ROW 
INSERT INTO countrylog VALUES (
NEW.id_country,NEW.code_country,NEW.name_country,
'I',now(),USER());

CREATE TRIGGER countrylog_update AFTER UPDATE ON country
FOR EACH ROW
INSERT INTO countrylog VALUES (
 NEW.id_country,NEW.code_country,NEW.name_country,
'U',now(),USER());

CREATE TRIGGER countrylog_delete AFTER DELETE ON country
FOR EACH ROW
INSERT INTO countrylog VALUES (
 OLD.id_country,OLD.code_country,OLD.name_country,
'D',now(),USER());

CREATE TABLE gamintojaslog LIKE gamintojas; 
ALTER TABLE gamintojaslog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE gamintojaslog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE gamintojaslog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE gamintojaslog MODIFY COLUMN id_gamintojas INT DEFAULT 0;
ALTER TABLE gamintojaslog DROP PRIMARY KEY;
ALTER TABLE gamintojaslog ADD PRIMARY KEY (id_gamintojas, change_time );

CREATE TRIGGER gamintojaslog_insert AFTER INSERT ON gamintojas
FOR EACH ROW 
INSERT INTO gamintojaslog VALUES (
NEW.id_gamintojas,NEW.gamintojas,NEW.kontaktinis_asmuo,NEW.el_pastas,NEW.telefono_nr,NEW.id_country,
'I',now(),USER());

CREATE TRIGGER gamintojaslog_update AFTER UPDATE ON gamintojas
FOR EACH ROW
INSERT INTO gamintojaslog VALUES (
 NEW.id_gamintojas,NEW.gamintojas,NEW.kontaktinis_asmuo,NEW.el_pastas,NEW.telefono_nr,NEW.id_country,
'U',now(),USER());

CREATE TRIGGER gamintojaslog_delete AFTER DELETE ON gamintojas
FOR EACH ROW
INSERT INTO gamintojaslog VALUES (
OLD.id_gamintojas,OLD.gamintojas,OLD.kontaktinis_asmuo,OLD.el_pastas,OLD.telefono_nr,OLD.id_country,
'D',now(),USER());

CREATE TABLE kelio_atkarpalog LIKE kelio_atkarpa; 
ALTER TABLE kelio_atkarpalog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE kelio_atkarpalog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE kelio_atkarpalog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE kelio_atkarpalog MODIFY COLUMN id_kelio_atkarpa INT DEFAULT 0;
ALTER TABLE kelio_atkarpalog DROP PRIMARY KEY;
ALTER TABLE kelio_atkarpalog ADD PRIMARY KEY (id_kelio_atkarpa, change_time );

CREATE TRIGGER kelio_atkarpalog_insert AFTER INSERT ON kelio_atkarpa
FOR EACH ROW 
INSERT INTO kelio_atkarpalog VALUES (
NEW.id_kelio_atkarpa,NEW.kelio_atkarpa,NEW.isvykimo_stotis,NEW.atvykimo_stotis,
NEW.keliones_trukme_minutes,NEW.atstumai_km,
'I',now(),USER());

CREATE TRIGGER kelio_atkarpalog_update AFTER UPDATE ON kelio_atkarpa
FOR EACH ROW
INSERT INTO kelio_atkarpalog VALUES (
NEW.id_kelio_atkarpa,NEW.kelio_atkarpa,NEW.isvykimo_stotis,NEW.atvykimo_stotis,
NEW.keliones_trukme_minutes,NEW.atstumai_km,
'U',now(),USER());

CREATE TRIGGER kelio_atkarpalog_delete AFTER DELETE ON kelio_atkarpa
FOR EACH ROW
INSERT INTO kelio_atkarpalog VALUES (
OLD.id_kelio_atkarpa,OLD.kelio_atkarpa,OLD.isvykimo_stotis,OLD.atvykimo_stotis,
OLD.keliones_trukme_minutes,OLD.atstumai_km,
'D',now(),USER());

CREATE TABLE kelioneslog LIKE keliones; 
ALTER TABLE kelioneslog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE kelioneslog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE kelioneslog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE kelioneslog MODIFY COLUMN id_keliones INT DEFAULT 0;
ALTER TABLE kelioneslog DROP PRIMARY KEY;
ALTER TABLE kelioneslog ADD PRIMARY KEY (id_keliones, change_time );

CREATE TRIGGER kelioneslog_insert AFTER INSERT ON keliones
FOR EACH ROW 
INSERT INTO kelioneslog VALUES (
NEW.id_keliones,NEW.nr_sastatas,NEW.id_marsrutai,NEW.isvykimo_laikas,
NEW.atvykimo_laikas,
'I',now(),USER());

CREATE TRIGGER kelioneslog_update AFTER UPDATE ON keliones
FOR EACH ROW
INSERT INTO kelioneslog VALUES (
NEW.id_keliones,NEW.nr_sastatas,NEW.id_marsrutai,NEW.isvykimo_laikas,
NEW.atvykimo_laikas,
'U',now(),USER());

CREATE TRIGGER kelioneslog_delete AFTER DELETE ON keliones
FOR EACH ROW
INSERT INTO kelioneslog VALUES (
OLD.id_keliones,OLD.nr_sastatas,OLD.id_marsrutai,OLD.isvykimo_laikas,
OLD.atvykimo_laikas,
'D',now(),USER());

CREATE TABLE keliones_bilietailog LIKE keliones_bilietai; 
ALTER TABLE keliones_bilietailog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE keliones_bilietailog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE keliones_bilietailog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE keliones_bilietailog DROP PRIMARY KEY;
ALTER TABLE keliones_bilietailog ADD PRIMARY KEY (id_keliones, id_bilietas, change_time );

CREATE TRIGGER keliones_bilietailog_insert AFTER INSERT ON keliones_bilietai
FOR EACH ROW 
INSERT INTO keliones_bilietailog VALUES (
NEW.id_keliones,NEW.id_bilietas,
'I',now(),USER());

CREATE TRIGGER keliones_bilietailog_update AFTER UPDATE ON keliones_bilietai
FOR EACH ROW
INSERT INTO keliones_bilietailog VALUES (
NEW.id_keliones,NEW.id_bilietas,
'U',now(),USER());

CREATE TRIGGER keliones_bilietailog_delete AFTER DELETE ON keliones_bilietai
FOR EACH ROW
INSERT INTO keliones_bilietailog VALUES (
OLD.id_keliones,OLD.id_bilietas,
'D',now(),USER());



CREATE TABLE keliones_kroviniailog LIKE keliones_kroviniai; 
ALTER TABLE keliones_kroviniailog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE keliones_kroviniailog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE keliones_kroviniailog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE keliones_kroviniailog DROP PRIMARY KEY;
ALTER TABLE keliones_kroviniailog ADD PRIMARY KEY (id_keliones, krovinio_tipas, svoris, change_time );

CREATE TRIGGER keliones_kroviniailog_insert AFTER INSERT ON keliones_kroviniai
FOR EACH ROW 
INSERT INTO keliones_kroviniailog VALUES (
NEW.id_keliones,NEW.krovinio_tipas,NEW.svoris,
'I',now(),USER());

CREATE TRIGGER keliones_kroviniailog_update AFTER UPDATE ON keliones_kroviniai
FOR EACH ROW
INSERT INTO keliones_kroviniailog VALUES (
NEW.id_keliones,NEW.krovinio_tipas,NEW.svoris,
'U',now(),USER());

CREATE TRIGGER keliones_kroviniaiLlog_delete AFTER DELETE ON keliones_kroviniai
FOR EACH ROW
INSERT INTO keliones_kroviniailog VALUES (
old.id_keliones,old.krovinio_tipas,old.svoris,
'D',now(),USER());

CREATE TABLE lokomotyvaslog LIKE lokomotyvas; 
ALTER TABLE lokomotyvaslog ADD COLUMN action CHAR(1) DEFAULT '';
ALTER TABLE lokomotyvaslog ADD COLUMN change_time TIMESTAMP DEFAULT NOW();
ALTER TABLE lokomotyvaslog ADD COLUMN changed_by VARCHAR(77) NOT NULL;
ALTER TABLE lokomotyvaslog MODIFY COLUMN id_lokomotyvas INT DEFAULT 0;
ALTER TABLE lokomotyvaslog DROP PRIMARY KEY;
ALTER TABLE lokomotyvaslog ADD PRIMARY KEY (id_lokomotyvas, change_time );

CREATE TRIGGER lokomotyvaslog_insert AFTER INSERT ON lokomotyvas
FOR EACH ROW 
INSERT INTO lokomotyvaslog VALUES (
NEW.id_lokomotyvas,NEW.nr_lokomotyvas,NEW.nr_keleivinis,NEW.nr_krovininis,
'I',now(),USER());

CREATE TRIGGER lokomotyvaslog_update AFTER UPDATE ON lokomotyvas
FOR EACH ROW
INSERT INTO lokomotyvaslog VALUES (
NEW.id_lokomotyvas,NEW.nr_lokomotyvas,NEW.nr_keleivinis,NEW.nr_krovininis,
'U',now(),USER());

CREATE TRIGGER lokomotyvaslog AFTER DELETE ON lokomotyvas
FOR EACH ROW
INSERT INTO lokomotyvaslog VALUES (
OLD.id_lokomotyvas,OLD.nr_lokomotyvas,OLD.nr_keleivinis,OLD.nr_krovininis,
'D',now(),USER());



    