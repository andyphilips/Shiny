# Andy Philips
# aphilips@pols.tamu.edu
# 12/23/15
# --------------------------------#
shinyServer(function(input, output) {

	output$plot <- renderPlot({
		y <- rnorm(input$obs)
		x1 <- rnorm(input$obs)
		x2 <- rnorm(input$obs)
		e1 <- rnorm(input$obs)
		e2 <- rnorm(input$obs)
		e3 <- rnorm(input$obs)
		for (t in 2:input$obs) y[t] <- y[t-1] + e1[t]
		for (t in 2:input$obs) x1[t] <- x1[t-1] + e2[t]
		for (t in 2:input$obs) x2[t] <- x2[t-1] + e3[t]
		makeplot <- function()	{
			if(input$regressors) {
				y.lim <- range(y, x1, x2)
				plot(y, type = "l", xlab = "Time", ylab = "Value", main = "Unit-Root", col = 'blue', lwd = 3, lty=1, ylim = y.lim)
				lines(x1, col = 'red', lwd = 3, lty = 2)
				lines(x2, col = 'black', lwd = 3, lty = 3)
				legend(1, y.lim[2], c("Y","X1","X2"), cex=0.8,
							 col=c("blue","red","black"), lty=1:3)
			} else	{
				y.lim <- range(y, x1)
				plot(y, type = "l", xlab = "Time", ylab = "Value", main = "Unit-Root", col = 'blue', lwd = 3, lty = 1, ylim = y.lim)
				lines(x1, col = 'red', lwd = 3, lty = 2)
				legend(1, y.lim[2], c("Y", "X1"), cex=0.8, col=c("blue","red"), lty= 1:2)
			}
		}

		output$resids <- renderPlot({
			if(input$regressors) {
				reg <- lm(y ~ x1 + x2)
			} else	{
				reg <- lm(y ~ x1)
			}
			output$summary <- renderPrint({
				summary(reg)
			})
			res.lm <- reg$residuals
			plot(res.lm, type = "l", xlab = "Time", ylab = "Value", main = "OLS Residuals", col = 'black', lwd = 1.5)
			abline(h = 0)
		})

		if(input$goButton) {			# if user presses Re-Simulate
			makeplot()
		} else	{									# so graph appears on startup
			makeplot()
		}
	})

})