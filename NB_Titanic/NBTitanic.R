install.packages("mlr")
library(mlr)
train <- read.csv("C:/Users/Pandu/Desktop/Pandu_ course/CASE_STUDY/NB_Titanic/train.csv",header = TRUE)
test <- read.csv("C:/Users/Pandu/Desktop/Pandu_ course/CASE_STUDY/NB_Titanic/test.csv",header = TRUE)
train
summary(train)
str(train)
dim(train)
nrow(train)
names(train)

features = c("Pclass","Sex", "Age", "SibSp", "Parch", "Fare", "Embarked")
featuresTarget = c("Pclass","Sex", "Age", "SibSp", "Parch", "Fare", "Embarked", "Survived")

train_data = train[,featuresTarget]
test_data = test[,features]
colnames(train_data)
colnames(test_data)
PassengerId = test[,'PassengerId']


task = makeClassifTask(data = train_data, target = "Survived")
lrn = makeLearner("classif.naiveBayes")

task
lrn

model = train(lrn, task)
pred = as.data.frame(predict(model, newdata = test_data))

colnames(pred) = c("Survived")

PassengerIdPred = cbind(PassengerId,pred)

write.csv(PassengerIdPred, file = "C:/Users/Pandu/Desktop/Pandu_ course/CASE_STUDY/NB_Titanic/PassengerId Survived.csv", row.names = FALSE)
head(PassengerIdPred)




