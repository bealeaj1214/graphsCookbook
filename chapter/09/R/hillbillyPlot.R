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
latR<-as.numeric(sapply(london$BBOX,function(x) {x[1]}))

plot2<-ggplot(air,aes(long,lat))+geom_point(aes(size=10,shape=1)) +xlim(longR)+ylim(latR) +opts(panel.grid.major=theme_blank(),
                                                          panel.grid.minor=theme_blank(),
                                                          panel.border=theme_rect(colour="grey80", size=5),
                                                          axis.text.x=theme_blank(),
                                                          axis.text.y=theme_blank(),
                                                          axis.title.x=theme_blank(),
                                                          axis.title.y=theme_blank(),
                                                          legend.position="none")


dev.new()
print(plot2 + opts(panel.background=function(...)pngob))

junk<-sapply(list(lat=1,long=2),function(x){ sapply(c('ll','ur'),function(y,z){as.numeric(london$BBOX[[y]])[z]},x) })

junk2<-as.data.frame(junk)
cr<-LatLon2XY(london$lat,london$lon,london[['zoom']])

test<-Tile2R(LatLon2XY(junk2$lat,junk2$long,london[['zoom']]),cr)

as.data.frame(test)[1,]


xy.air<-as.data.frame(Tile2R(LatLon2XY(air$lat,air$long,london[['zoom']]),cr))

plot3<-ggplot(xy.air,aes(X,Y))+geom_point(aes(size=5,shape=1))+
  xlim(test$X)+ylim(test$Y)+
  scale_size_identity()+
  opts(panel.grid.major=theme_blank(),
       panel.grid.minor=theme_blank(),
       panel.border=theme_rect(colour="grey80", size=5),
       axis.text.x=theme_blank(),
       axis.text.y=theme_blank(),
       axis.title.x=theme_blank(),
       axis.title.y=theme_blank(),
       legend.position="none")
plot3 + opts(panel.background=function(...)pngob)

xy.air<-mutate(xy.air,Xadj=X+sign(X))


