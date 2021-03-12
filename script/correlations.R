library(ISLR)
"The Auto dataset is part of the ISLR package."

library(corrplot)
corrplot(cor(Auto[,1:6]), method = "color")

"We can see a very strong negative correlation between mpg and all the other
variables except acceleration. This makes perfect sense, the more cylinders
a car has, the heavier it is, the more horsepower it can muster, the more fuel
it needs to operate, thus the less miles per gallon it has."