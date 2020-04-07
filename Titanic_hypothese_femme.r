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
# Test utilis� : comparaison de moyennes de 2 �chantillons ind�pendants
# Conditions : les donn�es suivent une loi Normale, le nombre d'�chantillons > 30 : ok

prop.test(nb2, nb1, p = 0.5, alternative = "greater",
          correct = F)

res <- prop.test(nb2, nb1, p = 0.5, alternative = "greater",
                      correct = F)
?prop.test
