install.packages("ISLR")


library(MASS)
library(ISLR)

#### SIMPLE LINEAR REGRESSION ####
fix(Boston)
names(Boston)

?Boston

# lm(y ~ x, data)
lm.fit = lm(medv ~ lstat ,data = Boston)
#attach(Boston)
#lm(medv ~ lstat) 

summary(lm.fit)

names(lm.fit)
## lm.fit$coefficients = coef(lm.fit)

lm.fit$coefficients
coef(lm.fit)

# a confidence interval

confint(lm.fit)

predict(lm.fit, data.frame(
                    lstat=(c(5,10 ,15))),
                    interval ="confidence"
        )

predict(lm.fit, data.frame(
                lstat=(c(5,10 ,15))),
                interval ="confidence"
        )


plot(Boston$lstat, Boston$medv)
abline(lm.fit, lwd = 3, pch = 20, col = 'red')

?abline
plot(Boston$lstat, Boston$medv, pch = 20)
abline(lm.fit, lwd = 3, col = 'red')

par(mfrow=c(2,2))
plot(lm.fit)

par(mfrow=c(1,1))
plot(predict (lm.fit), residuals (lm.fit))

#studentized residuals
plot(predict (lm.fit), rstudent (lm.fit))


plot(hatvalues (lm.fit))
which.max(hatvalues (lm.fit))
# which.max identifies the index of the largest element of a vector.
