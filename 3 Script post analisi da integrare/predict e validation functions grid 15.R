

# Estrazione modelli random forest originale e smote

forest_au <- rf_models_original_grid$Austria

forest_au_smote <- rf_models_smote_grid$Austria

# Estrazione validation set dati originali

validation_au <- validation$Austria




# predict  pop_vote using validation set ORIGINAL
valid_pred_orig <- predict(forest_au, newdata = validation_au)

print(table(valid_pred_orig, validation_au$pop_vote))

# Matrice - comparazione previsione con actual values in validation independent set

prova <- as.data.frame(table(validation_au$pop_vote, valid_pred_orig))
prova$id <- row.names(prova)


# predict  pop_vote using validation set SMOTE
valid_pred_smote <- predict(forest_au_smote, newdata = validation_au)

# Matrice - comparazione previsione con actual values in validation independent set
table(validation_au$pop_vote, valid_pred_smote)

prova_smote <- as.data.frame(table(validation_au$pop_vote, valid_pred_smote))
prova_smote$id <- row.names(prova_smote)


finale_prova <- merge(prova, prova_smote, by ="id")





accuracy_au <- as.data.frame(seq(1:15),)

accuracy_au$austria_original_accuracy <- as.data.frame(forest_au$results$Accuracy)
