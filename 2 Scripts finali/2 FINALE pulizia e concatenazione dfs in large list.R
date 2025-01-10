# cambio nome da df caricato a neutro ----

# Step 1: caricare dataframe da usare

df <- integral_pmm_cleaned # cambiare quando si esegue l'analisi il nome del dataframe con quello caricato


# Import and clean data ----
colnames(df)
summary(df$pop_vote)

summary(df)

## df --> togliamo le Y (vars originali, quindi DF IMPUTATO, ma con pop_vote e isco 1dig ORGINALE) ----

df <- df[ -c(119)]
df <- df[-c(122:130)]


#df$isco_2digit.x = NULL
#df$id <- NULL
#df$emp_status.x <- NULL
#colnames(df)




# Subsetting all dfs in for loop ----

# Inizializzare una lista vuota df IMPUTATO (x)

countries_lista <- list()

df$cntry_name <- as.factor(df$cntry_name)

subset_conditions <- as.character(c(unique(df$cntry_name)))

print(subset_conditions)

print(unique(df$cntry_name))

# Eseguire un ciclo per ogni condizione di subsetting

for(i in subset_conditions){
  
  # Selezionare i sottinsiemi del dataframe
  subset_data <- subset(df, df$cntry_name == i)
  
  
  # associare ad un df di appoggio
  pmm = subset_data[which(subset_data$cntry_name == i), ]
  
  
  
  # Aggiunge il df alla lista
  countries_lista[[i]] <- pmm  
  
}



## REMOVE ALL RECORDS WITH NA, e vars al 100%  ----

# per questo passaggio, vedi foglio excel con vars 100% NAs
# nello specifico, GB + NT (city size); PT (income)

# Rimozione colonne vuote per alcuni stati
countries_lista$Netherlands$city_siz = NULL
countries_lista$`Great-Britain`$city_siz = NULL
countries_lista$Portugal$incm_lvl = NULL

# solo "complete cases" per tutti gli stati
countries_lista <- lapply(countries_lista, na.omit)

# Ordine alfabetico large list
countries_lista <- countries_lista[order(names(countries_lista))]


# Cleaning environment
rm(pmm, subset_data, i)
