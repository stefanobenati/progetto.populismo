W7_cr = W7R[which(W7R$cntry_name == "Croatia"), ]


n = dim(W7_cr)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_cr$pop_vote = rep("lib", n)


i1_0 = which(is.na(W7_cr$E181_EVS5))
i1_1 = which(W7_cr$E181_EVS5 == 19126)
W7_cr$pop_vote[i1_0] = NA
W7_cr$pop_vote[i1_1] = NA


ip_1 =which(W7_cr$E181_EVS5 == 19101)
ip_2 =which(W7_cr$E181_EVS5 == 19106)
ip_3 =which(W7_cr$E181_EVS5 == 19108)
ip_4 =which(W7_cr$E181_EVS5 == 19113)
ip_5 =which(W7_cr$E181_EVS5 == 19115)
W7_cr$pop_vote[ip_1] = "pop"
W7_cr$pop_vote[ip_2] = "pop"
W7_cr$pop_vote[ip_3] = "pop"
W7_cr$pop_vote[ip_4] = "pop"
W7_cr$pop_vote[ip_5] = "pop"

W7_cr$pop_vote = as.factor(W7_cr$pop_vote)

table(W7_cr$E181_EVS5)
table(W7_cr$pop_vote, useNA = "always") # 673 lib 285 pop 529 na