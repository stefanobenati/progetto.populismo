W7_pt = W7R[which(W7R$cntry_name == "Portugal"), ]


n = dim(W7_pt)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_pt$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_pt$E181_EVS5))
i1_4 = which(W7_pt$E181_EVS5 == 62001)
i1_1 = which(W7_pt$E181_EVS5 == 62005)
i1_2 = which(W7_pt$E181_EVS5 == 62024)
i1_3 = which(W7_pt$E181_EVS5 == 62066)
W7_pt$pop_vote[i1_0] = NA
W7_pt$pop_vote[i1_1] = NA
W7_pt$pop_vote[i1_2] = NA
W7_pt$pop_vote[i1_3] = NA
W7_pt$pop_vote[i1_4] = NA


ip_1 =which(W7_pt$E181_EVS5 == 62008)
ip_2 =which(W7_pt$E181_EVS5 == 62011)
W7_pt$pop_vote[ip_1] = "pop"
W7_pt$pop_vote[ip_2] = "pop"


W7_pt$pop_vote = as.factor(W7_pt$pop_vote)

table(W7_pt$E181_EVS5)
table(W7_pt$pop_vote, useNA = "always") # 597 lib 33 pop 585 na
