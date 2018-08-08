library(shiny)
library(ggplot2)
library(readr)
library(ggthemes)
library(forcats)

dta <- read.csv("C:\\Users\\user\\Desktop\\week5-20180807T160642Z-001\\week5\\123456\\123.csv", header=T, sep=",")


shinyServer(function(input, output) {
  
  output$博士<-renderPlot({
    ggplot(data=dta,aes(x=年月,y=博士,xmax=100,ymax=100))+geom_bar(width=1,stat="identity")+ggtitle(expression(atop("博士生106年消費金額",atop("")))) +theme(plot.title=element_text(size=20)) +theme_igray()+scale_colour_tableau()
  }, height = 600, width = 900)
 
  
  output$碩士<-renderPlot({
    ggplot(data=dta,aes(x=年月,y=碩士,xmax=100,ymax=100))+geom_bar(width=1,stat="identity")+ggtitle(expression(atop("碩士生106年消費金額",atop("")))) +theme(plot.title=element_text(size=20)) +theme_igray()+scale_colour_tableau()
  }, height = 600, width = 900)
  
  output$大學<-renderPlot({
    ggplot(data=dta,aes(x=年月,y=大學,xmax=100,ymax=100))+geom_bar(width=1,stat="identity")+ggtitle(expression(atop("大學生106年消費金額",atop("")))) +theme(plot.title=element_text(size=20)) +theme_igray()+scale_colour_tableau()
  }, height = 600, width = 900)
   
  output$專科<-renderPlot({
    ggplot(data=dta,aes(x=年月,y=專科,xmax=100,ymax=100))+geom_bar(width=1,stat="identity")+ggtitle(expression(atop("專科生106年消費金額",atop("")))) +theme(plot.title=element_text(size=20)) +theme_igray()+scale_colour_tableau()
  }, height = 600, width = 900)
  
  output$高中高職<-renderPlot({
    ggplot(data=dta,aes(x=年月,y=高中高職,xmax=100,ymax=100))+geom_bar(width=1,stat="identity")+ggtitle(expression(atop("高中高職生106年消費金額",atop("")))) +theme(plot.title=element_text(size=20)) +theme_igray()+scale_colour_tableau()
  }, height = 600, width = 900)
  
  output$data.raw <- DT::renderDataTable({
    DT::datatable(dta)
    
  })
  
  
 
  
  
  })

