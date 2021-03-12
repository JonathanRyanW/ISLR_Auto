library(ISLR)
library(ggplot2)

"The plot between mpg and cylinders is not beautiful because the cylinders
values are discrete. It is basically a categorical variable"
ggplot(Auto, aes(mpg, cylinders)) +
  geom_point(color="sky blue") +
  geom_smooth(method = "lm", se = F, color = "red") +
  xlab("Miles per Gallon") +
  ylab("Cylinder") +
  ggtitle("Miles per Gallon by Cylinder (Linear Regression)") +
  theme_bw()

"We can already see from the dots that as the less cylinders a car has, the
more mpg it can muster. However, we should still make histograms of mpg based on
cylinders rather than a scatter plot"
ggplot(Auto, aes(mpg)) +
  geom_histogram(fill = "white", color = "black") +
  facet_grid(as.factor(Auto$cylinders)) +
  xlab("Miles per Gallon") +
  ylab("Count") +
  ggtitle("Miles per Gallon by Cylinder") +
  theme_bw()

"Now we can see that as the number of cylinders increase, the car consumes more
fuel and thus the mpg drops."

ggplot(Auto, aes(mpg, displacement)) +
  geom_point(color = "sky blue") +
  geom_smooth(method = "lm", se = F, color = "red") +
  ggtitle("Miles per Gallon vs Engine Displacement (Linear Regression)") +
  xlab("Miles per Gallon") +
  ylab("Engine Displacement") +
  theme_bw()
"It looks like the relationship between mpg and displacement is not linear.
It looks more like quadratic."

"We are going to use another method to plot this relationship"
ggplot(Auto, aes(mpg, displacement)) +
  geom_point(color = "sky blue") +
  geom_smooth(group = 1, se = F, color = "red") +
  ggtitle("Miles per Gallon vs Engine Displacement") +
  xlab("Miles per Gallon") +
  ylab("Engine Displacement") +
  theme_bw()

"Now the relationship looks better represented by the line."

ggplot(Auto, aes(mpg, horsepower)) +
  geom_point(color = "sky blue") +
  geom_smooth(method = "lm", se = F, color = "red") +
  ggtitle("Miles per Gallon vs Horsepower (Linear Regression)") +
  xlab("Miles per Gallon") +
  ylab("Horsepower") +
  theme_bw()

"Again, the relationship seems to be non-linear. We are gonna fit another curve"
ggplot(Auto, aes(mpg, horsepower)) +
  geom_point(color = "sky blue") +
  geom_smooth(group = 1, se = F, color = "red") +
  ggtitle("Miles per Gallon vs Horsepower") +
  xlab("Miles per Gallon") +
  ylab("Horsepower") +
  theme_bw()

"The regression line is very bad, particularly bad at predicting horsepower
when the mpg is higher than 40. Please ook at the near end of the line. There
seems to be a minimum of horsepower a car can produce, the line simply can't
address this."

ggplot(Auto, aes(mpg, weight)) +
  geom_point(color = "sky blue") +
  geom_smooth(method = "lm", se = F, color = "red") +
  ggtitle("Miles per Gallon vs Car Weight (Linear Regression)") +
  xlab("Miles per Gallon") +
  ylab("Car Weight (lbs)") +
  theme_bw()
"Again, for the same reason as the previous 2 plots, we are going to fit another
curve."

ggplot(Auto, aes(mpg, weight)) +
  geom_point(color = "sky blue") +
  geom_smooth(group = 1, se = F, color = "red") +
  ggtitle("Miles per Gallon vs Car Weight") +
  xlab("Miles per Gallon") +
  ylab("Car Weight (lbs)") +
  theme_bw()

ggplot(Auto, aes(mpg, acceleration)) +
  geom_point(color = "sky blue") +
  geom_smooth(method = "lm", se = F, color = "red") +
  ggtitle("Miles per Gallon vs Acceleration (Linear Regression)") +
  xlab("Miles per Gallon") +
  ylab("Acceleration (seconds)") +
  theme_bw()

"This regression line looks ok. I'm sure a curve won't fit the data better."
