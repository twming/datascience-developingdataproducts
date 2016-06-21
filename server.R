
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
        #generate random number
        x<-runif(input$draw_count, min=0, max=10)
        x_mean<-round(mean(x),2)
        x_sd<-round(sd(x),2)
        
        #convert into matrix of m X n (where m is the sample size) 
        x_agg<-colMeans(matrix(data=x,nrow=input$sample_count))
        x_agg_mean<-round(mean(x_agg),2)
        x_agg_sd<-round(sd(x_agg),2)
        
        par(mfrow=c(1,2))
        #plot the random draw
        hist_title<-paste('Histogram of Random Number (mean=',x_mean,',sd=',x_sd,')',sep='')
        hist(x, col = 'darkgray', border = 'white', main=hist_title,xlab='number',ylab='frequency',breaks=10,xlim=c(0,10))
        abline(v=mean(x),col="red")
        
        #plot the N-Sample draw
        hist_title<-paste('Histogram of N-Sample Average (mean=',x_agg_mean,',sd=',x_agg_sd,')',sep='')
        hist(x_agg, col = 'darkgray', border = 'white', main=hist_title,xlab='number',ylab='frequency',breaks=10,xlim=c(0,10))
        abline(v=mean(x_agg),col="red")
  })
  
})
