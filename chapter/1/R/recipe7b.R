source("comboPlot.R")

# import data
genes <-read.csv("data/genes.csv")

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.2a <-function() {

}

# ggplot data shaping
cgenes<-colnames(genes)


genes$var<-factor(cgenes,levels=rev(cgenes))

genes.melt<-melt.data.frame(genes,id.vars=c("var"))


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
plot7.2 <-ggplot(genes.melt) +
  geom_tile(aes(x=variable,y=var,fill=value)) +
  theme_bw() +
  opts(axis.text.x = theme_text(angle=45))

#doComboPlot(doBasePlot=base.recipe.2a,gplot=plot2.1)
