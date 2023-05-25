
dataset <- read.csv("countries of the world (tratado).csv", sep = ";")
View(dataset)

summary(dataset)
str(dataset)

plot(dataset$Telefones..por.1000., dataset$Renda.Per.capita....)
modelo <- lm(dataset$Renda.Per.capita.... ~ dataset$Telefones..por.1000. , data = dataset)
abline(modelo, col="red", lwd = .5)


library(tidyverse)
library(ggplot2)

ggplot(data = dataset) +
  geom_point(mapping = aes(x = Renda.Per.capita...., 
                           y = Telefones..por.1000.), 
             position = "jitter") +
  geom_smooth(mapping = aes(x = Renda.Per.capita...., 
                            y = Telefones..por.1000.))

ggplot(data = dataset, mapping = aes(x = Renda.Per.capita...., 
                                     y = Telefones..por.1000.)) +
  geom_boxplot() +
  coord_flip()


## Quem é esse país (outlier)

which(dataset$Telefones..por.1000. > 1000) # Monaco [1] 139



###################


            
