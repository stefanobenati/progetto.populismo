train_df <- bind_rows(train)


train_df$lib <- NA
train_df$pop <- NA

train_df$lib <- as.integer(train_df$pop_vote == "lib")
train_df$pop <- as.integer(train_df$pop_vote == "pop")




# Subsetting all dfs in for loop ----

# Inizializzare una lista vuota df IMPUTATO (x)

train_appoggio1 <- list()

train_df$cntry_name <- as.factor(train_df$cntry_name)

subset_conditions <- as.character(c(unique(train_df$cntry_name)))

print(subset_conditions)

print(unique(train_df$cntry_name))

# Eseguire un ciclo per ogni condizione di subsetting

for(i in subset_conditions){
  
  # Selezionare i sottinsiemi del dataframe
  subset_data <- subset(train_df, train_df$cntry_name == i)
  
  
  # associare ad un df di appoggio
  pmm = subset_data[which(subset_data$cntry_name == i), ]
  
  
  
  # Aggiunge il df alla lista
  train_appoggio1[[i]] <- pmm  
  
}
