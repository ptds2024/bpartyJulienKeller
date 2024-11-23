#' @title Calculate Surface Area of a Cone
#' @description Computes the surface area of an ice cream cone using numerical integration.
#' @return The surface area of the cone in square centimeters.
#' @examples
#' calculate_surface_area()
#' @importFrom stats integrate
#' @export
calculate_surface_area <- function() {
  # Define the cone radius function (from previous exercise)
  cone_radius <- function(x) {
    result <- numeric(length(x))
    result[x >= 0 & x < 8] <- x[x >= 0 & x < 8] / 8
    result[x >= 8 & x < (8 + pi/2)] <- 1 + 1.5 * sin(x[x >= 8 & x < (8 + pi/2)] - 8)
    result[x >= (8 + pi/2) & x < 10] <- 2.5 - 2 * cos(x[x >= (8 + pi/2) & x < 10] - 8)
    return(result)
  }

  # Derivative of the cone radius using finite differences
  cone_radius_derivative <- function(x, epsilon = 1e-5) {
    (cone_radius(x + epsilon) - cone_radius(x)) / epsilon
  }

  # Surface area integrand: h(x) * sqrt(1 + (dh/dx)^2)
  surface_area_integrand <- function(x) {
    h <- cone_radius(x)
    dh_dx <- cone_radius_derivative(x)
    return(h * sqrt(1 + dh_dx^2))
  }

  # Integrate to find the surface area
  result <- integrate(surface_area_integrand, lower = 0, upper = 10)
  surface_area <- 2 * pi * result$value

  return(surface_area)
}
