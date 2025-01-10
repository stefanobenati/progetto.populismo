W7_gb = W7R[which(W7R$cntry_name == "Great-Britain"), ]

n = dim(W7_gb)[1] 
W7_gb$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_gb$E181_EVS5))
i1_1 = which(W7_gb$E181_EVS5 == 82609)
i1_2 = which(W7_gb$E181_EVS5 == 82666)
W7_gb$pop_vote[i1_0] = NA
W7_gb$pop_vote[i1_1] = NA
W7_gb$pop_vote[i1_2] = NA



ip_1 =which(W7_gb$E181_EVS5 == 82607)
ip_2 =which(W7_gb$E181_EVS5 == 82608)
ip_3 =which(W7_gb$E181_EVS5 == 82601)
ip_4 =which(W7_gb$E181_EVS5 == 82602)
W7_gb$pop_vote[ip_1] = "pop"
W7_gb$pop_vote[ip_2] = "pop"
W7_gb$pop_vote[ip_3] = "pop"
W7_gb$pop_vote[ip_4] = "pop"


W7_gb$pop_vote = as.factor(W7_gb$pop_vote)

table(W7_gb$E181_EVS5)
table(W7_gb$pop_vote, useNA = "always") # 889 lib 603 pop 296 na