# Creazione dataframe per storage variable importance

var_imp_original30 <- data.frame(matrix(nrow = 138, ncol = (1)))

var_imp_original30[,1] <- row.names(var_imp_original30)

var_imp_original30$variables <- row.names(rf_models_original$Austria$finalModel$importance)

rows_remove <- 1:20

var_imp_original30 <- as.data.frame(var_imp_original30[-rows_remove,]) # rimuove le vars riferite agli altri stati che sono = 0
var_imp_original30[,1] <- NULL # rimuove colonna appoggio





for (i in seq_along(rf_models_original)) {
  
  modello <- rf_models_original[[i]] # seleziona il modello dello stato relativo
  
  # estrazione var impo del modello rf
  var_imp <- varImp(modello$finalModel)
  
  # per nome corretto stato a colonna, serve dopo
  stato <- names(rf_models_original[i])
  nome_colonna <- paste("Imp.var", stato)
  
  
  # conversione in DF, rimozione vars = 0 (variabile altri stati)
  temp_data <- data.frame(variables=row.names(var_imp), importance=var_imp$Overall)
  
  temp_data <- temp_data[-rows_remove,]
  
  # assegna nome stato corretto a colonna
  names(temp_data)[names(temp_data) == "importance"] <- nome_colonna
  
  # unisce il DF totale con quello rotante
  var_imp_original30 <- merge(var_imp_original30, temp_data, all = T, by = "variables")
  
}


save(var_imp_original30, file = "Var importance original data mtry 30.Rda")
write.csv(var_imp_original30, file = "Var importance original data mtry 30.csv")

