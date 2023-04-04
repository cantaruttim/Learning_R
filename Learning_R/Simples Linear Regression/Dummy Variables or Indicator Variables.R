# setwd("C:/Users/Matheus/OneDrive/Área de Trabalho/FATEC - BD Negócios/Projetos/Learning_R")

library(readr)
LungCapData <- read_csv("LungCapData2.csv")
View(LungCapData)

# We can include categorical or qualitative variables,
# also known as factors, in a regression model
# using dummy or indicator variables

CatHeight <- cut(LungCapData$Height, 
                 breaks=c(0,50,55,60,65,70,100), 
                 labels=c("A", "B", "C", "D", "E", "F")
          ) #(a,b] intervals

LungCapData$Height[1:10]
CatHeight[1:10]

class(CatHeight)
# [1] "factor"

levels(CatHeight)
#[1] "A" "B" "C" "D" "E" "F" (6 levels)

# Mean of each CatHeight levels
mean(LungCapData$LungCap[CatHeight=="A"])
mean(LungCapData$LungCap[CatHeight=="B"])
mean(LungCapData$LungCap[CatHeight=="C"])
mean(LungCapData$LungCap[CatHeight=="D"])
mean(LungCapData$LungCap[CatHeight=="E"])
mean(LungCapData$LungCap[CatHeight=="F"])
# The process above will include categorical variables
# in a Regression Model

model <- lm(LungCapData$LungCap ~ CatHeight)
summary(model)


#lm(formula = LungCapData$LungCap ~ CatHeight)

#Residuals:
#  Min      1Q  Median      3Q     Max 
#-5.3737 -0.8315 -0.0681  0.7748  6.8333 

#Coefficients:
# Estimate Std. Error t value
#(Intercept)   1.9412     0.2971   6.534
#CatHeightB    1.0348     0.3307   3.129
#CatHeightC    2.5486     0.3168   8.046
#CatHeightD    4.3445     0.3121  13.921
#CatHeightE    6.6045     0.3204  20.613
#CatHeightF    8.8171     0.3885  22.696
#Pr(>|t|)    
#(Intercept) 1.30e-10 ***
#  CatHeightB   0.00183 ** 
#  CatHeightC  4.09e-15 ***
#  CatHeightD   < 2e-16 ***
#  CatHeightE   < 2e-16 ***
#  CatHeightF   < 2e-16 ***
  ---
#  Signif. codes:  
#  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 1.394 on 648 degrees of freedom
#Multiple R-squared:  0.7152,	Adjusted R-squared:  0.713 
#F-statistic: 325.4 on 5 and 648 DF,  p-value: < 2.2e-16