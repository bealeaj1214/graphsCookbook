source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.6b <-function() {
  plot(cars$dist~cars$speed,
       xlim=c(0,30),
       ylim=c(0,150),
       xaxs="i",
       yaxs="i")
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

plot6.2 <-  ggplot(cars)+geom_point(aes(x=speed,y=dist)) +
  scale_x_continuous("cars$speed",limits=c(0,30),expand=c(0,0)) +
  scale_y_continuous("cars$dist",limits=c(0,150),expand=c(0,0))+ 
  theme_bw()   +
  opts(axis.title.x = theme_text(vjust=-0.25))

recipe6b <-function() {
  doComboPlot(doBasePlot=base.recipe.6b,gplot=plot6.2)
}
