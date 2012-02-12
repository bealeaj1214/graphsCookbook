
require("ggplot2")
require("RgoogleMaps")


air <-read.csv("../data/londonair.csv")

london <-GetMap(center=c(51.51,-0.116),zoom=10,destfile="London.png",maptype="mobile")




lon_reader <-as.raster(london$myTile)

lonr<-as.numeric(sapply(london$BBOX,function(x) {x[2]}))
latr<-as.numeric(sapply(london$BBOX,function(x) {x[1]}))

plotLondon <- ggplot(air,aes(long,lat)) +
  annotation_raster(lon_reader,
                    lonr[1],lonr[2],
                    latr[1],latr[2]) +
  geom_point(size=3,shape=1) +
  scale_x_continuous(limits=lonr,expand=c(0,0))+
  scale_y_continuous(limits=latr,expand=c(0,0))
                    

googleLondon<-function() {
  PlotOnStaticMap(london,lat =air$lat, lon=air$long,cex=2)
}

ggLondon <-function(){
  print(plotLondon)
}
