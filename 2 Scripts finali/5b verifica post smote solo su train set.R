# Calcolo Imbalance ratios in pre e post SMOTE, output in df singolo

stati <- names(train)




# IR pre SMOTE

ir_pre_smote <- list()

for (i in seq_along(train)) {
  data <- train[[i]]
  factor_counts <- table(data$pop_vote)
  majority_class <- names(factor_counts)[which.max(factor_counts)]
  minority_class <- names(factor_counts)[which.min(factor_counts)]
  
  if (majority_class == "lib") {
    imbalance_ratio <- round(factor_counts["lib"] / factor_counts["pop"], digits = 1)
  } else {
    imbalance_ratio <- round(factor_counts["pop"] / factor_counts["lib"], digits = 1)
  }
  
  ir_pre_smote[[i]] <- imbalance_ratio
}


ir_pre_smote <- data.frame(ir_pre_smote = unlist(ir_pre_smote))


# IR post SMOTE ----

ir_post_smote <- list()

for (i in seq_along(stati_bilanciati_train)) {
  data <- stati_bilanciati_train[[i]]
  factor_counts <- table(data$pop_vote)
  majority_class <- names(factor_counts)[which.max(factor_counts)]
  minority_class <- names(factor_counts)[which.min(factor_counts)]
  
  if (majority_class == "lib") {
    imbalance_ratio <- round(factor_counts["lib"] / factor_counts["pop"], digits = 2)
  } else {
    imbalance_ratio <- round(factor_counts["pop"] / factor_counts["lib"], digits = 2)
  }
  
  ir_post_smote[[i]] <- imbalance_ratio
}

ir_post_smote <- data.frame(ir_post_smote = unlist(ir_post_smote))




IR_compare <- cbind(stati, ir_pre_smote, ir_post_smote)


# clean environment ----

rm(factor_counts, 
   i, 
   stati, 
   imbalance_ratio, 
   majority_class, 
   minority_class,
   ir_post_smote, 
   ir_pre_smote,
   stato_corrente)
