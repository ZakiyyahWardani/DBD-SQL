create database skema_akademik;
use skema_akademik;

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
	seleksi_masuk varchar(55),
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

insert into seleksi_masuk (id_seleksi_masuk,singkat,seleksi_masuk) values
	(1,'SNMPTN','SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI NEGERI'),
	(2,'SBMPTN','SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI NEGERI');
	
insert into mahasiswa(nim,id_seleksi_masuk,id_program_studi,nama,angkatan,tgl_lahir,kota_lahir,jenis_kelamin) values
	('155150400',1,211,'JONI',2015,'1997-1-1','Malang','W'),
	('155150401',2,212,'JONO',2015,'1997-10-2','Situbondo','P');

update mahasiswa set nama = 'KIYYA' where nama = 'JONI';
delete from mahasiswa where nama = 'JONO';

insert into skema_akademik.mahasiswa values 
	('155150402', 2, 211, 'JOKO', 2015, '1998-2-10', 'SURABAYA', 'M'),
	('155150403', 2, 211, 'JUJUN', 2015, '1997-9-27', 'BANYUWANGI', 'M');

create view LATIHAN_1 as
select concat (nim, id_seleksi_masuk, id_program_studi) as nim_gabungan, nama, year (curdate())-year (tgl_lahir) as umur
from mahasiswa;

create view LATIHAN_2 as 
select distinct id_program_studi,angkatan,count(nim)
from mahasiswa m group by id_program_studi,angkatan;

select nim,nama,angkatan
from mahasiswa m 
inner join program_studi ps on 
	m.id_program_studi =ps.id_program_studi 
inner join seleksi_masuk sm on 
	m.id_seleksi_masuk = sm.id_seleksi_masuk;
 
select jurusan, program_studi 
from jurusan j
left join program_studi ps on j.id_jurusan = ps.id_jurusan;

insert into skema_akademik.mahasiswa values
	('155150404', 1 ,212,'JESSY',2016,'1999-2-10','BANDUNG','F'),
	('155150405', 2 ,219,'BAMBANG',2014,'1996-9-27','MAKASSAR','M');

create table skema_akademik.mahasiswa_pindahan (
	nim varchar(15) not null primary key,
	id_seleksi_masuk smallint,
	foreign key (id_seleksi_masuk) references skema_akademik.seleksi_masuk(id_seleksi_masuk),
	id_program_studi smallint,
	foreign key id_program_studi (id_program_studi) references skema_akademik.program_studi(id_program_studi),
	nama varchar(45),
	angkatan smallint,
	tgl_lahir date,
	kota_lahir varchar(60),
	jenis_kelamin char(1) check (jenis_kelamin in ('M','F'))
);

insert into skema_akademik.mahasiswa_pindahan values 
	('155150500', 1 ,211,'BUDI', 2015,'1997-3-3','BANYUWANGI','M'),
	('155150501', 2 ,212,'ANDI',2015,'1997-2-21','JAKARTA','M'),
	('155150502', 2 ,211,'DIMAS', 2015,'1998-4-11','SURABAYA','M'),
	('155150503', 2 ,211,'DIDIN',2015,'1997-2-26','BANDUNG','M');

select nim, nama, jenis_kelamin, kota_lahir, angkatan
from mahasiswa_pindahan mp 
where mp.kota_lahir like 'B%'
union 
select nim, nama, jenis_kelamin, kota_lahir, angkatan
from mahasiswa_pindahan mp 
where mp.nama like 'D%'
order by nim;

select nim, nama, jenis_kelamin, kota_lahir, angkatan
from mahasiswa_pindahan mp 
where mp.angkatan = 2015
except 
select nim, nama, jenis_kelamin, kota_lahir, angkatan
from mahasiswa_pindahan mp 
where mp.kota_lahir  like 'M%'
order by nim;

select m.nim, m.nama, m.angkatan
from mahasiswa m
join mahasiswa_pindahan mp ON m.kota_lahir = mp.kota_lahir
where mp.nama = 'BUDI';

select m.nim, m.nama, m.angkatan
from skema_akademik.mahasiswa m
join skema_akademik.mahasiswa_pindahan mp ON m.kota_lahir = mp.kota_lahir;
