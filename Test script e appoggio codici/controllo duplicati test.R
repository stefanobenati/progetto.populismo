# Subset the data frame for class1 only
class1_df <- subset(test_orig, pop_vote.y == "pop")

# Subset the data frame for class2 only
class2_df <- subset(test_orig, pop_vote.y == "lib")


# Subset the data frame for class1 only
class1_smote <- subset(test_smote, pop_vote.y == "pop")

# Subset the data frame for class2 only
class2_smote <- subset(test_smote, pop_vote.y == "lib")


summary(class1_df)
summary(class1_smote)



summary(class2_df)
summary(class2_smote)




duplicated_rows <- duplicated(class1_df)

# Print the duplicated rows
if (any(duplicated_rows)) {
  print("The following rows are duplicates:")
  print(class1_df[duplicated_rows, ])
} else {
  print("There are no duplicate rows.")
}




duplicated_rows <- duplicated(class2_df)

# Print the duplicated rows
if (any(duplicated_rows)) {
  print("The following rows are duplicates:")
  print(class2_df[duplicated_rows, ])
} else {
  print("There are no duplicate rows.")
}




duplicated_rows <- duplicated(test_orig)

# Print the duplicated rows
if (any(duplicated_rows)) {
  print("The following rows are duplicates:")
  print(test_orig[duplicated_rows, ])
} else {
  print("There are no duplicate rows.")
}





duplicated_rows <- duplicated(new_df)

# Print the duplicated rows
if (any(duplicated_rows)) {
  print("The following rows are duplicates:")
  print(new_df[duplicated_rows, ])
} else {
  print("There are no duplicate rows.")
}







# Check for duplicates in both directions
duplicates1 <- duplicated(new_df, fromLast = FALSE)
duplicates2 <- duplicated(new_df, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Print all the duplicated rows
if (any(all_duplicates)) {
  print("The following rows are duplicates:")
  print(new_df[all_duplicates, ])
} else {
  print("There are no duplicate rows.")
}






# Check for duplicates in both directions
duplicates1 <- duplicated(new_df, fromLast = FALSE)
duplicates2 <- duplicated(new_df, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Count the total number of duplicates
num_duplicates <- sum(all_duplicates)

# Print the number of duplicates
if (num_duplicates > 0) {
  cat("There are", num_duplicates, "duplicate(s) in the data frame.\n")
} else {
  cat("There are no duplicate rows in the data frame.\n")
}







lib_df_smote <- subset(new_df, pop_vote.y == "lib")




# Check for duplicates in both directions
duplicates1 <- duplicated(lib_df_smote, fromLast = FALSE)
duplicates2 <- duplicated(lib_df_smote, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Count the total number of duplicates
num_duplicates <- sum(all_duplicates)

# Print the number of duplicates
if (num_duplicates > 0) {
  cat("There are", num_duplicates, "duplicate(s) in the data frame.\n")
} else {
  cat("There are no duplicate rows in the data frame.\n")
}




# duplicates with new SMOTE function

new_df



# Subset the data frame for class1 only
class1_df <- subset(new_df, pop_vote.y == "pop")

# Subset the data frame for class2 only
class1_smote <- subset(new_df, pop_vote.y == "pop")




# Subset the data frame for class2 only
class2_df <- subset(new_df, pop_vote.y == "lib")

# Subset the data frame for class2 only
class2_smote <- subset(new_df, pop_vote.y == "lib")







# Check for duplicates in both directions
duplicates1 <- duplicated(class1_df, fromLast = FALSE)
duplicates2 <- duplicated(class1_smote, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Count the total number of duplicates
num_duplicates <- sum(all_duplicates)

# Print the number of duplicates
if (num_duplicates > 0) {
  cat("There are", num_duplicates, "duplicate(s) in the data frame.\n")
} else {
  cat("There are no duplicate rows in the data frame.\n")
}







# Check for duplicates in both directions
duplicates1 <- duplicated(class1_df, fromLast = FALSE)
duplicates2 <- duplicated(class1_smote, fromLast = TRUE)

# Combine the two logical vectors to get all the duplicates
all_duplicates <- duplicates1 | duplicates2

# Count the total number of duplicates
num_duplicates <- sum(all_duplicates)

# Print the number of duplicates
if (num_duplicates > 0) {
  cat("There are", num_duplicates, "duplicate(s) in the data frame.\n")
} else {
  cat("There are no duplicate rows in the data frame.\n")
}

