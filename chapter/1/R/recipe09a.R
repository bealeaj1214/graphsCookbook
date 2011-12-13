source("comboPlot.R")

# import data
#sales <- read.csv("../data/dailysales.csv",as.is=TRUE)
set.seed(100)

r9.data<-lapply((1:6),function(x) { data.frame(data=rnorm(100),no=x,index=(1:100)) } )
r9.df<-do.call("rbind",(r9.data))
r9.colors=data.frame(color=c("blue","blue","green","black","green","orange"),no=(1:6))
r9.df.merge<-merge(r9.df,r9.colors)
r9.df.merge<-transform(r9.df.merge,row= 1 - (no %%2), col =(no -1)%/% 2)

#(1:6) %% 2
#((1:6) -1) %/% 2

#define common text

#main.text="Unit Sales in the month\nof January 2010"
#ylab.text="Number of units sold"

base.recipe.9a <-function() {
  par(mfrow=c(2,3))
  lapply((1:6),
         function(x){
           plot(r9.data[[x]]$data,ylab="rnorm(100)",col= as.character(r9.colors[x,'color']))
           x
         }
         )
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


plot9.1<-ggplot(r9.df.merge)+geom_point(aes(index,data,colour=color))+facet_wrap(~ no) +
  scale_colour_identity()+theme_bw()
