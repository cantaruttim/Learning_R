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








#### GRÁFICOS

install.packages("esquisse")
install.packages("ggplot2")
library(esquisse)-
library(ggplot2)
library(sf)

data <- read.csv("dados.csv", header = TRUE)
View(data)

head(data)

# esquisser(data)


hist(data$Idade, xlab = "Idade", col="darkblue", border="red",
     probability = FALSE, xlim = c(0,100), ylim= c(0,12000), main="Frequência de Idades");
abline(v=median(data$Idade), col="green", lwd=2);
abline(v=mean(data$Idade), col="red", lwd=2);
abline(v=30, col="orange", lwd=2);
abline(v=50, col="orange", lwd=2);


## Adicionando de uma vez 

#abline(v = c(median(mtcars$mpg), mean(mtcars$mpg), 30),
#       col = c("blue", "red", "orange"),
#       lwd = c(2,2,4),
#       lty=c(1,2,3));

## Acrescentando a Legenda
legend(x="topright", #posicao da legenda
       c("Mediana","Média","Limite"), #nomes da legenda
       col=c("blue","red","orange"), #cores
       lty=c(1,2,3), #estilo da linha
       lwd=c(2,2,4)) #grossura das linhas


histograma<-hist(data$Idade, breaks = 20, ylim= c(0,12000), col="darkblue", xlim=c(10,95),main="Histograma Idades");
xfit<-seq(min(data$Idade),max(data$Idade))
yfit<-dnorm(xfit,mean=mean(data$Idade),sd=sd(data$Idade))
yfit <- yfit*diff(histograma$mids[1:2])*length(data$Idade)
lines(xfit, yfit, col="red", lwd=2)


??hist


## Graficos Exportados com o Esquisser

library(ggplot2)

ggplot(data) +
 aes(x = Idade, y = Altura, colour = Cor, size = Renda, group = Renda) +
 geom_point(shape = "diamond") +
 scale_color_gradient() +
 labs(x = "Idade (anos)", y = "Altura (m)", title = "Gráfico PNAD") +
 theme_bw() +
 facet_wrap(vars(Sexo), 
 scales = "free")


library(ggplot2)

ggplot(data) +
 aes(x = Idade, y = Altura, colour = Cor, size = Renda, group = UF) +
 geom_point(shape = "circle") +
 scale_color_gradient() +
 labs(x = "Idade (anos)", y = "Altura (m)", title = "Gráfico da PNAD") +
 theme_minimal() +
 facet_wrap(vars(Sexo))




## Question
# 1 Será que a renda está relacionada com a altura ?

