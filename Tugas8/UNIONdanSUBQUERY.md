# UNION DAN SUBQUERY

### Insert Data Mahasiswa
```sql
INSERT INTO skema_akademik.mahasiswa VALUES
    ('155150404', 1, 212, 'JESSY', 2016, '1999-2-10', 'BANDUNG', 'F'),
    ('155150405', 2, 219, 'BAMBANG', 2014, '1996-9-27', 'MAKASSAR', 'M');
```
Memasukkan data mahasiswa ke dalam tabel `skema_akademik.mahasiswa`.

![insertMhs](./Tugas8/assets/insert2mhs.png)

Sehingga akan ditampilkan tabel sebagai berikut setelah dilakukan insert

![tableMhs](./Tugas8/assets/tablemhsfix.png)

### Membuat Tabel Mahasiswa Pindahan
```sql
CREATE TABLE skema_akademik.mahasiswa_pindahan (
    nim VARCHAR(15) NOT NULL PRIMARY KEY,
    id_seleksi_masuk SMALLINT,
    FOREIGN KEY (id_seleksi_masuk) REFERENCES skema_akademik.seleksi_masuk(id_seleksi_masuk),
    id_program_studi SMALLINT,
    FOREIGN KEY id_program_studi (id_program_studi) REFERENCES skema_akademik.program_studi(id_program_studi),
    nama VARCHAR(45),
    angkatan SMALLINT,
    tgl_lahir DATE,
    kota_lahir VARCHAR(60),
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('M', 'F'))
);
```
![createTableMp](./Tugas8/assets/createfix.png)

membuat tabel `skema_akademik.mahasiswa_pindahan` yang digunakan untuk menyimpan informasi mahasiswa pindahan dalam skema akademik. Tabel ini memiliki kolom-kolom, seperti `nim` sebagai primary key yang berisi identifikasi unik mahasiswa, `id_seleksi_masuk` yang merupakan foreign key terhadap tabel `skema_akademik.seleksi_masuk`, `id_program_studi` yang merupakan foreign key terhadap tabel `skema_akademik.program_studi`, `nama` untuk menyimpan nama mahasiswa, `angkatan` untuk menandakan tahun masuk mahasiswa, `tgl_lahir` untuk tanggal lahir, `kota_lahir` untuk menyimpan kota kelahiran, dan `jenis_kelamin` yang diatur oleh constraint `CHECK` untuk memastikan nilainya hanya `M` (laki-laki) atau `F` (perempuan). Tabel ini dirancang untuk mencatat data pribadi dan akademik mahasiswa pindahan.

![tableMp](./Tugas8/assets/tablemp.png)

### Insert Data Mahasiswa Pindahan
```sql
INSERT INTO skema_akademik.mahasiswa_pindahan VALUES 
    ('155150500', 1, 211, 'BUDI', 2015, '1997-3-3', 'BANYUWANGI', 'M'),
    ('155150501', 2, 212, 'ANDI', 2015, '1997-2-21', 'JAKARTA', 'M'),
    ('155150502', 2, 211, 'DIMAS', 2015, '1998-4-11', 'SURABAYA', 'M'),
    ('155150503', 2, 211, 'DIDIN', 2015, '1997-2-26', 'BANDUNG', 'M');
```
Memasukkan data mahasiswa pindahan ke dalam tabel `skema_akademik.mahasiswa_pindahan`.

![insertMp](./Tugas8/assets/insertmp.png)

Setelah dimasukkan data nya maka akan ditampilkan pada tabel seperti yang tertera berikut

![tableMp2](./Tugas8/assets/tablemp2.png)

### NOMOR 4
```sql
SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan
FROM mahasiswa_pindahan mp 
WHERE mp.kota_lahir LIKE 'B%'
UNION 
SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan
FROM mahasiswa_pindahan mp 
WHERE mp.nama LIKE 'D%'
ORDER BY nim;
```
Query ini mengambil data mahasiswa pindahan yang memiliki kota_lahir diawali `B` atau nama diawali `D`, diurutkan berdasarkan `nim`.

![select1](./Tugas8/assets/select1fix.png)

### NOMOR 5
```sql
SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan
FROM mahasiswa_pindahan mp 
WHERE mp.angkatan = 2015
EXCEPT 
SELECT nim, nama, jenis_kelamin, kota_lahir, angkatan
FROM mahasiswa_pindahan mp 
WHERE mp.kota_lahir LIKE 'M%'
ORDER BY nim;
```
Query ini digunakan untuk mengambil data mahasiswa pindahan dengan `angkatan 2015`, kecuali yang memiliki `kota_lahir` diawali `M`, diurutkan berdasarkan `nim`.

![select2](./Tugas8/assets/select2fix.png)

## LATIHAN
### NOMOR 1
```sql
SELECT m.nim, m.nama, m.angkatan
FROM mahasiswa m
JOIN mahasiswa_pindahan mp ON m.kota_lahir = mp.kota_lahir
WHERE mp.nama = 'BUDI';
```
Query ini digunakan untuk mengambil data mahasiswa dan mahasiswa pindahan yang memiliki `kota_lahir` yang sama dan nama `BUDI`.

![select3](./Tugas8/assets/select3.png)

### NOMOR 2
```sql
SELECT m.nim, m.nama, m.angkatan
FROM skema_akademik.mahasiswa m
JOIN skema_akademik.mahasiswa_pindahan mp ON m.kota_lahir = mp.kota_lahir;
```
Query ini mengambil data mahasiswa dan mahasiswa pindahan dari skema akademik yang memiliki kota_lahir yang sama.

![select4](./Tugas8/assets/subquery2.png)
