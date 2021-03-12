library(ISLR)
"The Auto dataset is part of the ISLR package.Information about the dataset can
be get from: https://rdrr.io/cran/ISLR/man/Auto.html"

#Reading data.
auto <- Auto

"The origin values are as follows:
1. American
2. European
3. Japanese"

#Normalizing the Auto dataset
library(class)
auto <- data.frame(scale(auto[,1:6]))
auto$origin <- as.factor(Auto$origin)

#Splitting the data into training data and testing data
library(caTools)
set.seed(101)
sample <- sample.split(auto$origin, 0.7)

train <- auto[sample, 1:6]
test <- auto[!sample, 1:6]

train.origin <- auto[sample, 7]
test.origin <- auto[!sample, 7]

#Finding the best k value
library(class)

Prediction <- NULL
Error <- NULL

for (i in 1:20) {
  Prediction <- knn(train, test, train.origin, k = i)
  Error[i] <- mean(Prediction != test.origin)
}

k <- 1:20
k.error <- data.frame(k, Error)
ggplot(k.error, aes(k, Error)) +
  geom_point() +
  geom_line() +
  theme_bw()

write.csv(k.error, file = "Error Rate by K (Seed = 101).csv")
rm(i, Error, k, Prediction, sample)

"We find that the error rate is lowest for k = 5. We will use this value"

#Building the model
Prediction <- knn(train, test, train.origin, k = 5)
Result <- data.frame(Origin = test.origin, Prediction)
write.csv(Result, "KNN results.csv")

accuracy <- mean(Prediction == test.origin)

"We have 76% accuracy. It it not too bad. The question is, can we do better?"

#Creating the Confusion Matrix
Confusion.Matrix <- data.frame(matrix(nrow = 3, ncol = 3))
row.names(Confusion.Matrix) <- c("Actual Americans", "Actual Europeans", "Actual Japanese")
names(Confusion.Matrix) <- c("Predicted Americans", "Predicted Europeans", "Predicted Japanese")

for (i in 1:3) {
  for (j in 1:3) {
    Confusion.Matrix[i,j] <- sum(Result$Origin == i & Result$Prediction == j) / 117
  }
}

write.csv(Confusion.Matrix, file = "Confusion Matrix.csv")
rm(i,j, Prediction, test.origin, train.origin, test, train)
