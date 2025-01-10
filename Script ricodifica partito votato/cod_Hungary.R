


W7_hu = W7R[which(W7R$cntry_name == "Hungary"), ]

n = dim(W7_hu)[1]
W7_hu$pop_vote = rep("lib", n)

i1_0 = which(is.na(W7_hu$E181_EVS5))
i1_1 = which(W7_hu$E181_EVS5 == 34807)
i1_2 = which(W7_hu$E181_EVS5 == 34810)
i1_3 = which(W7_hu$E181_EVS5 == 34811)
i1_4 = which(W7_hu$E181_EVS5 == 34812)
i1_5 = which(W7_hu$E181_EVS5 == 34826)
i1_6 = which(W7_hu$E181_EVS5 == 34866)
W7_hu$pop_vote[i1_0] = NA
W7_hu$pop_vote[i1_1] = NA
W7_hu$pop_vote[i1_2] = NA
W7_hu$pop_vote[i1_3] = NA
W7_hu$pop_vote[i1_4] = NA
W7_hu$pop_vote[i1_5] = NA
W7_hu$pop_vote[i1_6] = NA

ip_1 =which(W7_hu$E181_EVS5 == 34802)
ip_2 =which(W7_hu$E181_EVS5 == 34803)
ip_3 =which(W7_hu$E181_EVS5 == 34804)
W7_hu$pop_vote[ip_1] = "pop"
W7_hu$pop_vote[ip_2] = "pop"
W7_hu$pop_vote[ip_3] = "pop"

W7_hu$pop_vote = as.factor(W7_hu$pop_vote)

table(W7_hu$E181_EVS5)
table(W7_hu$pop_vote, useNA = "always")