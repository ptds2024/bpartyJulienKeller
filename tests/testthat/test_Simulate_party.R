test_that("simulate_party computes correct resources", {
  # Simulate party with a fixed lambda
  lambda <- 10
  result <- simulate_party(lambda = lambda)

  # Check that the total volume and surface area are positive
  expect_gt(result$total_volume, 0)
  expect_gt(result$total_surface_area, 0)

  # Check that the results are reasonable given the inputs
  expected_cones <- lambda * 1.5  # Average of 1.5 cones per guest
  expected_volume <- expected_cones * calculate_volume()
  expected_surface_area <- expected_cones * calculate_surface_area()

  expect_equal(result$total_volume, expected_volume, tolerance = 0.1 * expected_volume)
  expect_equal(result$total_surface_area, expected_surface_area, tolerance = 0.1 * expected_surface_area)
})
