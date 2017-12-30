# Nested under "poltavchenko.2014.main.r"

# Reading data;
polt <- read.csv("poltavchenko.2014.csv", h=TRUE)

# Checking whether the data are okay;
dim(polt)
# [1] 1875   28
colnames(polt)
#  [1] "UIK"                      "UIK.NO"                  
#  [3] "VOTERS"                   "BULL.RECEIVED"           
#  [5] "BULL.ISS.PRELIMINARY"     "BULL.ISS.PRELIMINARY.TIK"
#  [7] "BULL.ISS.UIK.DAYOFVOTE"   "BULL.ISS.EXTRA"          
#  [9] "BULL.CANCELLED"           "BULL.PORTABLE_CASES"     
# [11] "BULL.STATIONARY_CASES"    "BULL.INVALID"            
# [13] "BULL.VALID"               "BULL.LOST"               
# [15] "BULL.NOT.RECORDED"        "TIK.NO"                  
# [17] "BIKBAEV"                  "BIKBAEV.pct"             
# [19] "IVANOVA"                  "IVANOVA.pct"             
# [21] "PETROV"                   "PETROV.pct"              
# [23] "POLTAVCHENKO"             "POLTAVCHENKO.pct"        
# [25] "SUKHENKO"                 "SUKHENKO.pct"            
# [27] "TURNOUT"                  "POLTAVCHENKO.sh"          

# Obtaining summary polling results;
polt.TURNOUT.raw <- sum(polt$BULL.INVALID + polt$BULL.VALID)/sum(polt$VOTERS)
polt.POLTAVCHENKO.sh.raw <- sum(polt$POLTAVCHENKO)/sum(polt$BULL.INVALID + polt$BULL.VALID)
polt.EARLY.VOTE.raw <- sum(polt$BULL.ISS.PRELIMINARY)/sum(polt$BULL.INVALID + polt$BULL.VALID)

# Adding calculable variables;
polt$TURNOUT <- (polt$BULL.INVALID + polt$BULL.VALID)/polt$VOTERS
polt$POLTAVCHENKO.sh <- polt$POLTAVCHENKO/(polt$BULL.INVALID + polt$BULL.VALID)
polt$EARLY.VOTE <- polt$BULL.ISS.PRELIMINARY/(polt$BULL.INVALID + polt$BULL.VALID)

# Breaking down by TIKs (Territorial Electoral Commissions);

TIKLIST <- unique(polt$TIK.NO)[order(unique(polt$TIK.NO))]

polt.tiks <- NULL
polt.tiks <- as.list(polt.tiks)

i <- 1
while(i <= length(TIKLIST)){
polt.tiks[[i]] <- subset(polt, polt$TIK.NO==TIKLIST[i])
i <- i + 1
}

# Selecting "honest" TIKs;

TIK.NORM <- c(4, 6, 16, 21, 26, 30)

polt.TIK.4_6_16_21_26_30 <- subset(polt, polt$TIK.NO==4 | polt$TIK.NO==6 | polt$TIK.NO==16 | polt$TIK.NO==21 | polt$TIK.NO==26 | polt$TIK.NO==30)

polt.TURNOUT.TIK.4_6_16_21_26_30 <- sum(polt.TIK.4_6_16_21_26_30$BULL.INVALID + polt.TIK.4_6_16_21_26_30$BULL.VALID)/sum(polt.TIK.4_6_16_21_26_30$VOTERS)
polt.POLTAVCHENKO.sh.TIK.4_6_16_21_26_30 <- sum(polt.TIK.4_6_16_21_26_30$POLTAVCHENKO)/sum(polt.TIK.4_6_16_21_26_30$BULL.INVALID + polt.TIK.4_6_16_21_26_30$BULL.VALID)
polt.EARLY.VOTE.TIK.4_6_16_21_26_30 <- sum(polt.TIK.4_6_16_21_26_30$BULL.ISS.PRELIMINARY)/sum(polt.TIK.4_6_16_21_26_30$BULL.INVALID + polt.TIK.4_6_16_21_26_30$BULL.VALID)
