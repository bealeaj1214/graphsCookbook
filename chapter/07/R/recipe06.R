require(reshape2)
require(ggplot2)

metals <- read.csv("../data/metals.csv")

main.title<- "Summary of metal\nconcentrations by Site"

metals2 <-metals[,-1]
book.recipe.06 <-function(){
  boxplot(metals[,-1],
          horizontal=TRUE,las=1,
          main=main.title)
}

metals.melt <-melt(metals2)

##
# see stack overflow
#http://stackoverflow.com/questions/5677885/ignore-outliers-in-ggplot2-boxplot
#


plot06.1<-ggplot(metals.melt,aes(variable,value))+
  geom_boxplot() + coord_flip() +
  xlab("") +ylab("") +theme_bw()+
  opts(title=main.title)

ggRecipe06a<-function(){
  print(plot06.1)
}

recipe6a<-function() {
  doComboPlot(doBasePlot=book.recipe.06,gplot=plot06.1)
}
