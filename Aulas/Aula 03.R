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

#######
#Exercício
pnud_muni %>% select(uf, municipio, ano, gini, starts_with('idhm'))



#-------------------------FILTER:
#filtrando linhas 

pnud_muni %>% select (ano, uf, municipio, idhm) %>% filter(uf==35, idhm > .8, ano==2010)
# somente estado de SP, com IDH municipal maior que 80% no ano 2010
#posso usar & ==> filter(uf==35 & idhm > .8 & ano==2010)

# !is.na(x)
pnud_muni %>%
  select(ano, ufn, municipio, idhm, pea) %>%
  filter(!is.na(pea))

# %in%
pnud_muni %>%
  select(ano, ufn, municipio, idhm) %>%
  filter(municipio %in% c('CAMPINAS', 'SÃO PAULO'))

#######
#Exercício:

pnud_muni %>% select(ano, municipio, ufn, gini, contains('idhm')) %>% filter(ano == 2010 & gini > .5 | idhm > .7)


#-------------------------MUTATE:
#Novas variáveis devem ter o mesmo length que o nrow do bd oridinal ou 1.

# media de idhm_l e idhm_e
pnud_muni %>%
  select(ano, ufn, municipio, starts_with('idhm')) %>%
  filter(ano == 2010) %>%
  mutate(idhm2 = (idhm_e + idhm_l) / 2)

#cuidado com mean:
#se eu fizer mutate(idhm2 = mean(c(idhm_e, idhm_e))) , concatenarei tudo
#então uma alternativa:  %>% rowwise %>%   mutate(idhm2 = mean(c(idhm_e, idhm_l)))
#versão acima é mais demorada que a primeira, que já é vetorizada

#Exercício:
pnud_muni %>%
  select(ano, ufn, municipio, idhm) %>%
  filter(ano==2010) %>%
  mutate(idhm_porc = paste(round(idhm * 100, 1), '%'))

#-------------------------ARRANGE:
pnud_muni %>%
  select(ano, ufn, municipio, idhm) %>%
  filter(ano==2010) %>%
  mutate(idhm_porc = idhm * 100,
         idhm_porc_txt = paste(idhm_porc, '%')) %>%
  arrange(idhm) #ou arrange(desc(idhm))

#Exercício:
pnud_muni %>%
  select(ano, ufn, municipio, idhm) %>%
  filter(ano==2010) %>% 
  mutate(idhm_porc = paste(round(idhm * 100, 1), '%')) %>%
  arrange(desc(idhm)) %>% head(10) #head só mostra as primeiras, tail só as ultimas

#-------------------------SUMMARISE:
#retorna (de um data frame) e retorna um data frame com uma linha
#fica mais fácil para fazer os cálculos em uma linha

pnud_muni %>% summarise(media = mean(idhm), dp = sd(idhm))

#por ano:
pnud_muni %>%
  group_by(ano) %>%
  summarise(media = mean(idhm), dp = sd(idhm), n_municipios = n(), n_distinct(ufn)) 
#numero de estados ufn calculado em n_distinct n mudou de 91 a 2010


pnud_muni %>%
  filter(ano == 2010) %>%  
  count(ufn)


#Exercício: expectativa de vida média ponderada pela população
pnud_muni %>% filter(ano == 2000) %>%
  group_by(ufn) %>% summarise(x = sum(espvida * popt)/sum(popt))


#---------------------    TIDYR           ----------------------------------

library(tidyr)

#-------------------------SUMMARISE:
#"Joga" uma variável nas colunas
#espalhei a população pelos anos:
pnud_muni %>%
  group_by(ano, ufn) %>%
  summarise(populacao=sum(popt)) %>%
  ungroup() %>%
  spread(ano, populacao) 

#-------------------------GATHER:
#Empliha o baco de dados
pnud_muni %>%
  filter(ano == 2010) %>%
  select(ufn, municipio, starts_with('idhm_')) %>%
  gather(tipo_idh, idh, starts_with('idhm_'))
  
