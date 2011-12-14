source("comboPlot.R")

# import data
genes <-read.csv("../data/genes.csv")
main.title="Gene Correlation Matrix"
rownames(genes) <-colnames(genes)
#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.7b <-function() {
  image(x=1:ncol(genes),
        y=1:nrow(genes),
        z=t(as.matrix(genes)),
        axes=FALSE,
        xlab="",  ylab="",
        main=main.title)
  axis(1,at=1:ncol(genes),labels=colnames(genes),col="white",
       las=2,cex.axis=0.8)
  axis(2,at=1:nrow(genes),labels=rownames(genes),col="white",
       las=1,cex.axis=0.8)

}

# ggplot data shaping
cgenes<-colnames(genes)

genes2<-genes
genes2$var<-factor(cgenes,levels=cgenes)

genes.melt<-melt.data.frame(genes2,id.vars=c("var"))


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

# use expand argument to remove expanded margin space

plot7.2 <-ggplot(genes.melt) +
  geom_tile(aes(x=variable,y=var,fill=value)) +
  scale_fill_gradientn(colours = heat.colors(12))+
  scale_x_discrete("",expand=c(0,0)) +
  scale_y_discrete("",expand=c(0,0))+
  theme_bw() +
  opts(axis.text.x = theme_text(angle=90),
       title=main.title,
       plot.title =
       theme_text(vjust= 0.75,face="bold",size=base_font_size+6))

#doComboPlot(doBasePlot=base.recipe.2a,gplot=plot2.1)
