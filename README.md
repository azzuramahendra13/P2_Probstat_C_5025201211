# Penjelasan Solusi Praktikum Modul 2
### Nomor 1
**a.) Mencari standar deviasi** <br />
<br />
Membuat vector yang berisi selisih nilai Y dan X terlebih dahulu
```R
X <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

selisihYX <- Y-X
```
Mencari nilai mean vector `selisihYX`
```R
rata <- mean(selisihYX)
```
Mendapatkan standar deviasi dari `selisihYX` dengan rumus standar deviasi untuk sampel <br /> <br />
![image](https://user-images.githubusercontent.com/82187488/170854996-06fbac5c-855b-4134-870b-be69a5e726d2.png)
```R
temp <- (selisihYX - rata)^2

stanDev <- ( (sum(temp) / (length(temp)-1)) )^0.5
print(stanDev) # 6.359595
```
Hasil yang diperoleh adalah **6.359595**. <br />

**b.) Mencari nilai t (p-value)** <br />
<br />
Membuat variabel untuk jumlah sampel dan menggunakan rumus untuk mencari nilai t <br /> <br />
![image](https://user-images.githubusercontent.com/82187488/170860439-8cdfe092-3b4f-488b-a88b-8debd9207610.png) <br />
```R
nsample <- 9
tval <- (rata-0) / (stanDev/(nsample)^0.5)
print(tval) # 7.652479
```
Hasil yang diperoleh adalah **7.652479**. <br />

**c.) Menentukan apakah terdapat pengaruh yang signifikan secara statistika terhadap pernyataan pada 1.c** <br />
<br />
Diketahui bahwa
```R
# H0 =  Tidak ada pengaruh yang signifikan secara statistika dalam 
#       hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas A.
#
# H1 =  Terdapat pengaruh yang signifikan secara statistika
#       dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
#       aktivitas A.
#
# alpha = 5% = 0.05; n = 9
```
Dengan melihat tabel nilai t, dapat diketahui nilai dari `t_alpha, n-1 = t_0.05, 8 =  2.306` <br /> <br />
![image](https://user-images.githubusercontent.com/82187488/170863641-32497b37-d213-454a-85fa-e71dbb2816d7.png)

Oleh karena itu, dapat dibuat grafik sebagai berikut <br /> <br />
![image](https://user-images.githubusercontent.com/82187488/170876205-78481d0f-91fc-433c-91bc-f2801bf32ab4.png) <br />

Dari 1.b, diperoleh `t = 7.652479` <br />
Karena **7.652479** berada di dalam daerah penolakan H0 (di kanan **2.306**), dapat disimpulkan bahwa **H0 ditolak, H1 diterima (terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas A)**.

### Nomor 2
<br />
Menginstall dan menjalankan BSDA library
```R
install.packages("BSDA")
library(BSDA)
```
Diketahui bahwa
```R
nsample <- 100
rata <- 23500
stanDev <- 3900
```
H0 = Mobil dikemudikan rata-rata > 20000 kilometer per tahun
H1 = Mobil dikemudikan rata-rata <= 20000 kilometer per tahun

Karena nsample berjumlah > 30, akan digunakan uji z
Uji yang dilakukan adalah uji satu arah, karena hipotesis berbentuk lebih besar atau kurang dari. Karena hipotesis alternatif (H1) berbentuk kurang dari, maka pada fungsi `zsum.test()`, argumen `alternative` diberi argumen `less`. Argumen `mu` diberikan nilai yang akan diujikan, yaitu **20000**.
```R
# Menggunakan uji z karena n > 30
# H0 > 20000, H1 <= 20000

zsum.test(mean.x = rata, sigma.x = stanDev, n.x = nsample,  
          alternative = "less", mu = 20000, conf.level = 0.95)
```
Diperoleh hasil sebagai berikut <br /> <br />
![image](https://user-images.githubusercontent.com/82187488/170868484-c7990cdd-2b65-46d7-97b0-9745168f18a2.png) <br />
<br />
**Jawaban soal** <br /> <br />
**a.) Apakah Anda setuju dengan klaim tersebut?** <br />
Karena diketahui dari 100 sampel acak diperoleh rata-rata 23500 (lebih dari 20000), maka saya setuju dengan klaim tersebut (H0 diterima, H1 ditolak). <br /> <br />
**b.) Penjelasan output yang dihasilkan** <br />
Output memberikan nilai z terhitung = 8.9744 dan nilai p-value = 1. Dari hasil tersebut,  H0 ditolak dan dapat disimpulkan jika rata-rata bernilai di bawah 20000. Rata-rata dari data sampel yang dihitung adalah 23500 dan rata-rata akan bernilai di bawah 24141.49 dengan tingkat keyakinan 95%. <br /> <br />
**c.) Kesimpulan dari p-value yang dihasilkan**
Karena p-value = 1, maka output yang dihasilkan sebelumnya dipastikan salah. Kesalahan output ini juga dapat diketahui dengan melihat jawaban 2.a dengan 2.b yang saling bertentangan.

### Nomor 3
**a.) H0 dan H1** <br />
H0: rata-rata sampel Bandung = rata-rata sampel Bali <br />
H1: rata-rata sampel Bandung != rata-rata sampel Bali <br /> <br />
**b.) Menghitung sampel statistik** <br />
<br />
**c.) Uji statistik (df = 2)**
Dengan menggunakan formula berikut, diperoleh nilai t terhitung <br />
```R
alpha <- 0.05
df <- 2
critPoint <- 4.303 # t_alpha/2,df = t_0.025,2
# nbandung < 30 dan nbali < 30, sehingga digunakan uji t

nbandung <- 19
nbali <- 27
rataBandung <- 3.64
rataBali <- 2.79
stanDevBandung <- 1.67
stanDevBali <- 1.32

varians <- ( (nbandung-1)*stanDevBandung^2 + (nbali-1)*stanDevBali^2 ) / df
print(varians) # 47.7513

t_terhitung <- (rataBandung-rataBali) / ((varians^0.5) * (((1/nbandung)+(1/nbali))^0.5))
print(t_terhitung) # 0.410777
```
Diperoleh nilai t terhitung = **0.410777** <br /> <br />
**d.) Nilai kritikal** <br />
Nilai kritikal telah ditemukan pada poin c, yaitu critPoint = **4.303** <br /> <br />
**e.) Keputusan** <br />
Grafik yang dihasilkan dengan critPoint = 4.303 dan t terhitung = 0.410777 <br /> <br />
![image](https://user-images.githubusercontent.com/82187488/170878353-7a73a1e5-807a-44c2-bc03-aee8ecba0e90.png) <br />
<br />
Karena nilai t terhitung berada di luar area tolak H0, maka **H0 diterima**. <br /> <br />
**f.) Kesimpulan** <br /> 
Kesimpulan yang diperoleh adalah **tidak ada perbedaan antara rata-rata sampel Bandung dan rata-rata sampel Bali.** <br /> <br />

### Nomor 4
**a.)** <br />
**b.)** <br />
**c.)** <br />
**d.)** <br />
**e.)** <br />
**f.)** <br />

### Nomor 5 





