dat <- read.table("taskswitchstrooptransfer.dat")
names(dat) <- c("Run","Task","Label","Trial","Time","Event","Par1","Par2","Par3","inp1","inp2","inp3","inp4","inp5")

dat <- dat[dat$Task=="stroop" & ((dat$Par1=="stim" & dat$Par2=="void") | dat$Event=="trial-end"),]
dat$RT <- dat$Time - 1.0
dat <- dat[dat$Event == "trial-end",]

res <- with(dat,tapply(RT,list(inp2,Label),mean))

res
