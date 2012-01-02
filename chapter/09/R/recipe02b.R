
require(maps)
require(ggplot2)
map.title="New York Counties"
book.recipe.02b<-function() {
  map("county","new york")
}

ny_map<-map_data("county","new york")
plot02.2 <-ggplot(ny_map)+
  geom_polygon(aes(long,lat,group=group),colour="black",fill="white")+
  theme_bw()+
  opts(title =map.title,
       plot.title = theme_text(vjust= 1.25),
       axis.title.x=theme_blank(),
       axis.title.y=theme_blank(),
       axis.text.x=theme_blank(),
       axis.text.y=theme_blank(),
       plot.margin = unit(c(4, 0.5, 6, 0.5), "lines"))

ggRecipe02b<-function() {
  print(plot02.2)
}
