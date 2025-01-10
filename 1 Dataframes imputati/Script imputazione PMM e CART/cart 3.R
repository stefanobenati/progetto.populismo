# Imputazioni for loop con large list format ----


lista_imputed_cart3 = list() # lista per storing mids

subset_conditions <- gruppo3

for (i in subset_conditions) {  # loop for imputing
  
  imputed_df = mice(lista_stati[[i]], m = 5, method = "cart", seed = 123)
  
  imputed_df_cart = complete(imputed_df)
  
  lista_imputed_cart3[[i]] = imputed_df_cart
  
}

df_imputed_cart3 <- do.call(rbind, lista_imputed_cart3)