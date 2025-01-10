# 
# # Test 1: codice con Filippo ----
# 
# set.seed(123)
# 
# ## train the random forest model ----
# 
# forest = randomForest(pop_vote.y ~ ., data=train,
#                              proximity = T, 
#                              method = "rf",
#                              ntree=500, mtry=4, importance=TRUE)
# print(forest)
# 
# 
# 
# # predict the pop_vote using the validation set
# valid_pred <- predict(forest, newdata = valid)
# 
# # compare the predicted values with the actual values in the validation set
# table(valid$pop_vote, valid_pred)
# 



# Test 2: 10 fold cross validation ----

set.seed(123)

# Cross-validation 10fold, 5 times
repeat_cv <- trainControl(method='repeatedcv', number=10, repeats=5)

## Train random forest model
forest <- train(
  
  # Formula. We are using all variables to predict Species
  pop_vote ~ ., 
  
  # Source of data; remove the Species variable
  data=train, 
  
  # `rf` method for random forest
  method='rf', 
  
  # Add repeated cross validation as trControl
  trControl=repeat_cv,
  
  # Accuracy to measure the performance of the model
  metric='Accuracy')

## Print out the details about the model
forest$finalModel



# predict the pop_vote using the validation set
valid_pred <- predict(forest, newdata = valid)

# compare the predicted values with the actual values in the validation set
table(valid$pop_vote, valid_pred)




# Test 3: altro test cross validation ----

set.seed(123)

# Specify the number of folds
k <- 10

# Create a training control object for cross-validation
ctrl <- trainControl(method = "cv", number = k)

# Define the training parameters
rf_params <- expand.grid(mtry = 1:10)  # Example grid of hyperparameters

# Train the random forest model using cross-validation
forest <- train(pop_vote ~ ., data = train, 
                  method = "rf", 
                  trControl = ctrl, 
                  tuneGrid = rf_params)


print(forest)

performance_metrics <- forest$results

view(performance_metrics)


# predict the pop_vote using the validation set
valid_pred <- predict(forest, newdata = valid)

# compare the predicted values with the actual values in the validation set
table(valid$pop_vote, valid_pred)


