# Andy Philips
# aphilips@pols.tamu.edu
# 12/02/15
# --------------------------------#
library(ggplot2)
shinyServer(function(input, output) {

	output$plot <- renderPlot({
		makeplot <- function()	{
			y <- arima.sim(n = input$obs, list(ar = input$phi))
			plot.ts(y, col = 'blueviolet', lwd=5)
		}
		if(input$goButton) {			# if user presses Re-Simulate
			makeplot()
		} else	{									# so graph appears on startup
			makeplot()
		}
		})

})
