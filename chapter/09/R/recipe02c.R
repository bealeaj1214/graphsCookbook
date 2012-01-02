require(maps)
require(ggplot2)

#map.title="New York Counties"

book.recipe.02c<-function() {
  map("state", region=c("california","oregon","nevada"))
}

ca_or_nv<-map_data("state" , region=c("california","oregon","nevada"))
plot2.3<- ggplot(ca_or_nv)+
  geom_polygon(aes(long,lat,group=group),colour="black",fill="white")+
  theme_bw()+
  opts(axis.title.x=theme_blank(),
       axis.title.y=theme_blank(),
       axis.text.x=theme_blank(),
       axis.text.y=theme_blank(),
       plot.margin = unit(c(4, 5, 6, 4), "lines"))

ggRecipe02c<-function(){
  print(plot2.3)
}
