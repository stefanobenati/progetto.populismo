W7_es = W7R[which(W7R$cntry_name == "Spain"), ]


n = dim(W7_es)[1] #[1] = righe
W7_es$pop_vote = rep("lib", n)

#codifica

i1_0 = which(is.na(W7_es$E181_EVS5))
i1_1 = which(W7_es$E181_EVS5 == 72420)
i1_2 = which(W7_es$E181_EVS5 == 72421)
i1_3 = which(W7_es$E181_EVS5 == 72426)
i1_4 = which(W7_es$E181_EVS5 == 72466)
i1_5 = which(W7_es$E181_EVS5 == 72404)
W7_es$pop_vote[i1_0] = NA
W7_es$pop_vote[i1_1] = NA
W7_es$pop_vote[i1_2] = NA
W7_es$pop_vote[i1_3] = NA
W7_es$pop_vote[i1_4] = NA
W7_es$pop_vote[i1_5] = NA

ip_1 =which(W7_es$E181_EVS5 == 72406)
ip_2 =which(W7_es$E181_EVS5 == 72407)
ip_3 =which(W7_es$E181_EVS5 == 72418)
ip_4 =which(W7_es$E181_EVS5 == 72405)
W7_es$pop_vote[ip_1] = "pop"
W7_es$pop_vote[ip_2] = "pop"
W7_es$pop_vote[ip_3] = "pop"
W7_es$pop_vote[ip_4] = "pop"


W7_es$pop_vote = as.factor(W7_es$pop_vote)

table(W7_es$E181_EVS5)
table(W7_es$pop_vote, useNA = "always") # 630 lib 87 pop 492 na

