
# Imputazioni for loop con large list format ----


lista_imputed_pmm2 = list() # lista per storing mids

subset_conditions <- gruppo2

for (i in subset_conditions) {  # loop for imputing
  
  imputed_df = mice(lista_stati[[i]], m = 5, method = "pmm", seed = 123)
  
  imputed_df_pmm = complete(imputed_df)
  
  lista_imputed_pmm2[[i]] = imputed_df_pmm
  
}

df_imputed_pmm2 <- do.call(rbind, lista_imputed_pmm2)

