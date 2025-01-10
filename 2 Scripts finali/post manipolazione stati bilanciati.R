# Name of the variable for which you want to calculate summary statistics
variable_name <- "pop_vote"

# Create an empty dataframe to store the summary statistics
summary_df <- data.frame(State = character(0), Min = numeric(0), Max = numeric(0), Mean = numeric(0), Median = numeric(0), SD = numeric(0), stringsAsFactors = FALSE)

# Loop through each state's dataframe
for (state_name in names(stati_bilanciati)) {
  state_df <- stati_bilanciati[[state_name]]
  
  # Calculate summary statistics
  summary_stats <- summary(state_df[[variable_name]])
  
  # Add the summary statistics to the summary dataframe
  summary_df <- rbind(summary_df, c(State = state_name, as.numeric(summary_stats)))
}

# Print the resulting summary dataframe
print(summary_df)


appoggio <- bind_rows(stati_bilanciati)



appoggio$lib <- NA
appoggio$pop <- NA

appoggio$lib <- as.integer(appoggio$pop_vote == "lib")
appoggio$pop <- as.integer(appoggio$pop_vote == "pop")

summary_pop <- appoggio %>%
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


