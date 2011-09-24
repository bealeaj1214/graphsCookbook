source("comboPlot.R")

sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
main.text="Unit Sales in the month\nof January 2010"
ylab.text="Number of units sold"
base.recipe.2a <-function() {
  plot(sales$units~as.Date(sales$date,"%d/%m/%y"),
       type="l",
       main=main.text,
       xlab="Date",
       ylab=ylab.text,
       col="blue")
}

# ggplots datetime scale needs POSIXct datetimes
sales$date2 <- as.POSIXct(sales$date,format="%d/%m/%Y")

plot2.1 <- ggplot(sales) +
  geom_line(aes(date2,units,color="blue")) +
  scale_x_datetime(major="10 days") +
  scale_colour_identity()+
  xlab("Date")+ ylab(ylab.text) +
  theme_bw() +
  opts(title=main.text,
                         legend.position = "none") +
  opts(axis.title.x = theme_text(vjust=-0.25),
       axis.title.y = theme_text(angle=90,vjust=0.02),
       plot.title = theme_text(vjust= 1.25,face="bold"),
       plot.margin = unit(c(2, 2, 2, 1), "lines"))


doComboPlot(doBasePlot=base.recipe.2a,gplot=plot2.1)
