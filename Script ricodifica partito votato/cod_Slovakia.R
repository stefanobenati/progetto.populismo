W7_sl = W7R[which(W7R$cntry_name == "Slovakia"), ]

n = dim(W7_sl)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_sl$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_sl$E181_EVS5))
i1_1 = which(W7_sl$E181_EVS5 == 70366)
W7_sl$pop_vote[i1_0] = NA
W7_sl$pop_vote[i1_1] = NA


ip_1 =which(W7_sl$E181_EVS5 == 70302)
ip_2 =which(W7_sl$E181_EVS5 == 70305)
ip_3 =which(W7_sl$E181_EVS5 == 70308)
ip_4 =which(W7_sl$E181_EVS5 == 70309)
W7_sl$pop_vote[ip_1] = "pop"
W7_sl$pop_vote[ip_2] = "pop"
W7_sl$pop_vote[ip_3] = "pop"
W7_sl$pop_vote[ip_4] = "pop"




W7_sl$pop_vote = as.factor(W7_sl$pop_vote)

table(W7_sl$E181_EVS5)
table(W7_sl$pop_vote, useNA = "always") # 653 lib 298 pop 481 na