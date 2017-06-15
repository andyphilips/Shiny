# Andy Philips
# andrew.philips@colorado.edu
# 06/08/17
# --------------------------------#


shinyUI(fluidPage(
	includeCSS("style.css"),
	titlePanel("Central Limit Theorem Simulator"),
	sidebarLayout(position = "right",
								sidebarPanel(
									radioButtons("dist", "Choose Distribution",
											c("Normal" = "norm",
											"Uniform" = "unif",
											"Exponential" = "expo")),
									sliderInput(inputId = "obs",
															label = "Number of Observations Per Sample",
															min = 1, max = 500, value = 50),
									br(),
									sliderInput(inputId = "samples", label = "Number of Samples", min = 1, max = 10000, value = 100),
									br()
								),
								mainPanel(
									p("This app shows the Central Limit Theorem in action. The Central Limit Theorem states that, given a large enough number of independent, identically distributed samples, the resulting means of the samples will be distributed approximately normal. In other words, the mean of the means of the samples converge to the population mean, given enough samples."),
									p("Below you can try out the CLT for yourself across a number of different distributions, number of observations in each sample, and the total number of samples. Note that the data were sampled with mean equal to one for all distributions."),
									p("Author: ",
										a("Andrew Q. Philips", href = "http://www.andyphilips.com/")),
									plotOutput("plot1"),
									br(),
									fluidRow(column(6, p("Summary Statistics of Means of Samples"),
																	verbatimTextOutput("summary")),
									column(6, plotOutput("plot2")))
								)
	)


))





