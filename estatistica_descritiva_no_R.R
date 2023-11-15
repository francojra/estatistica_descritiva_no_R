
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

# Tabelas de frequências para variáveis categóricas ----------------------------------------------------------------------------------------

### Frequências absolutas

table(dados$Genero)
table(dados$Grau_de_Instruçao)

### Tabela cruzada com frequências absolutas

table(dados$Genero, dados$Grau_de_Instruçao)

### Frequências relativas

prop.table(table(dados$Genero))
prop.table(table(dados$Grau_de_Instruçao))
prop.table(table(dados$Genero, dados$Grau_de_Instruçao))

# Tabelas de frequências para variáveis quantitativas --------------------------------------------------------------------------------------

### Variáveis quantitativas discretas

table(dados$N_Filhos)
table(dados$Idade)

prop.table(table(dados$N_Filhos))
prop.table(table(dados$Idade))

### Variáveis quantitativas contínuas

#### Para valores contínuos apenas é possível criar faixas de valores

#### Passo 1: analisar a amplitude (valores máximos e mínimos)

range(dados$Salario)

#### Passo 2: avaliar a quantidade de categorias

nclass.Sturges(dados$Salario)

#### Passo 3: criação de tabela com faixas de valores

table(cut(dados$Salario, seq(0, 6, l = 7)))

#### A função cut() é responsável por dividir a tabela.
#### O l = 7 indica a quantidade de faixas, no caso, 7.
#### Interpretação: entre a categoria 0-1 existe 1 pessoa,
#### na categoria 1-2 existem 6 pessoas, e assim por diante.
#### Essa tabela mostra as faixas de salários e não os salários
#### em si.

# Função summary() - Média, mediana, quartis, máximos e mínimos ----------------------------------------------------------------------------

summary(dados$N_Filhos)
summary(dados$Salario)

# Funções describe() e describeBy() -  Média, desvio, erro, mediana, skew, kurtosis, etc. --------------------------------------------------

describe(dados$N_Filhos)

describeBy(dados$Salario, group = dados$Genero)

describeBy(dados$Salario, group = dados$Genero:dados$Grau_de_Instruçao)

# Função group_by do pacote dplyr ----------------------------------------------------------------------------------------------------------

tabela <- dados %>%
  group_by(Genero, Grau_de_Instruçao) %>%
  summarise(Media = mean(Salario),
            DP = sd(Salario),
            Mediana =  median(Salario))
tabela
View(tabela)
