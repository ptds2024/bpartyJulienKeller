#' @title Cone Radius Function
#' @description Calculates the radius of the cone based on the given piecewise function.
#' @param x Numeric vector representing the height of the cone.
#' @return A numeric vector with the calculated radii for each x.
#' @examples
#' cone_radius(seq(0, 10, length.out = 100))
#' @export
cone_radius <- function(x) {
  result <- numeric(length(x))
  result[x >= 0 & x < 8] <- x[x >= 0 & x < 8] / 8
  result[x >= 8 & x < (8 + pi/2)] <- 1 + 1.5 * sin(x[x >= 8 & x < (8 + pi/2)] - 8)
  result[x >= (8 + pi/2) & x < 10] <- 2.5 - 2 * cos(x[x >= (8 + pi/2) & x < 10] - 8)
  return(result)
}

library(testthat)

test_that("cone_radius calculates correctly", {
  x <- c(-1, 0, 4, 8, 8 + pi/4, 10)
  result <- cone_radius(x)
  expected <- c(0, 0, 4 / 8, 1, 1 + 1.5 * sin(pi/4), 0)
  expect_equal(result, expected)
})

