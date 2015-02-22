
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(caret)

shinyServer(function(input, output) {

  output$scatPlot <- renderPlot({

    # generate sample data 
    set.seed(100)
    x <- seq(2,input$sample,by=0.05)
    y <- sin(x)+rnorm(length(x),0,input$norn)
    X <- matrix(data=NA,nrow=length(x),ncol=10)
    
    X[,1] <- x
    for(i in 2:10){
      X[,i] <- (X[,1])^i
    }

    if(input$terms == 1){
      dat <- as.data.frame(cbind(y,x))
      overFit <- lm(y~x,data=dat)
    }else{
      overFit <- train(x=X[,1:input$terms],y=y,method="lm")     
    }

    
    # draw the histogram with the specified number of bins
    plot(x,y,type="p",col="black",main="sin(x) , prediction model and sin(x) + rnorm(0,sd)")
    lines(x,predict(overFit,X[,1:input$terms]))
    lines(x,sin(x),col="red")
    
    output$summary <- renderPrint({
      summary(overFit)
    })
    
  })

})
