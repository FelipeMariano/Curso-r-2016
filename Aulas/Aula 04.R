#install.packages("ggplot2")
#install.packages("maps")
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

view(economics)

ggplot(economics, aes(x = date, y = unemploy)) + geom_line()
ggplot(economics, aes(x = date, y = uempmed)) + geom_line()

#escalas dos dois diferentes, então:
#padronizo os 2 e deixo na msma escala:

economics %>%
  mutate(unemploy = ((unemploy - min(unemploy))/(max(unemploy) - min(unemploy))),
         uempmed = ((uempmed - min(uempmed))/(max(uempmed) - min(uempmed)))
  ) %>%
  ggplot(aes(date, unemploy)) + 
  geom_line() +
  geom_line(aes(y = uempmed), colour = "blue")


#padronizandos de outro jeito (melhor q o primeiro):
economics %>%
  select(date, unemploy, uempmed) %>%
  gather(indice, valor, -date) %>%
  group_by(indice) %>% 
  mutate(valor_padronizado = ((valor - min(valor))/(max(valor) - min(valor)))) %>%
  ggplot(aes(x = date, y = valor_padronizado, color = indice)) + geom_line() +
  scale_color_manual("Índice", values = c("grey", "sky blue"),
                     labels = c("Desemprego", "Tempo Desemprego")
                     ) +
  labs(x = "Data", y = "Valor")


#Colocar uma reta de regressão em um gráfico de dispersão:
ggplot(data = diamonds, aes(y = price, x = carat)) + 
  geom_point() + 
  geom_abline(intercept = -2256.361, slope = 7756.426, color = "light grey", 
              linetype = "dashed", size = 1)

#retorna slope (coef angular) e intercept
coef(lm(price ~ carat, data = diamonds))

#Outro jeito de aplicar:
ggplot(data = diamonds %>% sample_n(1000), aes(y = price, x = carat)) + 
  geom_point() + 
  geom_smooth(method = "lm") #ele tbm traz intervalo de confiança
#com smooth, paraca cada modelo de cut ele vai ajeitar:
ggplot(data = diamonds %>% sample_n(1000), aes(y = price, x = carat, color = cut)) + 
  geom_point() + 
  geom_smooth(method = "lm") +
  facet_wrap(~cut)


####Gráfico de barra: Quantidade de veículos por classe
diamonds %>%
  group_by(cut) %>%
  summarise(n = n()) %>%
  ggplot(aes(x = cut, y = n)) +
  geom_bar(stat = "identity")

# Mais fácil:
ggplot(diamonds, aes(x = cut)) +
  geom_bar()

####Mapa das ocorrências:
mapa <- map_data("world")

quakes %>%
  ggplot(aes(x=long, y=lat)) +
  geom_density2d(aes(size=stations)) +
  geom_map(aes(map_id=region), map=mapa, data=mapa)
