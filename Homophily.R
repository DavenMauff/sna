library(statnet)
library(ergm)
library(sna)
library(coda)

data("faux.mesa.high")
mesa <- faux.mesa.high

plot(mesa, vertex.col='Grade')
legend('bottomleft',fill=7:12,legend=paste('Grade',7:12),cex=0.75)

fauxmodel.01 <- ergm(mesa ~edges + nodematch('Grade',diff=T) + nodematch('Race',diff=T))

summary(fauxmodel.01)

table(mesa %v% 'Race')

mixingmatrix(mesa, "Race")

summary(mesa ~edges + nodematch('Grade',diff=T) + nodematch('Race',diff=T))
