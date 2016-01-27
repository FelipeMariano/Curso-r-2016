#install.packages("ggplot2")
#Pastel on Dark
library(ggplot2)

head(mtcars)

#primeiro banco, dps quais variáveis irei usar e o tipo de gráfico = + geom_point()
ggplot(data = mtcars, aes(x = disp, y = mpg)) + geom_point()
#posso dividir o bd dos dados, da na mesma! 
ggplot(data = mtcars) + geom_point(aes(x = disp, y = mpg, colour = as.character(am)))

ggplot(data = mtcars) + geom_point(aes(x = disp, y = mpg, colour = as.character(am), size = cyl))

ggplot(data = mtcars) +
  geom_point(aes(x = disp, y = mpg), colour = "blue", size = 5, 
             shape = 2) #Aqui ele irá aplicar para todos os pontos, se eu quero aplicar para somente um tipo, coloco dentro do aes

ggplot(data = mtcars) +
  geom_boxplot(aes(x = as.character(gear), y = mpg, 
                   fill = as.character(gear)))


##
head(economics)
ggplot(economics, aes(date, unemploy)) + geom_line()

############################################################

ggplot(diamonds) + 
  geom_histogram(aes(price), color = 'light grey', fill = 'dark grey')

#banco de dados muito grande, visualização do gráfico fica ruim!
ggplot(data = diamonds) + 
  geom_point(aes(x = price, y = carat))

ggplot(data = diamonds) + 
  geom_point(aes(x = price, y = carat, color = cut), alpha = 0.1) +
  facet_wrap(~cut)
#editando alpha, edito a transparência dos pontos, tornando escuro como era antes somente onde há encontro de 10 pontos (no caso de 0.1)
#facet_wrap = separar os gráficos de acordo com o cut

ggplot(data = diamonds, aes(y = price, x = carat, color = cut)) + 
  geom_point(aes(color =  cut)) +
  geom_point(alpha = 0.1, size = 3) +
  facet_wrap(~cut) +
  labs(x = "Peso", y = "Preço", colour = "Corte") #define nome dos aspectos

###############################################################

library(dplyr)
library(tidyr)
