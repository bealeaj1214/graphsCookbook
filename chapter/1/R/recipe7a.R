source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)

#define common text

main.text="Car characteristics by Model"
#ylab.text="Number of units sold"

base.recipe.7a <-function() {
  heatmap(as.matrix(mtcars),Rowv=NA,Colv=NA,
          col=heat.colors(256),scale="column",
          margins=c(2,8),
          main=main.text)
}

# ggplot data shaping


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

mtcars2<-mtcars
mtcars2$name<-rownames(mtcars)
mtcars2$name<-factor(mtcars2$name,levels=c(mtcars2$name),ordered=TRUE)

mtcars2.melt<-melt(mtcars2,id.vars=c("name"))
mtcars2.melt <- ddply(mtcars2.melt, .(variable),transform,rescale=scale(value))

base_font_size=8

plot7.1<-ggplot(mtcars2.melt) +
  geom_tile(aes(x= variable,y=name,fill= rescale)) +
  scale_fill_gradientn(colours = heat.colors(256))+
  theme_bw(base_size = base_font_size) +
  opts(axis.title.x =theme_blank(),
       axis.title.y =theme_blank(),
       title=main.text, legend.position = "none",
       plot.margin = unit(c(2, 2, 2, 1), "lines"),
       plot.title =
       theme_text(vjust= 0.75,face="bold",size=base_font_size+6),
       panel.grid.major = theme_blank(),
       panel.border=  theme_blank())

recipe7a<-function(){
 doComboPlot(doBasePlot=base.recipe.7a,gplot=plot7.1)
}

ggRecipe7a<-function(){
  print(plot7.1)
}
