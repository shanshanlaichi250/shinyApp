T.ind <- function(quotes,tgt.margin=0.025,n.days=10) {
  v <- apply(HLC(quotes),1,mean)
  
  r <- matrix(NA,ncol=n.days,nrow=NROW(quotes))
  for(x in 1:n.days) r[,x] <- Next(Delt(v,k=x),x)
  
  x <- apply(r,1,function(x) sum(x[x > tgt.margin | x < -tgt.margin]))
  if (is.xts(quotes)) xts(x,time(quotes)) else x
}