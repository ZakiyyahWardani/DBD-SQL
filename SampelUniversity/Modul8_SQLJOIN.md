# Modul 8 Praktikum SQL - JOIN, RO, CF

Pertama download kode pada link berikut:

[Link Database University](https://drive.google.com/drive/folders/1PP6tSH-XIAokt00jeOhxXxTc3rQ26Ra2)

Setelah berhasil men download kemudian copy file dan jalankan file di dalam dbeaver sehingga terbentuk database baru dengan nama `sampel_university`

![create database](SampelUniversity/assets/3.png)

Selanjutnya membuat view sesuai dengan perintah pada soal
1. Tampilkan semua nama Mahasiswa beserta nama department.
2. Tampilkan semua nama student beserta nama department yang memiliki total SKS (total credit) lebih dari 100.
3. Tampilkan nama student dan nama instructor yang bekerja pada department yang
sama.

## Soal 1
Tampilkan semua nama Mahasiswa beserta nama department.

**Kode:**
```sql
create view soal_1 as
select student.name, department.dept_name
from student, department
where student.dept_name = department.dept_name;
```
![Soal_1](SampelUniversity/assets/soal1.png)

**Penjelasan:**
- Membuat view `soal_1` dengan mengambil dua kolom, yaitu `name` dari tabel `student` dan `dept_name` dari tabel `department`.
- Menggunakan `FROM` dan `WHERE` untuk mencocokkan data yang terdapat pada kolom `dept_name`.

**View soal_1:**
![Soal_1_View](SampelUniversity/assets/view1.png)

**Penjelasan Gambar Tabel:**
- Tabel hasil view `soal_1` terdiri dari dua kolom, yaitu `name` dan `dept_name`.
- Setiap baris menunjukkan nama mahasiswa dan nama departemen mereka.

---

## Soal_2
Tampilkan semua nama student beserta nama department yang memiliki total SKS (total credit) lebih dari 100.

**Kode:**
```sql
create view soal_2 as
select student.name, department.dept_name, student.tot_cred as total_SKS
from student
join department on student.dept_name = department.dept_name
where student.tot_cred > 100;
```
![Soal_2](SampelUniversity/assets/soal21.png)

**Penjelasan:**
- View `soal_2` mengambil tiga kolom, yaitu `name` dari tabel `student`, `dept_name` dari tabel `department`, dan `tot_cred` dari tabel `student`.
- Menggunakan `JOIN` antara tabel `student` dan `department` berdasarkan nilai `dept_name`.
- Mengambil nama mahasiswa dengan total SKS lebih dari 100 menggunakan `where student.tot_cred > 100`.

**View soal_2**
![Soal_2_View](SampelUniversity/assets/view2.png)

**Penjelasan Gambar Tabel:**
- Tabel hasil view `soal_2` terdiri dari tiga kolom, yaitu `name`, `dept_name`, dan `total_SKS`.
- Setiap baris menunjukkan nama mahasiswa, nama departemen tempat mereka, dan total SKS yang dimiliki mahasiswa tersebut.

---

## Soal_3
Tampilkan nama student dan nama instructor yang bekerja pada department yang
sama.

**Kode:**
```sql
create view soal_3 as
select A.name as student_name, B.name as instructor_name, C.dept_name
from student A, instructor B, department C
where A.dept_name = B.dept_name and C.dept_name = B.dept_name;
```
![Soal_3](SampelUniversity/assets/soal3.png)

**Penjelasan:**
- View `soal_3` mengambil tiga kolom, yaitu `name` dari tabel `student` yang dinamai sebagai `student_name`, `name` dari tabel `instructor` yang dinamai sebagai `instructor_name`, dan `dept_name` dari tabel `department`.
- Menggunakan metode penggabungan dengan kondisi atau `FROM` dan `WHERE` untuk melakukan pengecekan apakah `dept_name` di tabel `student` sama dengan `dept_name` di tabel `instructor`, dan juga sama dengan `dept_name` di tabel `department`.

**View soal_2**
![Soal_3_View](SampelUniversity/assets/view3.png)

**Penjelasan Gambar Tabel:**
- Tabel hasil view `soal_3` terdiri dari tiga kolom, yaitu `student_name`, `instructor_name`, dan `dept_name`.
- Setiap baris menunjukkan nama mahasiswa, nama instruktur, dan nama departemen di mana mahasiswa dan instruktur yang berada pada departemen yang sama.
