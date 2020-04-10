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


#Reparttion adulte enfants
df_enfant <- data.frame(df[ which(df$Age < 18.0), ])
df_adulte <- data.frame(df[ which(df$Age > 18.0), ])



# Question : Les enfants ont �t� privil�gi�s lors du naufrage.
# Hypoth�se H0 : les enfants n'ont pas �t� privil�gi�s / H1  :les enfants ont �t� privil�gi�s
# Test utilis� : chi2




# Test du chi2
?chisq.test
chisq.test(df_enfant,df_adulte,correct=FALSE)
# Affichage des r�sultats par valeur :
res <- chisq.test(df_enfant,df_adulte,correct=FALSE)
# Affichage de la p-value
res$p.value
# Affichage du degr� de libert�
res$parameter
# Affichage de la t value de Student
res$statistic


# p-value est le degr� de significativit� du test = 2.687949e-07

#
# p-value = 2.687949e-07 - Ce qui est largement inf�rieur � 0.05.
# On rejette l'hypoth�se 0 et on conclut que les moyennes des enfants ayant �t� sauv�s 
# et de toutes les personnes sauv�s ne sont pas identiques
