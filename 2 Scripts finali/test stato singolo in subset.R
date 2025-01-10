table(train$Austria$pop_vote)
table(stati_bilanciati_train$Austria$pop_vote)


austria_train <- countries_lista$Austria
austria_train1 <- stati_bilanciati_train$Austria
austria_valid <- validation$Austria




library(caret)

# Test 3: altro test cross validation ----

set.seed(123)

# Specify the number of folds
k <- 10

# Create a training control object for cross-validation
ctrl <- trainControl(method = "cv", number = k)

# Define the training parameters
rf_params <- expand.grid(mtry = 1:10)  # Example grid of hyperparameters





# Train the random forest model using cross-validation (NON SMOTE) ----
forest_original <- train(pop_vote ~ ., data = austria_train, 
                         method = "rf", 
                         trControl = ctrl, 
                         tuneGrid = rf_params)


print(forest_original)

performance_metrics_orig <- forest_original$results

view(performance_metrics_orig)






# Train the random forest model using cross-validation SMOTE ----
forest_smote <- train(pop_vote ~ ., data = austria_train1, 
                      method = "rf", 
                      trControl = ctrl, 
                      tuneGrid = rf_params)


print(forest_smote)

performance_metrics_smote <- forest_smote$results

view(performance_metrics_smote)







# predict the pop_vote using the validation set ----

# NON SMOTE model data

valid_pred_orig <- predict(forest_original, newdata = austria_valid) # correggere validation set



# SMOTE DATA

valid_pred_smote <- predict(forest_smote, newdata = austria_valid) # correggere validation set



# compare the predicted values with the actual values in the validation set

table(austria_valid, valid_pred_orig)

table(austria_valid, valid_pred_smote)
