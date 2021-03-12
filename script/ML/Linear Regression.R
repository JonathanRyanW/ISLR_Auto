library(ISLR)
"The Auto dataset is part of the ISLR package.Information about the dataset can
be get from: https://rdrr.io/cran/ISLR/man/Auto.html"

"We will create a linear model to predict mpg based on some of the variables in
the data."

linear.model <- lm(mpg ~ cylinders + displacement + horsepower + weight + acceleration + as.factor(origin), data = Auto)
summary(linear.model)

"We get a model with Adjusted R-squared: 0.7158. Not too bad, but also not
incredible. The model seems to not value displacement, acceleration, and
horsepower. Autocorrelation might be happening in the data."

"What if we include the year factor?"
linear.model <- lm(mpg ~ cylinders + displacement + horsepower + as.factor(year) + weight + acceleration + as.factor(origin), data = Auto)
summary(linear.model)

"Wow, we get a considerable better model with Adjusted R-squared: 0.8473. We are
going to use this model!"