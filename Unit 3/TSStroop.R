dat <- read.table("taskswitchstrooptransfer.dat")
names(dat) <- c("Run","Task","Label","Trial","Time","Event","Par1","Par2","Par3","inp1","inp2","inp3","inp4","inp5")

dat <- dat[dat$Task=="stroop" & ((dat$Par1=="stim" & dat$Par2=="void") | dat$Event=="trial-end"),]
dat$RT <- dat$Time - 1.0
dat <- dat[dat$Event == "trial-end" & dat$Trial > 49,]

res <- with(dat,tapply(RT,list(inp2,Label),mean))

res

plot(res[1:2,1],type="b", ylim=c(0,1),xaxt="n",ylab = "RT",xlab="condition")
axis(side=1, labels=c("conflict","consistent"), at = 1:2)
lines(res[1:2,2],type="b",pch=2)
legend(1.6,0.3,legend=c("control","training"),pch=c(1,2),lty=1)