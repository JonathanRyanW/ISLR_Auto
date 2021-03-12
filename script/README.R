library(ISLR)
"The Auto dataset is part of the ISLR package.Information about the dataset can
be get from: https://rdrr.io/cran/ISLR/man/Auto.html"

"The descriptions of each variable
mpg: miles per gallon
cylinders: Number of cylinders between 4 and 8
displacement: Engine displacement (cu. inches)
horsepower: Engine horsepower
weight: Vehicle weight (lbs.)
acceleration: Time to accelerate from 0 to 60 mph (sec.)
year: Model year (modulo 100)
origin: Origin of car (1. American, 2. European, 3. Japanese)
name: Vehicle name

A data frame with 392 observations on the following 9 variables. The orginal
data contained 408 observations but 16 observations with missing values were
removed."

head(Auto)
names(Auto)

#Checking for NAs
any(is.na(Auto))

"There is no NA. Good news!"