RFVIZ: AN INTERACTIVE VISUALIZATION PACKAGE FOR RANDOM FORESTS IN R

By: Chris Kuchar

ABSTRACT

Random forests are very popular tools for predictive analysis and data science. They work for both classification (where there is a categorical response variable) and regression (where the response is continuous). Random forests provide proximities, and both local and global measures of variable importance.  However, these quantities require special tools to be effectively used to interpret the forest. Rfviz is a sophisticated interactive visualization package and toolkit in R, specially designed for interpreting the results of a random forest in a user-friendly way. Rfviz uses a recently-developed R package (loon) from the Comprehensive R Archive Network (CRAN) to create parallel coordinate plots of the predictor variables, the local importance values, and the MDS plot of the proximities. The visualizations allow users to highlight or brush observations in one plot and have the same observations show up as highlighted in other plots. This allows users to explore unusual subsets of their data and to potentially discover previously-unknown relationships between the predictor variables and the response.

Please go to https://chriskuchar.github.io/Rfviz for complete documentation

This package is available on CRAN. Use install.packages("rfviz") within R to download it.

If installation fails, make sure you have the most recent version of R, make sure your computer has the most recent update and install xtools if you are using a Mac, using this guide: "http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/".

Citation Recommendation:

@manual{cb3,
	author = {C Beckett},
	title = {Rfviz: An Interactive Visualization Packge for Random Forests in R},
	year = {2018},
	url = {https://chriskuchar.github.io/Rfviz},
}
