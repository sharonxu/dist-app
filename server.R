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
    truehist(dist, nbins=30, col= "#FFFFB3")
    lines(density(dist), col="darkblue", lwd=2)
    legend("topright", legend=c("random distribution density"), lty=1, lwd=2, col=c("darkblue",2))
  }
  else if (input$type=="Poisson"){
    x <- 0:15
    x1 <- dpois(x, input$lambda)
    i <- input$lambda
    barplot(x1, names.arg=c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10","11","12","13","14","15"), ylab=expression(P(x)), ylim=c(0,signif(x1[1] +.1, digits=2)), col="lightgreen")
title(main = substitute(lambda == i))
#Poisson graph from http://www.stattler.com/article/how-do-graph-using-r
  }

})
})