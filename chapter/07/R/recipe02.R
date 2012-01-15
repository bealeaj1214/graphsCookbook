require(ggplot2)

# import 
metals <- read.csv("../data/metals.csv")
main.title="Summary of Copper\n(Cu) concentrations by Site"
book.recipe.02 <-function() {
  boxplot(Cu~Source,data=metals,main=main.title)
}


plot02.1 <-ggplot(data=metals,aes(Source,Cu)) +
  geom_boxplot()+
  theme_bw()+
  opts(title=main.title)


ggRecipe02a<-function(){
  print(plot02.1)
}

recipe2a <-function() {
  doComboPlot(doBasePlot=book.recipe.02,gplot=plot02.1)
}
