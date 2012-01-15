require(reshape2)
require(ggplot2)

metals <- read.csv("../data/metals.csv")

main.title<- "Summary of metal\n concentrations by Site\n (without outliers)"

metals2 <-metals[,-1]
book.recipe.05 <-function(){
  boxplot(metals[,-1],outline=FALSE,
          main=main.title)
}

metals.melt <-melt(metals2)

##
# see stack overflow
#http://stackoverflow.com/questions/5677885/ignore-outliers-in-ggplot2-boxplot
#

#turn off outier.shape and adjust ylim  - 1.5*IQR + 3rd quartile
plot05.1<-ggplot(metals.melt,aes(variable,value))+
  geom_boxplot(outlier.shape=NA) +
  ylim(min(sapply(metals2,IQR,na.rm=TRUE)*-1.5 + sapply(metals2,fivenum)[2]),
       max(sapply(metals2,IQR,na.rm=TRUE)*1.5 + sapply(metals2,fivenum)[4]))+
  xlab("") +ylab("") +theme_bw()+
  opts(title=main.title)

ggRecipe05a<-function(){
  print(plot05.1)
}

recipe5a<-function() {
  doComboPlot(doBasePlot=book.recipe.05,gplot=plot05.1)
}
