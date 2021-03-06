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

#suppression des noy�s
df_survivants <- data.frame(df[ which(df$Survived == 1), ])

#suppression colonnes Survived
df <- df[ , - 1]
df_survivants <- df_survivants[ , - 1]

# Question : Le prix du billet a une influence sur la survie d'un passager.
# Hypoth�se H0 : le prix du billet a une influence / H1  :le prix du billet a une influence.
# Test utilis� : comparaison de moyennes de 2 �chantillons ind�pendants
# Conditions : les donn�es suivent une loi Normale, le nombre d'�chantillons > 30 : ok

# Test de Student
?t.test
t.test(df, df_survivants)
# Affichage des r�sultats par valeur :
res <- t.test(jeu1, jeu2)
# Affichage de la p-value
res$p.value
# Affichage de la moyenne
res$estimate
# Affichage de l'intervalle de confiance
res$conf.int
# Affichage du degr� de libert�
res$parameter
# Affichage de la t value de Student
res$statistic

# Retours : la diff�rence entre les 2 moyennes n'est pas nulle
# Statistique de Student = -5.598963 
# Degr� de libert� = 480
# p-value est le degr� de significativit� du test = 3.632247e-08
# L'intervalle de confiance de la moyenne � 95% est indiqu�
#
# p-value = 3.632247e-08 - Ce qui est largement inf�rieur � 0.05.
# On rejette l'hypoth�se 0 et on conclut que 
# le prix du billet a une influence sur la survie d'un passager.

