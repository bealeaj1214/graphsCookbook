source("comboPlot.R")

base.recipe.1b <-function() {
  plot(cars$dist~cars$speed,
       main="Relationship between car \ndistance \\& speed",
       xlab="Speed (miles per hour)",
       ylab="Distance traveled (miles)",
       xlim=c(0,30),
       ylim=c(0,140),
       xaxs="i",
       yaxs="i",
       col="red",
       pch=19
       )

}

plot1b<-ggplot(cars)+geom_point(aes(x=speed,y=dist,color="red",shape=19)) +
scale_x_continuous("Speed (miles per hour)",limits=c(0,30),expand=c(0,0)) +
scale_y_continuous("Distance traveled (miles)",limits=c(0,140),expand=c(0,0))+ 
scale_colour_identity() +
theme_bw()      +       
opts(title="Relationship between car \ndistance \\& speed",
                         legend.position = "none") +
  opts(axis.title.x = theme_text(vjust=-0.25),
       plot.margin = unit(c(1, 2, 2, 1), "lines"))


doComboPlot(doBasePlot=base.recipe.1b,gplot=plot1b)
