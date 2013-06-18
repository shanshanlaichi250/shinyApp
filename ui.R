library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("股价模型"),
  
  sidebarPanel(
  radioButtons("name", "Select the cor:",
               list(#"S&P500" = "^gspc",
                    "Apple" = "AAPL",
                    "IBM" = "IBM",
                    "SINA" = "SINA")),
  br(),
  textInput("start", "the start of the period to download:", "2000-01-02")
  ),
  
  mainPanel(

  #  verbatimTextOutput("summary"),
   #plotOutput("distPlot")
    plotOutput("returnplot")
  )
))
