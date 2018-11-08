#' @title A function to create Random Forests output in preparation for visualization with rf_viz
#' 
#' @description A funciton using Random Forests which outputs a list of the Random Forests output, the predictor variables data, and response variable data. 
#' 
#' @param x A data frame or a matrix of predictors.
#' @param y A response vector. If a factor, classification is assume, otherwise regression is assumed. If omitted, randomForest will run in unsupervised mode.
#' @param ... Optional parameters to be passed down to the randomForest function. Use ?randomForest to see the optional parameters.
#' @return The parallel coordinate plots of the input data, the local importance scores, and the 2-D XYZ classic multidimensional scaling proximities from the output of the random forest algorithm.
#' 
#' @note For instructions on how to use randomForests, use ?randomForest. For more information on loon, use ?loon. 
#' 
#' For detailed instructions in the use of these plots in this package, visit \url{https://github.com/chrisbeckett8/rfviz/blob/master/Rfviz.md}
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
#' @seealso \code{\link[randomForest]{randomForest}}, \code{\link{rf_viz}}, \code{\link[loon]{l_plot}}, \code{\link[loon]{l_serialaxes}}
#' 
#' @examples
#' #Preparation for classification with Iris data set
#' rfprep <- rf_prep(x=iris[,1:4], y=iris$Species)
#' 
#' #Preparation for Regression with mtcars data set
#' rfprep <- rf_prep(x=mtcars[,-1], y=mtcars$mpg)
#' @export
rf_prep <- function(x, y,...){
rf <-
  randomForest(x,
               y,
               localImp = TRUE,
               proximity = TRUE,
               ...)
return(list(rf = rf, x = x, y = y))
}
