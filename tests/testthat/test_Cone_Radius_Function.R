test_that("cone_radius calculates correctly", {
  x <- c(-1, 0, 4, 8, 8 + pi/4, 10)
  result <- cone_radius(x)
  expected <- c(0, 0, 4 / 8, 1, 1 + 1.5 * sin(pi/4), 0)
  expect_equal(result, expected)
})

