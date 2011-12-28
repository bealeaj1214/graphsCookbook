source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"
require(maps)

base.recipe.11b <-function() {
  map("state", interior=FALSE)
  map("state", boundary=FALSE, col="red",add=TRUE)
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
all_states <- map_data("state")
plot11.2 <-ggplot() +
  geom_polygon(data=all_states,aes(long,lat,group=group),
               colour="red",fill="white")+
  scale_colour_identity()+
  scale_fill_identity()+
  theme_bw()

recipe11b <-function() {
  doComboPlot(doBasePlot=base.recipe.11b,gplot=plot11.2)
}

ggRecipe11b<-function() {
  print(plot11.2)
}
