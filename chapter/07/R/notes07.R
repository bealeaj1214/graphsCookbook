
require(reshape2)
require("ggplot2")
air<- read.csv("../data/airpollution.csv")
air.melt<-melt(air,na.rm=TRUE)

ggplot(air.melt,aes(variable,value)) + geom_boxplot(width=0.2)
