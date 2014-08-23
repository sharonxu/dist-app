library(MASS)
library(RColorBrewer)
c1 <- brewer.pal(12, "Set3")
c2 <- brewer.pal(8, "Set2")
c3 <- brewer.pal(9, "Pastel1")
c4 <- brewer.pal(8, "Pastel2")
c <- c(c1,c2,c3,c4)

shinyServer(function(input, output) {

  output$plot1 <- renderPlot({
    dist <- rnorm(input$n, input$mean, input$sd)
    truehist(dist, nbins=30, col= c[sample(1:37,1)] )
    lines(density(dist), col="darkblue", lwd=2)
    curve(dnorm(x, mean=input$mean, sd=input$sd),col=2, lwd=2, add=TRUE)
    legend("topright", legend=c("random distribution density", "normal curve"), lty=1, lwd=2, col=c("darkblue",2))
  })
})