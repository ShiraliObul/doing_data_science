data1 <- read.csv("/Users/dilhumarablat/Desktop/dds_datasets/dds_ch2_nyt/nyt1.csv")
head(data1)

#categorize 
data1$agecat <- cut(data1$Age, c(-Inf, 0, 18, 24, 34, 44, 54, 64, Inf))

#view
summary(data1)

# Brackets 

install.packages("doBy")
library("doBy")
siterange <- function(x){c(length(x), min(x), mean(x), max(x))}
summaryBy(Age~agecat, data=data1, FUN=siterange)

# so only singed in users have ages and genders 
colnames(data1)

summaryBy(Gender + Signed_In + Impressions + Clicks~agecat, data = data1)


#Plot

install.packages("ggplot2")
library("ggplot2")
ggplot(data1, aes(x=Impressions, fill=agecat)) +geom_boxplot()
 