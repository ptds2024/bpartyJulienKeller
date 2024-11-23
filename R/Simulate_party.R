#' @title Simulate Party Resources
#' @description Simulates the total volume and surface area required for a party based on guest behavior.
#' @param lambda Numeric value for the average number of guests (Poisson distribution mean).
#' @param prob_one_cone Probability that a guest eats 1 cone (default: 0.67).
#' @param prob_two_cones Probability that a guest eats 2 cones (default: 0.33).
#' @return A list containing the total volume of ice cream and surface area required.
#' @examples
#' simulate_party(lambda = 10, prob_one_cone = 0.67, prob_two_cones = 0.33)
#' @importFrom stats rpois
#' @export
simulate_party <- function(lambda, prob_one_cone = 0.67, prob_two_cones = 0.33) {
  # Simulate the number of guests
  n_guests <- rpois(1, lambda)

  # Simulate the number of cones consumed
  total_cones <- sum(sample(c(1, 2), size = n_guests, replace = TRUE, prob = c(prob_one_cone, prob_two_cones)))

  # Compute the total volume and surface area
  cone_volume <- calculate_volume()
  cone_surface_area <- calculate_surface_area()

  total_volume <- total_cones * cone_volume
  total_surface_area <- total_cones * cone_surface_area

  return(list(
    total_volume = total_volume,
    total_surface_area = total_surface_area
  ))
}
