
W7_at = integral_pmm_cleaned[which(integral_pmm_cleaned$cntry_name == "Austria"), ]
#W7_at$cntry_name = NULL
W7_at= na.omit(W7_at)

length(which(is.na(W7_at$E181_EVS5))) #141 NA
length(W7_at$E181_EVS5) #1644 entry

# n = dim(W7_at)[1] #[1] vuol dire righe, quindi qui mi sta chiedendo quante righe??
# W7_at$pop_vote = rep("lib", n)
# 
# 
# i1_0 = which(is.na(W7_at$E181_EVS5))
# i1_1 = which(W7_at$E181_EVS5 == 4026)
# i1_2 = which(W7_at$E181_EVS5 == 4066)
# W7_at$pop_vote[i1_0] = NA
# W7_at$pop_vote[i1_1] = NA
# W7_at$pop_vote[i1_2] = NA
# 
# 
# ip_1 =which(W7_at$E181_EVS5 == 4003)
# W7_at$pop_vote[ip_1] = "pop"
# 
# 
# W7_at$pop_vote = as.factor(W7_at$pop_vote)
# 
# table(W7_at$E181_EVS5)
table(W7_at$pop_vote, useNA = "always") # 1011 lib 268 pop 365 na
#table(countries_lista$Austria$pop_vote)


#togliamo ID e party classifier

W7_at$E181_EVS5 = NULL
W7_at$id = NULL

#colnames(integral_pmm_cleaned)



# divide the data set into 80% training and 20% validation
library(caret)
set.seed(123)
trainIndex <- createDataPartition(W7_at$pop_vote, p = 0.8, list = FALSE)
train_au <- W7_at[trainIndex,]
valid_au <- W7_at[-trainIndex,]

#table train - pop vote 

table(train_au$pop_vote)
table(valid_au$pop_vote)


str(train)


#SMOTE SU TRAIN----

library(DMwR)

#str(train)

#use SMOTE to create new dataset that is more balanced
new_df <- SMOTE(pop_vote ~ ., train_au, perc.over = 369, perc.under = 127)

#view distribution of response variable in new dataset
table(new_df$pop_vote)

#RF SU TRAIN NON SMOTED ---- 

## parameters ----

# Specify the number of folds
k <- 10

# Create a training control object for cross-validation
ctrl <- trainControl(method = "cv", number = k)

# Define the training parameters
rf_params <- expand.grid(mtry = 1:10)  # Example grid of hyperparameters




# Train the random forest model using cross-validation ----
forest_au <- train(pop_vote ~ ., data = train_au, 
                method = "rf", 
                trControl = ctrl, 
                tuneGrid = rf_params)


print(forest_au)

performance_metrics <- forest_au$results

view(performance_metrics)


#PREDICT SU DATI NON SMOTE ----

# predict the pop_vote using the validation set
valid_pred <- predict(forest_au, newdata = valid_au)

# compare the predicted values with the actual values in the validation set
table(valid_au$pop_vote, valid_pred)





#RF SU TRAIN *SMOTED* 

# Specify the number of folds
k <- 10

# Create a training control object for cross-validation
ctrl <- trainControl(method = "cv", number = k)

# Define the training parameters
rf_params <- expand.grid(mtry = 1:10)  # Example grid of hyperparameters

# Train the random forest model using cross-validation
forest_smotefil <- train(pop_vote ~ ., data = new_df, 
                method = "rf", 
                trControl = ctrl, 
                tuneGrid = rf_params)


print(forest_smotefil)

performance_metrics_smote <- forest_smotefil$results

view(performance_metrics_smote)



# PREDICT SU DATI  SMOTE ----


# predict the pop_vote using the validation set
valid_pred_smotefil <- predict(forest_smotefil, newdata = valid_au)

# compare the predicted values with the actual values in the validation set
table(valid_au$pop_vote, valid_pred_smotefil)






## Get variable importance, and turn into a ggplot + data frame ----

var_imp <- varImp(forest_smotefil, scale=FALSE)$importance

var_imp <- data.frame(variables=row.names(var_imp), importance=var_imp$Overall)

view(var_imp)

var_imp1 <- arrange(var_imp, desc(importance))

var_imp2 = var_imp1[1:30,]

view(var_imp2)

## Create a plot of variable importance
var_imp2 %>%
  
  ## Sort the data by importance
  #arrange(importance) %>%
  
  ## Create a ggplot object for aesthetic
  ggplot(aes(x=reorder(variables, importance), y=importance)) + 
  
  ## Plot the bar graph
  geom_bar(stat='identity') + 
  
  ## Flip the graph to make a horizontal bar plot
  coord_flip() + 
  
  ## Add x-axis label
  xlab('Variables') +
  
  ## Add a title
  labs(title='Random forest variable importance') + 
  
  ## Some layout for the plot
  theme_minimal() + 
  theme(axis.text = element_text(size = 10), 
        axis.title = element_text(size = 15), 
        plot.title = element_text(size = 20), 
  )

