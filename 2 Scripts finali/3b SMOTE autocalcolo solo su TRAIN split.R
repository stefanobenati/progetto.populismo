

### Procedura separata per NT, PT, GB. ----
# Causa: colonna intera mancante

countries_lista1 <- list()

df1 <- bind_rows(train)


subset_conditions <- as.character(c("Netherlands", "Portugal", "Great-Britain"))


## Create two new columns, ONLY FOR OUTPUT CSV E APPOGGIO ----

df1$lib <- NA
df1$pop <- NA

df1$lib <- as.integer(df1$pop_vote == "lib")
df1$pop <- as.integer(df1$pop_vote == "pop")



for(i in subset_conditions){
  
  # Selezionare i sottinsiemi del dataframe
  subset_data <- subset(df1, df1$cntry_name == i)
  
  
  # associare ad un df1 di appoggio
  pmm = subset_data[which(subset_data$cntry_name == i), ]
  
  
  
  # Aggiunge il df1 alla lista
  countries_lista1[[i]] <- pmm  
  
}


countries_lista1$Netherlands$city_siz = NULL
countries_lista1$`Great-Britain`$city_siz = NULL
countries_lista1$Portugal$incm_lvl = NULL


countries_lista1 <- lapply(countries_lista1, na.omit)


# Conteggio individui lib o pop per imbalance ratio


count_table_nt <- countries_lista1$Netherlands %>%
  group_by(cntry_name) %>%
  summarise(lib = sum(lib),
            pop = sum(pop),
            obs = sum(pop) + sum(lib),
            IR = ifelse(
              sum(lib) > sum(pop), 
              round(sum(lib) / sum(pop), digits = 2), 
              round(sum(pop) / sum(lib), digits = 2)
            )
  )


count_table_pt <- countries_lista1$Portugal %>%
  group_by(cntry_name) %>%
  summarise(lib = sum(lib),
            pop = sum(pop),
            obs = sum(pop) + sum(lib),
            IR = ifelse(
              sum(lib) > sum(pop), 
              round(sum(lib) / sum(pop), digits = 2), 
              round(sum(pop) / sum(lib), digits = 2)
            )
  )


count_table_gb <- countries_lista1$`Great-Britain` %>%
  group_by(cntry_name) %>%
  summarise(lib = sum(lib),
            pop = sum(pop),
            obs = sum(pop) + sum(lib),
            IR = ifelse(
              sum(lib) > sum(pop), 
              round(sum(lib) / sum(pop), digits = 2), 
              round(sum(pop) / sum(lib), digits = 2)
            )
  )


count_table_tot <- rbind(count_table_nt, count_table_gb, count_table_pt)


### Conteggio per tutti gli altri stati ----


summary(df1$cntry_name)

str(df1)

df1 <- subset(df1, cntry_name!="Great-Britain" & 
                cntry_name!="Portugal" &
                cntry_name!="Netherlands")

df1$cntry_name <- as.character(df1$cntry_name)
df1$cntry_name <- as.factor(df1$cntry_name)

# Conteggio individui lib o pop per imbalance ratio

count_table <- df1 %>%
  group_by(cntry_name) %>%
  summarise(lib = sum(lib),
            pop = sum(pop),
            obs = sum(pop) + sum(lib),
            IR = ifelse(
              sum(lib) > sum(pop), 
              round(sum(lib) / sum(pop), digits = 2), 
              round(sum(pop) / sum(lib), digits = 2)
            )
  )



count_table_tot <- rbind(count_table, count_table_tot)




# Formule script per calcolo automarico perc.over e perc.under ----


auto.calc <- count_table_tot  %>%
  group_by(cntry_name) %>%
  reframe(IR,
          maj.class = ifelse(lib > pop, "Lib", "Pop"),
          perc.over = IR*100,
          
          syn.data = round(ifelse(maj.class == "Lib", pop * IR, lib * IR), digits = 0),
          
          new.pop = ifelse(maj.class == "Lib", pop + syn.data,0),
          new.lib = ifelse(maj.class == "Pop", lib + syn.data,0),
          
          perc.under = ifelse(
            maj.class == "Lib",
            round(new.pop / syn.data * 100, digits = 0),
            round(new.lib / syn.data * 100, digits = 0)
          ),
          
          final.lib = ifelse(
            maj.class == "Lib", 
            round(syn.data * perc.under/100, digits = 0), 
            new.lib),
          
          final.pop = ifelse(
            maj.class == "Pop", 
            round(syn.data * perc.under/100, digits = 0), 
            new.pop),
          
          tot.new.balanced = final.pop + final.lib
  )


parametri_smote <- auto.calc[-c(5:7)]





# Trova il numero di elementi (dataframes) nella lista
num_elementi <- length(train)

# nuova lista per salvare i df1s bilanciati
stati_bilanciati <- vector("list", num_elementi)


# for loop su ogni stato
for (i in 1:num_elementi) {
  # Trova il dataframe corrente
  df1_corrente <- train[[i]]
  
  # Trova il nome dello stato corrispondente
  stato_corrente <- names(train)[i]
  
  # Trova i parametri corrispondenti dal df1 dei parametri
  perc_over <- parametri_smote[parametri_smote$cntry_name == stato_corrente, "perc.over"]
  perc_under <- parametri_smote[parametri_smote$cntry_name == stato_corrente, "perc.under"]
  
  # Print statements for debugging
  print(paste("Processing:", stato_corrente, "- perc_over:", perc_over, "- perc_under:", perc_under))
  
  # Applica SMOTE al dataframe corrente
  df1_bilanciato <- SMOTE(pop_vote ~ ., df1_corrente, perc.over = perc_over, perc.under = perc_under)
  
  # Aggiungi il dataframe bilanciato alla nuova lista
  stati_bilanciati[[i]] <- df1_bilanciato
  
  # Imposta il nome dello stato corrispondente (da numero X a nome giusto)
  names(stati_bilanciati)[i] <- stato_corrente
}

stati_bilanciati_train <- stati_bilanciati
rm(stati_bilanciati)


# Clean environment ----

rm(count_table, 
   count_table_gb, 
   count_table_nt, 
   count_table_pt, 
   countries_lista1, 
   df1_bilanciato, 
   df1_corrente,
   perc_over,
   perc_under, 
   pmm,
   subset_data,
   i,
   stato_corrente,
   subset_conditions,
   df1)




