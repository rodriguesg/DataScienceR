base = read.csv('credit_data.csv')
base$clientid = NULL
summary(base)

idade_invalida = base[base$age < 0 & !is.na(base$age), ]

#TRATAMENTO DE VALORES INCONSISTENTES

# 1 - apagar a coluna inteira
#base$age = NULL

# 2 - apagar somente os registros com problema
#base = base[base$age > 0,]

# 3 - preencher os dados manualmente
#entrar em contato com as pessoas para obter os dados seria a melhor op��o 

#calcular media da idade
mean(base$age, na.rm = TRUE)
mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, mean(base$age[base$age > 0], na.rm = TRUE), base$age)

#TRATAMENTO DE VALORES FALTANTES

base[is.na(base$age), ]
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)

#ESCALONAMENTO DE ATRIBUTOS

# 1 - Standardisation
# 2 - Normalization

base[, 1:3] = scale(base[, 1:3])

#pacote para dividir a base de dados em treinamento e teste
install.packages('caTools')
library(caTools)
set.seed(1)
divisao = sample.split(base$default, SplitRatio = 0.75)

base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)

