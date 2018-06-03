https://www.r-bloggers.com/understanding-naive-bayes-classifier-using-r/

#Getting started with Naive Bayes
#Install the package
install.packages(“e1071”)
install.packages("klaR")
#Loading the library
library(e1071)
#Next load the Titanic dataset
data(Titanic)
#Save into a data frame and view it
Titanic_df=as.data.frame(Titanic)
Titanic_df
head(Titanic_df)
summary(Titanic_df)
str(Titanic_df)
dim(Titanic_df)
nrow(Titanic_df)
colnames(Titanic_df)



#Creating data from table
#This will repeat each combination equal to the frequency of each combination
repeating_sequence=rep.int(seq_len(nrow(Titanic_df)), Titanic_df$Freq) 
#Create the dataset by row repetition created
Titanic_dataset=Titanic_df[repeating_sequence,]

head(Titanic_dataset)
summary(Titanic_dataset)
str(Titanic_dataset)
dim(Titanic_dataset)
nrow(Titanic_dataset)
colnames(Titanic_dataset)
#We no longer need the frequency, drop the feature
Titanic_dataset$Freq=NULL

#Fitting the Naive Bayes model
Naive_Bayes_Model=NaiveBayes(Survived ~., data=Titanic_dataset)
#What does the model say? Print the model summary
Naive_Bayes_Model

#Prediction on the dataset
NB_Predictions=predict(Naive_Bayes_Model,Titanic_dataset)
NB_Predictions
#Confusion matrix to check accuracy
table(NB_Predictions,Titanic_dataset$Survived)