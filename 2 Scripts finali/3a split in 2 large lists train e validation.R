# divide the data set into 80% training and 20% validation
library(caret)
set.seed(123)



# Trova il numero di elementi (dataframes) nella lista
num_elementi <- length(countries_lista)

# nuova lista per salvare i dfs bilanciati

train <- vector("list", num_elementi)

validation <- vector("list", num_elementi)


# for loop su ogni stato
for (i in 1:num_elementi) {
  # Trova il dataframe corrente
  df_corrente <- countries_lista[[i]]
  
  # Trova il nome dello stato corrispondente
  stato_corrente <- names(countries_lista)[i]
  

  trainIndex <- createDataPartition(df_corrente$pop_vote, p = 0.8, list = FALSE)
  train_appoggio <- df_corrente[trainIndex,]
  valid_appoggio <- df_corrente[-trainIndex,]
  
  
  # Aggiunge il valid e train set alle rispettive liste
  
  train[[i]] <- train_appoggio
  validation[[i]] <- valid_appoggio
  

  # Imposta il nome dello stato corrispondente (da numero X a nome giusto)
  names(train)[i] <- stato_corrente
  names(validation)[i] <- stato_corrente
  

}


# clean environment ----

rm(df_corrente, trainIndex, valid_appoggio, train_appoggio, i, stato_corrente)
