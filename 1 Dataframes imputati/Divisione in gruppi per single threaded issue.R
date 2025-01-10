
# divisione per gruppi di stati con vettori condizionali ----

nomi_stati <- names(lista_stati)

gruppo1 <- nomi_stati[1:6]
grupop2 <- nomi_stati[7:12]
gruppo3 <- nomi_stati[13:17]
gruppo4 <- nomi_stati[18:21]





# Imputazioni for loop con large list format ----

# il loop seguente è generale, diviso in 4 gruppi per pmm e cart
# nei rispettivi script


lista_imputed_pmm = list() # lista per storing mids

subset_conditions <- nomi_stati

for (i in subset_conditions) {  # loop for imputing
  
  imputed_df = mice(lista_stati[[i]], m = 5, method = "pmm", seed = 123)
  
  imputed_df_pmm = complete(imputed_df)
  
  lista_imputed_pmm[[i]] = imputed_df_pmm
  
}

df_imputed_pmm1 <- do.call(rbind, lista_imputed_pmm)

