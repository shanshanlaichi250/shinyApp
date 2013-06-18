library(shiny)
library(tseries)
library(zoo)
library(xts)
library(DMwR)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {

  
  # Return the requested dataset
  data <- reactive({
    name <- switch(input$name,
                  # ^gspc = ^gspc,
                   AAPL = "AAPL",
                   IBM = "IBM",
                   SINA = "SINA"
                   )
  })
  price <- reactive({
    as.xts(get.hist.quote(data(),start=input$start,quote=c("Open","High","Low","Close","Volume","AdjClose")))
  })
  
  # Generate a summary of the dataset
  #output$summary <- renderPrint({
   # dataset <- datasetInput()
    #summary(dataset)
#  })
  
  # Show the first "n" observations
#  output$view <- renderTable({
 #   head(datasetInput(), n = input$obs)
  #})


# output$distPlot <- renderPlot({
#   source("./function/T.ind.r")
#   candleChart(last(price(),'3 months'),theme='white',TA=NULL)
#   source("./function/addAvgPrice.r")
#   addAvgPrice(on=1)
#   source("./function/addT.ind.r")
#   addT.ind()
#  })
  output$returnplot <- renderPlot({
    plot(diff(log(price()$AdjClose)),main = "收益率曲线")
  })
})

