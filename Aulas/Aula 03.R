require(dplyr)

#Carregando o banco:
data(pnud_muni, package ='abjutils')
pnud_muni <- tbl_df(pnud_muni)
pnud_muni #se eu imprimir no console, n contará todas as linhas

#-------------------------SELECT:

pnud_muni %>% select(uf, municipio, ano, gini, idhm)