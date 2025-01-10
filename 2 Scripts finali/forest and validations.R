table(train$Austria$pop_vote)


table(stati_bilanciati_train$Austria$pop_vote)




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
forest_original <- train(pop_vote ~ ., data = train[["Austria"]], 
                         method = "rf", 
                         trControl = ctrl, 
                         tuneGrid = rf_params)


print(forest_original)

performance_metrics_orig <- forest_original$results

view(performance_metrics_orig)






# Train the random forest model using cross-validation SMOTE ----
forest_smote <- train(pop_vote ~ ., data = stati_bilanciati_train[["Austria"]], 
                method = "rf", 
                trControl = ctrl, 
                tuneGrid = rf_params)


print(forest_smote)

performance_metrics_smote <- forest_smote$results

view(performance_metrics_smote)







# predict the pop_vote using the validation set ----

# NON SMOTE model data

valid_pred_orig <- predict(forest_original, newdata = validation$Austria) # correggere validation set



# SMOTE DATA

valid_pred_smote <- predict(forest_smote, newdata = validation$Austria) # correggere validation set



# compare the predicted values with the actual values in the validation set

table(validation$Austria$pop_vote, valid_pred_orig)

table(validation$Austria$pop_vote, valid_pred_smote)


