library(tidyverse)
hprice1 <- read_csv("https://www.dropbox.com/s/0p9uv60wk1ckxf0/HPRICE1.csv?dl=1")
options(scipen=999) # to disable scientific notation


# Question 1 --------------------------------------------------------------

fit <- lm(price ~ sqrft + bdrms, data = hprice1)

# Question 2 --------------------------------------------------------------
# What is the estimated increase in price for a house with one more bedroom, 
# holding square footage constant?
summary(fit)

# Answer: Holding square footage constant, price increases by 15.20, 
# which means $15,200.

# Question 3 --------------------------------------------------------------
# What is the estimated increase in price for a house with an additional bedroom
# that is 140 square feet in size? Compare this to your answer in part (2).
names(fit$coefficients)

fit$coefficients["sqrft"]*140 + fit$coefficients["bdrms"]*1

# ***ANSWER***:
# .128(140) + 15.20 = 33.12, or $33,120. Because the size of the house is 
# increasing, this is a much larger effect than in part (2).
.128*(140) + 15.20


# Question 4 --------------------------------------------------------------
# What percentage of the variation in price is explained by square footage 
# and number of bedrooms?

# ***ANSWER***: About 63.2%.


# Question 5 --------------------------------------------------------------

# The first house in the sample has sqrft = 2,438 and bdrms = 4. Find the 
# predicted selling price for this house from the OLS regression line.

# ***ANSWER***:
# The predicted price is –19.32 + .128(2,438) + 15.20(4) = 353.544, or $353,544

# Question 5 --------------------------------------------------------------
# The actual selling price of the first house in the sample was $300,000
# (so price = 300). Find the residual for this house. Does it suggest that the 
# buyer underpaid or overpaid for the house?

# ***ANSWER***:
# the estimated value of the home based only on square footage and number of 
# bedrooms is $353,544. The actual selling price was $300,000, which suggests 
# the buyer underpaid by some margin. But, of course, there are many other 
# features of a house (some that we cannot even measure) that affect price, and 
# we have not controlled for these.