require(dplyr)

#Carregando o banco:
data(pnud_muni, package ='abjutils') #criando um data frame de pnud_muni
pnud_muni <- tbl_df(pnud_muni)
pnud_muni #se eu imprimir no console, n contará todas as linhas

#-------------------------SELECT:
  

#### Posso selecionar:
# por indice (nao recomendavel!)
# especificando nomes
# intervalos e funcoes auxiliares (começa por, tem, etc)

#selecioando algumas colunas
pnud_muni %>% select(uf, municipio, ano, gini, idhm)