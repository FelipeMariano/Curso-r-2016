#Excel:

arq <- '_source/assets/dados/arq.txt'
dados <- read.table(file = arq, sep = ";", dec = ",", header = T, 
                    stringsAsFactors = F)
str(dados)

library(dplyr)
arq_diamonds <- '_source/assets/dados/diamonds.sqlite'

dados_sqlite <- src_sqlite(arq_diamonds) %>% tbl("diamonds")

dados_sqlite