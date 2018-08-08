library(shiny)
library(ggplot2)

library(markdown)

choice.教育程度 <-
  c('高中高職', '專科', '大學', '碩士', '博士')
choice.月 <-
  c(
    
    '107年01月',
    '107年02月',
    '107年03月',
    '107年04月',
    '107年05月'
  )

navbarPage(
  "各教育程度持卡人以信用卡支付食品餐飲類消費之總簽帳金額及筆數",
  tabPanel(
    "Introduction",
    tags$h1("討論持卡人教育程度與信用卡之間的消費關係"),
    tags$p("GO")
    #HTML("<img height=600 src=\"https://78.media.tumblr.com/aa70ed84a7cd2e7b83c36118dfb2c0e5/tumblr_p8xzq1U8ik1qhy6c9o1_500.gif\"/>")
  ),
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
  
  tabPanel(
    "Single Variable",
    tags$h1("Summrizing time!"),
    br(),
    sidebarLayout(
      sidebarPanel(
        selectInput('SV.input', 'type', c(choice.教育程度, choice.月), selectize = TRUE)
      ),
      mainPanel(plotOutput("SV.plot"))
    ),
    
    verbatimTextOutput("summary")
  ),
  
  tabPanel(
    "PartA.",
    tags$h1("Box Plot"),
    sidebarLayout(
      sidebarPanel(
        selectInput('PA.type', '教育程度', choice.教育程度, selectize = TRUE),
        selectInput('PA.value', '月', choice.月, selectize =
                      TRUE)
      ),
      mainPanel(plotOutput("PA.plot"))
    )
  ),
  
  tabPanel("Summary"),
  
  navbarMenu("More",
             plotOutput("plot"))
)