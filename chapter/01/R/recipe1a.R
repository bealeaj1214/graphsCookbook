source("comboPlot.R")

base.recipe.1a <-function() {
  plot(cars$dist~cars$speed)
}

# plot.margin -respectively: top, right, bottom, left
plot1a<-ggplot(cars)+geom_point(aes(x=speed,y=dist)) +theme_bw() +
  opts(axis.title.x = theme_text(vjust=-0.25),
       plot.margin = unit(c(4, 2, 2, 1), "lines"))

doComboPlot(doBasePlot=base.recipe.1a,gplot=plot1a)
