# https://drive.google.com/drive/folders/1E91Iex7YW5b6TyT4fo4F8un00vgIFrAr

library(tidyverse)

mpg <- as.data.frame(mpg)
summary(mpg)
str(mpg)

#'data.frame':	234 obs. of  11 variables:
#  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
#$ model       : chr  "a4" "a4" "a4" "a4" ...
#$ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
#$ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
#$ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
#$ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
#$ drv         : chr  "f" "f" "f" "f" ...
#$ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
#$ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
#$ fl          : chr  "p" "p" "p" "p" ...
#$ class       : chr  "compact" "compact" "compact" "compact" ...

# categorical columns in mpg : model, trans, drv, fl, class
# numerical columns in mpg : displ, year, cyl, cty, hwy

# A car with a low fuel efficiency consumes more fuel than
# a car with a high fuel efficiency when they travel the same disstance.

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))
# scatter showing a negative relationship between displ and hwy

# An aesthetic is a visual property of the objects in your plot. Aesthetics include things like the
# size, the shape, or the color of your points.


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))


## Changing plot's colors

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")




