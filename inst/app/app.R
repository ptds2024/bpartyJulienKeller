library(shiny)
library(shinythemes)
library(owmr)
library(ggplot2)

mykey <- "7fa76ff39ad1825f2d96471812591a6a"

ui <- fluidPage(
  theme = shinytheme("united"),
  titlePanel("Climatic Factors Today and Next 5 Days"),
  fluidRow(
    column(4,
           textInput("city", label = "Enter City Name:", value = "Lausanne"),
           selectInput("parameter", label = "Select Parameter",
                       choices = c("Temperature", "Humidity", "Pressure")),
           actionButton("submit", "Get Weather Info")
    ),
    column(8,
           span(textOutput("current_weather"), style = "font-size: 18px; color: grey;"),
           plotOutput("forecast_plot")
    )
  )
)

server <- function(input, output, session) {
  validate_city <- function(city_name, api_key) {
    response <- httr::GET(
      "http://api.openweathermap.org/data/2.5/weather",
      query = list(q = city_name, appid = api_key)
    )
    return(httr::status_code(response) == 200)
  }

  # Traduit les paramètres en termes API
  translate_parameter <- function(parameter) {
    switch(parameter,
           "Temperature" = "temp",
           "Humidity" = "humidity",
           "Pressure" = "pressure",
           NULL)
  }

  # Mesure pour le paramètre sélectionné
  parameter_units <- function(parameter) {
    switch(parameter,
           "Temperature" = "°C",
           "Humidity" = "%",
           "Pressure" = "hPa",
           "")
  }

  # Obtenir les données météo actuelles
  current_weather <- eventReactive(input$submit, {
    parameter <- translate_parameter(input$parameter)
    if (is.null(parameter)) {
      return("Please select a valid parameter.")
    }

    owmr_settings(api_key = mykey)
    if (!validate_city(input$city, mykey)) {
      return("Invalid city name. Please check your input.")
    }

    weather_data <- owmr::get_current(city = input$city, units = "metric")
    value <- weather_data$main[[parameter]]
    paste0("The ", input$parameter, " in ", input$city, " is ", value, " ", parameter_units(input$parameter), ".")
  })

  # Obtenir les prévisions météo
  forecast_plot <- eventReactive(input$submit, {
    parameter <- translate_parameter(input$parameter)
    if (is.null(parameter)) {
      return(NULL)
    }

    owmr_settings(api_key = mykey)
    if (!validate_city(input$city, mykey)) {
      return(NULL)
    }

    forecast_data <- owmr::get_forecast(city = input$city, units = "metric")
    forecast_df <- owmr::owmr_as_tibble(forecast_data)
    forecast_df$datetime <- as.POSIXct(forecast_df$dt_txt, tz = "UTC")

    ggplot(forecast_df, aes(x = datetime, y = .data[[parameter]])) +
      geom_line(color = "blue") +
      labs(
        title = paste("5-Day Forecast for", input$parameter, "in", input$city),
        x = "Datetime",
        y = paste0(input$parameter, " (", parameter_units(input$parameter), ")")
      ) +
      theme_minimal()
  })

  output$current_weather <- renderText({ current_weather() })
  output$forecast_plot <- renderPlot({ forecast_plot() })
}

shinyApp(ui = ui, server = server)
