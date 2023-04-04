library(readr)
LungCapData <- read_csv("LungCapData2.csv")
View(LungCapData)

?cut

CatHeight <- cut(LungCapData$Height, breaks=c(0,50,55,60,65,70,100), labels=c("A", "B", "C", "D", "E", "F")) #(a,b] intervals
#  It's important to especify the Labels !!!


LungCapData$Height[1:10]
#  [1] 57.0 67.5 54.5 53.0 57.0
# [6] 61.0 58.0 56.0 58.5 60.0

CatHeight[1:10]
# [1] C E B B C D C C C C
# Levels: A B C D E F