library(shiny)
library(ggplot2)
library(datasets)


fluidPage(    
  
 
  titlePanel("各教育程度持卡人以信用卡支付食品餐飲類消費之總簽帳金額及筆數"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("region", "年月", 
                  choices=colnames(WorldPhones)),
      hr()
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)