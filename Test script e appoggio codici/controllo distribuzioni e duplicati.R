# Comparazione distribuzioni: differenze della media e mediana ----

# 'stato' è original dataset, 'stato_smote' è il synthetic dataset post-SMOTE

# Combine the datasets
combined_df <- rbind(stato, stato_smote)

# Extract numeric variables
numeric_vars <- sapply(combined_df, is.numeric)

# Calculate the mean for each variable and dataset
mean_summary <- aggregate(combined_df[, numeric_vars], by = list(dataset = rep(c("Original", "Synthetic"), times = c(nrow(stato), nrow(stato_smote)))), FUN = mean)

# Calculate the differences in means
mean_diff <- mean_summary[mean_summary$dataset == "Synthetic", -1] - mean_summary[mean_summary$dataset == "Original", -1]


# Calculate the median for each variable and dataset
median_summary <- aggregate(combined_df[, numeric_vars], by = list(dataset = rep(c("Original", "Synthetic"), times = c(nrow(stato), nrow(stato_smote)))), FUN = median)

# Calculate the differences in medians
median_diff <- median_summary[median_summary$dataset == "Synthetic", -1] - median_summary[median_summary$dataset == "Original", -1]


# Create a dataframe to store the mean and median differences
diff_df <- data.frame(Mean_Difference = unlist(mean_diff), Median_Difference = unlist(median_diff))

# Display the mean differences
diff_df


# SISTEMATO E GIà INSERITO IN UN FOR LOOP






# Controllo duplicati ----

## Divide the two classes into different subsets ----

## Pre smote ----

# Subset the data frame for class1 only
class1_df <- subset(stato, pop_vote.y == "pop")

# Subset the data frame for class2 only
class2_df <- subset(stato, pop_vote.y == "lib")


## Post smote ----

# Subset the data frame for class1 only
class1_smote <- subset(stato_smote, pop_vote.y == "pop")

# Subset the data frame for class2 only
class2_smote <- subset(stato_smote, pop_vote.y == "lib")

summary(class1_df)
summary(class2_df)

summary(class1_smote)
summary(class2_smote)





## Check for duplicates in both directions ----
duplicates1 <- duplicated(class1_df, fromLast = FALSE)
duplicates2 <- duplicated(class1_smote, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Count the total number of duplicates
num_duplicates <- sum(all_duplicates)

# Print the number of duplicates
if (num_duplicates > 0) {
  cat("There are", num_duplicates, "duplicate(s) in the data frame.")
} else {
  cat("There are no duplicate rows in the data frame.")
}


duplicates1 <- duplicated(class2_df, fromLast = FALSE)
duplicates2 <- duplicated(class2_smote, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Count the total number of duplicates
num_duplicates <- sum(all_duplicates)

# Print the number of duplicates
if (num_duplicates > 0) {
  cat("There are", num_duplicates, "duplicate(s) in the data frame.")
} else {
  cat("There are no duplicate rows in the data frame.")
}



df_unique <- unique(stato_smote, fromLast = TRUE)
