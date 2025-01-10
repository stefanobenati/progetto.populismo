# Pulizia dati e colonne per consistenza generale

pacman::p_load(janitor, mice, magrittr, randomForest, caret, dplyr, tidyverse, ggplot2, xts, quantmod, zoo, abind, ROCR, DMwR)


data_all_countries_clean <- data_all_countries[-c(2,129:130, 120:128)]
data_all_countries_clean$cntry_name <- as.factor(data_all_countries_clean$cntry_name)

janitor::compare_df_cols(data_all_countries, data_all_countries_clean)


lista_stati <- split(data_all_countries_clean, data_all_countries_clean$cntry_name)


# Unione liste divise per reintegro vars non imputabili ----




# Reintegro vars non imputabili ----

appoggio <- data_all_countries[c(2,129:130, 120:128)]


integral_pmm_cleaned <- cbind(imputed_pmm, appoggio)


