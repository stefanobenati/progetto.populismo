
W7_li = W7R[which(W7R$cntry_name == "Lithuania"), ]

n = dim(W7_li)[1] 
W7_li$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_li$E181_EVS5))
i1_4 = which(W7_li$E181_EVS5 == 44005)
i1_5 = which(W7_li$E181_EVS5 == 44011)
i1_1 = which(W7_li$E181_EVS5 == 44009)
i1_2 = which(W7_li$E181_EVS5 == 44012)
i1_3 = which(W7_li$E181_EVS5 == 44066)
W7_li$pop_vote[i1_0] = NA
W7_li$pop_vote[i1_1] = NA
W7_li$pop_vote[i1_2] = NA
W7_li$pop_vote[i1_3] = NA
W7_li$pop_vote[i1_4] = NA
W7_li$pop_vote[i1_5] = NA


ip_1 =which(W7_li$E181_EVS5 == 44001)
ip_2 =which(W7_li$E181_EVS5 == 44002)
ip_3 =which(W7_li$E181_EVS5 == 44003)
ip_4 =which(W7_li$E181_EVS5 == 44004)
ip_5 =which(W7_li$E181_EVS5 == 44005)
ip_6 =which(W7_li$E181_EVS5 == 44007)
ip_7 =which(W7_li$E181_EVS5 == 44008)

W7_li$pop_vote[ip_1] = "pop"
W7_li$pop_vote[ip_2] = "pop"
W7_li$pop_vote[ip_3] = "pop"
W7_li$pop_vote[ip_4] = "pop"
W7_li$pop_vote[ip_5] = "pop"
W7_li$pop_vote[ip_6] = "pop"
W7_li$pop_vote[ip_7] = "pop"



W7_li$pop_vote = as.factor(W7_li$pop_vote)

table(W7_li$E181_EVS5)
table(W7_li$pop_vote, useNA = "always") # 407 lib 459 pop 582 na