# Unione dataframes in singolo

countries_list_NA <- list(W7_at, W7_cr, W7_cz, 
                          W7_dm, W7_es, W7_et, 
                          W7_fi, W7_fr, W7_gb, 
                          W7_ge, W7_hu, W7_it, 
                          W7_li, W7_ne, W7_no, 
                          W7_pl, W7_pt, W7_ro, 
                          W7_si, W7_sl, W7_sw)

save(data_all_countries, file = "Data finale POST POP CLASSIFICATION.Rda")


nomi_paesi <- unique(data_all_countries$cntry_name)
names(countries_list_NA) <- nomi_paesi

save(countries_list_NA, file = "Large list post classificazione con NA.Rda")
