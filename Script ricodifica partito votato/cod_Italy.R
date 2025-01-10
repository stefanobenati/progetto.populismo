
W7_it = W7R[which(W7R$cntry_name == "Italy"), ]

n = dim(W7_it)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_it$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_it$E181_EVS5))
i1_1 = which(W7_it$E181_EVS5 == 38031)
i1_2 = which(W7_it$E181_EVS5 == 38066)
W7_it$pop_vote[i1_0] = NA
W7_it$pop_vote[i1_1] = NA
W7_it$pop_vote[i1_2] = NA


ip_1 =which(W7_it$E181_EVS5 == 38002)
ip_2 =which(W7_it$E181_EVS5 == 38009)
ip_3 =which(W7_it$E181_EVS5 == 38011)
ip_4 =which(W7_it$E181_EVS5 == 38012)
ip_5 =which(W7_it$E181_EVS5 == 38013)
ip_6 =which(W7_it$E181_EVS5 == 38014)
ip_7 =which(W7_it$E181_EVS5 == 38015)
ip_8 =which(W7_it$E181_EVS5 == 38016)
W7_it$pop_vote[ip_1] = "pop"
W7_it$pop_vote[ip_2] = "pop"
W7_it$pop_vote[ip_3] = "pop"
W7_it$pop_vote[ip_4] = "pop"
W7_it$pop_vote[ip_5] = "pop"
W7_it$pop_vote[ip_6] = "pop"
W7_it$pop_vote[ip_7] = "pop"
W7_it$pop_vote[ip_8] = "pop"


W7_it$pop_vote = as.factor(W7_it$pop_vote)

table(W7_it$E181_EVS5)
table(W7_it$pop_vote, useNA = "always") # 456 lib 852 pop 969 na
