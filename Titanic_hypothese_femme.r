library(Hmisc)
library(corrplot)
library(PerformanceAnalytics)
library(dplyr)

# importation du dataset
df <- read.csv2(file="C:/Users/utilisateur/Documents/Mlearning/Brief_Projet_Titanic/titanic/train_modifie.csv",sep =",", encoding= "utf-8")

#suppression de colonnes
df <- df[ , - 1]
df <- df[ , - c(2:3)]
df <- df[ , - c(3:8)]

#suppression des noy�s
df <- data.frame(df[ which(df$Survived == 1), ])

#suppression des hommes
df_femmes <- data.frame(df[ which(df$Sex == 'female'), ])

#suppression colonnes Survived
df <- df[ , - 1]
df_femmes <- df_femmes[ , - 1]

#calcul du nb d'elements

nb1 = length(df)
nb2 = length(df_femmes)

# Question : Les femmes ont �t� privil�gi�s lors du naufrage.
# Hypoth�se H0 : les femmes n'ont pas �t� privil�gi�s / H1  :les femmes ont �t� privil�gi�s
# Test utilis� : Test de comparaison � une proportion
?prop.test

prop.test(nb2, nb1, p = 0.5, alternative = "greater",
          correct = F)

res <- prop.test(nb2, nb1, p = 0.5, alternative = "greater",
                      correct = F)

# Affichage de la p-value
res$p.value
# Affichage de la moyenne
res$estimate
# Affichage de l'intervalle de confiance
res$conf.int
# Affichage de la t value de Student
res$statistic


# Retours : la diff�rence entre les 2 moyennes n'est pas nulle
# Statistique de Pearson = 44.95906 
# p-value est le degr� de significativit� du test = 1.005984e-11
# L'intervalle de confiance de la moyenne � 95% est indiqu�
#
# p-value = 1.005984e-11 - Ce qui est largement inf�rieur � 0.05.
# On rejette l'hypoth�se 0 et on conclut que les femmes ont �t� privil�gi�s lors du naufrage.
