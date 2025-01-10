
W7_fr = W7R[which(W7R$cntry_name == "France"), ]

n = dim(W7_fr)[1]
W7_fr$pop_vote = rep("lib", n)

i1_0 = which(is.na(W7_fr$E181_EVS5))
i1_1 = which(W7_fr$E181_EVS5 == 25026)
i1_2 = which(W7_fr$E181_EVS5 == 25066)
W7_fr$pop_vote[i1_0] = NA
W7_fr$pop_vote[i1_1] = NA
W7_fr$pop_vote[i1_2] = NA

ip_1 =which(W7_fr$E181_EVS5 == 25001)
ip_2 =which(W7_fr$E181_EVS5 == 25002)
ip_3 =which(W7_fr$E181_EVS5 == 25003)
ip_4 =which(W7_fr$E181_EVS5 == 25006)  # green
ip_5 =which(W7_fr$E181_EVS5 == 25007)  # other green
ip_6 =which(W7_fr$E181_EVS5 == 25013)  # right
ip_7 =which(W7_fr$E181_EVS5 == 25014)  # right
ip_8 =which(W7_fr$E181_EVS5 == 25015)  # right
W7_fr$pop_vote[ip_1] = "pop"
W7_fr$pop_vote[ip_2] = "pop"
W7_fr$pop_vote[ip_3] = "pop"
W7_fr$pop_vote[ip_4] = "pop"
W7_fr$pop_vote[ip_5] = "pop"
W7_fr$pop_vote[ip_6] = "pop"
W7_fr$pop_vote[ip_7] = "pop"
W7_fr$pop_vote[ip_8] = "pop"

W7_fr$pop_vote = as.factor(W7_fr$pop_vote)

table(W7_fr$pop_vote, useNA = "always" )