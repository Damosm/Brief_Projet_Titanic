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

#suppression des noyés
df <- data.frame(df[ which(df$Survived == 1), ])
#suppression des adultes
df_enfant <- data.frame(df[ which(df$Age < 18.0), ])

#suppression colonnes Survived
df <- df[ , - 1]
df_enfant <- df_enfant[ , - 1]

#test de pearson

r<-cor(df,df_enfant, method = "pearson")
cor.test(df,df_enfant,method = c("pearson"))


#matrice de correlation

m <- cor(df)
m
#Méthode de Pearson
mpears<-rcorr(as.matrix(df), type=c("pearson"))

#Méthode de Pearson
mspear<-rcorr(as.matrix(df), type=c("spearman"))

#test significativité
rcorr(m, type=c("pearson","spearman"))


#graphs
corrplot(m, type="upper", order="hclust", tl.col="black", tl.srt=45)
#corrplot(mpears, type="upper", order="hclust", tl.col="black", tl.srt=45)
#corrplot(mspear, type="upper", order="hclust", tl.col="black", tl.srt=45)



chart.Correlation(m, histogram=TRUE, pch=19)
#chart.Correlation(mpears, histogram=TRUE, pch=19)
#chart.Correlation(mspear, histogram=TRUE, pch=19)


symnum(m, abbr.colnames=FALSE)

