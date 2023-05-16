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



## FACETS:

#Another way, particularly useful for categorical variables, is to split your plot into
#facets, subplots that each display one subset of the data.

# formula in R is a data structure and not a synonym for "equation". Therefore, the variable that
# you pass to facet_wrap() should be discrete

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# We can combine two variables with facet_grid function

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


# GEOMETRIC OBJECTS

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = TRUE
  )

# To display multiple geoms in the same plot, and multiple geom functions to ggplot():

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# You can avoid this type of repetition by passing a set of mappings to ggplot().

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(
    data = filter(mpg, class == "suv"),
    se = FALSE
  )


## STATISTICAL TRANSFORMATIONS

diamonds <- as.data.frame(diamonds)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color))


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity))


# ?geom_bar shows the default value for stat is “count,” which means that 
# geom_bar() uses stat_count().

# you can also use stat_count()


ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))


ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )

?geom_bar

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
    
  )

?stat_bin

## POSITION ADJUSTMENTS

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = color))


ggplot(
  data = diamonds,
  mapping = aes(x = cut, fill = clarity)
) +
  geom_bar(alpha = 1/5, position = "identity")

ggplot(
  data = diamonds, 
  mapping = aes(x = cut, color = clarity)
  ) +
  geom_bar(fill = NA, position = "identity")


ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )


ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )


## Overplotting
# This arrangement makes it hard to see where the mass of the data is.

# position = "jitter" adds a small amount of random noise
# to each point. This spreads the points out because no two points are
# likely to receive the same amount of random noise:

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(
    position = "jitter"
  ) + geom_smooth()

# WHY SHOULD WE USE POSITION = "JITTER" ? 
# Adding randomness seems like a strange way to improve your plot,
# but while it makes your graph less accurate at small scales, it makes
# your graph more revealing at large scales.

#?position_dodge, 
#?position_fill, 
#?position_identity, 
#?position_jitter, 
#?position_stack.

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")

?position_jitter
# width and heidht controls the amount of jitter


# COORDINATE SYSTEMS

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

# horizontally

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

### coord_quickmap() sets the aspect ratio correctly for maps.

nz <- map_data("nz")

?map_data

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()

## coord_polar() uses polar coordinates.

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)


bar + coord_flip()
bar + coord_polar()




