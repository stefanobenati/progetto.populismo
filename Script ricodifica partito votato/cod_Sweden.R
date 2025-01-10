W7_sw = W7R[which(W7R$cntry_name == "Sweden"), ]

n = dim(W7_sw)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_sw$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_sw$E181_EVS5))
i1_1 = which(W7_sw$E181_EVS5 == 75266)
W7_sw$pop_vote[i1_0] = NA
W7_sw$pop_vote[i1_1] = NA


ip_1 =which(W7_sw$E181_EVS5 == 75203)
W7_sw$pop_vote[ip_1] = "pop"


W7_sw$pop_vote = as.factor(W7_sw$pop_vote)

table(W7_sw$E181_EVS5)
table(W7_sw$pop_vote, useNA = "always") # 971 lib 80 pop 143 na