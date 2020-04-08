library(Hmisc)
library(corrplot)
library(PerformanceAnalytics)
library(dplyr)

# importation du dataset
df <- read.csv2(file="C:/Users/utilisateur/Documents/Mlearning/Brief_Projet_Titanic/titanic/train_modifie.csv",sep =",", encoding= "utf-8")


#suppression de colonnes
df <- df[ , - 1]
df <- df[ , - c(2:4)]
df <- df[ , - c(3:7)]


#conversion de Age en numeric
df$Age <- as.numeric(as.character(df$Age))

#suppression des noy�s
df <- data.frame(df[ which(df$Survived == 1), ])
#suppression des adultes
df_enfant <- data.frame(df[ which(df$Age < 18.0), ])

#suppression colonnes Survived
df <- df[ , - 1]
df_enfant <- df_enfant[ , - 1]

#calcul des variances

var1 = var(df)
var2 = var(df_enfant)


# Question : Les enfants ont �t� privil�gi�s lors du naufrage.
# Hypoth�se H0 : les enfants n'ont pas �t� privil�gi�s / H1  :les enfants ont �t� privil�gi�s
# Test utilis� : comparaison de moyennes de 2 �chantillons ind�pendants
# Conditions : les donn�es suivent une loi Normale, le nombre d'�chantillons > 30 : ok



# Test de Student
?t.test
t.test(df, df_enfant)
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
# Statistique de Student = 17.894
# Degr� de libert� = 339
# p-value est le degr� de significativit� du test = 3.907198e-56
# L'intervalle de confiance de la moyenne � 95% est indiqu�
#
# p-value = 3.907198e-56 - Ce qui est largement inf�rieur � 0.05.
# On rejette l'hypoth�se 0 et on conclut que les moyennes des enfants ayant �t� sauv�s 
# et de toutes les personnes sauv�s ne sont pas identiques



