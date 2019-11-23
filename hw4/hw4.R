rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
  ts = args[1]
  folder = args[2]
} else {
  cat('usage: Rscript hw4.R <template spectrum> <data directory>\n', file=stderr())
  stop()
}

# cat("Hello, world.\n") # This line goes to stdout. Next lines goes to outfile.

# sink(file=outfile) # send stdout to outfile
# cat(sep="", "The sum of ", a, " and ", b, " is ", a + b, ".\n")
if (require("astro")) {
  print("Loaded package astro.")
} else {
  print("Failed to load package astro.")  
}
# sink()


# require("astro")
wd = getwd()
template = read.fitstab(ts)
target = template[,2]
# setwd(paste(getwd(), "/", folder, sep=""))
spectrum.id = list.files(folder)
print(length(spectrum.id))
spectrum.id.read = unlist(lapply(spectrum.id, FUN=function(x) paste(folder,"/",x, sep='')))
spectrum = lapply(spectrum.id.read,FUN=read.fitstab)

setwd(wd)

my.dist = function(a,b){
    if (sum(a[,4] == 0) <= length(b)*0.02) return(99)
    a1 = scale(a[a[,4]==0,][,1])
    b1 = scale(b[a[,4]==0])
    return(sqrt(sum((a1-b1)^2))/length(a1)*1000)
} 


compare = function(sample,target){
    distance = c()
    lsp = dim(sample)[1]
    ltg = length(target)
    if (lsp<ltg) return(list("distance" = 99, "i"=0))
    for(start in 1:(lsp-ltg+1)){
        tryCatch({sample.cut = sample[start:(start+ltg-1),];
        distance = c(distance, my.dist(sample.cut,target))}, 
		 error = function(w){print(lsp);print(ltg);print(start)} )
    }
    best.part = which(distance == min(distance))[1]
    return(list("distance" = min(distance), "i" = best.part))
}

distance = lapply(spectrum, compare, target=target)
mt.dis = matrix(unlist(distance),ncol=2,byrow=TRUE)
df.dis = data.frame("distance"=mt.dis[,1],"i"=mt.dis[,2])

od = order(df.dis$distance)

# par(mfrow=c(3,2))
# for(k in 1:6){
#     plot(type="l",scale(spectrum[[od[k]]][,1]),main=spectrum.id[k])
#     lines(c(rep(0,df.dis[od[k],2]),scale(target)),col = "red")
# }

od.dis = data.frame("distance"=mt.dis[od,1],"i"=mt.dis[od,2],"spectrumID"=spectrum.id[od])
write.csv(od.dis[1:100,], file=paste(folder,".csv",sep=''))
# print(paste(folder,".csv",sep=''))
# print(od.dis)