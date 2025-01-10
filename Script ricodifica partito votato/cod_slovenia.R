

W7_si = W7R[which(W7R$cntry_name == "Slovenia"), ]

n = dim(W7_si)[1] 
W7_si$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_si$E181_EVS5))
i1_1 = which(W7_si$E181_EVS5 == 70511)
i1_2 = which(W7_si$E181_EVS5 == 70566)
W7_si$pop_vote[i1_0] = NA
W7_si$pop_vote[i1_1] = NA
W7_si$pop_vote[i1_2] = NA

ip_1 =which(W7_si$E181_EVS5 == 70502)
ip_2 =which(W7_si$E181_EVS5 == 70505)
ip_3 =which(W7_si$E181_EVS5 == 70506)
ip_4 =which(W7_si$E181_EVS5 == 70510)
ip_5 =which(W7_si$E181_EVS5 == 70503)
ip_6 =which(W7_si$E181_EVS5 == 70508)
W7_si$pop_vote[ip_1] = "pop"
W7_si$pop_vote[ip_2] = "pop"
W7_si$pop_vote[ip_3] = "pop"
W7_si$pop_vote[ip_4] = "pop"
W7_si$pop_vote[ip_5] = "pop"
W7_si$pop_vote[ip_6] = "pop"

W7_si$pop_vote = as.factor(W7_si$pop_vote)

table(W7_si$E181_EVS5)
table(W7_si$pop_vote, useNA = "always") # 231 lib 306 pop 538 na
