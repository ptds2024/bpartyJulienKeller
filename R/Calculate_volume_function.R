#' @title Calculate Volume of a Cone
#' @description Computes the volume of an ice cream cone using numerical integration.
#' @return The volume of the cone in cubic centimeters.
#' @examples
#' calculate_volume()
#' @importFrom stats integrate
#' @export
calculate_volume <- function() {
  # Define the cone radius function (from previous exercise)
  cone_radius <- function(x) {
    result <- numeric(length(x))
    result[x >= 0 & x < 8] <- x[x >= 0 & x < 8] / 8
    result[x >= 8 & x < (8 + pi/2)] <- 1 + 1.5 * sin(x[x >= 8 & x < (8 + pi/2)] - 8)
    result[x >= (8 + pi/2) & x < 10] <- 2.5 - 2 * cos(x[x >= (8 + pi/2) & x < 10] - 8)
    return(result)
  }

  # Square of the radius
  cone_radius_squared <- function(x) {
    h <- cone_radius(x)
    return(h^2)
  }

  # Integrate to find the volume
  result <- integrate(cone_radius_squared, lower = 0, upper = 10)
  volume <- pi * result$value

  return(volume)
}
