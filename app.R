library(shiny)

valg_år <- c("2018","2019","2020","2021","2022")

ui <- fluidPage(
  selectInput("regnskabsår", "Vælg regnskabsår", valg_år),
)

server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}


shinyApp(ui, server)
