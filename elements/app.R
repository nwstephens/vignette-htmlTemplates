library(shiny)

ui <- htmlTemplate(
  "index.html",
  t1 = titlePanel("Old Faithful Geyser Data"),
  i1 = sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30),
  p1 = plotOutput("distPlot")
)

server <- function(input, output) {
    output$distPlot <- renderPlot({
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

shinyApp(ui = ui, server = server)
