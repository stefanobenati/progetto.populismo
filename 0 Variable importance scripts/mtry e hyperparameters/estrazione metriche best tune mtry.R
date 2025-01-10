# Estrazione e comparazione optimal hyperparameters ----


# inserire colonna di appoggio
# Crea dataframe colonna singola con hyperparameters per best accuracy

# mtry 15 ----

## ORIGINALI

performance_metrics_orig_grid <- lapply(rf_models_original_grid, function(df) df$results)

state_name <- names(performance_metrics_orig_grid)

bestTune <- bind_rows(lapply(rf_models_original_grid, function(df) df$bestTune))

nome_colonna <- c("bestTune_mtry")

colnames(bestTune) <- nome_colonna

bestTune$country <- state_name




## SMOTE

performance_metrics_smote_grid <- lapply(rf_models_smote_grid, function(df) df$results)

state_name <- names(rf_models_smote_grid)

bestTune_smote <- bind_rows(lapply(rf_models_smote_grid, function(df) df$bestTune))

nome_colonna <- c("bestTune_mtry_smote")

colnames(bestTune_smote) <- nome_colonna

bestTune_smote$country <- state_name


# comparison best Tune original and smote

best_tune_comparison_15 <- cbind.data.frame(bestTune$country, bestTune$bestTune_mtry, bestTune_smote$bestTune_mtry_smote)
colnames(best_tune_comparison_15) <- c("country", "best-tune", "best-tune-smote")




# mtry 30 ----

## ORIGINALI

performance_metrics_orig <- lapply(rf_models_original, function(df) df$results)

state_name <- names(performance_metrics_orig)

bestTune <- bind_rows(lapply(rf_models_original, function(df) df$bestTune))

nome_colonna <- c("bestTune_mtry")

colnames(bestTune) <- nome_colonna

bestTune$country <- state_name




## SMOTE

performance_metrics_smote <- lapply(rf_models_smote, function(df) df$results)

state_name <- names(rf_models_smote)

bestTune_smote <- bind_rows(lapply(rf_models_smote, function(df) df$bestTune))

nome_colonna <- c("bestTune_mtry_smote")

colnames(bestTune_smote) <- nome_colonna

bestTune_smote$country <- state_name


# comparison best Tune original and smote

best_tune_comparison_30 <- cbind.data.frame(bestTune$country, bestTune$bestTune_mtry, bestTune_smote$bestTune_mtry_smote)
colnames(best_tune_comparison_30) <- c("country", "best-tune", "best-tune-smote")




# mtry 10 random (sqrt n. variables) ----


## ORIGINALI

performance_metrics_orig_random <- lapply(rf_models_original_random, function(df) df$results)

state_name <- names(performance_metrics_orig_random)

bestTune <- bind_rows(lapply(rf_models_original_random, function(df) df$bestTune))

nome_colonna <- c("bestTune_mtry")

colnames(bestTune) <- nome_colonna

bestTune$country <- state_name




## SMOTE

performance_metrics_smote_random <- lapply(rf_models_smote_random, function(df) df$results)

state_name <- names(rf_models_smote_random)

bestTune_smote <- bind_rows(lapply(rf_models_smote_random, function(df) df$bestTune))

nome_colonna <- c("bestTune_mtry_smote")

colnames(bestTune_smote) <- nome_colonna

bestTune_smote$country <- state_name


# comparison best Tune original and smote

best_tune_comparison_random <- cbind.data.frame(bestTune$country, bestTune$bestTune_mtry, bestTune_smote$bestTune_mtry_smote)
colnames(best_tune_comparison_random) <- c("country", "best-tune", "best-tune-smote")



# Saving and exporting all ----


save(best_tune_comparison_15, file = "mtry 15 best tune comparison.Rda")
save(best_tune_comparison_30, file = "mtry 30 best tune comparison.Rda")
save(best_tune_comparison_random, file = "mtry random best tune comparison.Rda")



write.csv(best_tune_comparison_15, file = "mtry 15 best tune comparison.csv")
write.csv(best_tune_comparison_30, file = "mtry 30 best tune comparison.csv")
write.csv(best_tune_comparison_random, file = "mtry random best tune comparison.csv")


