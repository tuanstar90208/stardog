library(tidyr)
library(stringr)
path =  "C:\\Users\\B06408042\\Desktop\\GitHub\\CSX_RProject_summer_2018\\week4\\UCI_Credit_Card.csv"
TB = read.csv(path)
TB$EDUCATION = str_replace_all(TB$EDUCATION, c("5" = "0", "6" = "0", "4" = "0"))


TB$ID = factor(TB$ID)
TB$SEX = factor(TB$SEX, labels = c("male", "female"))
TB$EDUCATION = factor(TB$EDUCATION, labels = c("others","graduate school", "university", "high school"))
TB$MARRIAGE = factor(TB$MARRIAGE, labels = c("others","married", "single","divorce"))
TB$AGE = factor(TB$AGE)
TB$default.payment.next.month = factor(TB$default.payment.next.month)
TB$default.payment.next.month = as.numeric(TB$default.payment.next.month )


TB$PAY_0 = factor(TB$PAY_0, labels = c("No consumption", "Paid in full", "use revolving credit", "delay 1 month", "delay 2 month","delay 3 month","delay 4 month","delay 5 month","delay 6 month","delay 7 month","delay 8 month"))
TB$PAY_2 = factor(TB$PAY_2, labels = c("No consumption", "Paid in full", "use revolving credit", "delay 1 month", "delay 2 month","delay 3 month","delay 4 month","delay 5 month","delay 6 month","delay 7 month","delay 8 month"))
TB$PAY_3 = factor(TB$PAY_3, labels = c("No consumption", "Paid in full", "use revolving credit", "delay 1 month", "delay 2 month","delay 3 month","delay 4 month","delay 5 month","delay 6 month","delay 7 month","delay 8 month"))
TB$PAY_4 = factor(TB$PAY_4, labels = c("No consumption", "Paid in full", "use revolving credit", "delay 1 month", "delay 2 month","delay 3 month","delay 4 month","delay 5 month","delay 6 month","delay 7 month","delay 8 month"))
TB$PAY_5 = factor(TB$PAY_5, labels = c("No consumption", "Paid in full", "use revolving credit", "delay 2 month", "delay 3 month","delay 4 month","delay 5 month","delay 6 month","delay 7 month","delay 8 month"))
TB$PAY_6 = factor(TB$PAY_6, labels = c("No consumption", "Paid in full", "use revolving credit", "delay 2 month", "delay 3 month","delay 4 month","delay 5 month","delay 6 month","delay 7 month","delay 8 month"))


names(TB)[2]<-"given_credit"
names(TB)[3]<-"sex"
names(TB)[4]<-"education"
names(TB)[5]<-"marriage"
names(TB)[6]<-"age"
names(TB)[25]<-"default"
names(TB)[7]<-"Sep"
names(TB)[8]<-"Aug"
names(TB)[9]<-"Jul"
names(TB)[10]<-"Jun"
names(TB)[11]<-"May"
names(TB)[12]<-"Apr"


library(ggplot2)
library(dplyr)
library(shiny)
choice.T<- c("sex", "education","marriage")
# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("因素作圖"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     sidebarPanel(
       selectInput('PlotInput', '因素:',choice.T, selectize = TRUE)
     ),
     mainPanel(
               tabsetPanel(
                 tabPanel("Point",
                          plotOutput("plotop")
                 ),
                 tabPanel("Box",
                          plotOutput("plotbox")
                 )
              )
   )
)
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$plotop <- renderPlot({
   
    d<-TB%>%
      group_by(sex,education,age,marriage)%>%
      summarise(defaultAvg = mean(default))
    options(scipen=999)
    print(input$PlotInput)
    ggplot(d, aes(x = age, y = defaultAvg, color = eval(parse(text=input$PlotInput))))+ 
      geom_point()+
      facet_wrap(~ eval(parse(text=input$PlotInput)))+
     labs(title= paste0(input$PlotInput,'對違約機率(以年齡分群)')) +
      scale_fill_discrete(name = "類別")+
      labs(x="年齡", y="違約機率")
    
    
    
  })
  output$plotbox <- renderPlot({
    d<-TB%>%
      group_by(sex,education,age,marriage)%>%
      summarise(defaultAvg = mean(default))
    ggplot(d, aes(x =eval(parse(text=input$PlotInput)) , y = defaultAvg))+
      geom_boxplot()+
      labs(title= paste0(input$PlotInput,'對違約機率(以年齡分群)')) +
      scale_fill_discrete(name = "類別")+
      labs(x=input$PlotInput, y="違約機率")
    
    })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

