require("rgdal")
require("RgoogleMaps")
require("ggplot2")
require("png")
require("gridExtra")

air <-read.csv("../data/londonair.csv")

london <-GetMap(center=c(51.51,-0.116),zoom=10,destfile="London.png",maptype="mobile")

PlotOnStaticMap(london,lat =air$lat, lon=air$long,cex=2)
img <-readPNG("London.png")
pngob<-rasterGrob(img)
longR<-as.numeric(sapply(london$BBOX,function(x) {x[2]}))
latR<<-as.numeric(sapply(london$BBOX,function(x) {x[1]}))

plot2<-ggplot(air,aes(long,lat))+geom_point(aes(size=10,shape=1)) +xlim(longR)+ylim(latR) +opts(panel.grid.major=theme_blank(),
                                                          panel.grid.minor=theme_blank(),
                                                          panel.border=theme_rect(colour="grey80", size=5),
                                                          axis.text.x=theme_blank(),
                                                          axis.text.y=theme_blank(),
                                                          axis.title.x=theme_blank(),
                                                          axis.title.y=theme_blank(),
                                                          legend.position="none")


dev.new()
plot2 + opts(panel.background=function(...)pngob)
