# Nomor 1
# a
X <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
Y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

selisihYX <- Y-X
rata <- mean(selisihYX)
temp <- (selisihYX - rata)^2

stanDev <- ( (sum(temp) / (length(temp)-1)) )^0.5
print(stanDev) # 6.359595

# b
nsample <- 9
tval <- (rata-0) / (stanDev/(nsample)^0.5)
print(tval) # 7.652479

# c
# H0 =  Tidak ada pengaruh yang signifikan secara statistika dalam 
#       hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas A.
#
# H1 =  Terdapat pengaruh yang signifikan secara statistika
#       dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan
#       aktivitas A.
#
# alpha = 5% = 0.05; n = 9
# t_alpha, n-1 = t_0.05, 8 = 2.306
# tval = 7.652479
# Kesimpulan = H0 ditolak, H1 diterima (Penjelasan lebih detail akan diberikan di laporan)

# Nomor 2

install.packages("BSDA")
library(BSDA)

nsample <- 100
rata <- 23500
stanDev <- 3900

# Menggunakan uji z karena n > 30
# H0 > 20000, H1 <= 20000

zsum.test(mean.x = rata, sigma.x = stanDev, n.x = nsample,  
          alternative = "less", mu = 20000, conf.level = 0.95)

# Nomor 3
# a
# H0 = rata-rata sampel Bandung = rata-rata sampel Bali
# H1 = rata-rata sampel Bandung != rata-rata sampel Bali

# b

# C
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
print(varians)

t_terhitung <- (rataBandung-rataBali) / ((varians^0.5) * (((1/nbandung)+(1/nbali))^0.5))
print(t_terhitung) 

# d
print(critPoint)

# e
# t_terhitung di luar area tolak H0, sehingga H0 diterima

# f
# Kesimpulan yang diperoleh adalah tidak ada perbedaan antara rata-rata sampel Bandung dan sampel Bali.

# Nomor 4
dt <- read.delim(file.choose())
set.seed(1234)
dplyr::sample_n(dt, 10)

# a
library("ggpubr")
ggboxplot(dt, x="Group", y="Length", color="Group", 
          palette=c("#14d983", "#d98414", "#d91466"),
          order=c("Grup1", "Grup2", "Grup3"),
          ylab="Length", xlab="Group")

# b

# c
res.aov <- aov(length~group, data=dt)
summary(res.aov)

# d

# e
TukeyHSD(res.aov)

# f

# Nomor 5
