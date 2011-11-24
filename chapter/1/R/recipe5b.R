source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
copper <-read.csv("../data/copper_site.csv")




#define common text
xlab.text= "Measurement Site"
ylab.text="Atmospheric Concentration of Copper in ng per cubic metre"
ylab.text2="Atmospheric Concentration of Copper\nin ng per cubic metre"
main.text="Atmospheric Copper Concentrations in London"
main.text2="Atmospheric Copper Concentrations\nin London"

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.5b <-function() {
  boxplot(copper$Cu~copper$Source,
          xlab=xlab.text,
          ylab=ylab.text2,
          main=main.text2)
}

# ggplot data shaping


## ggplot

# Remember apply opts post theme
# remove legend
#  opts(title=main.text, legend.position = "none") 

#  push x-axis title down
#  opts(axis.title.x = theme_text(vjust=-0.25))

# rotate the x-axis text
#   opts(axis.text.x = theme_text(angle=30,hjust=1,vjust=0.5))	

#  move y-axis title to left
#  opts( axis.title.y = theme_text(angle=90,vjust=0.02))

#  increase space between title and graph - bold title text
#  opts(plot.title = theme_text(vjust= 1.25,face="bold"))

#   adjust space around graph
#  opts(plot.margin = unit(c(2, 2, 2, 1), "lines"))

plot5.2 <- ggplot(copper,aes(Source,Cu)) + geom_boxplot() +
  xlab(xlab.text) +
  ylab(ylab.text2) +
  opts(title=main.text2) +  theme_bw() +
  opts(axis.title.x = theme_text(vjust=-0.25))


recipe5b <-function() {
  doComboPlot(doBasePlot=base.recipe.5b,gplot=plot5.2)
}
