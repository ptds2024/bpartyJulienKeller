#' @title Run Shiny Application
#' @description Launches the Shiny app for weather-based simulations.
#' @return None. This function starts the Shiny application.
#' @examples
#' if (interactive()) {
#'   run_app()
#' }
#' @export
run_app <- function() {
  app_dir <- system.file("app", package = "bpartyJulienKeller")
  if (app_dir == "") {
    stop("Could not find Shiny app directory. Try re-installing the package.", call. = FALSE)
  }
  shiny::runApp(app_dir)
}
