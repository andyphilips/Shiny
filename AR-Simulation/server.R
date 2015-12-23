# Andy Philips
# aphilips@pols.tamu.edu
# 12/02/15
# --------------------------------#
library(ggplot2)
shinyServer(function(input, output) {

	output$plot <- renderPlot({
		makeplot <- function()	{
			y <- arima.sim(n = input$obs, list(ar = input$phi))
			dataset <- data.frame(Time = seq(1:input$obs),series = "y",y)
			ggplot(data=dataset, aes(x=Time,y=y, group = series, colour = series)) + geom_line() + theme_minimal() + scale_color_brewer(palette="Accent") + theme(legend.position="none")
		}
		if(input$goButton) {			# if user presses Re-Simulate
			makeplot()
		} else	{									# so graph appears on startup
			makeplot()
		}
		})

})
