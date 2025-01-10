# Controllo e conteggio per bilanciamento classi output ----


## Create two new columns, ONLY FOR OUTPUT CSV E APPOGGIO ----

df$lib <- NA
df$pop <- NA

df$lib <- as.integer(df$pop_vote == "lib")
df$pop <- as.integer(df$pop_vote == "pop")


### Procedura separata per NT, PT, GB. ----
# Causa: colonna intera mancante

subset_conditions <- as.character(c("Netherlands", "Portugal", "Great-Britain"))

countries_lista1 <- list()

for(i in subset_conditions){
  
  # Selezionare i sottinsiemi del dataframe
  subset_data <- subset(df, df$cntry_name == i)
  
  
  # associare ad un df di appoggio
  pmm = subset_data[which(subset_data$cntry_name == i), ]
  
  
  
  # Aggiunge il df alla lista
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

df1 <- df[complete.cases(df), ]


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


