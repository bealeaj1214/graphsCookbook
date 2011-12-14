require(gridBase)
require(ggplot2)
options(tikzDefaultEngine = "xetex")
options( tikzLatex = "/usr/texbin/xelatex" )
options( tikzXelatex = "/usr/texbin/xelatex" )
options( tikzMetricsDictionary = "build/4tikzMetricsDictionary" )
options(digits=6)
require("tikzDevice")

#tikz(file="build/recipe1a.tex",standAlone=F,width=5,height=3.75)
## layout function
vplayout <- function(x,y) { viewport(layout.pos.row=x, layout.pos.col=y)  }

opar <- par(no.readonly = TRUE)
grid.newpage()

# two columns, one row
unit. <- unit(c(1,1), c("null","null"))
pushViewport(viewport(layout = grid.layout(1, 2, widths = unit.)))

# draw base graphics
pushViewport(viewport(layout.pos.col = 1, name = "A"))
par(fig = gridFIG()); par(new = TRUE)
plot(cars$dist~cars$speed)
upViewport(1)

# plot.margin =unit( c(top,right, bottom,left), measure)

plot1<-ggplot(cars)+geom_point(aes(x=speed,y=dist)) +theme_bw() +opts(axis.title.x = theme_text(vjust=-0.25)) +  opts(plot.margin = unit(c(3, 2, 2, 1), "lines"))

print(plot1,vp= vplayout(1,2))

#garbage <- dev.off()
