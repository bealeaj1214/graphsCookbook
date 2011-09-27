source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
data.hist <-data.frame(x=rnorm(1000))

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.4a <-function() {
  hist(data.hist$x)
}

# ggplot data shaping


## ggplot

# remove lengend
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

plot4a<- ggplot(data.hist,aes(x)) + geom_histogram() + xlab("rnorm(1000)") + ylab("Frequency")+theme_bw()


doComboPlot(doBasePlot=base.recipe.4a,gplot=plot4a)
