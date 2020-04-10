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



#suppression colonnes Survived
df_survivants <- df[ , - 1]
df <- df[ , - 2]


# Question : Le prix du billet a une influence sur la survie d'un passager.
# Hypoth�se H0 : le prix du billet a une influence / H1  :le prix du billet a une influence.
# Test utilis� : chi2




# Test du chi2
?chisq.test
chisq.test(df,df_survivants,correct=FALSE)
# Affichage des r�sultats par valeur :
res <- chisq.test(df,df_survivants,correct=FALSE)
# Affichage de la p-value
res$p.value
# Affichage du degr� de libert�
res$parameter
# Affichage de la t value de Student
res$statistic


# p-value est le degr� de significativit� du test = 1.164764e-11

#
# p-value = 1.164764e-11 - Ce qui est largement inf�rieur � 0.05.
# On rejette l'hypoth�se 0 et on conclut que 
# le prix du billet a une influence sur la survie d'un passager.

