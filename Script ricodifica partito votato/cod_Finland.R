W7_fi = W7R[which(W7R$cntry_name == "Finland"), ]


n = dim(W7_fi)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_fi$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_fi$E181_EVS5))
i1_1 = which(W7_fi$E181_EVS5 == 24609)
i1_2 = which(W7_fi$E181_EVS5 == 24666)
W7_fi$pop_vote[i1_0] = NA
W7_fi$pop_vote[i1_1] = NA
W7_fi$pop_vote[i1_2] = NA


ip_1 =which(W7_fi$E181_EVS5 == 24608)
W7_fi$pop_vote[ip_1] = "pop"


W7_fi$pop_vote = as.factor(W7_fi$pop_vote)

table(W7_fi$E181_EVS5)
table(W7_fi$pop_vote, useNA = "always") # 938 lib 90 pop 143 na