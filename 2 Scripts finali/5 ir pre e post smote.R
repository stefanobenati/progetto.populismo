# Calcolo Imbalance ratios in pre e post SMOTE, output in df singolo

stati <- names(countries_lista)

# IR pre SMOTE

ir_pre_smote <- list()

for (i in seq_along(countries_lista)) {
  data <- countries_lista[[i]]
  factor_counts <- table(data$pop_vote.y)
  majority_class <- names(factor_counts)[which.max(factor_counts)]
  minority_class <- names(factor_counts)[which.min(factor_counts)]
  
  if (majority_class == "lib") {
    imbalance_ratio <- round(factor_counts["lib"] / factor_counts["pop"], digits = 0)
  } else {
    imbalance_ratio <- round(factor_counts["pop"] / factor_counts["lib"], digits = 0)
  }
  
  ir_pre_smote[[i]] <- imbalance_ratio
}


ir_pre_smote <- data.frame(ir_pre_smote = unlist(ir_pre_smote))


# IR post SMOTE ----

ir_post_smote <- list()

for (i in seq_along(stati_bilanciati)) {
  data <- stati_bilanciati[[i]]
  factor_counts <- table(data$pop_vote.y)
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
