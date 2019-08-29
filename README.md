# sna
#ALDU 
Regression on metrics, in social network analysis 
Do a bit of leg work for everyone else 
If you and I are friends are we likely to go to coffee, we just need a friend graph and a coffee graph, if there is an edge in graph 1 is there an edge in graph 2
Flatten metrics and put it into a linear line 

problem 1: 
With linear models you assume there is a normal distribution (like standard deviation graph)
Power law: there are very few nodes with extremely high degree and very many nodes with low degree. 
You can see it is a power bar if you log transform both axes and you Get a straight line- this you can deal with by trying to transform the data. 

The second problem:
what is a network, a series of non independent observations- many models assume that your observations are independant. Our observations aren't independent, there is always a hidden structure- like we are similar and that is why we are friends. 

But there are ways to deal with these problems 
- bootstrapping- you generate data based on the population data that you have. You generate your population from your sample. 
Non-parametric statistics is what this is called 

Quadratic assignment procedure is one of the most simple methods though- get a network, make random versions of that network and see how similar the original one is to the random ones- see if it is random or not. From the random distribution, how many times did you observe the same structure, if your version lands outside of the normal graph then it is statistically significant. 

Summary:
You can't assume observations are independent and you have to be careful of distributions, any degree distribution will have power law. Many times there is a hidden structure. 

- Multiple relation quadratic assignment procedure so that you can have multiple regression

- Most basic version of regression is just correlating graphs. 

- One network  and two networks in tutorial. 

- The tutorial gives you things like what mean means for a network, etc. 

- Datasets are on line. What is the mean standard division etc about any vector. Hypothesis about one network based on another network, is this density statistically significant. 

Tap 
Mrqap
Cut.tests

- Explain to them which situations would call for an inference in a network. Help them understand why we infer. 

NO PREDICTION.

library()
igraph
igraphdata

read_graph(file = "")

downloading knokbur.net data. 

might have to use statnet- has hypothesis testing on graph level indincies. 
structural correlation on large graphs and small ones. 
statnet basically just has alot of what we need in it
