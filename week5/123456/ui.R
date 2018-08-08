library(shiny)
shinyUI(navbarPage("106年各教育程度持卡人以信用卡支付食品餐飲類消費之總簽帳金額及筆數",

tabPanel("介紹",tags$h1("觀察106年持卡人教育程度與以信用卡支付食品餐飲類消費之間的關係")),

tabPanel(
  "Raw Data",
  tags$h1("Let's take a look at the dataset."),
  br(),
  fluidRow(column(
    8,
    tabPanel("Table",
             DT::dataTableOutput("data.raw"))
  ))
),

navbarMenu("教育程度",
           
           tabPanel("博士",
                    
                    plotOutput("博士")),
           
           tabPanel("碩士",
                    plotOutput("碩士")),
           tabPanel("大學",
                    plotOutput("大學")),
           tabPanel("專科",
                    plotOutput("專科")),
           tabPanel("高中高職",
                    plotOutput("高中高職"))
)
)
)