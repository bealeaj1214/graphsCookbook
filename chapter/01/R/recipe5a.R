source("comboPlot.R")

# import data
metals <-read.csv("../data/metals.csv")

#define common text

main.text="Atmospheric Metal Concentrations in London"
ylab.text="Atmospheric Concentration in ng per cubic metre"
ylab2.text="Atmospheric Concentration in\nng per cubic metre"
xlab.text="Metals"

base.recipe.5a <-function() {
  boxplot(metals, xlab=xlab.text,
          ylab=ylab.text,
          main=main.text)
}

# ggplot data shaping

metals.melt <-melt(metals,id=c("Source"))

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


base_font_size=8

plot5.1 <- ggplot(metals.melt,aes(variable,value))+geom_boxplot() +
  xlab(xlab.text) + ylab(ylab2.text) +
  theme_bw(base_size = base_font_size) +
  opts(title=main.text,
       axis.title.x = theme_text(vjust=-0.25)) 

recipe5a <-function() {
  doComboPlot(doBasePlot=base.recipe.5a,gplot=plot5.1)
}
