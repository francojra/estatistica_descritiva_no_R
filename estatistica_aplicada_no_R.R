
# Estatística Aplicada com R ---------------------------------------------------------------------------------------------------------------
# Autora do script: Jeanne Franco ----------------------------------------------------------------------------------------------------------
# Data: 27/09/23 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://www.youtube.com/watch?v=-XVQuVmlJyI ----------------------------------------------------------------------------------

# O que aprender? --------------------------------------------------------------------------------------------------------------------------

### Importação rápida e manipulação eficiente de diversas planilhas;
### Manipulação de dados de planilhas e arquivos como selecionar, 
### filtrar, criar, ordenar e sumarizar dados;
### Elaboração dos mais variados tipos de gráficos e produção
### de relatórios automáticos e reprodutíveis;
### Boas práticas de programação e projetos colaborativos.

# Iniciando a prática ----------------------------------------------------------------------------------------------------------------------

### Operações matemáticas

5 + 6
7 / 3
6 - 2
5 * 9
43 ^ 5

### Salvar objetos no ambiente (enviroment)

a <- 2 + 6 # salvar a operação em um objeto chamado 'a'
a # verificar o que tem no objeto

### Funções

b <- c(3, 5, 6, 2) # conjunto de valores salvos em um vetor 'b'
b
sum(b) # função de soma
sum(3, 5, 7, 2) # outra forma de usar a função
rm(b) # função para remover o objeto b

### Conjuntos numéricos ou listas são criadas usando o c() de combine

lista_alfab <- c('f', 'd', 'g', 'a', 't') # lista de caracteres
lista_alfab
lista_num <- c(5, 3, 7, 2) # lista com números
lista_num

# Dicas ------------------------------------------------------------------------------------------------------------------------------------

### Use um novo script (new file) para deixar todos seus códigos salvos;
### Utilize as teclas ctrl + l para limpar os dados do console;
### Tools -> Global options -> Appearance: para mudar, tema, tamanho
### de fonte, tipo de letra, etc;
### Crie um projeto no RStudio para salvar todos arquivos em um único
### diretório;
### Dentro do projeto crie as seguintes pastas: 'dados', 'resultados'
### e 'scripts'.

# Principais ambientes do R ----------------------------------------------------------------------------------------------------------------

### 1. Console: local onde estão os resultados os códigos;
### 2. Script: local onde ficam todos os códigos, documeto que pode ser salvo;
### 3. Files: arquivos e pastas do diretório de trabalho, onde poderão
### ficar salvos seus scripts, documentos, tabelas e gráficos;
### 4. Plots: local onde ficarão os gráficos produzidos pelos códigos;
### 5. Packages: pacotes do R que estão instalados e que apresentam
### funções para as análises.
### 6. Help: local onde estãos os documentos sobre pacotes e funções.

# Acessando posições em um conjunto de valores ---------------------------------------------------------------------------------------------

vetor <- c(5, 2, 1, 3, 9)
vetor

vetor[1:3] # acesando os valores entre as posições 1 e 3
vetor[4] # acessa o quarto elemento do conjunto
vetor[c(5,3)] # acessa os valores das posições 5 e 3
vetor[4] <- 80 # atribui o novo valor 80 à posição 4 do conjunto de dados
vetor
vetor < 5 # verifica cada valor do conjunto e atribui True ou False 

# Função ifelse( ) - "Se ou então" ---------------------------------------------------------------------------------------------------------

vetor

ifelse(test = vetor > 4, 
       "Esse valor é maior que 4", 
       "Esse valor não é maior que 4")

# Criando tabelas - data.frame( ) ----------------------------------------------------------------------------------------------------------

vetor

resultado <- ifelse(test = vetor > 70, 
                     "Risco", 
                     "Seguro")
resultado

tabela <- data.frame(valores = vetor, resultados = resultado)
tabela

# Listas -----------------------------------------------------------------------------------------------------------------------------------

list(vetor, tabela) # lista cada os elementos de cada argumento na função

# Tipos de objetos e pacotes ---------------------------------------------------------------------------------------------------------------

### Números, vetores, dataframes (tabelas), listas, matrizes

### Objetos
### - Numéricos (num ou dbl)
### - Caracter (chr)
### - Inteiro (int)
### - Lógico (lgl - True ou False)

class(vetor)
class(lista_alfab)
class(resultado)
class(tabela)
class(list(vetor, tabela))
class(matrix(vetor, 4, 5))
str(tabela) # mostra toda a estrutura (structure) da tabela

### Os pacotes são bibliotecas com conjuntos de funções criadas para
### facilitar operações ou análises desejadas. Algumas bibliotecas
### já vem instaladas no R-base e outras precisam ser instaladas no CRAN.

### - Função install.packages()
### - Função library()

### Para ler funções do pacote

readxl::
readxl::read_xlsx()