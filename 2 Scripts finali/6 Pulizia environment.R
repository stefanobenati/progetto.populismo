# Pulire enviroment ----

# Runnare lo script due volte per rimuovere in modo corretto. Motivo? Boh..

# list of objects to keep
objects_to_keep <- c("auto.calc", "count_table_tot", "countries_lista", "df", "integral_pmm_imputed", "stati_bilanciati", "parametri_smote")

# list of all objects in the environment
all_objects <- ls()

# objects to remove
objects_to_remove <- setdiff(all_objects, objects_to_keep)

# Remove the objects from the environment
rm(list = objects_to_remove)
