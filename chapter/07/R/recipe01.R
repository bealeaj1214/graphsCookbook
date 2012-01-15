
require(reshape2)
require(ggplot2)

#import data
 data.air <- read.csv("../data/airpollution.csv")

#book
book.recipe.01a<-function() {
  boxplot(data.air,las=1)
}

book.recipe.01b<-function() {
  boxplot(data.air,boxwex=0.2,las=1)
}

air.melt <- melt(data.air,rm.na=TRUE)

# ggplot
plot01.1 <-ggplot(air.melt,aes(variable,value))+geom_boxplot()+
  xlab("")+ylab("")+theme_bw()

ggRecipe01a<-function() {
 print(plot01.1)
}




plot01.2 <-ggplot(air.melt,aes(variable,value))+geom_boxplot(width=0.2)+
  xlab("")+ylab("")+theme_bw()

ggRecipe01b<-function() {
 print(plot01.2)
}
#combo plot


recipe1a <-function() {
  doComboPlot(doBasePlot=book.recipe.01a,gplot=plot01.1)
}
recipe1b <-function() {
  doComboPlot(doBasePlot=book.recipe.01b,gplot=plot01.2)
}
