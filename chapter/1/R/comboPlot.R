
require(gridBase)
require(ggplot2)

## layout function
vplayout <- function(x,y) { viewport(layout.pos.row=x, layout.pos.col=y)  }

doComboPlot<-function(doBasePlot,gplot,...){
  oldpar <- par(no.readonly = TRUE)
  # clean and clear out old plots
  grid.newpage()
  #setup widths parameter for grid.layout call
  unit. <- unit(c(1,1), c("null","null"))
  # create a layout 1 row, two columns
  pushViewport(viewport(layout = grid.layout(1, 2, widths = unit.)))

  # draw base gr
  pushViewport(viewport(layout.pos.col = 1, name = "A"))
  par(fig = gridFIG())
  par(new =TRUE)

  # use the knowledge for R programming advanced


  # use do.call to force exectution of base graphics functions  with empty args list
  doBasePlot(...)

  upViewport(1)

  # from ggplot book and help list
  # print the ggplot and pass a viewport
  print(gplot,vp= vplayout(1,2))
  par(oldpar)
}







