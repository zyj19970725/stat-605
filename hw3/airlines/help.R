data = read.csv("allMSN.csv")
data = data[!is.na(data[,2]),]
#fileConn = file("week.txt")
write(paste0(round(as.vector(tapply(data[,2],as.character(data[,1]),mean)),1), collapse=" "), file = "week.txt")
#close(fileConn)
