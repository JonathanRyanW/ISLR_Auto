library(ISLR)
"The Auto dataset is part of the ISLR package. Information about the dataset can
be get from: https://rdrr.io/cran/ISLR/man/Auto.html"

table(Auto$origin)
"The origin variable is a numeric variable. There are 3 values, 1. American,
2. European, and 3. Japanese"

#Changing the origin variable to factors
data <- Auto
data$origin <- as.factor(data$origin)

#Creating scatter plots by origin
library(ggplot2)
index <- 1:392
data$index <- index

ggplot(data, aes(x = index, y = mpg)) +
  geom_point(aes(color = origin), size = 2, alpha = 0.5) +
  xlab("") +
  ylab("Miles per Gallon") +
  ggtitle("Miles per Gallon by Origin") +
  theme_bw()

"From this plot we get the idea that America are producing cars with low mpg
values. Europe and Japanese seems to be head to head in producing cars with mid
to high mpg values."

ggplot(data, aes(x = index, y = cylinders)) +
  geom_point(aes(color = origin), size = 2, alpha = 0.5) +
  xlab("Index") +
  ylab("Cylinders") +
  ggtitle("Cylinders by Origin") +
  theme(axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) +
  theme_bw()

ggplot(data, aes(x = index, y = displacement)) +
  geom_point(aes(color = origin), size = 2, alpha = 0.5) +
  xlab("Index") +
  ylab("Engine Displacement") +
  ggtitle("Engine Displacement by Origin") +
  theme_bw()

ggplot(data, aes(x = index, y = horsepower)) +
  geom_point(aes(color = origin), size = 2, alpha = 0.5) +
  xlab("Index") +
  ylab("Horsepower") +
  ggtitle("Horsepower by Origin") +
  theme_bw()

ggplot(data, aes(x = index, y = weight)) +
  geom_point(aes(color = origin), size = 2, alpha = 0.5) +
  xlab("Index") +
  ylab("Car Weight (lbs)") +
  ggtitle("Car Weight by Origin") +
  theme_bw()

ggplot(data, aes(x = index, y = acceleration)) +
  geom_point(aes(color = origin), size = 2, alpha = 0.5) +
  xlab("Index") +
  ylab("Acceleration (seconds)") +
  ggtitle("Acceleration by Origin") +
  theme_bw()

#Creating a dataframe of all the measures mean by origin
Measure <- c(names(Auto[1:6]), names(Auto[1:6]), names(Auto[1:6]))
Origin <- c(rep(1,6), rep(2,6), rep(3,6))

library(dplyr)
Mean <- NULL
for (i in 1:3){
  temp <- filter(data, origin == i)
  Mean <- c(Mean, sapply(temp, mean)[1:6]) 
}

Measure.Origin <- data.frame(Measure, Origin, Mean)
for (i in 1:18) {
  if (Measure.Origin[i,2] == 1) {
    Measure.Origin[i,2] <- "American"
  } else if (Measure.Origin[i,2] == 2){
    Measure.Origin[i,2] <- "European"
  } else {
    Measure.Origin[i,2] <- "Japanese"
  }
}

write.csv(Measure.Origin, file = "Measure by Origin.csv")

rm(index, i, Mean, Measure, Origin, temp)

"We can see that the americans are more interested in making strong, powerful,
and huge car that consumes fuel in a much larger scale than the european and
japanese cars. The European and Japanese are more interested in making fuel
friendly cars with low power but high efficiency. This fact probably shows the
difference in mentality between the countries. Americans are famous for always
searching for the biggest, most powerful thing. Americans take pride in owning
the best thing money can buy. The japanese and the europeans seems to care
about that considerable less."