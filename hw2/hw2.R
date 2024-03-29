rm(list=ls())
                                        #Name: Yuchen Zeng
                                        #Netid: yzeng58@wisc.edu
require("astro")
wd = getwd()
template = read.fitstab("cB58_Lyman_break.fit")
target = template[,2]
setwd(paste(getwd(),"/data",sep=""))
spectrum.id = list.files()
spectrum = lapply(spectrum.id,FUN=read.fitstab)
setwd(wd)

my.dist = function(a,b){
    if (sum(a[,4] == 0) <= length(b)*0.02) return(100000)
    a1 = scale(a[a[,4]==0,][,1])
    b1 = scale(b[a[,4]==0])
    return(sqrt(sum((a1-b1)^2))/length(a1)*1000)
}


compare = function(sample,target){
    distance = c()
    lsp = dim(sample)[1]
    ltg = length(target)
    for(start in 1:(lsp-ltg+1)){
        sample.cut = sample[start:(start+ltg-1),]
        distance = c(distance, my.dist(sample.cut,target))
    }
    best.part = which(distance == min(distance))[1]
    return(list("distance" = min(distance), "i" = best.part))
}

distance = lapply(spectrum, compare, target=target)
mt.dis = matrix(unlist(distance),ncol=2,byrow=TRUE)
df.dis = data.frame("distance"=mt.dis[,1],"i"=mt.dis[,2])

od = order(df.dis$distance)

od.dis = data.frame("distance"=mt.dis[od,1],"i"=mt.dis[od,2],"spectrumID"=spectrum.id[od])
write.csv(od.dis, file="hw2.csv")

