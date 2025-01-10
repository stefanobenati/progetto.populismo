

vdf0 = as.data.frame(t(rf_models_original_grid[[1]]$finalModel$importance))
for (i in 2:length(rf_models_original_grid)){
  vdf1 = as.data.frame(t(rf_models_original_grid[[i]]$finalModel$importance))
  vdf0 = merge(vdf0, vdf1, all = T)
}

row.names(vdf0) = names(rf_models_original_grid)
vdf0 = vdf0[,-(1:20)]

imp_rank = matrix(data = NA, nrow = dim(vdf0)[1], ncol = dim(vdf0)[2])

for (i in 1:dim(vdf0)[1]){
  x = sort(as.numeric(vdf0[i, ]), decreasing = T, na.last = T, index.return = T)
  for (j in 1:length(x$ix)){
    imp_rank[i, x$ix[j]] = j
  }
}


row.names(imp_rank) = row.names(vdf0)
colnames(imp_rank) = names(vdf0)

