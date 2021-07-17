library(jpeg)
require(jpeg)
x=readJPEG("D:\\AKG\\Assignments\\PCM.jpg")
View(x)
pic=function(y,title)
{
dim(y)=c(nrow(y),ncol(y))
plot(1:4,ty="n",main=title,xlab="",ylab="")
rasterImage(as.raster(y),1,1,4,4)
}
pic(x,"original")
dim(x)
#b)
m=nrow(x)
n=ncol(x)
m
n
q=4;k=1
v=NULL
for(i in 1:(m/q))
{
v=cbind(v,x[k:((k-1)+q),1:n])
k=k+q
} 
View(v)
dim(v)
km=kmeans(t(v),15,algorithm="Lloyd")
S=km$center
S=t(S)
S
distance=function(s,y)
{
d=NULL
for(i in 1:15)
{
d[i]=sqrt(sum((s[,i]-y)^2))
}
mindist=which(d==min(d))
return(mindist)
}
v2=NULL
for(i in 1:ncol(v))
{
s2=distance(S,v[,i])
v2=cbind(v2,S[,s2])
}
View(v2)
dim(v2)
x2=v2[,1:n]
h=n+1
for(i in 2:floor(m/q))
{ 
x2=rbind(x2,v2[,h:((h-1)+n)])
h=h+n
}
dim(x2)
par(mfrow=c(1,2))
pic(x2,"compressed with r=15")
pic(x,"original")







#various choice of r
par(mfrow=c(3,3))
f=function(r)
{
km=kmeans(t(v),r,algorithm="Lloyd")
S=km$center
S=t(S)
distance=function(s,y)
{
d=NULL
for(i in 1:r)
{
d[i]=sqrt(sum((s[,i]-y)^2))
}
mindist=which(d==min(d))
return(mindist)
}
v2=NULL
for(i in 1:ncol(v))
{
s2=distance(S,v[,i])
v2=cbind(v2,S[,s2])
}
dim(v2)
x2=v2[,1:n]
h=n+1
for(i in 2:floor(m/q))
{ 
x2=rbind(x2,v2[,h:((h-1)+n)])
h=h+n
}
dim(x2)
pic(x2,paste("compressed with r=",r))
if(nrow(x2)!=430)
{
g=matrix(0,ncol=346,nrow=2)
x2=rbind(x2,g)
}
return(x2)
}

#d)
euclidis=function(r)
{
y=f(r)
ed=sqrt(sum((x-y)^2))
return(ed)
}
i=1
edis=NULL
for(r in c(3,5,15,30,50,100,500))
{
edis[i]=euclidis(r)
i=i+1
}
edis




#e)
par(mfrow=c(3,3))
f2=function(qq)
{
m=nrow(x)
n=ncol(x)
m
n
k=1
q=qq
v=NULL
for(i in 1:(m/q))
{
v=cbind(v,x[k:((k-1)+q),1:n])
k=k+q
} 
View(v)
dim(v)
km=kmeans(t(v),15,algorithm="Lloyd")
S=km$center
S=t(S)
S
distance=function(s,y)
{
d=NULL
for(i in 1:15)
{
d[i]=sqrt(sum((s[,i]-y)^2))
}
mindist=which(d==min(d))
return(mindist)
}
v2=NULL
for(i in 1:ncol(v))
{
s2=distance(S,v[,i])
v2=cbind(v2,S[,s2])
}
View(v2)
dim(v2)
x2=v2[,1:n]
h=n+1
for(i in 2:floor(m/q))
{ 
x2=rbind(x2,v2[,h:((h-1)+n)])
h=h+n
}
dim(x2)
pic(x2,paste("reconstructed image with q:",q))
if(nrow(x2)!=430)
{
g=matrix(0,ncol=346,nrow=(m%%q))
x2=rbind(x2,g)
}
ed=sqrt(sum((x-x2)^2))
return(ed)
}
edis2=NULL
i=1
for(qq in c(2,4,5,10,15))
{
edis2[i]=f2(qq)
i=i+1
}
edis2












































































































