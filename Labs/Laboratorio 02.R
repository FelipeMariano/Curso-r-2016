## Exercícios Lab 03:
## Felipe Mariano

library(readr)
library(readxl)
library(dplyr)

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

##SQLITE:
arq <- 'C:/Users/felipe/Desktop/R Programming/pnud.sqlite'
dt_pnud_sqlite <- src_sqlite(arq) %>% tbl("pnud")


pnud_sqlite



########################PARTE 2:
library(readr)
library(httr)
link_pnud <- 'C:/Users/felipe/Desktop/R Programming/pnud_simplificado.rds'
pnud <- readRDS(tmp)
pnud



