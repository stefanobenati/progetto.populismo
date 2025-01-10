W7_no = W7R[which(W7R$cntry_name == "Norway"), ]


n = dim(W7_no)[1]
W7_no$pop_vote = rep("lib", n)

i1_0 = which(is.na(W7_no$E181_EVS5))
i1_1 = which(W7_no$E181_EVS5 == 57866)
i1_2 = which(W7_no$E181_EVS5 == 57814)
i1_3 = which(W7_no$E181_EVS5 == 57809)
i1_4 = which(W7_no$E181_EVS5 == 57808)
i1_5 = which(W7_no$E181_EVS5 == 57806)
i1_6 = which(W7_no$E181_EVS5 == 57802)
W7_no$pop_vote[i1_0] = NA
W7_no$pop_vote[i1_1] = NA
W7_no$pop_vote[i1_2] = NA
W7_no$pop_vote[i1_3] = NA
W7_no$pop_vote[i1_4] = NA
W7_no$pop_vote[i1_5] = NA
W7_no$pop_vote[i1_6] = NA

ip_1 =which(W7_no$E181_EVS5 == 57811)
ip_2 =which(W7_no$E181_EVS5 == 57810)
ip_3 =which(W7_no$E181_EVS5 == 57803)
W7_no$pop_vote[ip_1] = "pop"
W7_no$pop_vote[ip_2] = "pop"
W7_no$pop_vote[ip_3] = "pop"

W7_no$pop_vote = as.factor(W7_no$pop_vote)

table(W7_no$E181_EVS5)
table(W7_no$pop_vote, useNA = "always")
