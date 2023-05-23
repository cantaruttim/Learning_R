require(stats)

notas <- data.frame(alunos = c(1,2,3,4,5,6,7),
                    notas = c(5.5, 6.8, 7.0, 9.5, 10.0, 4.3, 2.5)
                    )

str(notas)
View(notas)
plot(notas)

# calcula a média das notas
mean(notas$notas) 
notas["xmédia"] <- mean(notas$notas)
View(notas)

# Cácular a diferente de xi - xmédia
notas["xi - xmédia"] <- notas$notas - mean(notas$notas) 
View(notas)

# Elevar a diferença ao quadrado
notas["(xi - xmédia)²"] <- ( notas$notas - mean(notas$notas) )**2
View(notas)
