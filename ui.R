
shinyUI(fluidPage(
  titlePanel("Random Distributions"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Generate a random distribution."),
      
      selectInput("type", 
                  label = "Choose a distribution",
                  choices = c("Binomial","Normal"),
                  selected = "Binomial"),
      if (input$type == "Normal"){
      numericInput("mean", label = "Mean:", value =0),
      
      numericInput("sd", label = "Standard Deviation:", value =1),
      }
      else{
        numericInput("p", label = "p:", value =0.a read, min=),
      }
        
      
      sliderInput("n", 
                  label = "Sample size:",
                  min = 2, max = 500, value = 100)
      ),

    mainPanel(plotOutput("plot1"))
  )
))

C:/Users/Sharon/Downloads/libimseti-complete.zip/libimseti