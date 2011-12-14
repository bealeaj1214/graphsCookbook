
set.seed(100)
#r9.data<-lapply((1:6),function(x) { rnorm(100) } )

r9.data<-lapply((1:6),function(x) { data.frame(data=rnorm(100),no=x) } )
r9.df<-do.call("rbind",(r9.data))
df.colors=list("blue","blue","green","black","green","orange")
#r9.data[[1]]$data

par(mfrow=c(2,3))
#lapply((1:6),function(x){ plot(r9.data[[x]]$data,ylab="rnorm(100)"); x})
lapply((1:6),function(x){ plot(r9.data[[x]]$data,ylab="rnorm(100)",col=df.colors[[x]]); x})

par(mfcol=c(2,3))
lapply((1:6),function(x){ plot(r9.data[[x]]$data,ylab="rnorm(100)",col=df.colors[[x]]); x})


