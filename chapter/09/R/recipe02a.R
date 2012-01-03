
#package management
require(maps)
require(RColorBrewer)

require(ggplot2)



#how to do it
map.title=paste("Murder Rates in US States in 1973\n",
  "(arrests per 100,00 residents)")

us_map_list<-map("state",plot=FALSE)
x<-map("state",plot=FALSE)

#book

for( i in 1:length (rownames(USArrests))) {
  for( j in 1:length(x$names)){
    if(grepl(rownames(USArrests)[i],x$names[j], ignore.case=T))
      x$measure[j]<-as.double(USArrests$Murder[i])
  }
}

# use match to return index see help(match) on normalized names
us_map_list$measure<- USArrests$Murder[match(toupper(us_map_list$names), toupper(rownames(USArrests)))]

colors<-brewer.pal(7,"Reds")

values<-seq(min(x$measure,na.rm=TRUE),max(x$measure,na.rm=TRUE)*1.001,
            length.out=7)

sd<-data.frame(col=colors,values=values)

breaks<- sd$values

matchcol<- function(y){
  as.character(sd$col[findInterval(y,sd$values)])
}

book.recipe.02a<-function() {
  layout(matrix(data=c(2,1),nrow=1,ncol=2),
         widths=c(8,1), heights=c(8,1))

  #color scale first - construct by hand

  par(mar=c(10,1,10,3),oma=rep(.02,4),mex=0.5)
  image(x=0,y=0:length(breaks),z=t(matrix(breaks))*1.001,
        col=colors[1:length(breaks)-1], axes=FALSE, breaks=breaks,
        xlab="",ylab="",xaxt="n")
  axis(4,at=0:(length(breaks)-1),
       labels=round(breaks),col="white",las=1)
  abline(h=c(1:length(breaks)),col="white",lwd=2,xpd=F)

  #Map
  map("state",boundary=FALSE,col=matchcol(x$measure),
      fill=TRUE,lty="blank")

  map("state", col="white",add=TRUE)
  title(map.title,line=2)
}

states<-map_data("state")
arrests <-USArrests
names(arrests) <-tolower(names(arrests))
arrests$region<-tolower(rownames(USArrests))

choro<-merge(states,arrests,by="region")

#reorder because merge does not preserver order
choro <-choro[order(choro$order),]

choro$codeMurders <-factor(findInterval(choro$murder,sd$values))
plot02.1 <-ggplot(data=choro,aes(long,lat,group=group))+
  geom_polygon(aes(fill=codeMurders),colour="gray") +
  scale_fill_manual("murder rate",values=colors,
                    breaks=levels(choro$codeMurders),
                    labels=as.character(round(breaks[-1])) ) +
  coord_equal(ratio = 1)+
  theme_bw() +
  opts(title =map.title,
       plot.title = theme_text(vjust= 1.25),
       axis.title.x=theme_blank(),
       axis.title.y=theme_blank(),
       axis.text.x=theme_blank(),
       axis.text.y=theme_blank(),
       plot.margin = unit(c(2, 0.5, 3, 0.5), "lines"))

ggRecipe02a<-function() {
  print(plot02.1)
}
