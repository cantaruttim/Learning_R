library(readr)
LungCapData <- read_csv("LungCapData2.csv")
View(LungCapData)


plot(LungCapData$Age, LungCapData$LungCap, main="Scatterplot")
mod <- lm(LungCapData$LungCap ~ LungCapData$Age)

abline(mod, col=2)


plot(mod)


# plot 4 graphs at  (Diagnostic plots)
par(mfrow=c(2,2))
plot(mod)


######## MULTIPLE LINEAR REGRESSION ##########
## MLR is useful for modelling the relationship between a 
## numeric outcome or dependent variable (Y) and multiple
## exploratory or independent variables (X)

help(lm)

model <- lm(LungCapData$LungCap ~ LungCapData$Age + LungCapData$Height )
summary(model)


cor(LungCapData$Age, LungCapData$Height, method="pearson")
# [1] 0.7919436

confint(model, conf.level=0.95)

#                        2.5 %          97.5%
#(Intercept)        -17.1525418    -14.5102552
#LungCapData$Age      0.1091993      0.2164848
#LungCapData$Height   0.3013531      0.3569179















