RFVIZ: AN INTERACTIVE VISUALIZATION PACKAGE FOR RANDOM FORESTS IN R

By: Chris Beckett

ABSTRACT

Random forests are very popular tools for predictive analysis and data science. They work for both classification (where there is a categorical response variable) and regression (where the response is continuous). Random forests provide proximities, and both local and global measures of variable importance.  However, these quantities require special tools to be effectively used to interpret the forest. Rfviz is a sophisticated interactive visualization package and toolkit in R, specially designed for interpreting the results of a random forest in a user-friendly way. Rfviz uses a recently-developed R package (loon) from the Comprehensive R Archive Network (CRAN) to create parallel coordinate plots of the predictor variables, the local importance values, and the MDS plot of the proximities. The visualizations allow users to highlight or brush observations in one plot and have the same observations show up as highlighted in other plots. This allows users to explore unusual subsets of their data and to potentially discover previously-unknown relationships between the predictor variables and the response.

Please read "Rfviz.md" for complete documentation, or go to https://chrisbeckett8.github.io/Rfviz for the website version of the markdown. 

For installation, use devtools::install_github("chrisbeckett8/rfviz") and library(rfviz). If you do not have devtools already installed within R, use install.packages("devtools") and library(devtools) before installing rfviz. 
