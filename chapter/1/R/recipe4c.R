source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
set.seed(15)
x=rnorm(1000)
data.hist <-data.frame(x=x)
x.density<-density(x)
#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.4c <-function() {
  plot(density(x))
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

# read plot.density to understand default label construction

plot4c <-ggplot(data.hist,aes(x)) + geom_density() + xlab(paste("N =",x.density$n,"Bandwidth =",formatC(x.density$bw))) + ylab("Density")+
  theme_bw()+
  opts(title="density.default (x= rnorm(1000))",
       plot.margin = unit(c(2, 2, 2, 1), "lines"),
       axis.title.x = theme_text(vjust=-0.5),
       axis.title.y = theme_text(angle=90,vjust=0.02),
       plot.title = theme_text(vjust= 1.5,face="bold",size=14))

recipe4c<-function() {
  doComboPlot(doBasePlot=base.recipe.4c,gplot=plot4c)
}
