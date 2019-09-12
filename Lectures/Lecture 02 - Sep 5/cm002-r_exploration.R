#STAT 545 Class Meeting 2
#Sep 5, 2019


#basic data setup
number <- 5 + 2
number * 2

(times <- c(60, 40, 33, 15, 20, 55, 35)) #brackets outside to print and assign with same line
times / 60
times.mn <- mean(times)
times.med <- median(times)
times.rg <- range(times)
sqrt(times)

boxplot(times,ylab="Time (min)", main="Commute times")
abline(h=times.mn,lty=2)
abline(h=times.med)

#logicals
times< 30
times == 35
which(times > 20 & times < 50)
j <- all(times < 30)
jnum <- as.numeric(j)


#subsetting
times[3]
times[-3]
times[c(2,4)]
times[1:5]
times[times > 35]
times[times >= 35]
times[times > 50] <- NA
times[8] <- NA
times[12] <- NA

#NAs
mean(times)
mean(times, na.rm=T)
?mean
mean(times, trim=0.2, na.rm=T)
mean(times, trim=0.5, na.rm=T)

#dataframes
print(mtcars)
mean(mtcars$mpg)
hist(mtcars$qsec)
str(mtcars)
names(mtcars)
row.names(mtcars)
as.matrix(mtcars)
object.size(mtcars)
object.size(as.matrix(mtcars))
