bestTune$country <- state_name


# Creazione DFS per comparazione metriche accuracy ----


rf_models_original_grid["Austria"]



# Add additional variable to each element in the list
for (i in 1:length(performance_metrics_orig_grid)) {
  state <- names(performance_metrics_orig_grid)[i]
  additional_value <- bestTune$country[bestTune$country == state]
  
  # Add the additional variable to the state's data
  performance_metrics_orig_grid[[state]]$country <- additional_value
}


performance_orig_grid <- bind_rows(performance_metrics_orig_grid)



# ---

for (i in 1:length(performance_metrics_orig)) {
  state <- names(performance_metrics_orig_grid)[i]
  additional_value <- bestTune$bestTune[bestTune$country == state]
  

  performance_metrics_orig_grid15[[state]]$bestTune <- additional_value
}



performance_orig_grid <- bind_rows(performance_metrics_orig_grid)