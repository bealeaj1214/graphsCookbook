
source("comboPlot.R")

test<- function() { plot(cars$dist~cars$speed) }

plot1<-ggplot(cars)+geom_point(aes(x=speed,y=dist)) +theme_bw() +opts(axis.title.x = theme_text(vjust=-0.25)) +  opts(plot.margin = unit(c(3, 2, 2, 1), "lines"))


doComboPlot(doBasePlot=test,gplot=plot1)
