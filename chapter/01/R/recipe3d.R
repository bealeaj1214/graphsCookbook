source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
sales <- read.csv("../data/citysales.csv",as.is=TRUE)
#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.3d <-function() {
  barplot(as.matrix(sales[,2:4]),beside=TRUE,
          legend=sales$City,
          col=heat.colors(5),
          border="white",
          horiz=TRUE)
}

# ggplot data shaping
sales$City2=factor(sales$City,levels=sales$City)
sales.melt=melt(sales,id=c("City2"),
  measure.vars=c("ProductA","ProductB","ProductC"))


## ggplot

# remove lengend
#  opts(title=main.text, legend.position = "none") 

#  push x-axis down
#  opts(axis.title.x = theme_text(vjust=-0.25))

#  move y-axis title to left
#  opts( axis.title.y = theme_text(angle=90,vjust=0.02))

#  increase space between title and graph - bold title text
#  opts(plot.title = theme_text(vjust= 1.25,face="bold"))

#   adjust space around graph
#  opts(plot.margin = unit(c(2, 2, 2, 1), "lines"))

plot3d <-ggplot(sales.melt) +geom_bar(aes(x=variable,y=value,fill=City2),position="dodge")+ xlab("") +ylab("")+ theme_bw()+ scale_fill_brewer(name="City")+
  coord_flip()

doComboPlot(doBasePlot=base.recipe.3d,gplot=plot3d)
