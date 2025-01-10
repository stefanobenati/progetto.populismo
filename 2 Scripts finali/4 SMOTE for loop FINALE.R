
# Trova il numero di elementi (dataframes) nella lista
num_elementi <- length(countries_lista)

# nuova lista per salvare i dfs bilanciati
stati_bilanciati <- vector("list", num_elementi)


# for loop su ogni stato
for (i in 1:num_elementi) {
  # Trova il dataframe corrente
  df_corrente <- countries_lista[[i]]
  
  # Trova il nome dello stato corrispondente
  stato_corrente <- names(countries_lista)[i]
  
  # Trova i parametri corrispondenti dal df dei parametri
  perc_over <- parametri_smote[parametri_smote$cntry_name == stato_corrente, "perc.over"]
  perc_under <- parametri_smote[parametri_smote$cntry_name == stato_corrente, "perc.under"]
  
  # Print statements for debugging
  print(paste("Processing:", stato_corrente, "- perc_over:", perc_over, "- perc_under:", perc_under))
  
  # Applica SMOTE al dataframe corrente
  df_bilanciato <- SMOTE(pop_vote ~ ., df_corrente, perc.over = perc_over, perc.under = perc_under)
  
  # Aggiungi il dataframe bilanciato alla nuova lista
  stati_bilanciati[[i]] <- df_bilanciato
  
  # Imposta il nome dello stato corrispondente (da numero X a nome giusto)
  names(stati_bilanciati)[i] <- stato_corrente
}
