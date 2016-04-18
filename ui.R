
# Shiny app for Data Products on Coursera
# Author: Peter Michael Crocco
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Manipulate a Regression Line to Maximize R-squared"),

  # Sidebar with slider inputs for regression line
  sidebarLayout(
    sidebarPanel(
            
        sliderInput("muX", label = h3("Point on Regression Line, X position:"),
                    min = 18.0, max = 22.0, value = 18.0, step = 0.1),
        sliderInput("muY", label = h3("Point on Regression Line, Y position:"),
                    min = 2.5, max = 4.0, value = 2.5, step = 0.1),
        sliderInput("slope", label = h3("Slope of Regression Line"),
                  min = -0.25, max = -0.05, value = -0.25, step = 0.01)
    ),


    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("scatterPlot"),
      textOutput("result")
    )
  )
))
