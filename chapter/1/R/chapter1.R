require("tikzDevice")
options(tikzDefaultEngine = "xetex")
options( tikzLatex = "/usr/texbin/xelatex" )
options( tikzXelatex = "/usr/texbin/xelatex" )
options( tikzMetricsDictionary = "build/4tikzMetricsDictionary" )


source("recipe1b.R")

width=6.5
height=4

tikz(file="build/recipe1b.tex",standAlone=F,width=width,height=height)
doComboPlot(doBasePlot=base.recipe.1b,gplot=plot1b)
garbage <- dev.off()
cat("finished recipe 1b\n")

source("recipe2a.R")

tikz(file="build/recipe2a.tex",standAlone=F,width=width,height=height)
doComboPlot(doBasePlot=base.recipe.2a,gplot=plot2.1)
garbage <- dev.off()
cat("finished recipe 2a\n")

source("recipe3a.R")

tikz(file="build/recipe3a.tex",standAlone=F,width=width,height=height)
doComboPlot(doBasePlot=base.recipe.3a,gplot=plot3.1)
garbage <- dev.off()

source("recipe3b.R")

tikz(file="build/recipe3b.tex",standAlone=F,width=width,height=height)
doComboPlot(doBasePlot=base.recipe.3b,gplot=plot3b)
garbage <- dev.off()


source("recipe3c.R")

tikz(file="build/recipe3c.tex",standAlone=F,width=width,height=height)
doComboPlot(doBasePlot=base.recipe.3c,gplot=plot3c)
garbage <- dev.off()



source("recipe3d.R")

tikz(file="build/recipe3d.tex",standAlone=F,width=width,height=height)
doComboPlot(doBasePlot=base.recipe.3d,gplot=plot3d)
garbage <- dev.off()

