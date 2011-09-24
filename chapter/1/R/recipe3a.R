source("comboPlot.R")

# import data
sales <- read.csv("../data/citysales.csv",as.is=TRUE)

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.3a <-function() {
  barplot(sales$ProductA,names.arg= sales$City,col="black")
}

# ggplot data shaping
# use our own coding of the City column as factor preserving the
# original data order
sales$City2=factor(sales$City,levels=sales$City)


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
plot3.1 <- ggplot(sales) +geom_bar(aes(x=City2,y=ProductA)) +
  theme_bw() +xlab("")+ylab("") +
  opts(plot.margin = unit(c(2, 1, 2, 1), "lines"))
   

doComboPlot(doBasePlot=base.recipe.3a,gplot=plot3.1)
