test_that("run_app locates the app directory correctly", {
  app_dir <- system.file("app", package = "bpartyJulienKeller")
  expect_true(dir.exists(app_dir))

  # Vérifie que run_app ne génère pas d'erreur (si le test est interactif)
  if (interactive()) {
    expect_error(run_app(), NA) # Pas d'erreur attendue
  }
})
