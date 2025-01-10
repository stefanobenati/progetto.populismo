# Creare due large list vuote per salvare i training e validation
lista_training <- list()
lista_validation <- list()

# For loop per iterare su ogni stato calcolo percentuale, e la salva nel tranining/validation list

for (i in 1:length(countries_lista)) {
  stato <- countries_lista[[i]]
  
  # Calcolo la dimensione del training set per lo stato corrente in proporzione alle osservazioni che ha (cambiano da country a country obsly)
  proporzione_training <- 0.7   # Modificabile, qui 70%
  dimensione_training <- round(nrow(stato) * proporzione_training)
  
  # Split dataframe dello stato corrente
  training_set <- stato[1:dimensione_training, ]
  validation_set <- stato[(dimensione_training + 1):nrow(stato), ]
  
  # Aggiungere il training set il validation alle rispettive liste separate
  lista_training[[i]] <- training_set
  lista_validation[[i]] <- validation_set
}

