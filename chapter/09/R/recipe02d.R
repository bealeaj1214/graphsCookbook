require(maps)
require(RColorBrewer)
require(ggplot2)

#map.title="New York Counties"
colors<-brewer.pal(7,"Set1")
book.recipe.02d<-function() {
  map("italy",fill=TRUE, col=colors)
}

italy_df<-map_data("italy")
italy_df$code <- factor(italy_df$group %%7 +1)
plot2.4<- ggplot(italy_df)+
  geom_polygon(aes(long,lat,group=group,fill=code),colour="black")+
  scale_fill_manual("",values=rev(colors)[c(1,7,6,5,4,3,2)])+
  theme_bw()+
  opts(axis.title.x=theme_blank(),
       axis.title.y=theme_blank(),
       axis.text.x=theme_blank(),
       axis.text.y=theme_blank(),
       plot.margin = unit(c(4, 2, 6, 4), "lines"))

ggRecipe02d<-function(){
  print(plot2.4)
}
