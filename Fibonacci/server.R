
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(fibor)
library(ggplot2)
co <- function(x) {
  fibx <- fibonacci(x+1)[3:(x+2)]
  fiby <- fibx
  print(fibx)
  print(fiby)
  cx <- c(0)
  cy <- c(0)
  for (k in 1:x) {
    if ((k%%4) == 1 || (k%%4) == 2) {
      fibx[k] <- -fibx[k]
    } 
    if ((k%%4) >= 2) {
      fiby[k] <- -fiby[k]
    }
    cx <- append(cx, sum(fibx[1:k]))
    print(cx)
    print(fibx)
    cy <- append(cy, sum(fiby[1:k]))
    print(cy)
    print(fiby)
  }
  co <- matrix(c(cx, cy), nrow = (x+1), ncol = 2)
  return(co)
}
sp <- co(50)
df <- data.frame(x = c(sp[,1]), y = c(sp[,2]))
shinyServer(function(input, output) {

  output$FibPlot <- renderPlot({


    k <- input$Amount


    
    spiral2 <- ggplot(df, aes(x, y))
    for (j in 1:(k-1)) {
      spiral2 <- spiral2 + geom_curve(aes(x[1], y[1], xend = x[2], yend = y[2]), data = data.frame(x = c(sp2[j:(j+1), 1]), y = c(sp2[j:(j+1), 2])), curvature = 0.4)
    }
    spiral2+ xlim(-abs(max(df[j+1,])), abs(max(df[j+1,])))+ ylim(-abs(max(df[j+1,])), abs(max(df[j+1,])))

  })

})
