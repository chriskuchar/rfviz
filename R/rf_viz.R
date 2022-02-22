#' @title Random Forest Plots for interpreting Random Forests output
#'
#' @description The Input Data, Local Importance Scores, and Classic Multidimensional Scaling Plots
#'
#' @importFrom stats cmdscale
#' @importFrom utils data 
#' @import tcltk
#' @import randomForest
#' @import loon
#'
#' @param rfprep A list of prepared Random Forests input data to be used in visualization, created using the function rf_prep.
#' @param input Should the Input Data Parallel Coordinate Plot be included in the visualization?
#' @param imp Should the Local Importance Scores Parallel Coordinate Plot be included in the visualization?
#' @param cmd Should the Classic Multidimensional Scaling Proximites 3-D XYZ Scatter Plot be included in the visualization?
#' @param hl_color The highlight color when you select points on the plot(s).
#' @return Any combination of the parallel coordinate plots of the input data, the local importance scores, and the 3-D XYZ classic multidimensional scaling proximities from the output of the random forest algorithm.
#'
#' @note For instructions on how to use randomForests, use ?randomForest. For more information on loon, use ?loon.
#'
#' For detailed instructions in the use of these plots in this package, visit \url{https://github.com/chriskuchar/rfviz/blob/master/Rfviz.md}
#'
#' @author Chris Kuchar \email{chrisjkuchar@gmail.com}, based on original Java graphics by Leo
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
#' @seealso \code{\link[randomForest]{randomForest}}, \code{\link{rf_prep}}, \code{\link[loon]{l_plot3D}}, \code{\link[loon]{l_serialaxes}}
#'
#' @examples
#' #Classification with iris data set
#' rfprep <- rf_prep(x = iris[,1:4], y = iris$Species)
#'
#' #View all three plots
#' Myrfplots <- rf_viz(rfprep, input = TRUE, imp = TRUE, cmd = TRUE, hl_color = 'orange')
#'
#' #Select data on any of the plots then run:
#' iris[Myrfplots$input['selected'], ]
#' iris[Myrfplots$imp['selected'], ]
#' iris[Myrfplots$cmd['selected'], ]
#' 
#' #Rotate 3-D XYZ Scatterplot
#' #1. Click on 3-D XYZ Scatterplot
#' #2. Press 'r' on keyboard to enter rotation mode
#' #3. Click and drag mouse to rotate plot
#' #4. Press 'r' to leave rotation mode
#' 
#' #View only the Input Data and CMD Scaling Proximities Plots
#' Myrfplots <- rf_viz(rfprep, input = TRUE, imp = FALSE, cmd = TRUE, hl_color = 'orange')
#'
#' #Regression with mtcars data set
#' rfprep2 <- rf_prep(x = mtcars[,-1], y = mtcars$mpg)
#'
#' #View all three plots
#' Myrfplots <- rf_viz(rfprep2, input = TRUE, imp = TRUE, cmd = TRUE, hl_color = 'orange')
#'
#' #Unsupervised clustering with iris data set 
#' rfprep <- rf_prep(x = iris[,1:4], y = NULL)
#'
#' #View the Input Data and CMD Scaling Proximities Plots for the unsupervised case. 
#' #(Importance Scores Plot not valid here)
#' Myrfplots <- rf_viz(rfprep, input = TRUE, imp = FALSE, cmd = TRUE, hl_color = 'orange')
#' @export
rf_viz <-
  function(rfprep,
           input = TRUE,
           imp = TRUE,
           cmd = TRUE,
           hl_color = "orange") {
    tcl('set', '::loon::Options(select-color)', hl_color)
    #This is to pass the CRAN checks
    if(is.null(rfprep$y)){
      col <- NULL
    } else {
      col <- rfprep$y
    }
    if(is.null(rfprep$y)){
      imp <- FALSE
    }
    issa <- NULL
    rm(issa)
    idsa <- NULL
    rm(idsa)
    cmdxyz <- NULL
    rm(cmdxyz)
    cmdxyz <- NULL
    rm(cmdxyz)
    
    inputOnly <- FALSE
    impOnly <- FALSE
    cmdOnly <- FALSE
    if(input == TRUE & imp == FALSE & cmd == FALSE) {
      inputOnly <- TRUE
    } else {
      if(input == FALSE & imp == TRUE & cmd == FALSE) {
        impOnly <- TRUE
      } else {
        if(input == FALSE & imp == FALSE & cmd == TRUE) {
          cmdOnly <- TRUE
        }
      }
    }
    
    tt <- tktoplevel()
    customInspector <- FALSE
    if(inputOnly == TRUE | impOnly == TRUE | cmdOnly == TRUE) customInspector <- TRUE
    
    #All three plots, the input data, local importance scores, and cmd scaled proximities
    if (input == TRUE) {
      #Input Serial Axes Plot
      idsa <- l_serialaxes(
        parent = tt,
        rfprep$x,
        linkingGroup = nrow(rfprep$x),
        axesLayout = "parallel",
        scaling = "variable",
        title = "Input Data",
        color = col,
        useLoonInspector = !customInspector
      )
    }
    if (imp == TRUE) {
      #Local Importance Score Plots
      #Prepare the Local Importance Scores for the plot
      xx <- as.data.frame(rfprep$rf$localImportance)
      yy <- t(xx)
      zz <- as.data.frame(yy)
      issa <-
        l_serialaxes(
          parent = tt,
          data = zz,
          linkingGroup = nrow(rfprep$x),
          axesLayout = "parallel",
          scaling = "variable",
          title = "Local Importance Scores",
          useLoonInspector = !customInspector,
          color = col
        )
    }
    
    if (cmd == TRUE) {
      #Metric Multidimensional Scaling Proximities
      #Obtain the CMD scaled proximities in preparation for plot
      rf.mds <- cmdscale(1 - rfprep$rf$proximity, eig = TRUE, k = 3)
      cmdxyz <-
        l_plot3D(rf.mds$points,
                 parent = tt,
                 linkingGroup = nrow(rfprep$x),
                 title = "Metric Multidimensional Scaling Proximities",
                 useLoonInspector = !customInspector,
                 color = col,
                 xlabel = "x",
                 ylabel = "y",
                 zlabel = "z",
                 showLabels=TRUE
        )
    }
    
    #Setting up the viewing grid for the plots
    #All plots
    if (input == TRUE & imp == TRUE & cmd == TRUE) {
      tkgrid(idsa,
             row = 0,
             column = 0,
             sticky = "nesw")
      tkgrid(issa,
             row = 0,
             column = 1,
             sticky = "nesw")
      tkgrid(cmdxyz,
             row = 1,
             column = 0,
             sticky = "nesw")
    }
    if (input == TRUE && imp == TRUE && cmd == FALSE) {
      tkgrid(idsa,
             row = 0,
             column = 0,
             sticky = "nesw")
      tkgrid(issa,
             row = 1,
             column = 0,
             sticky = "nesw")
    }
    #Input data and CMD scaling proximities plots
    if (input == TRUE & imp == FALSE & cmd == TRUE) {
      tkgrid(idsa,
             row = 0,
             column = 0,
             sticky = "nesw")
      tkgrid(cmdxyz,
             row = 1,
             column = 0,
             sticky = "nesw")
    }
    #Local Importance Score and CMD Proximities Plots
    if (input == FALSE & imp == TRUE & cmd == TRUE) {
      tkgrid(issa,
             row = 0,
             column = 0,
             sticky = "nesw")
      tkgrid(cmdxyz,
             row = 1,
             column = 0,
             sticky = "nesw")
    }
    
    tkgrid.columnconfigure(tt, 0, weight = 1)
    tkgrid.columnconfigure(tt, 1, weight = 1)
    tkgrid.rowconfigure(tt, 0, weight = 1)
    
    #Input Data Plot
    if (inputOnly == TRUE) {
      tkpack(idsa,
             side = "left",
             fill = "both",
             expand = TRUE)
      ## Add a custom inspector (no layers)
      f <- tkframe(tt)
      ai <- l_serialaxes_inspector(parent = f, activewidget = idsa)
      
      tkpack(f, side = "right", anchor = "ne")
      tkpack(ai, side = "top", fill = "x")
    }
    #Local Importance Score Plot
    if (impOnly == TRUE) {
      tkpack(issa,
             side = "left",
             fill = "both",
             expand = TRUE)
      ## Add a custom inspector (no layers)
      f <- tkframe(tt)
      ai <- l_serialaxes_inspector(parent = f, activewidget = issa)
      tkpack(f, side = "right", anchor = "ne")
      tkpack(ai, side = "top", fill = "x")
    }
    
    #CMD Scaling Proximities Plot
    if (cmdOnly == TRUE) {
      tkpack(
        cmdxyz,
        side = "left",
        fill = "both",
        expand = TRUE
      )
      ## Add a custom inspector (no layers)
      f <- tkframe(tt)
      lf <- tkwidget(f, "labelframe", text = "Worldview")
      wv <- l_worldview(parent = lf, activewidget = cmdxyz)
      tkconfigure(paste(wv, ".canvas", sep = ""),
                  width = 50,
                  height = 160)
      ai <-
        l_plot_inspector_analysis(parent = f, activewidget = cmdxyz)
      tkpack(f, side = "right", anchor = "ne")
      tkpack(lf, side = "top", fill = "x")
      tkpack(wv, side = "top", fill = "x")
      tkpack(ai, side = "top", fill = "x")
    }
    if(cmd & input & imp){ 
      list(input = idsa, imp = issa, cmd = cmdxyz)
    } else if(input & imp){
      list(input = idsa, imp = issa)  
    } else if(imp & cmd){
      list(imp = issa, cmd = cmdxyz)  
    } else if(input & cmd){
      list(input = idsa, cmd = cmdxyz)  
    } else if(input){
      list(input = idsa)
    } else if(imp){
      list(imp = issa)
    } else {
      list(cmd = cmdxyz)
    }
  }

