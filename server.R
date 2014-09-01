library(MASS)
#library(RColorBrewer)
#color palette option
# c1 <- brewer.pal(12, "Set3")
# c2 <- brewer.pal(8, "Set2")
# c3 <- brewer.pal(9, "Pastel1")
# c4 <- brewer.pal(8, "Pastel2")
# c <- c(c1,c2,c3,c4)

shinyServer(function(input, output) {
  

output$plot1 <- renderPlot({
  if (input$type=="Normal") {
    dist <- rnorm(input$n, input$mean, input$sd)
    truehist(dist, nbins=30, col= "#7FEBD5") #col = c[sample(1:37,1)]
    lines(density(dist), col="darkblue", lwd=2)
    curve(dnorm(x, mean=input$mean, sd=input$sd),col=2, lwd=2, add=TRUE)
    legend("topright", legend=c("random distribution density", "normal curve"), lty=1, lwd=2, col=c("darkblue",2))
  }
  else if (input$type=="Binomial") {
    dist <- rbinom(input$num, input$n1, input$p)
    truehist(dist, nbins=30, col= "#7FEBD5")
    lines(density(dist), col="darkblue", lwd=2)
    legend("topright", legend=c("random distribution density"), lty=1, lwd=2, col=c("darkblue",2))
  }
  else if (input$type=="Poisson"){
    dist <- rnorm(input$n, input$mean, input$sd)
    truehist(dist, nbins=30, col= "#7FEBD5") #col = c[sample(1:37,1)]
    lines(density(dist), col="darkblue", lwd=2)
    curve(dnorm(x, mean=input$mean, sd=input$sd),col=2, lwd=2, add=TRUE)
    legend("topright", legend=c("random distribution density", "normal curve"), lty=1, lwd=2, col=c("darkblue",2))
    
  }

})
})