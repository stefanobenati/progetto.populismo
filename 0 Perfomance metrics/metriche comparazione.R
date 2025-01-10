# Output metriche per valutazione modelli ----

lista_stati <- c(names(performance_metrics_15original), 
                 paste(names(performance_metrics_15original), "SMOTE"))

lista_stati <- sort(lista_stati)


# mtry 15 ----

metrics_comparison15 <- as.data.frame(1:length(lista_stati))
metrics_comparison15[,1] = NULL

metrics_comparison15$country <- lista_stati



lista_metriche15 <- list()

for (i in seq_along(performance_metrics_15original)) {
  
  metrica <- as.data.frame(t(performance_metrics_15original[[i]][["byClass"]]))
  
  metrica_smote <- as.data.frame(t(performance_metrics_15smote[[i]][["byClass"]]))
  
  
  stato <- bind_rows(metrica, metrica_smote)
  
  lista_metriche15[[i]] <- stato
  
}

metrics_comparison15 <- cbind(metrics_comparison15, 
                              bind_rows(lista_metriche15))



# mtry 30 ----



metrics_comparison30 <- as.data.frame(1:length(lista_stati))
metrics_comparison30[,1] = NULL

metrics_comparison30$country <- lista_stati



lista_metriche30 <- list()

for (i in seq_along(performance_metrics_30original)) {
  
  metrica <- as.data.frame(t(performance_metrics_30original[[i]][["byClass"]]))
  
  metrica_smote <- as.data.frame(t(performance_metrics_30smote[[i]][["byClass"]]))
  
  
  stato <- bind_rows(metrica, metrica_smote)
  
  lista_metriche30[[i]] <- stato
  
}

metrics_comparison30 <- cbind(metrics_comparison30, 
                              bind_rows(lista_metriche30))

#mtry 10 random ----



metrics_comparison_random <- as.data.frame(1:length(lista_stati))
metrics_comparison_random[,1] = NULL

metrics_comparison_random$country <- lista_stati



lista_metriche_random <- list()

for (i in seq_along(performance_metrics_random_original)) {
  
  metrica <- as.data.frame(t(performance_metrics_random_original[[i]][["byClass"]]))
  
  metrica_smote <- as.data.frame(t(performance_metrics_random_smote[[i]][["byClass"]]))
  
  
  stato <- bind_rows(metrica, metrica_smote)
  
  lista_metriche_random[[i]] <- stato
  
}

metrics_comparison_random <- cbind(metrics_comparison_random, 
                              bind_rows(lista_metriche_random))



