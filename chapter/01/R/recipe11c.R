source("comboPlot.R")


require("sp")
require("maptools")
require("ggplot2")

gpclibPermit()
# import data
load(url("http://gadm.org/data/rda/GBR_adm1.RData"))
uk.gadm <-gadm


#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.11c <-function() {
  print(spplot(gadm,"Shape_Area"))
}

# ggplot data shaping
uk.polygon <-fortify(uk.gadm,region="ID_1")
uk.polygon$grCodes<-factor(cut(as.double((as.character(uk.polygon$group))),20,labels=FALSE))



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

plot11.3<-ggplot(uk.polygon,aes(long,lat,group=group)) +
  geom_polygon(aes(fill=grCodes))+opts(legend.position='none')


ggRecipe11.3<-function(){
  print(plot11.3)
}
