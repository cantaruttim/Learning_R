# Obs¹ Não esqueça! Se você estiver utilizando o RStudio assim como eu, inicie a sessão de trabalho
# para isso clique em Session, depois em Set Working Directory e CHoose Work Directory

gastos = c(60,45,	55,	66,	70,	90,	95,	77, 85,	86,	60,	90)
vendas = c(1150,	900,	1000,	1150,	1250,	1400,	1450,	1300,	1345,	1344,	1350,	1400)


# calcula a média das notas
mean(gastos)
mean(vendas)

str(gastos)
str(vendas)

################ PLOTAGEM BÁSICA ####################

plot(gastos, vendas)
lm(vendas ~ gastos)
abline( 568.590     ,   9.347   )

# adicionando a regressão ao modelo
abline(lm(vendas ~ gastos), col = "red")

##### UTILIZANDO O GGPLOT2 #######

library(ggplot2)
install.packages("ggplot2")

ggplot(mapping = aes(gastos, vendas)) +
  geom_point() +
  geom_smooth(method = "lm")


retas <- ggplot(mapping = aes(gastos, vendas)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm") + 
  geom_hline(yintercept = mean(vendas))
retas


####### VISUALIZANDO OS ERROS #######

retas +
  geom_segment(aes(x = gastos, y = vendas),
               xend = gastos, yend = mean(vendas), col="red")


retas +
  geom_segment(aes(x = gastos, y = vendas),
               xend = gastos, yend = predict(lm(vendas ~ gastos)), col = "red" )


####### CALCULANDO O R² #######

SQt = sum((mean(vendas) - vendas)**2)
SQres = sum((predict(lm(vendas ~ gastos)) - vendas)**2)
R2 = (SQt - SQres) / SQt
R2
0.7895924

# Utilizando a função summary
summary(lm(vendas ~ gastos))
