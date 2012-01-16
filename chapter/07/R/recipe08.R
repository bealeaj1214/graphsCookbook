require(reshape2)
require(ggplot2)

metals <-read.csv("../data/metals.csv")

metals2 <- metals[,-1]

book.recipe.08a <-function(){
  boxplot(metals[,-1],
          range=1,border="white",col="black",
          boxwex=0.3,medlwd=1,whiskcol="black",
          staplecol="black",outcol="red",cex=0.3,outpch=19,
          main="Summary of metal concentrations\n by Site (range=1)")
}

metals.melt<-melt(metals2)

main.title="Summary of metal concentrations\n by Site (ceof=1)"
plot08.1<-ggplot(metals.melt,aes(variable,value))+
  geom_boxplot(coef=1.0,outlier.colour="red") +
  xlab("") +ylab("") +theme_bw()+
  opts(title=main.title)

ggRecipe08a<-function(){
  print(plot08.1)
}

recipe8a<-function() {
  doComboPlot(doBasePlot=book.recipe.08a,gplot=plot08.1)
}


book.recipe.08b <-function(){
  boxplot(metals[,-1],
          range=0,border="white",col="black",
          boxwex=0.3,medlwd=1,whiskcol="black",
          staplecol="black",outcol="red",cex=0.3,outpch=19,
          main="Summary of metal concentrations\n by Site (range=0)")
}


main.title2="Summary of metal concentrations\n by Site (ceof=20)"
plot08.2<-ggplot(metals.melt,aes(variable,value))+
  geom_boxplot(coef=20.0,outlier.colour="red") +
  xlab("") +ylab("") +theme_bw()+
  opts(title=main.title2)

ggRecipe08b<-function(){
  print(plot08.2)
}

recipe8b<-function() {
  doComboPlot(doBasePlot=book.recipe.08b,gplot=plot08.2)
}
