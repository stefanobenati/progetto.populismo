

W7_ne = W7R[which(W7R$cntry_name == "Netherlands"), ]


n = dim(W7_ne)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
W7_ne$pop_vote = rep("lib", n)


#i1_0 = which(is.na(W7_ne$E181_EVS5))
i1_1 = which(W7_ne$E181_EVS5 == 52812)
i1_2 = which(W7_ne$E181_EVS5 == 52814)
i1_3 = which(W7_ne$E181_EVS5 == 52866)
#W7_ne$pop_vote[i1_0] = NA
W7_ne$pop_vote[i1_1] = NA
W7_ne$pop_vote[i1_2] = NA
W7_ne$pop_vote[i1_3] = NA


ip_1 =which(W7_ne$E181_EVS5 == 52802)
ip_2 =which(W7_ne$E181_EVS5 == 52806)
ip_3 =which(W7_ne$E181_EVS5 == 52813)
W7_ne$pop_vote[ip_1] = "pop"
W7_ne$pop_vote[ip_2] = "pop"
W7_ne$pop_vote[ip_3] = "pop"


W7_ne$pop_vote = as.factor(W7_ne$pop_vote)

table(W7_ne$E181_EVS5)
table(W7_ne$pop_vote, useNA = "always") # 1914 lib 456 pop 34 na
