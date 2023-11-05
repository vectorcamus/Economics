library(shiny)

ui <- fluidPage(
  titlePanel("Scatter Plot with Shiny"),
  sidebarLayout(
    sidebarPanel(
      h3("Select Data Points:"),
      sliderInput("x_range", "X Range:", min = 20, max = 40, value = c(20, 40)),
      sliderInput("y_range", "Y Range:", min = 20, max = 40, value = c(20, 40))
    ),
    mainPanel(
      plotOutput("scatterplot")
    )
  )
)

server <- function(input, output) {
  output$scatterplot <- renderPlot({
    x <- c(20, 30, 40)
    y <- c(20, 40, 40, 39)
    
    filtered_data <- data.frame(x = x, y = y)
    filtered_data <- filtered_data[filtered_data$x >= input$x_range[1] & filtered_data$x <= input$x_range[2] &
                                     filtered_data$y >= input$y_range[1] & filtered_data$y <= input$y_range[2],]
    
    plot(filtered_data$x, filtered_data$y, pch = 19, col = "blue",
         xlab = "X", ylab = "Y",
         main = "Scatter Plot")
  })
}

shinyApp(ui = ui, server = server)
