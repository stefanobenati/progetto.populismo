W7_ge = W7R[which(W7R$cntry_name == "Germany"), ]

n = dim(W7_ge)[1]
W7_ge$pop_vote = rep("lib", n)

i1_0 = which(is.na(W7_ge$E181_EVS5))
i1_1 = which(W7_ge$E181_EVS5 == 27666)
i1_2 = which(W7_ge$E181_EVS5 == 27607)
W7_ge$pop_vote[i1_0] = NA
W7_ge$pop_vote[i1_1] = NA
W7_ge$pop_vote[i1_2] = NA

ip_1 =which(W7_ge$E181_EVS5 == 27605)
ip_2 =which(W7_ge$E181_EVS5 == 27606)
W7_ge$pop_vote[ip_1] = "pop"
W7_ge$pop_vote[ip_2] = "pop"

W7_ge$pop_vote = as.factor(W7_ge$pop_vote)

table(W7_ge$E181_EVS5)
table(W7_ge$pop_vote, useNA = "always") # 1434 LIB 255 POP 2009 NA