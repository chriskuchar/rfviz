RFVIZ: AN INTERACTIVE VISUALIZATION PACKAGE FOR RANDOM FORESTS IN R

By: Chris Beckett

ABSTRACT

Random forests are very popular tools for predictive analysis and data science. They work for both classification (where there is a categorical response variable) and regression (where the response is continuous). Random forests provide proximities, and both local and global measures of variable importance.  However, these quantities require special tools to be effectively used to interpret the forest. Rfviz is a sophisticated interactive visualization package and toolkit in R, specially designed for interpreting the results of a random forest in a user-friendly way. Rfviz uses a recently-developed R package (loon) from the Comprehensive R Archive Network (CRAN) to create parallel coordinate plots of the predictor variables, the local importance values, and the MDS plot of the proximities. The visualizations allow users to highlight or brush observations in one plot and have the same observations show up as highlighted in other plots. This allows users to explore unusual subsets of their data and to potentially discover previously-unknown relationships between the predictor variables and the response.

Please read "Rfviz.md" for complete documentation, or go to https://chrisbeckett8.github.io/Rfviz for the website version of the markdown. 

For installation, this package is available on CRAN. Use install.packages("rfviz") within R to download it.

UPDATE: While it is available to download in R, it won't work yet. This is because a dependency package called tcl/tk is built-in to R now. There is a dependency for rfviz called loon. Loon requires tcl/tk to be downloaded as a package, which can't happen because it is built-in to R now. This is an error within loon. It shouldn't be listed as a required dependency. I have reached out to the author and hopefully they fix it soon.

Citation Recommendation:

@manual{cb3,
	author = {C Beckett},
	title = {Rfviz: An Interactive Visualization Packge for Random Forests in R},
	year = {2018},
	url = {https://chrisbeckett8.github.io/Rfviz},
}
