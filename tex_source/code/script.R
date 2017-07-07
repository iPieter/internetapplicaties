library(ISLR)
library(tree)

attach(Carseats)


range(Sales) #sales range from 0 to 16

#create categorical variable based on sales
High =ifelse(Sales>=8, "yes","No")
Carseats2 = data.frame(Carseats,High) #Toevoegen van een kolom
Carseats2 = Carseats2[-1] #verwijder 1e kolom

#split data into testing and training
set.seed(2) #to be able to reproduce the results with sample
train = sample(1:nrow(Carseats2),nrow(Carseats2)/2)
test = -train
training_data = Carseats2[train,]
test_data = Carseats2[test,]
testing_high = High[test]

#fit the tree model using training data
tree_model = tree(High~.,training_data)
plot(tree_model)
text(tree_model, pretty = 0)

#check how the model is doing using the test data
tree_pred = predict(tree_model, test_data, type = "class")
mean(tree_pred!=testing_high) #calculate misclassication error

#=================================================================
#=================================================================
#=================================================================
#=================================================================

data <- read.table("loan-data.csv",header = TRUE, sep=";")
data2 = data.frame(data)
data2 = data[-1] 

set.seed(2) #to be able to reproduce the results with sample
train = sample(1:nrow(data2),nrow(data2)/2)
test = -train
training_data = data2[train,]
test_data = data2[test,]

#fit the tree model using training data
tree_model = tree(Class~,training_data)
plot(tree_model)
text(tree_model, pretty = 0)

#check how the model is doing using the test data
tree_pred = predict(tree_model, test_data, type = "class")
mean(tree_pred!=testing_high) #calculate misclassication error

