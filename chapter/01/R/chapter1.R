require("tikzDevice")
options(tikzDefaultEngine = "xetex")
options( tikzLatex = "/usr/texbin/xelatex" )
options( tikzXelatex = "/usr/texbin/xelatex" )
options( tikzMetricsDictionary = "build/4tikzMetricsDictionary" )

width=7
height=4

source("recipe1a.R")

rollPicture<-function(baseName,plotFunc,
                      dirname="build/",typeName=".tex",
                      rp.standAlone=F,rp.width=width,rp.height=height,
                      rp.sanitize=FALSE,...){
 filename=paste(dirname,baseName,typeName,sep="")

 tikz(file=filename,standAlone=rp.standAlone,width=rp.width,height=rp.height,sanitize=rp.sanitize)

 plotFunc(...)

 garbage <- dev.off()
 cat("finished",filename , "\n")
 system(paste("./tikzDeviceRepair.sh" ,filename))
}

recipe1a<-function(){
  doComboPlot(doBasePlot=base.recipe.1a,gplot=plot1a)
}

rollPicture("recipe1a",recipe1a, rp.sanitize=TRUE)

#tikz(file="build/recipe1a.tex",standAlone=F,width=width,height=height,sanitize=TRUE)
#doComboPlot(doBasePlot=base.recipe.1a,gplot=plot1a)
#garbage <- dev.off()
#cat("finished recipe 1a\n")
#system(paste("./tikzDeviceRepair.sh" ,"build/recipe1a.tex"))

source("recipe1b.R")

recipe1b<-function(){
  doComboPlot(doBasePlot=base.recipe.1b,gplot=plot1b)
}

rollPicture("recipe1b",recipe1b)

#tikz(file="build/recipe1b.tex",standAlone=F,width=width,height=height)
#doComboPlot(doBasePlot=base.recipe.1b,gplot=plot1b)
#garbage <- dev.off()
#cat("finished recipe 1b\n")

source("recipe2a.R")

recipe2a<-function(){
  doComboPlot(doBasePlot=base.recipe.2a,gplot=plot2.1)
}

rollPicture("recipe2a",recipe2a)
#tikz(file="build/recipe2a.tex",standAlone=F,width=width,height=height)
#doComboPlot(doBasePlot=base.recipe.2a,gplot=plot2.1)
#garbage <- dev.off()
#cat("finished recipe 2a\n")

source("recipe3a.R")

recipe3a<-function() {
  doComboPlot(doBasePlot=base.recipe.3a,gplot=plot3.1)
}

rollPicture("recipe3a",recipe3a)

source("recipe3b.R")

recipe3b<-function() {
  doComboPlot(doBasePlot=base.recipe.3b,gplot=plot3b)
}

rollPicture("recipe3b",recipe3b)

source("recipe3c.R")

recipe3c<-function() {
  doComboPlot(doBasePlot=base.recipe.3c,gplot=plot3c)
}

rollPicture("recipe3c",recipe3c)


source("recipe3d.R")

recipe3d<-function(){
  doComboPlot(doBasePlot=base.recipe.3d,gplot=plot3d)
}

rollPicture("recipe3d",recipe3d)


source("recipe4a.R")

rollPicture("recipe4a",recipe4a,rp.sanitize=TRUE)


source("recipe4b.R")

rollPicture("recipe4b",recipe4b)

source("recipe4c.R")

rollPicture("recipe4c",recipe4c)



source("recipe7a.R")
rollPicture("baserecipe7a",base.recipe.7a)

rollPicture("ggRecipe7a",ggRecipe7a,rp.width=4.5,rp.height=5)
