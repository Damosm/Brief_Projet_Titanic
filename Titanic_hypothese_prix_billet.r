library(Hmisc)
library(corrplot)
library(PerformanceAnalytics)
library(dplyr)

# importation du dataset
df <- read.csv2(file="C:/Users/utilisateur/Documents/Mlearning/Brief_Projet_Titanic/titanic/train_modifie.csv",sep =",", encoding= "utf-8")

#suppression de colonnes
df <- df[ , - 1]
df <- df[ , - c(2:8)]
df <- df[ , - c(3)]

#conversion de fare en numeric
df$Fare <- as.numeric(as.character(df$Fare))

#suppression des noyés
df_survivants <- data.frame(df[ which(df$Survived == 1), ])

#suppression colonnes Survived
df <- df[ , - 1]
df_survivants <- df_survivants[ , - 1]

#calcul des moyennes et ecart type et nb d'elements
m1 = mean(df)
m2 = mean(df_survivants)

std1 = sd(df)
std2 = sd(df_survivants)

nb1 = length(df)
nb2 = length(df_survivants)

# Question : Le prix du billet a une influence sur la survie d'un passager.
# Hypothèse H0 : le prix du billet a une influence / H1  :le prix du billet a une influence.
# Test utilisé : comparaison de moyennes de 2 échantillons indépendants
# Conditions : les données suivent une loi Normale, le nombre d'échantillons > 30 : ok

# Création des 2 jeux représentatifs
jeu1 <- rnorm(n=nb1,mean=m1,sd=std1)
jeu2 <- rnorm(n=nb2,mean=m2,sd=std2)

?t.test
t.test(jeu1, jeu2)
# Affichage des résultats par valeur :
res <- t.test(jeu1, jeu2)
# Affichage de la p-value
res$p.value
# Affichage de la moyenne
res$estimate
# Affichage de l'intervalle de confiance
res$conf.int
# Affichage du degré de liberté
res$parameter
# Affichage de la t value de Student
res$statistic

# Retours : la différence entre les 2 moyennes n'est pas nulle
# Statistique de Student = -6.120036
# Degré de liberté = 487
# p-value est le degré de significativité du test = 1.924927e-09
# L'intervalle de confiance de la moyenne à 95% est indiqué
#
# p-value = 1.924927e-09 - Ce qui est largement inférieur à 0.05.
# On rejette l'hypothèse 0 et on conclut que 
# le prix du billet a une influence sur la survie d'un passager.

