test_that("calculate_surface_area computes the correct surface area", {
  # Calculer la surface
  surface_area <- calculate_surface_area()

  # Vérifiez que la surface est un nombre positif
  expect_gt(surface_area, 0)

  # Comparer avec une valeur attendue approximative
  expected_surface_area <- 68.86146  # Valeur calculée précédemment
  expect_equal(surface_area, expected_surface_area, tolerance = 1e-3)
})
