
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  # Application title
  headerPanel("Central Limit Theorem"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    h5("Step 1: Slide the random samples to define the total number of draw from the box, consists of 1 to 10 with replacement"),
    h5("default no. of random samples = 500"),
    sliderInput("draw_count",
                "No. of random samples:",
                min = 250,
                max = 600,
                value = 500,
                step=50),
    h5("Step 2: Slide the sample size to define how many numbers to draw for averaging"),
    h5("default sample size = 5"),
    
    sliderInput("sample_count",
                "Sample size:",
                min = 1,
                max = 9,
                value = 5,
                step=2),
    
    h5("Note: Observe the 'Histogram of Random Number' and 'Histogram of N-Sample Average' plots"),
    h5("a. the N-Sample plot is normal"),
    h5("b. both has the same mean"),
    h5("c. the N-Sample std. dev. is 1/sqrt(N) of the random number one")
  ),

  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
