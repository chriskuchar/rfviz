#' Rfviz: An Interactive Visualization Package for Random Forests in R
#' 
#' Rfviz is an interactive package and toolkit in R, using TclTK code on the backend, 
#' to help in viewing and interpreting the results Random Forests for both Supervised Classification and Regression 
#' in a user-friendly way.
#' 
#' Currently, rfviz implements the following statistical graphs, with functions to view any combination of the plots:  
#' 
#' The three plots are:
#' 
#' 1. The classic multidimensionally scaled proximities are plotted as a 2-D XYZ scatterplot. 
#' 
#' 2. The raw input data is plotted in a parallel coordinate plot. 
#' 
#' 3. The local importance scores of each observation are plotted in a parallet coordinate plot. 
#' 
#' rfviz is built using the package Loon on the backend, and implements the random forests algorithm.
#'
#' For detailed instructions in the use of these plots in this package, visit \url{https://github.com/chrisbeckett8/rfviz/blob/master/Rfviz.md}
#'
#' @note For instructions on how to use randomForests, use ?randomForest. For more information on loon, use ?loon.  
#' 
#' @author Chris Beckett \email{chrisbeckett8@gmail.com}, based on original Java graphics by Leo 
#' Breiman and Adele Cutler.
#' 
#' @references 
#' Liaw A, Wiener M (2002). “Classification and Regression by randomForest.” _R News_,
#' *2*(3), 18-22. \url{https://CRAN.R-project.org/doc/Rnews/}
#' 
#' Waddell A, Oldford R. Wayne (2018). "loon: Interactive Statistical Data Visualization"
#' \url{https://github.com/waddella/loon}
#' 
#' Breiman, L. (2001), Random Forests, Machine Learning 45(1), 5-32.
#' 
#' Breiman, L (2002), “Manual On Setting Up, Using, And Understanding Random Forests V3.1”,
#' \url{https://www.stat.berkeley.edu/~breiman/Using_random_forests_V3.1.pdf}
#' 
#' Breiman, L., Cutler, A., Random Forests Graphics.
#' \url{https://www.stat.berkeley.edu/~breiman/RandomForests/cc_graphics.htm}
#' 
#' @seealso \code{\link[randomForest]{randomForest}}, \code{\link{rf_prep}}, \code{\link{rf_viz}}, \code{\link[loon]{l_plot}}, \code{\link[loon]{l_serialaxes}}
#' 
#' @docType package
#' 
"_PACKAGE"
