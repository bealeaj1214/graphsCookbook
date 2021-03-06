source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"
require(maps)

base.recipe.11a <-function() {
  map('world',fill=TRUE,col=heat.colors(10))
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


world.df<-map_data("world")

plot11.1<-ggplot(world.df) +
  geom_polygon(aes(long,lat,group=group),colour="red",fill="white")+
  scale_colour_identity()+
  scale_fill_identity()+
  theme_bw()+
  opts(axis.title.x = theme_text(vjust=0.5),
       plot.margin = unit(c(4, 0.5, 6, 0.5), "lines"))

recipe11a <-function() {
  doComboPlot(doBasePlot=base.recipe.11a,gplot=plot11.1)
}
