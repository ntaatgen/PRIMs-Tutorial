dat <- read.table("peak-time.txt")
names(dat) <- c("Run","Task","Label","Trial","Time","Event","Par1","Par2","Par3","RT","inp2","inp3","inp4","inp5")

dat <- dat[dat$Event=="trial-end",]
dat$RT <- dat$Time - 1.0
dat <- dat[dat$Event == "trial-end" & dat$Trial > 49,]
dat$RT = as.numeric((dat$RT))
plot(density(dat[dat$Label == "peak-time8",]$RT),xlim=c(0,35))
lines(density(dat[dat$Label == "peak-time12",]$RT))
lines(density(dat[dat$Label == "peak-time21",]$RT))
