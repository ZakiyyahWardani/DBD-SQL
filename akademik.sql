create database akademik;
use akademik;

create table fakultas(
	id_fakultas smallint,
	fakultas varchar(45),
	primary key (id_fakultas)
);

create table jurusan (
	id_jurusan smallint,
	id_fakultas smallint,
	jurusan varchar(45),
	primary key (id_jurusan),
	foreign key (id_fakultas) references fakultas(id_fakultas)
);

create table strata (
	id_strata smallint,
	singkat varchar(10),
	strata varchar(45),
	primary key (id_strata)
);

create table program_studi (
	id_program_studi smallint,
	id_strata smallint,
	id_jurusan smallint,
	program_studi varchar(60),
	primary key (id_program_studi),
	foreign key (id_strata) references strata(id_strata),
	foreign key (id_jurusan) references jurusan(id_jurusan)
);

create table seleksi_masuk(
	id_seleksi_masuk smallint,
	singkat varchar(12),
	seleksi_masuk varchar(45),
	primary key (id_seleksi_masuk)
);

create table mahasiswa(
	nim varchar(15),
	id_seleksi_masuk smallint,
	id_program_studi smallint,
	nama varchar(45),
	angkatan smallint,
	tgl_lahir date,
	kota_lahir varchar(60),
	jenis_kelamin char(1),
	primary key (nim),
	foreign key (id_seleksi_masuk) references seleksi_masuk(id_seleksi_masuk),
	foreign key (id_program_studi) references program_studi(id_program_studi)
);

insert into  fakultas(id_fakultas,fakultas) values 
	(1,'Ekonomi & Bisnis'),
	(2,'Ilmu Komputer');

insert into jurusan(id_jurusan,id_fakultas,jurusan) values
	(21,2,'Informatika'),
	(22,2,'Sistem Informasi'),
	(23,2,'Teknik Komputer');

insert into strata(id_strata,singkat,strata) values
	(1,'D1','Diploma'),
	(2,'S1','Sarjana'),
	(3,'S2','Magister');

insert into program_studi(id_program_studi,id_strata,id_jurusan,program_studi) values
	(211,2,21,'Teknik Informatika'),
	(212,2,21,'Teknik Komputer'),
	(219,3,21,'Magister Ilmu Komputer');

insert into seleksi_masuk(id_seleksi_masuk,singkat,seleksi_masuk) values
	(1,'SNMPTN','SELEKSI NASIONAL MAHASISWA PTN'),
	(2, 'SBMPTN', 'SELEKSI BERSAMA MAHASISWA PTN');

insert into mahasiswa(nim,id_seleksi_masuk,id_program_studi,nama,angkatan,tgl_lahir,kota_lahir,jenis_kelamin) values
	('155150400',1,211,'JONI',2015,'1997-1-1','Malang','W'),
	('155150401',2,212,'JONO',2015,'1997-10-2','Situbondo','P');

update mahasiswa set nama = 'KIYYA' where nama = 'JONO';
select * from mahasiswa;

update mahasiswa set nama = 'WARDANI' where nama ='JONI';
select * from mahasiswa ;
