# Nested under "poltavchenko.2014.main.r"
# Requires data resulting from "poltavchenko.2014.reading_data.r"

# General Sobianin-Sukovolskii plot (S-S plot);

png("ss.polt.2014.png", height=500, width=500)
plot(polt$TURNOUT, polt$POLTAVCHENKO.sh,
xlim=c(0,1), ylim=c(0,1),
pch=20, cex=sqrt(polt$BULL.INVALID + polt$BULL.VALID)/25, col=rgb(0,0,0,.3),
main="Выборы губернатора Петербурга, 2014 г.",
xlab="Явка", ylab="Доля голосов за Г.С. Полтавченко")
abline(h=seq(0,1,.1), lty=3, col="grey")
abline(v=seq(0,1,.1), lty=3, col="grey")
dev.off()

# 30 S-S plots for 30 TIKs

i <- 1
while(i <= length(TIKLIST)){
png(file=paste("ss.polt.2014.TIK.",TIKLIST[i],".png", sep=""), height=500, width=500)

plot(polt.tiks[[i]]$TURNOUT, polt.tiks[[i]]$POLTAVCHENKO.sh,
xlim=c(0,1), ylim=c(0,1),
pch=20, cex=sqrt(polt.tiks[[i]]$BULL.INVALID + polt.tiks[[i]]$BULL.VALID)/25, col=rgb(0,0,0,.3),
main=paste("Выборы губернатора Петербурга, 2014 г.\nТИК No.",TIKLIST[i]),
xlab="Явка", ylab="Доля голосов за Г.С. Полтавченко")
abline(h=seq(0,1,.1), lty=3, col="grey")
abline(v=seq(0,1,.1), lty=3, col="grey")
dev.off()

i <- i + 1
}

# Combining 30 plots in one table;

png(file="ss.polt.2014.TIKs.png", height=3000, width=2500)
par(mfrow=c(6,5), cex=1.2)

i <- 1
while(i <= length(TIKLIST)){

plot(polt.tiks[[i]]$TURNOUT, polt.tiks[[i]]$POLTAVCHENKO.sh,
xlim=c(0,1), ylim=c(0,1),
pch=20, cex=sqrt(polt.tiks[[i]]$BULL.INVALID + polt.tiks[[i]]$BULL.VALID)/25, col=rgb(0,0,0,.3),
main=paste("ТИК No.",TIKLIST[i]),
xlab="", ylab="")
abline(h=seq(0,1,.1), lty=3, col="grey")
abline(v=seq(0,1,.1), lty=3, col="grey")

i <- i + 1
}
dev.off()

# Printing S-S plot for six "honest" TIKs;

png(file="ss.polt.2014.TIK.NORM.png", height=500, width=500)

plot(polt$TURNOUT, polt$POLTAVCHENKO.sh, type="n",
xlim=c(0,1), ylim=c(0,1),
main="Выборы губернатора Петербурга, \nТИК No. 4, 6, 16, 21, 26, 30",
xlab="Явка", ylab="Доля голосов за Г.С. Полтавченко")

i <- 1
while(i <= length(TIK.NORM)){
points(polt.tiks[[TIK.NORM[i]]]$TURNOUT, polt.tiks[[TIK.NORM[i]]]$POLTAVCHENKO.sh,
pch=20, cex=sqrt(polt.tiks[[TIK.NORM[i]]]$BULL.INVALID + polt.tiks[[TIK.NORM[i]]]$BULL.VALID)/25, col=rgb(0,0,0,.3))
i <- i + 1
}

abline(h=seq(0,1,.1), lty=3, col="grey")
abline(v=seq(0,1,.1), lty=3, col="grey")
dev.off()
