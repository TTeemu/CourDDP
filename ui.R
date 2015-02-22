
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Over-fitting and under-ftting with linear regression"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("sample",
                  "From, to",
                  min = 2,
                  max = 20,
                  value = 10,
                  step=0.01),
      sliderInput("terms",
                  "Number and order of polynomial terms",
                  min = 2,
                  max = 10,
                  value = 2),
      sliderInput("norn",
                  "normal random standard deviation",
                  min = 0.01,
                  max = 2,
                  value = 0.05),
      p("Purpose of this shiny-app is to show the problem associated with over-fitting by adding additional terms in linear regression"),
      p("The model to fit is the following form: y = a + B1x^1 +B2x^2 + .... + Bnx^n and so forth depending on the terms included in the model  "),
      p("In the plot the red line shows the real data producing function without noise and black line shows the prediction function")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("scatPlot"),
      h3("Model summary:"),
      verbatimTextOutput("summary")
    )
  )
))


