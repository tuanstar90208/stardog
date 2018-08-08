library(shiny)
library(ggplot2)
library(readr)
library(datasets)

dta <- read.csv("../week5/123.csv", header=T, sep=",")


function(input, output) {
  
  output$phonePlot <- renderPlot({
    
    barplot(WorldPhones[,input$region]*1000, 
            main=input$region,
            ylab="花費",
            xlab="教育程度")
  })
}