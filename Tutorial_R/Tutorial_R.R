## R Objects
# Um objeto em R assume o papel de uma variável

a <- 1
class(a)
# "numeric"

a + 2
# 3


die <- 1:6
die
# [1] 1 2 3 4 5 6

class(die)
# "integer"


# Listando os objetos criados e que estão no ambiente
ls()
# "a" "b" "die"

die - 1
# 0 1 2 3 4 5

#R uses element-wise execution. When you manipulate a set of numbers, 
# R will apply the same operation to each
#element in the set. So for example, when you run die - 1, 
# R subtracts one from each element of die.


die + 1:2

# inner multiplication
die %*% die
#      [,1]
#[1,]   91


# outer multiplication

die %o% die

#        [,1] [,2] [,3] [,4] [,5] [,6]
# [1,]    1    2    3    4    5    6
# [2,]    2    4    6    8   10   12
# [3,]    3    6    9   12   15   18
# [4,]    4    8   12   16   20   24
# [5,]    5   10   15   20   25   30
# [6,]    6   12   18   24   30   36

??matrix

