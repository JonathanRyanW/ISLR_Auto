library(ISLR)
"The Auto dataset is part of the ISLR package.Information about the dataset can
be get from: https://rdrr.io/cran/ISLR/man/Auto.html"

"We will do some EDA on the year variable"

table(Auto$year)

"Ok so there are like 13 different year values. Each one of them does not differ
too much. If the data is distributed uniformly into the year variable, each
value would be 392/13 = 30.15. This data is almost uniformly distributed."

"Let us create a dataframe that shows the means of all the measurements based on
the year of the production."

Measure <- rep(names(Auto)[1:6], 13)
Year <- rep(70:82, 6)
Mean <- NULL

library(dplyr)
for (i in 70:82) {
  temp.data <- filter(Auto, year == i)
  Mean <- append(Mean, sapply(temp.data[,1:6], mean))
}

Measure.Year <- data.frame(Measure, Year, Mean)
Measure.Year <- arrange(Measure.Year, Measure, Year)
Measure.Year$Year <- Measure.Year$Year + 1900
write.csv(Measure.Year, file = "Measurement by Year.csv")
rm(i, temp.data, Mean, Measure, Year)

"We have successfully created our data frame. This data frame can then be used
to make plots to visualize the trend of all the measurements by year. However
we can't use it to view the trend by origin, which might be interesting, simply
because we didnt put origin as a factor when we filter the data. We can do it
after creating the plots."

#Creating line plots to find trends
library(ggplot2)

ggplot(filter(Measure.Year, Measure == "mpg"), aes(x = Year, y = Mean)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Miles per Gallon by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Miles per Gallon (Average)") +
  theme_bw()

"For some reason, the mpg values generally decreases all the way until 1975.
Afterwards, the mpg values increase again."

ggplot(filter(Measure.Year, Measure == "cylinders"), aes(x = Year, y = Mean)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Number of Cylinders by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Number of Cylinders (Average)") +
  theme_bw()

"The number of cylinders actually shows a decreasing trend. We can draw a trend
line channel much like analyzing the price movement of a stock."

ggplot(filter(Measure.Year, Measure == "displacement"), aes(x = Year, y = Mean)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Engine Displacement by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Engine Displacement (Average)") +
  theme_bw()

"Engine displacement also shows a decreasing trend"

ggplot(filter(Measure.Year, Measure == "horsepower"), aes(x = Year, y = Mean)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Horsepower by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Horsepower (Average)") +
  theme_bw()

"Horsepower also shows a decreasing trend."

ggplot(filter(Measure.Year, Measure == "weight"), aes(x = Year, y = Mean)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Car Weight by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Car Weight in lbs (Average)") +
  theme_bw()

"We found out that in general, the more recent cars are having less
cylinders, horsepower, and displacement . Could it be that as time goes
by the American car companies are getting much much weaker and cannot compete
with the Japanese and European car companies, which produces less powerful cars.

We can check this simply by finding the proportion of each origin by year."

Year <- rep(70:82, 3)
Origin <- c(rep(1,13), rep(2,13), rep(3,13))
Proportion <- NULL

for (i in 1:3) {
  temp.data <- filter(Auto, origin == i)
  Proportion <- append(Proportion, table(temp.data$year) / length(temp.data$year))
}

Proportion <- round(Proportion*100, 2)
Origin.Year <- data.frame(Year, Origin, Proportion)

write.csv(Origin.Year, file = "Origin by Year.csv")
rm(i, temp.data, Origin, Proportion, Year)

"Plotting the trend of origin proportion by year. We can do this easily with
Tableau. But let us use ggplot2 this time."

ggplot(filter(Origin.Year, Origin == 1), aes(x = Year, y = Proportion)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Proportion of American Cars by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Proportion of American Cars") +
  theme_bw()

"We can see a general trend much like those of stock prices. The general trend
for the proportion of American Cars is down. Bearish"

ggplot(filter(Origin.Year, Origin == 2), aes(x = Year, y = Proportion)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Proportion of European Cars by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Proportion of European Cars") +
  theme_bw()

"The proportion of European cars remain stagnant and showing down trend in the
last 2 years. From this fact and the previous plot, we can expect that the
proportion of Japanese cars is increasing"

ggplot(filter(Origin.Year, Origin == 3), aes(x = Year, y = Proportion)) +
  geom_point(size = 0.5) +
  geom_line(color = "#ffa500", size = 2) +
  ggtitle("Proportion of Japanese Cars by Year") +
  scale_x_continuous(breaks = 1970:1982) +
  ylab("Proportion of Japanese Cars") +
  theme_bw()

"Yes, our hypotheses is correct. The Japanese are dominating the car industry.
More and more people are buying Japanese cars."

"Another hypotheses might be that the market simply change. That as time goes on
people are getting less interested in having a powerful car and prefer the more
fuel efficient ones. But our data does not have variables to show this.
  
The same thing cannot be said about car weight. In general as time goes the car
weights become more varied. The manufacturers consistenly invent heavier cars as
well as lighter cars."