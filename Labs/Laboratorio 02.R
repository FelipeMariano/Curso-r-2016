## Exercícios Lab 03:
## Felipe Mariano

library(readr)
library(readxl)
library(dplyr)
library(httr)
library(graphics)

##CSV:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud2_win.csv'
dt_pnud_csv <- read.table(file = arq, sep = ";", dec = ",", header = T, 
                    stringsAsFactors = F)
pnud_csv <- dt_pnud_csv[,c(1:10)]
summary(pnud_csv)


##XLSX:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud_win.xlsx'
dt_pnud_xlsx <- read_excel(arq, col_names = TRUE, na = "")
pnud_xlsx <- dt_pnud_xlsx[,c(1:10)]
summary(pnud_xlsx)


##TXT:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud_win.txt'
dt_pnud_txt <- read.table(file = arq, sep = " ", dec = ".", header = T, 
                           stringsAsFactors = F)
pnud_txt <- dt_pnud_txt[,c(1:10)]
summary(pnud_txt)

##RDA:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud.rda' 
dt_pnud_rda <- load(arq, .GlobalEnv)
pnud_rda <- dt_pnud_rda[,c(1:10)]
pnud_rda

##RDS:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud.rds' 
dt_pnud_rds <- readRDS(arq)
pnud_rds <- dt_pnud_rds[,c(1:10)]
summary(pnud_rds)

#~~ ~~~~~~ ~~~~ ~~~~~~
##SQLITE:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud.sqlite'



########################PARTE 2:

link_pnud <- 'C:/Users/felipe/Desktop/R Programming/pnud.rds'
pnud <- readRDS(link_pnud)

#Quais são os seis municípios com os maiores IDH municipais em 2010.
pnud %>% select(ano, ufn, idhm) %>% 
  filter(ano == 2010) %>% 
  arrange(desc(idhm)) %>% 
  head(6)

#Qual é a unidade federativa com menor expectativa de vida média, ponderada pela população dos municípios em 2000.
pnud %>% select(ano, espvida, ufn, popt) %>%  
  filter(ano == 2010) %>% group_by(ufn) %>%
  summarise(espvida_med = sum(espvida * popt)/sum(popt)) %>% 
  arrange(espvida_med) %>% head(1)

#Quais são os municípios outliers com relação ao índice de Gini em 1991 e em 2010 
#(Dica: utilize como critério para determinar outliers valores maiores que a média mais duas vezes o desvio padrão).
pnud %>% select(ano, gini, ufn) %>%
  filter(ano == 2010 | ano == 1991) %>% filter(gini > (mean(gini) + (2 * sd(gini))))

pnud %>% select(ano, ufn, rdpc, espvida) %>% arrange(desc(rdpc)) %>% head(10)
#quanto maior a renda per capita, maior a expectativa de vida!

#No nordeste o aumento de distribuição de renda foi maior do que no sudeste?
se <- c('Espírito Santo', 'Minhas Gerais', 'Rio de Janeiro', 'São Paulo')
ne <- c('Alagoas', 'Bahia', 'Ceará', 'Maranhão', 'Paraíba', 'Pernambuco', 'Piauí', 'Rio Grande do Norte', 'Sergipe')
n <- c('Acre', 'Amapá', 'Amazonas', 'Pará', 'Rondônia', 'Roraina', 'Tocantins')
s <- c('Paraná', 'Santa Catarina', 'Rio Grande do Sul')
co <- c('Distrito Federal', 'Goiás', 'Mato Grosso', 'Mato Grosso do Sul')

val1 <- 
pnud %>% filter(ufn %in% se) %>% group_by(ano) %>% summarise(x = mean(rdpc)) %>% summarise(media = mean(x))
val2 <- 
pnud %>% filter(ufn %in% ne) %>% group_by(ano) %>% summarise(x = mean(rdpc)) %>% summarise(media = mean(x))

if (val1 > val2){
  print('A renda do Sudeste aumentou mais que o Nordeste')
}else
{
  print('A renda do Sudeste não aumentou mais que o Nordeste')
}

#

