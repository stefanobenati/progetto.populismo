

W7_at = W7R[which(W7R$cntry_name == "Austria"), ]

n = dim(W7_at)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_at$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_at$E181_EVS5))
i1_1 = which(W7_at$E181_EVS5 == 4026)
i1_2 = which(W7_at$E181_EVS5 == 4066)
W7_at$pop_vote[i1_0] = NA
W7_at$pop_vote[i1_1] = NA
W7_at$pop_vote[i1_2] = NA


ip_1 =which(W7_at$E181_EVS5 == 4003)
W7_at$pop_vote[ip_1] = "pop"


W7_at$pop_vote = as.factor(W7_at$pop_vote)

table(W7_at$E181_EVS5)
table(W7_at$pop_vote, useNA = "always") # 1011 lib 268 pop 365 na
