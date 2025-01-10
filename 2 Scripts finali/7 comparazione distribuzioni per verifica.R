distro_compar <- list()


for (i in seq(1:length(countries_lista))) {


# Combine the datasets
combined_df <- rbind(countries_lista[[i]], stati_bilanciati[[i]])

# Extract numeric variables
numeric_vars <- sapply(combined_df, is.numeric)


# Calculate the mean for each variable and dataset
mean_summary <- aggregate(combined_df[, numeric_vars], by = list(dataset = rep(c("Original", "Synthetic"), times = c(nrow(countries_lista[[i]]), nrow(stati_bilanciati[[i]])))), FUN = mean)

# Calculate the differences in means
mean_diff <- mean_summary[mean_summary$dataset == "Synthetic", -1] - mean_summary[mean_summary$dataset == "Original", -1]


# Calculate the median for each variable and dataset
median_summary <- aggregate(combined_df[, numeric_vars], by = list(dataset = rep(c("Original", "Synthetic"), times = c(nrow(countries_lista[[i]]), nrow(stati_bilanciati[[i]])))), FUN = median)

# Calculate the differences in medians
median_diff <- median_summary[median_summary$dataset == "Synthetic", -1] - median_summary[median_summary$dataset == "Original", -1]


# Create a dataframe to store the mean and median differences
diff_df <- data.frame(Mean_Difference = unlist(mean_diff), Median_Difference = unlist(median_diff))

distro_compar[[i]] <- diff_df


# Trova il nome dello stato corrispondente
stato_corrente <- names(countries_lista)[i]

# Imposta il nome dello stato corrispondente (da numero X a nome giusto)
names(distro_compar)[i] <- stato_corrente

}
