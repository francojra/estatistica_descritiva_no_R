
# Estatísticas descritivas no R - Tabelas --------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 11/11/23 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://www.youtube.com/watch?v=jZvQ4N0nuDY&list=PLOw62cBQ5j9VE9X4cCCfFMjW_hhEAJUhU&index=5 ----------------------------------

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(dplyr)
library(psych)
library(stringi)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dados <- read.csv('Banco de Dados 2.csv', sep = ';', dec = ',', check.names = F)

### O read.csv usa como padrão a vírgula como separador de coluna 
### e o ponto como separador decimal. Por isso, é necessário informar.

### Como existe um nome de coluna com acento o argumento check.names = F
### impede do read.csv checar os nomes de colunas com caracteres especiais.

dados <- read.csv2('Banco de Dados 2.csv', check.names = F)

### Essa opção acima permite fazer a leitura do banco de dados que está
### com separador de colunas com ponto de vírgula e o separador decimal com 
### vírgula.

# Lidando com tabelas com acentos ----------------------------------------------------------------------------------------------------------

### O enconding indica como é codificado o caracter especial, como acentos.

dados <- read.csv2('Banco de Dados 2.csv', fileEncoding = 'latin1', 
                   stringsAsFactors = T)

### O stringsAsFactors transforma as variáveis categóricas em fatores.

# Como descobrir o encoding da tabela? -----------------------------------------------------------------------------------------------------

stringi::stri_enc_detect('Banco de Dados 2.csv')

### Essa função mostra a probabilidade de cada tipo de encoding e a
### linguagem.

# Visualizando o banco de dados ------------------------------------------------------------------------------------------------------------

View(dados)
glimpse(dados)

# Análises Descritivas ---------------------------------------------------------------------------------------------------------------------

### Frequências absolutas

table(dados$Genero)
table(dados$Grau_de_Instruçao)

### Tabela cruzada com frequências absolutas

table(dados$Genero, dados$Grau_de_Instruçao)

### Frequências relativas










