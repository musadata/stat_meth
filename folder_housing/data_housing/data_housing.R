#> Building linear regression 
#> 
#> https://www.statology.org/multiple-linear-regression-r/
library(readr)
usa_housing_kaggle <- read_csv("folder_housing/data_housing/usa_housing_kaggle.csv")
View(usa_housing_kaggle)

head(usa_housing_kaggle)
usa_housing_kaggle$YearBuilt <- as_date(usa_housing_kaggle$YearBuilt)
house <- usa_housing_kaggle[ , c("Price", "SquareFeet", "YearBuilt", "CrimeRate", "Bedrooms")]
pairs(house, pch = 18, col = "steelblue")

install.packages("GGally")
library(GGally)
ggpairs(house)

model <- lm(Price ~ SquareFeet + YearBuilt + CrimeRate + Bedrooms, data = house)
summary(model)

hist(residuals(model), col = "steelblue")
plot(fitted(model), residuals(model))
abline(h = 0, lty = 2)
