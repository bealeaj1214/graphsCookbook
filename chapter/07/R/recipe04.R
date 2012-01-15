require(ggplot2)

metals <- read.csv("../data/metals.csv")

main.tile<- "Summary of Copper\n concentrations by Site"

book.recipe.04 <-function(){
  boxplot(Cu ~Source,data=metals,
          varwidth=TRUE,notch=TRUE,
          main=main.title)
}

plot04.1 <-ggplot(data=metals,aes(Source,Cu))+
  geom_boxplot(notch=TRUE)+
  theme_bw()+
  opts(title=main.title)


ggRecipe04a<-function(){
  print(plot04.1)
}

recipe4a <-function() {
  doComboPlot(doBasePlot=book.recipe.04,gplot=plot04.1)
}
