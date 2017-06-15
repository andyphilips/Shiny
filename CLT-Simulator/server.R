# Andy Philips
# andrew.philips@colorado.edu
# 06/08/17
# --------------------------------#
shinyServer(function(input, output) {
	output$plot1 <- renderPlot({
		dist <- switch(input$dist,
									 norm = rnorm(n = input$obs, mean = 1),
									 unif = runif(n = input$obs, min = 0, max = 2),
									 expo = rexp(n = input$obs, rate = 1.0))
		hist(dist, main = "Selected Distribution", col = "mediumorchid2")
	})

	output$plot2 <- renderPlot({
		dist <- switch(input$dist,
									 norm = replicate(input$samples, mean(rnorm(n = input$obs, mean = 1))),
									 unif = replicate(input$samples, mean(runif(n = input$obs, min = 0, max = 2))),
									 expo = replicate(input$samples, mean(rexp(n = input$obs, rate = 1.0))))
		#res <- replicate(input$samples, mean(rnorm(n = input$obs, mean = 1)))
		res <- dist
		hist(res, main = "Histogram of Means of Each Sample", col = "cornflowerblue")
		output$summary <- renderPrint({
			summary(res)
		})
	})

})