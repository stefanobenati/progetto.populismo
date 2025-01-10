library("moments")
library("xtable")

range_scale <- function(x){
  M = max(x)
  m = min(x)
  y = (x - m)/(M - m)
}

var <- function(x){
  return (max(x) - min(x))
}

imp_statistics <- function(a){
  mdn = apply(a, 1, median)
  avg = apply(a, 1, mean)
  d1 = apply(a, 1, sd)
  se = d1/dim(a)[2]
  d2 = apply(a, 1, var)
  s1 = apply(a, 1, skewness)
  k1 = apply(a, 1, kurtosis)
  statistics = cbind(mdn, avg, se, d1, d2, s1, k1)
  row.names(statistics) = row.names(a)
return (statistics)
}

make_nation_importance_matrix<- function(df){
  a = df[2:dim(df)[2]]
  row.names(a) = df[[1]]
  for (i in 1:dim(a)[2]){
    s1 = substr(colnames(a)[i], 9, nchar(colnames(a)[i]))
    colnames(a)[i] = s1
  }
  avg = rowMeans(a, na.rm = T)
  i1 = which(is.na(rowMeans(a)))
  for (i in i1){
      j1 = is.na(a[i,])
      a[i, j1] = avg[i]
      }
  return(a)
}


best_predictictors <- function(m1, best_vars = dim(m1)[1], col_pos = 1){
  rank_1 = sort(m1[,col_pos], decreasing = T, index.return = T)
  i1 = rank_1$ix[1:best_vars]
  m2 = m1[i1, ]
  return (list(m = m2, sorted_index = i1))
}

common_predictors <- function(nation, a, international_sort, best_vars = dim(m1)[1]){
  n1 = as.matrix(a[,nation])
  q1 = best_predictictors(n1, best_vars)
  cross1 = intersect(q1$sorted_index, international_sort)
  symdiff1 = setdiff(q1$sorted_index, international_sort)
  return(list(global_vars = cross1, local_vars = symdiff1))
}

common_predictors_matrix <- function(a, international_sort, best_vars = dim(m1)[1]){
  cmn_prd = matrix(0, nrow = dim(a)[1], ncol = dim(a)[2])
  lcl_prd = matrix(0, nrow = dim(a)[1], ncol = dim(a)[2])
  rownames(cmn_prd) = rownames(a)
  colnames(cmn_prd) = colnames(a)
  rownames(lcl_prd) = rownames(a)
  colnames(lcl_prd) = colnames(a)
  
  for (i in 1:dim(a)[2]){ 
    nation = colnames(a)[i]
    n1 = as.matrix(a[,nation])
    q1 = best_predictictors(n1, best_vars)
    cross1 = intersect(q1$sorted_index, international_sort)
    symdiff1 = setdiff(q1$sorted_index, international_sort)
    cmn_prd[cross1,i] = 1
    lcl_prd[symdiff1,i] = 1
  }
  return (list(cmn_prd = cmn_prd, lcl_prd = lcl_prd))
}

load("/Users/stefanobenati/Documents/Trento_2023/Prin_Populismo/BonNardi_dataframes/Var importance original data mtry 15.Rda")
load("/Users/stefanobenati/Documents/Trento_2023/Prin_Populismo/BonNardi_dataframes/Var importance original data mtry 30.Rda")


load("/Users/stefanobenati/Documents/Trento_2023/Prin_Populismo/BonNardi_dataframes/Var importance smote data mtry 15.Rda")
load("/Users/stefanobenati/Documents/Trento_2023/Prin_Populismo/BonNardi_dataframes/Var importance smote data mtry 30.Rda")


a1 = make_nation_importance_matrix(var_imp_smote30)
m1 = imp_statistics(a1)
corr1 <- cor.test(m1[,"mdn"], m1[,"avg"], method = 'spearman')
print(corr1)


p1 = best_predictictors(m1, col_pos = 1) # col_pos = 1: considero la mediana
                                         # col_pos = 2: considero la media
n_vars = 15
p1$m[1:n_vars]
row.names(m1)[p1$sorted_index[1:n_vars]]
tbl_1 = as.data.frame(cbind(row.names(m1)[p1$sorted_index[1:n_vars]], p1$m[1:n_vars]))
xtable(tbl_1, digits = 3)
m = common_predictors_matrix(a1, p1$sorted_index[1:n_vars], best_vars = n_vars)

t1 = apply(m$cmn_prd, 1, sum)
t2 = t1[which(t1 > 0)]
t2
l1 = apply(m$lcl_prd, 1, sum)
l2 = l1[which(l1 > 4)]
l2
sum(m$cmn_prd)
sum(m$lcl_prd)

apply(m$cmn_prd, 2, sum)
var_list = as.character(row.names(a1))

v1 = common_predictors("Netherlands", a1, p1$sorted_index[1:n_vars], best_vars = n_vars )
print("Queste sono le variabili internazionali")
var_list[v1$global_vars]
print("Queste sono le variabili nazionali")
var_list[v1$local_vars]




