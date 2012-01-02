
#package management
require(maps)
require(WDI)
require(RColorBrewer)
require(ggplot2)

# common text
map.title="CO2 emissions (kg per 2000 US$ of GDP)"

# how to do it
colors<- brewer.pal(7,"PuRd")
wgdp <-WDIsearch("gdp")
#w<-WDI(country="all",indicator=wgdp[4,1],start=2005,end=2005)
w<-WDI(country="all",indicator=wgdp[12,1],start=2005,end=2005)

w[63,1] <- "USA"

x<-map(plot=FALSE)

x$measure <-array(NA,dim=length(x$name))


for(i in 1:length(w$country)) {
  for(j in 1:length(x$names)) {
    if(grepl(w$country[i],x$names[j],ignore.case=TRUE))
      x$measure[j]<-w[i,4]
      #x$measure[j]<-w[i,3]
  }
}

sd<-data.frame(col=colors,
               values<-seq(min(x$measure[!is.na(x$measure)]),
                           max(x$measure[!is.na(x$measure)])*1.0001,
                           length.out=7))

sc<-array("#FFFFFF",dim=length(x$names))

for (i in 1:length(x$measure))
  if(!is.na(x$measure[i]))
  sc[i]=as.character(sd$col[findInterval(x$measure[i],
      sd$values)])


# Color Scale first
breaks <-sd$values
book.recipe.01a<-function() {
  #2- column layout with color scale to right of map
  layout(matrix(data=c(2,1), nrow=1, ncol=2),widths=c(8,1),
         heights=c(8,1))

  par(mar = c(5,1,10,7), oma=c(0.2,0.2,0.2,0.2), mex=0.25)
  
  image(x=1,y=0:length(breaks),z=t(matrix(breaks))*1.001,
        col=colors[1:length(breaks) -1],axes=FALSE,
        breaks=breaks,xlab="",ylab,xaxt="n")

  axis(side=4,at=0:(length(breaks) -1),
       labels=round(breaks),col="white",las=1)

  abline(h=c(1:length(breaks)),col="white",lwd=2,xpd=F)

  #Map
  map(col=sc,fill=TRUE,lty="blank")

  map(add=TRUE,col="gray",fill=FALSE)
  title(map.title)
}



# basic for ggplot
world.df<-map_data("world")
world.df$ucountry<-toupper(world.df$region)
x$ucountry<-toupper(x$names)
world.df.co<-subset(world.df,ucountry %in% toupper(w$country))

#extract country and CO2 data from the w data frame
w.aug<-w[,c(1,4)]
# rename columns for ease of use
names(w.aug) <-c("country","measure")
#upper case all country names
w.aug$country<-toupper(w.aug$country)
# use merge to ad CO2 measure data to map
world.df.merge<-merge(world.df.co,w.aug,by.x="ucountry",by.y="country",all.y=FALSE)

# use subset to drop all countries with data
world.df.co2<-subset(world.df.merge,!is.na(measure))
#merge operation didn't preserve order
world.df.co2<-world.df.co2[order(world.df.co2$order),]

#use findInteral trick from above to code  CO2 values
world.df.co2$codedMeas<-factor(findInterval(world.df.co2$measure,sd$values))

# use of manual fill scale
#http://learnr.wordpress.com/2009/04/15/ggplot2-qualitative-colour-palettes/

# plot the geo-coded data ploygon and overlap all world map with
# transparent fill outline all countries

plot01.1 <-ggplot(data=world.df.co2) +
  geom_polygon(aes(long,lat,group=group,fill=codedMeas),
               colour="gray")+
  geom_polygon(data=world.df,aes(long,lat,group=group),
               colour="gray",fill="transparent",legend=FALSE)+
  scale_fill_manual("C02 score",values=colors) +
  theme_bw() +
  opts(title =map.title,
       plot.margin = unit(c(4, 0.5, 6, 0.5), "lines"))


ggRecipe01a<-function() {
  print(plot01.1)
}
