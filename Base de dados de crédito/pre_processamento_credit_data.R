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
#entrar em contato com as pessoas para obter os dados seria a melhor opção 

#calcular media da idade
mean(base$age, na.rm = TRUE)
mean(base$age[base$age > 0], na.rm = TRUE)
base$age = ifelse(base$age < 0, mean(base$age[base$age > 0], na.rm = TRUE), base$age)