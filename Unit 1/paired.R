dat <- read.table("paired.txt")
names(dat) <- c("Run","Task","Label","Trial","Time","Event","Par1","Par2","Par3","RT","accuracy","inp3","inp4","inp5")
dat$RT <- as.numeric(dat$RT)
dat$accuracy <- as.numeric(dat$accuracy)

dat <- dat[dat$Event == "trial-end",]
dat$RT = ifelse(dat$accuracy == 0, NA, dat$RT)
res <- with(dat,tapply(RT,list(Trial),mean, na.rm = TRUE))
res

plot(res, type="b", ylim=c(0,3),ylab = "RT",xlab="block")
lines(c(0.0, 2.158, 1.967, 1.762, 1.680, 1.552, 1.467, 1.402), lty=2)

res <- with(dat,tapply(accuracy, list(Trial),mean))
plot(res, type="b", ylim=c(0,1),ylab = "Accuracy",xlab="block")
lines(c(0.000, .526, .667, .798, .887, .924, .958, .954),lty =2)

