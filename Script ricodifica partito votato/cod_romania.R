
W7_ro = W7R[which(W7R$cntry_name == "Romania"), ]

n = dim(W7_ro)[1] 
W7_ro$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_ro$E181_EVS5))
i1_1 = which(W7_ro$E181_EVS5 == 64226)
i1_2 = which(W7_ro$E181_EVS5 == 64266)
W7_ro$pop_vote[i1_0] = NA
W7_ro$pop_vote[i1_1] = NA
W7_ro$pop_vote[i1_2] = NA


ip_1 =which(W7_ro$E181_EVS5 == 64203)
ip_2 =which(W7_ro$E181_EVS5 == 64205)
ip_3 =which(W7_ro$E181_EVS5 == 64206)
ip_4 =which(W7_ro$E181_EVS5 == 64207)
W7_ro$pop_vote[ip_1] = "pop"
W7_ro$pop_vote[ip_2] = "pop"
W7_ro$pop_vote[ip_3] = "pop"
W7_ro$pop_vote[ip_4] = "pop"


W7_ro$pop_vote = as.factor(W7_ro$pop_vote)

table(W7_ro$E181_EVS5)
table(W7_ro$pop_vote, useNA = "always") # 636 lib 131 pop 2103 na