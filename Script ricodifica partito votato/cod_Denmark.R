W7_dm = W7R[which(W7R$cntry_name == "Denmark"), ]


n = dim(W7_dm)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_dm$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_dm$E181_EVS5))
i1_1 = which(W7_dm$E181_EVS5 == 20811)
i1_2 = which(W7_dm$E181_EVS5 == 20866)
W7_dm$pop_vote[i1_0] = NA
W7_dm$pop_vote[i1_1] = NA
W7_dm$pop_vote[i1_2] = NA


ip_1 =which(W7_dm$E181_EVS5 == 20805)
ip_1 =which(W7_dm$E181_EVS5 == 20806)
ip_1 =which(W7_dm$E181_EVS5 == 20809)
W7_dm$pop_vote[ip_1] = "pop"


W7_dm$pop_vote = as.factor(W7_dm$pop_vote)

table(W7_dm$E181_EVS5)
table(W7_dm$pop_vote, useNA = "always") # 2838 lib 212 pop 312 na