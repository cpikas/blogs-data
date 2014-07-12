# using R to get the html of the blog web pages, then i'll use python
# and beautiful soup to get just the pieces I want to deal with

setwd("C:/Users/Christina/Dropbox/Dissertation/R")
# packages
library("tm", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")
library("RCurl", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")


#get the list of post urls
# aguposturls <- read.table("C:/Users/Christina/Dropbox/Dissertation/R/aguposturls.txt", header=T, quote="\"")
#with the file names
#agposturls <- read.csv("C:/Users/Christina/Dropbox/Dissertation/R/agposturl.csv")
agposturl <- read.csv("C:/Users/Christina/Dropbox/Dissertation/R/agposturl.csv", quote="")


#check it out
View(aguposturl)

str(aguposturl)
#messed up and they are factors so
agposturl$url<-as.character(agposturl$url)
agposturl$name<-as.character(agposturl$name)


getFullContent<-function(link,fileName){
  UserAgent <- "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0"
  temp <- getURL(link, timeout = 16, ssl.verifypeer = FALSE, useragent = "UserAgent")
  print(temp)
  nameout <- paste(fileName, ".htm", sep="") 
  print(nameout)
  write (temp,file=nameout)
}

# test 
getFullContent(agposturl$url[[3]], agposturl$name[[3]])

#one more test
getFullContent(haorigurls$url[[1]], haorigurls$name[[1]])

#has to be mapply for multiple vectorized arguments
#worked beautifully.
mapply(getFullContent,haorigurls$url[2:17], haorigurls$name[2:17])

mapply(getFullContent,cdarchiveurls$url[1:19], cdarchiveurls$name[1:19])
mapply(getFullContent,cdarchiveurls$url[21:112], cdarchiveurls$name[21:112])

# don't run - don't get each post individually
mapply(getFullContent, agposturl$url[1:150], agposturl$name[1:150])


mapply(getFullContent,haarchiveurls$url[2:187],haarchiveurls$name[2:187])