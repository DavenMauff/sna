library(statnet)
library(ergm)
library(sna)
library(coda)

data("samplk")
ls()

plot(samplk3)

summary(samplk3~edges+mutual)

sampmodel.01 <- ergm(samplk3~edges+mutual)

summary(sampmodel.01)

missnet <- network.initialize(10,directed=F)
missnet[1,2] <- missnet[2,7] <- missnet[3,6] <- 1
missnet[4,6] <- missnet[4,9] <- missnet[5,6] <- NA
summary(missnet)

#PLOT MISSING DATA WITH EDGE COLORED RED
tempnet <- missnet
tempnet[4,6] <- tempnet[4,9] <- tempnet[5,6] <- 1
missnetmat <-as.matrix(missnet)
missnetmat[is.na(missnetmat)] <- 2
plot(tempnet,label = network.vertex.names(tempnet),edge.col = missnetmat)

summary(missnet~edges)
summary(ergm(missnet~edges))


missnet_bad <- missnet
missnet_bad[4,6] <- missnet_bad[4,9] <- missnet_bad[5,6] <- 0
summary(missnet_bad)
summary(ergm(missnet_bad~edges))
