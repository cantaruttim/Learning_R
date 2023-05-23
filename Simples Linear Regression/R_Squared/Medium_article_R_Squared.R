require(stats)

gastos = c(60,45,	55,	66,	70,	90,	95,	77, 85,	86,	60,	90)
vendas = c(1150,	900,	1000,	1150,	1250,	1400,	1450,	1300,	1345,	1344,	1350,	1400)

vendas.propagandas <- data.frame(
  
  mês = c('Jan', 'Fev', 'Mar', 'Abr', 'Maio', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez', 
          'Jan', 'Fev', 'Mar', 'Abr', 'Maio', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'),
  gastos = c(60,45,	55,	66,	70,	90,	95,	77, 85,	86,	60,	90,
             58,48,	59,	69,	76,	93,	94,	79, 88,	89,	70,	95),
  vendas = c(1150,	900,	1000,	1150,	1250,	1400,	1450,	1300,	1345,	1344,	1350,	1400,
             1350,	1900,	1200,	1250,	1450,	1450,	1550,	1350,	1355,	1354,	1355,	1700),
  ano = c(2020,2020,2020,2020,2020,2020,2020,2020,2020,2020,2020,2020,
          2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021)

)

View(vendas.propagandas)

# calcula a média das notas
mean(vendas.propagandas$gastos)
mean(vendas.propagandas$vendas)


##############################################

plot(vendas.propagandas$gastos, vendas.propagandas$vendas)
lm(vendas.propagandas$vendas ~ vendas.propagandas$gastos)
abline( 953.889    ,    5.236 )

abline(lm(vendas.propagandas$vendas ~ vendas.propagandas$gastos), col = "red")


plot(gastos, vendas)
lm(vendas ~ gastos)
abline( 568.590     ,   9.347   )

abline(lm(vendas ~ gastos), col = "red")

## com ggplot2

library(ggplot2)

ggplot(mapping = aes(vendas.propagandas$gastos, vendas.propagandas$vendas)) +
  geom_point() +
  geom_smooth(method = "lm")


ggplot(mapping = aes(gastos, vendas)) +
  geom_point() +
  geom_smooth(method = "lm")



retas <- ggplot(mapping = aes(vendas.propagandas$gastos, vendas.propagandas$vendas)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm") + 
  geom_hline(yintercept = mean(vendas.propagandas$vendas))
retas


retas2 <- ggplot(mapping = aes(gastos, vendas)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm") + 
  geom_hline(yintercept = mean(vendas))
retas2


# visualizando os erros

retas +
  geom_segment(aes(x = vendas.propagandas$gastos, y = vendas.propagandas$vendas),
               xend = vendas.propagandas$gastos, yend = mean(vendas.propagandas$vendas), col="red")

retas +
  geom_segment(aes(x = gastos, y = vendas),
               xend = gastos, yend = mean(vendas), col="red")

retas +
  geom_segment(aes(x = vendas.propagandas$gastos, y = vendas.propagandas$vendas),
               xend = vendas.propagandas$gastos, yend = predict(lm(vendas.propagandas$vendas ~ vendas.propagandas$gastos)), col = "red" )

retas +
  geom_segment(aes(x = gastos, y = vendas),
               xend = gastos, yend = predict(lm(vendas ~ gastos)), col = "red" )


## Calculando o R²

SQt = sum((mean(vendas.propagandas$vendas) - vendas.propagandas$vendas)**2)
SQres = sum((predict(lm(vendas.propagandas$vendas ~ vendas.propagandas$gastos)) - vendas.propagandas$vendas)**2)
R2 = (SQt - SQres) / SQt
R2
0.1655023


SQt = sum((mean(vendas) - vendas)**2)
SQres = sum((predict(lm(vendas ~ gastos)) - vendas)**2)
R2 = (SQt - SQres) / SQt
R2
0.7895924