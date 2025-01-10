# Codice per estrarre variable importance into a data frame ----

# INSERIRE IN LOOP CON LARGE LIST PER OUTPUT IN EXCEL / LATEX



var_imp_smote <- data.frame(matrix(nrow = 138, ncol = (1)))
var_imp_smote[,1] <- row.names(var_imp_smote)
colnames(var_imp_smote)[1] <- "id"


for (i in seq_along(rf_models_smote_grid)) {
  
  modello <- rf_models_smote_grid[[i]]
  
  stato <- names(rf_models_smote_grid[i])
  
  var_imp <- varImp(modello$finalModel)
  
  
  temp_data <- data.frame(variables=row.names(var_imp), importance=var_imp$Overall)
  
  rows_remove <- 1:20
  temp_data <- temp_data[-rows_remove,]
  
  names(temp_data)[names(temp_data) == "variables"] <- stato
  
  temp_data$id <- row.names(temp_data)
  
  
  var_imp_smote <- merge(var_imp_smote, temp_data, all = T, by = "id")
  
  
}


var_imp_smote <- na.omit(var_imp_smote)


save(var_imp_smote, file = "Var importance smote data.Rda")
write.csv(var_imp_smote, file = "Var importance smote data.csv")



