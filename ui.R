
shinyUI(fluidPage(
  titlePanel("Random Distributions"),
sidebarLayout(
  
    sidebarPanel(
      helpText("Generate a random distribution."),
      
      selectInput("type", 
                  label = "Choose a distribution",
                  choices = c("Binomial","Normal","Poisson"),
                  selected = "Normal"),
    
    conditionalPanel(
      condition = "input.type == 'Normal'",    
      
      numericInput("mean", label = "Mean:", value =0),
      
      numericInput("sd", label = "Standard Deviation:", value =1),
      
      sliderInput("n", 
                  label = "Sample size:",
                  min = 2, max = 1000, value = 100)
     ),
    
    conditionalPanel(
      condition = "input.type == 'Binomial'",  
      
      sliderInput("p", label = "Probability of success:", min=0, max=1, value = 0.5),
      sliderInput("n1", 
                  label = "Number of trials n:",
                  min = 2, max = 1000, value = 100),
      sliderInput("num", 
                  label = "Number of observations:",
                  min = 2, max = 1000, value = 100)      
      ),
    
    conditionalPanel(
      condition = "input.type == 'Poisson'",  
   
      numericInput("lambda", label = "Lambda:", value = 1)
    
    )
),

    mainPanel(plotOutput("plot1"))
)
    ))

