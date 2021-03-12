library(ISLR)

# Which of the predictors are quantitative, and which are qualitative?
names(Auto)
"Quantitative:
1. mpg
2. weight
3. cylinders
4. displacement
5. horsepower
6. acceleration

Qualitative:
1. year
2. origin
3. name
"

#What is the range of each quantitative predictor?
sapply(Auto[,1:6], range)

#What is the mean and standard deviation of each quantitative predictor?
sapply(Auto[,1:6], mean)
sapply(Auto[,1:6], sd)

#Now remove the 10th through 85th observations. What is the range, mean, and
#standard deviation of each predictor in the subset of the data that remains?
sapply(Auto[c(1:9,86:392),1:6], range)
sapply(Auto[c(1:9,86:392),1:6], mean)
sapply(Auto[c(1:9,86:392),1:6], sd)

#Using the full data set, investigate the predictors graphically, using
#scatterplots or other tools of your choice. Create some plots highlighting the
#relationships among the predictors. Comment on your findings.
pairs(Auto[1:6])

"I have already done extensive EDA. The analysis can be read in the scripts in
the EDA folder."

#Suppose that we wish to predict gas mileage (mpg) on the basis of the other
# variables. Do your plots suggest that any of the other variables might
# be useful in predicting mpg? Justify your answer.

"Yes i am sure that we can use the displacement, cylinders, horsepower, and
weight to predict mpg. These 4 variables are all strongly negatively correlated
with mpg. This relationship makes perfect sense. The more cylinders a car has,
the more engine displacement, the more horse power, and the heavier the car, the
more fuel the car needs to consume in order to function. This is why the
correlation is negative. I am very sure that a linear model can be made to
accurately predict mpg based on these 4 values.

The acceleration variable can also be used to predict mpg. They are positively
correlated. Although it is weak. I am sure acceleration can help make our model
even more accurate.

In addition, i have found that the country of origin affects all of the measures
significantly. Cars from America are consistenly having less mpg and acceleration
and bigger cylinders, displacement, hp, and weight values than the European or
Japanese cars. This categorical variable can be used.

The year variable can also be useful to predict mpg. It could be that there is
a trend of efficiency. For example as time goes by the car manufacturers are
consistently finding ways to make their cars more fuel efficient."