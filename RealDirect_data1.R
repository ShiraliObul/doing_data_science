# Author Benjamin Reddy

install.packages("plyr")
library(plyr)
install.packages("gdata")
require(gdata)
mh<- read.xls("/Users/dilhumarablat/Desktop/dds_datasets/dds_ch2_rollingsales/rollingsales_brooklyn.xls", pattern ="BOROUGH")
head(mh)
summary(mh)
colnames(mh)
mh$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", mh$SALE.PRICE))
count(is.na(mh$SALE.PRICE.N))
names(mh) <- tolower(names(mh))
colnames(mh)


#Clean/format the data with regular expression
mh$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", mh$gross.square.feet))
mh$gross.sqft 

mh$land.sqft <- as.numeric(gsub("[^[:digit:]]","", mh$land.square.feet))
mh$land.square.feet
mh$land.sqft
mh$sale.date <- as.Date(mh$sale.date)                            
mh$year.built <- as.numeric(as.character(mh$year.built))

# do a bit of exploration to make sure there's not anything weird going o with sale price

attach(mh)
mh

hist(sale.price.n)
hist(sale.price.n[sale.price.n>0])
hist(sale.price.n[sale.price.n == 0])

detach(mh)
# keep only the actual sales

mh.sale <- mh[mh$sale.price.n!=0,]
mh.sale

plot(mh.sale$gross.sqft, mh.sale$sale.price.n)
plot(log(mh.sale$gross.sqft), log(mh.sale$sale.price.n))

# for now, let's look at 1-, 2-, and 3-family homes
mh.homes <- mh$