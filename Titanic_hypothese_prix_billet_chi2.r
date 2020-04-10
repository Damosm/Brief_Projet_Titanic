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
# Hypothèse H0 : le prix du billet a une influence / H1  :le prix du billet a une influence.
# Test utilisé : chi2




# Test du chi2
?chisq.test
chisq.test(df,df_survivants,correct=FALSE)
# Affichage des résultats par valeur :
res <- chisq.test(df,df_survivants,correct=FALSE)
# Affichage de la p-value
res$p.value
# Affichage du degré de liberté
res$parameter
# Affichage de la t value de Student
res$statistic


# p-value est le degré de significativité du test = 1.164764e-11

#
# p-value = 1.164764e-11 - Ce qui est largement inférieur à 0.05.
# On rejette l'hypothèse 0 et on conclut que 
# le prix du billet a une influence sur la survie d'un passager.

