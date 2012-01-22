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

# There is no ggplot2 equivalent of range 0
# we can  simulate this by using a linerange from min to max

metals.range<-
  as.data.frame(t(vapply(metals2,range,numeric(2),na.rm=TRUE)))
names(metals.range) <-c("min","max")
metals.range$col<-row.names(metals.range)
                               

main.title2="Summary of metal concentrations\n by Site"
plot08.2<-ggplot(metals.range)+
  geom_linerange(aes(col,ymin=min,ymax=max,group=1))+
  geom_boxplot(data=metals.melt,aes(variable,value),outlier.shape=NA) +
  xlab("") +ylab("") +theme_bw()+
  opts(title=main.title2)

ggRecipe08b<-function(){
  print(plot08.2)
}

recipe8b<-function() {
  doComboPlot(doBasePlot=book.recipe.08b,gplot=plot08.2)
}
