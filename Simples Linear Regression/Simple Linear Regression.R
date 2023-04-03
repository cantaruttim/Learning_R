# importing data

library(readr)
LungCapData <- read_csv("LungCapData2.csv")
View(LungCapData)

Age # retutn Ages
names(LungCapData) # return columns' names


class(Age) # "Numeric"

# plot
plot(LungCapData$Age, LungCapData$LungCap, main="Scatterplot")

cor(Age, LungCap) # [1] 0.756459
# positive fit capacity between Age and LungCapacity

help(lm)

#           Y        X
mod <- lm(LungCap ~ Age)

summary(mod)


#  lm(formula = LungCap ~ Age)
  
#  Residuals:
#    Min      1Q    Median      3Q     Max 
#  -4.7262 -1.0370 -0.1497  0.9637  6.3836 
  
#  Coefficients:
#    Estimate Std. Error t value Pr(>|t|)    
#  (Intercept)   -0.70506    0.23369  -3.017  0.00265 ** 
#    Age          0.66612    0.02256  29.533  < 2e-16 ***
#    ---
#    Signif. codes:  
#    0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#  
#  Residual standard error: 1.703 on 652 degrees of freedom
#  Multiple R-squared:  0.5722,	Adjusted R-squared:  0.5716 
#  F-statistic: 872.2 on 1 and 652 DF,  p-value: < 2.2e-16


attributes(mod)

mod$coefficients


coef(mod)


# Adding the regresion Line to the plot
plot(LungCapData$Age, LungCapData$LungCap, main="Scatterplot")
abline(mod, col=2, lwd=2)



confint(mod)

#                 2.5 %     97.5 %
#  (Intercept) -1.163924 -0.2461874
#  Age          0.621833  0.7104129

# Changing the level of confident


confint(mod, level=0.90)

#                 5 %       95 %
#  (Intercept) -1.0899822 -0.3201292
# Age          0.6289698  0.7032760


# ANOVA table for the linear regression

anova(mod) # correspond to the F-statistic: 872.2 on 1 and 652 DF,  p-value: < 2.2e-16
# from the linear regression model
  

# Analysis of Variance Table

# Response: LungCap
#             Df Sum Sq Mean Sq F value    Pr(>F)    
#  Age         1 2528.3  2528.3  872.18 < 2.2e-16 ***
#  Residuals 652 1890.0     2.9                      
#---
#   Signif. codes:  
#  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


sqrt(2.9) # [1] 1.702939
# Residual standard error: 1.703 on 652 degrees of freedom (lm model)








