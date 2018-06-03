install.packages("mlbench")
library(mlbench)
data(HouseVotes84)
head(HouseVotes84)
dim(HouseVotes84)
summary(HouseVotes84)
str(HouseVotes84)
nrow(HouseVotes84)
colnames(HouseVotes84)

#barplots for specific issue
plot(as.factor(HouseVotes84[,2]))
title(main = "Votes cast for issue",xlab = "vote",ylab = "# reps")

#by party

plot(as.factor(HouseVotes84[HouseVotes84$Class == 'republican',2]))
title(main = "Republican Votes cast for issue 1", xlab = "vote", ylab = "# reps")
plot(as.factor(HouseVotes84[HouseVotes84$Class == 'democrat',2]))
title(main = "Democrat Votes cast for issue 1", xlab = "vote", ylab = "# reps")

#Functions needed for imputation
#function to return number of NAs by vote and class (democrat or republican)
na_by_col_class <- function (col,cls){return(sum(is.na(HouseVotes84[,col]) & HouseVotes84$Class==cls))}

