test_that("calculate_volume computes the correct volume", {
  # Calculer le volume
  volume <- calculate_volume()

  # Vérifiez que le volume est un nombre positif
  expect_gt(volume, 0)

  # Comparer avec une valeur théorique connue
  theoretical_volume <- pi * ((193/6) - (49 * pi / 16) - 10 * sin(2) + sin(4))
  expect_equal(volume, theoretical_volume, tolerance = 1e-3)
})
