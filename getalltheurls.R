library("XML", lib.loc="C:/Users/Christina/Documents/R/win-library/3.0")

# download allonchthonous
#test a single
ckp.test<-getURL("http://scientopia.org/blogs/christinaslisrant/")
ha.test<-getURL("http://all-geo.org/highlyallochthonous/page/187/")
ha.test.l<-getHTMLLinks(ha.test)

ckp.test.l<-getHTMLLinks(ckp.test)

getHAurls<- function(link){
  holding <- getURL(link)
  url.list <- getHTMLLinks(holding)
  return(url.list)
}
url.info<-sapply(testckpblog,getHAurls)
# v works great chunked just in case
url.info<-sapply(HAurls$V1[151:186], getHAurls)
url.info.u<-unlist(url.info)
write.csv(url.info.u, file="HApostUrls151-186")