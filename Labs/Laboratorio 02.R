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



