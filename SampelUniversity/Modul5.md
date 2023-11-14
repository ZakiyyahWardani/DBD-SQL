# Modul 5 DBDSQL

### 1. CONCAT_WS
```sql
select concat_ws(' ',ID, name) as PROFIL
from student;
```
Query diatas menggunakan fungsi `CONCAT_WS` untuk menggabungkan kolom `ID` dan `name` dari tabel student dengan `spasi` atau `('...')` sebagai pemisah. 
Hasilnya akan disajikan dalam kolom baru dengan nama `PROFIL` seperti yang terlampir berikut:
![Screenshot CONCAT_WS](./SampelUniversity/assets/concat.png)

### 2. SUBSTRING_INDEX
```sql
select substring_index(name, ' ', 1) as result
from student;
```
Query ini menggunakan fungsi `SUBSTRING_INDEX` untuk mengambil kata pertama dari kolom `name` pada tabel `student` berdasarkan  `spasi` dan memasukkan ke dalam kolom baru bernama `result` dan dengan tampilan sebagai berikut:
![Screenshot SUBSTRING_INDEX](./SampelUniversity/assets/substring.png)

### 3. SUBSTRING
```sql
select substring(name, 1, 3) as result
from student;
```
Query ini menggunakan fungsi `SUBSTRING` untuk mengambil tiga karakter pertama dari kolom `name` dalam tabel `student` sehingga menghasilkan output sebagai berikut:
![Screenshot SUBSTRING](./SampelUniversity/assets/substring2.png)

### 4. LENGTH
```sql
select length(name) as length_of_name
from student;
```
Query ini menggunakan fungsi `LENGTH` untuk menghitung panjang (jumlah karakter) dari kolom `name` dalam tabel `student` sehingga dihasilkan tampilan sebagai berikut:
![Screenshot LENGTH](./SampelUniversity/assets/length.png)

### 5. REPLACE
```sql
select replace(title, 'sampel', 'contoh') as modified_title
from course;
```
Query ini menggunakan fungsi `REPLACE` untuk mengganti isi kolom sehingga setiap muncul kata `"sampel"` akan diganti dengan kata `"contoh"` dalam kolom `title` dari tabel `course` seperti tampilan berikut:
![Screenshot REPLACE](./SampelUniversity/assets/replace.png)

### 6. ABS
```sql
select abs(salary) as absolute_salary
from instructor;
```
Query ini menggunakan fungsi `ABS` untuk mengembalikan nilai absolut atau mutlak dari kolom `salary` dalam tabel `instructor`. Fungsi ini digunakan untuk menghitung nilai mutlak gaji instructor yang ditampilkan seperti kolom bernama `absolut_salary` berikut:
![Screenshot ABS](./SampelUniversity/assets/abs.png)

### 7. CEILING
```sql
select ceiling(budget) as rounded_budget
from department;
```
Query ini menggunakan fungsi `CEILING` untuk membulatkan ke atas nilai dalam kolom `budget` dari tabel `department` seperti yang tertera pada gambar berikut:
![Screenshot CEILING](./SampelUniversity/assets/ceilingbudget.png)

### 8. FLOOR
```sql
select floor(salary) as rounded_salary
from instructor;
```
Query ini menggunakan fungsi `FLOOR` untuk membulatkan ke bawah nilai dalam kolom `salary` dari tabel `instructor` yang dapat dihilat pada kolom berikut:
![Screenshot FLOOR](./SampelUniversity/assets/floor.png)

### 9. ROUND
```sql
select round(budget, 2) as rounded_budget
from department;
```
Query ini menggunakan fungsi `ROUND` untuk membulatkan nilai dalam kolom `budget` dari tabel `department` hingga dua digit di belakang koma atau desimal seperti yang tertera berikut:
![Screenshot ROUND](./SampelUniversity/assets/round.png)

### 10. SQRT
```sql
select sqrt(salary) as square_root_salary
from instructor;
```
Query ini menggunakan fungsi `SQRT` untuk menghitung akar kuadrat dari nilai dalam kolom `salary` dari tabel `instructor` yang akan menampilkan output sebagai berikut:
![Screenshot SQRT](./SampelUniversity/assets/sqrt.png)

### 11. CURDATE
```sql
select curdate() as tanggal_sekarang;
```
Query ini menggunakan fungsi `CURDATE` untuk menampilkan tanggal saat ini seperti tampilan berikut:
![Screenshot CURDATE](./SampelUniversity/assets/curdate.png)

### 12. CURTIME
```sql
select curtime() as waktu_sekarang;
```
Query ini menggunakan fungsi `CURTIME` untuk memanggil waktu atau detail jam saat ini seperti tampilan berikut:
![Screenshot CURTIME](./SampelUniversity/assets/curtime.png)

### 13. TIMESTAMP
```sql
select timestamp('2023-11-07 12:30:00') as custom_timestamp;
```
Query ini menggunakan fungsi `TIMESTAMP` untuk membuat nilai timestamp kustom sesuai dengan tanggal dan waktu yang diberikan seperti berikut:
![Screenshot TIMESTAMP](./SampelUniversity/assets/timestamp.png)

### 14. SUM
```sql
select sum(credits) as total_credits
from course;
```
Query ini menggunakan fungsi `SUM` untuk menghitung total kredit dari kolom `credits` dalam tabel `course` dengan tampilan sebagai berikut:
![Screenshot SUM](./SampelUniversity/assets/sum.png)

### 15. AVG
```sql
select avg(salary) as average_salary
from instructor;
```
Query ini menggunakan fungsi `AVG` untuk menghitung rata-rata dari kolom `salary` dalam tabel `instructor` dengan tampilan sebagai berikut:
![Screenshot AVG](./SampelUniversity/assets/avg.png)

### 16. COUNT
```sql
select count(*) as total_students
from student;
```
Query ini menggunakan fungsi `COUNT` untuk menghitung total baris atau `jumlah mahasiswa` dalam tabel `student` dengan tampilan sebagai berikut:
![Screenshot COUNT](./SampelUniversity/assets/count.png)

### 17. GROUP BY dan HAVING
```sql
select dept_name, count(*) as total_students
from student
group by dept_name 
having count(*) > 1;
```
Query ini menggunakan klausa `GROUP BY` untuk mengelompokkan mahasiswa berdasarkan nama departemen dan `HAVING` berfungsi untuk memfilter departemen yang memiliki lebih dari satu mahasiswa dengan tampilan tertera sebagai berikut:
![Screenshot GROUP BY HAVING](./SampelUniversity/assets/dept.png)
