source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
rain <-read.csv("../data/cityrain.csv")

#define common text

main.text="Monthly Rainfall in\nmajor cities"
ylab.text="Rainfall (mm)"
xlab.text="Month of Year"

base.recipe.10a <-function() {
 plot(rain$Tokyo,type="l",col="red",
      ylim=c(0,300),
      main=main.text,
      xlab=xlab.text,
      ylab=ylab.text,
      lwd=2)
 lines(rain$NewYork,type="l",col="blue",lwd=2)
 lines(rain$London,type="l",col="green",lwd=2)
 lines(rain$Berlin,type="l",col="orange",lwd=2)

 legend("topright",
        legend=c("Tokyo","NewYork","London","Berlin"),
        col=c("red","blue","green","orange"),
        lty=1,lwd=2)

}


# ggplot data shaping
months=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
rain2 <-rain
rain2$Month <-factor(rain2$Month,levels=months)

rain.melt<-melt(rain2,id=c("Month"))

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
plot10.1=ggplot(rain.melt)+geom_line(aes(Month,value,group=variable,colour=variable)) +
  scale_colour_manual("",values=c("red","blue","green","orange"),
                      guide=guide_legend(ncol=1))+
  scale_x_discrete(xlab.text) + scale_y_continuous(ylab.text,limits=c(0,300))+
  theme_bw()+
  opts(title=main.text,
       axis.text.x = theme_text(angle=90,hjust=1,vjust=0.5))

recipe10a <-function() {
doComboPlot(doBasePlot=base.recipe.10a,gplot=plot10.1)
}
