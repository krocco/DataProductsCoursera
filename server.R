
# Shiny app for Data Products on Coursera
# Author: Peter Michael Crocco
#

library(shiny)
library(stats)
data(mtcars)

shinyServer(function(input, output) {

  output$scatterPlot <- renderPlot({

    # import Sepal Length and Width
    X    <<- mtcars$mpg
    Y    <<- mtcars$wt


    # draw the histogram with the specified number of bins
    plot(X, Y, col = 'darkgray', xlim = c(0,40), ylim = c(0,6),
         xlab = 'Miles Per Gallon', ylab = 'Vehicle Mass (1000s of lbs)',
         title = 'Regression Line Estimation with mtcars data')
    
    # get slider data to specify slope and y-intercept
    muY   <<- input$muY
    muX   <<- input$muX
    slope <<- input$slope
    
    # calculate intercept
    intercept <<- muY - slope * muX
    
    # plot the guessed regression line
    abline(intercept, slope, col = 'green', lty = 2)
    points(muX, muY, col = 'red', pch = 1, cex = 3)
    text(5, 1, paste("(intercept : ", intercept, ")"))
    text(5, 2, paste("point on line : (", muX, ",", muY, ")"))
    text(5, 3, paste("slope : ", slope))
    
    #calculate R-squared
    residSS <<- sum((Y - (slope * X + intercept))^2)
    totalSS <<- sum((Y - muY)^2)
    Rsquared <<- 1 - residSS/totalSS
    if(Rsquared < 0) {
            Rsquared <<- 0}
    else{NULL}
    text(30, 5, paste("R-squared: ", round(Rsquared,3)))


  })


})
