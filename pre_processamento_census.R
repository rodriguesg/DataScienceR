#BASEADO NSO DADOS SOCIOECONOMICOS DE UMA PESSOA, SER CAPAZ DE PREVER 
#SE SUA RENDA ANUAL SER� MAIOR OU MENOR QUE 50K DOL POR ANO
base = read.csv('census.csv')
base$X = NULL

#TRANSFORMACAO DE ATRITOS NOMINAIS EM DISCRETOS
table(base$sex)
unique(base$sex)
#transformando masculino e feminino em 0 e 1
base$sex = factor(base$sex, levels = c(' Female', ' Male'), labels = c(0 , 1))
base[is.na(base$sex)]

base$workclass = factor(base$workclass, levels = c(' Federal-gov', ' Local-gov', ' Private', ' Self-emp-inc', ' Self-emp-not-inc', ' State-gov', ' Without-pay'), labels = c(1, 2, 3, 4, 5, 6, 7))
base$education = factor(base$education, levels = c(' 10th', ' 11th', ' 12th', ' 1st-4th', ' 5th-6th', ' 7th-8th', ' 9th', ' Assoc-acdm', ' Assoc-voc', ' Bachelors', ' Doctorate', ' HS-grad', ' Masters', ' Preschool', ' Prof-school', ' Some-college'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16))
base$marital.status = factor(base$marital.status, levels = c(' Divorced', ' Married-AF-spouse', ' Married-civ-spouse', ' Married-spouse-absent', ' Never-married', ' Separated', ' Widowed'), labels = c(1, 2, 3, 4, 5, 6, 7))
base$occupation = factor(base$occupation, levels = c(' Adm-clerical', ' Armed-Forces', ' Craft-repair', ' Exec-managerial', ' Farming-fishing', ' Handlers-cleaners', ' Machine-op-inspct', ' Other-service', ' Priv-house-serv', ' Prof-specialty', ' Protective-serv', ' Sales', ' Tech-support', ' Transport-moving'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14))
base$relationship = factor(base$relationship, levels = c(' Husband', ' Not-in-family', ' Other-relative', ' Own-child', ' Unmarried', ' Wife'), labels = c(1, 2, 3, 4, 5, 6))
base$race = factor(base$race, levels = c(' Amer-Indian-Eskimo', ' Asian-Pac-Islander', ' Black', ' Other', ' White'), labels = c(1, 2, 3, 4, 5))
base$native.country = factor(base$native.country, levels = c(' Cambodia', ' Canada', ' China', ' Columbia', ' Cuba', ' Dominican-Republic', ' Ecuador', ' El-Salvador', ' England', ' France', ' Germany', ' Greece', ' Guatemala', ' Haiti', ' Holand-Netherlands', ' Honduras', ' Hong', ' Hungary', ' India', ' Iran', ' Ireland', ' Italy', ' Jamaica', ' Japan', ' Laos', ' Mexico', ' Nicaragua', ' Outlying-US(Guam-USVI-etc)', ' Peru', ' Philippines', ' Poland', ' Portugal', ' Puerto-Rico', ' Scotland', ' South', ' Taiwan', ' Thailand', ' Trinadad&Tobago', ' United-States', ' Vietnam', ' Yugoslavia'), labels = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41))

#ESCALONAMENTO DOS ATRIBUTOS numericos

base[, 1] = scale(base[ ,1])
base[, 3] = scale(base[ ,3])
base[, 5] = scale(base[ ,5])
base[, 11:13] = scale(base[ ,11:13])




