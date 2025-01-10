library(caret)

# Predict and validation mtry 15 ----


## Prediction and validation ORIGINAL 15 ----


# large list vuota per store confusion matrices
performance_metrics_15original <- list()

# loop per ogni stato e validazione independent testset
for (i in 1:length(rf_models_original_grid)) {
  
  # selezione modello e stato dal validation
  model <- rf_models_original_grid[[i]]
  test_data <- validation[[i]]
  
  # riga per dare nome corretto poi
  stato_corrente <- names(rf_models_original_grid)[i]
  
  # funzione previsione
  predictions <- predict(model, newdata = test_data)
  
  # per essere sicuri, una conversione as.factor (anche se dovrebbero già esserlo)
  predicted_classes <- as.factor(predictions)
  
  # confusion matrix sulle previsioni
  confusion <- confusionMatrix(predicted_classes, test_data$pop_vote)
  
  # store di tutto nella large list
  performance_metrics_15original[[stato_corrente]] <- confusion
}



# accedere alle metriche 

print(performance_metrics_15original$Austria)

performance_metrics_15original[[1]]$overall["Accuracy"]




## Prediction and validation SMOTE 15 ----


performance_metrics_15smote <- list()


for (i in 1:length(rf_models_smote_grid)) { 
  model <- rf_models_smote_grid[[i]]
  test_data <- validation[[i]]
  
  stato_corrente <- names(rf_models_smote_grid)[i]
  
  predictions <- predict(model, newdata = test_data)
  
  predicted_classes <- as.factor(predictions)
  
  confusion <- confusionMatrix(predicted_classes, test_data$pop_vote)
  
  performance_metrics_15smote[[stato_corrente]] <- confusion
}





# Predict and validation mtry 30 ----


## Prediction and validation ORIGINAL 30 ----


performance_metrics_30original <- list()



for (i in 1:length(rf_models_original)) { 
  model <- rf_models_original[[i]]
  test_data <- validation[[i]]
  
  stato_corrente <- names(rf_models_original)[i]
  
  predictions <- predict(model, newdata = test_data)
  
  predicted_classes <- as.factor(predictions)
  
  confusion <- confusionMatrix(predicted_classes, test_data$pop_vote)
  
  performance_metrics_30original[[stato_corrente]] <- confusion
}



## Prediction and validation SMOTE 30 ----

performance_metrics_30smote <- list()


for (i in 1:length(rf_models_smote)) { 
  model <- rf_models_smote[[i]]
  test_data <- validation[[i]]
  
  stato_corrente <- names(rf_models_smote)[i]
  
  predictions <- predict(model, newdata = test_data)
  
  predicted_classes <- as.factor(predictions)
  
  confusion <- confusionMatrix(predicted_classes, test_data$pop_vote)
  
  performance_metrics_30smote[[stato_corrente]] <- confusion
}






# Predict and validation mtry random 10 ----

## Prediction and validation ORIGINAL RANDOM 10 ----


performance_metrics_random_original <- list()



for (i in 1:length(rf_models_original_random)) { 
  model <- rf_models_original_random[[i]]
  test_data <- validation[[i]]
  
  stato_corrente <- names(rf_models_original_random)[i]
  
  predictions <- predict(model, newdata = test_data)
  
  predicted_classes <- as.factor(predictions)
  
  confusion <- confusionMatrix(predicted_classes, test_data$pop_vote)
  
  performance_metrics_random_original[[stato_corrente]] <- confusion
}





## Prediction and validation SMOTE RANDOM 10 ----


performance_metrics_random_smote <- list()



for (i in 1:length(rf_models_smote_random)) { 
  model <- rf_models_smote_random[[i]]
  test_data <- validation[[i]]
  
  stato_corrente <- names(rf_models_smote_random)[i]
  
  predictions <- predict(model, newdata = test_data)
  
  predicted_classes <- as.factor(predictions)
  
  confusion <- confusionMatrix(predicted_classes, test_data$pop_vote)
  
  performance_metrics_random_smote[[stato_corrente]] <- confusion
}



save(performance_metrics_15original, file = "performance original 15.Rda")
save(performance_metrics_15smote, file = "performance smote 15.Rda")
save(performance_metrics_30original, file = "performance original 30.Rda")
save(performance_metrics_30smote, file = "performance smote 30.Rda")
save(performance_metrics_random_original, file = "performance original 10 random.Rda")
save(performance_metrics_random_smote, file = "performance smote 10 random.Rda")
