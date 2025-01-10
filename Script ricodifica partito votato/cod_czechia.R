
W7_cz = W7R[which(W7R$cntry_name == "Czechia"), ]


n = dim(W7_cz)[1] 
W7_cz$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_cz$E181_EVS5))
i1_1 = which(W7_cz$E181_EVS5 == 20301)
i1_2 = which(W7_cz$E181_EVS5 == 20316)
i1_3 = which(W7_cz$E181_EVS5 == 20366)
W7_cz$pop_vote[i1_0] = NA
W7_cz$pop_vote[i1_1] = NA
W7_cz$pop_vote[i1_2] = NA
W7_cz$pop_vote[i1_3] = NA


ip_1 =which(W7_cz$E181_EVS5 == 20301)
ip_2 =which(W7_cz$E181_EVS5 == 20308)
ip_3 =which(W7_cz$E181_EVS5 == 20311)
ip_4 =which(W7_cz$E181_EVS5 == 20313)
ip_5 =which(W7_cz$E181_EVS5 == 20315)
ip_6 =which(W7_cz$E181_EVS5 == 20303)
W7_cz$pop_vote[ip_1] = "pop"
W7_cz$pop_vote[ip_2] = "pop"
W7_cz$pop_vote[ip_3] = "pop"
W7_cz$pop_vote[ip_4] = "pop"
W7_cz$pop_vote[ip_5] = "pop"
W7_cz$pop_vote[ip_6] = "pop"


W7_cz$pop_vote = as.factor(W7_cz$pop_vote)

table(W7_cz$E181_EVS5)
table(W7_cz$pop_vote, useNA = "always") # 971 lib 80 pop 143 na
