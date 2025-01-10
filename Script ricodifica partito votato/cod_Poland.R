W7_pl = W7R[which(W7R$cntry_name == "Poland"), ]


n = dim(W7_pl)[1]
W7_pl$pop_vote = rep("lib", n)

i1_0 = which(is.na(W7_pl$E181_EVS5))
i1_1 = which(W7_pl$E181_EVS5 == 61666)
i1_2 = which(W7_pl$E181_EVS5 == 61609)
W7_pl$pop_vote[i1_0] = NA
W7_pl$pop_vote[i1_1] = NA
W7_pl$pop_vote[i1_2] = NA

ip_1 =which(W7_pl$E181_EVS5 == 61601)
ip_2 =which(W7_pl$E181_EVS5 == 61603)
ip_3 =which(W7_pl$E181_EVS5 == 61608)
W7_pl$pop_vote[ip_1] = "pop"
W7_pl$pop_vote[ip_2] = "pop"
W7_pl$pop_vote[ip_3] = "pop"

W7_pl$pop_vote = as.factor(W7_pl$pop_vote)

table(W7_pl$E181_EVS5)
table(W7_pl$pop_vote, useNA = "always")