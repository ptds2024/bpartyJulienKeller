# bpartyJulienKeller
 
# bpartyJulienKeller

The `bpartyJulienKeller` package provides tools for managing resources for birthday parties, focusing on ice cream cones and guest predictions based on weather. The package includes functionalities to calculate the volume and surface area of cones, simulate resource needs based on guest behavior, and explore weather data interactively through a Shiny application. 

To install the package, use the following command in R: 
`devtools::install_github("your_github_username/bpartyJulienKeller")`. Replace `your_github_username` with your actual GitHub username.

After installing, load the package with `library(bpartyJulienKeller)`. You can calculate the volume and surface area of a cone using `calculate_volume()` and `calculate_surface_area()` respectively. For example, run `calculate_volume()` to get the cone volume in cubic centimeters and `calculate_surface_area()` to get the cone's surface area in square centimeters.

To simulate total resource needs for a party, use the `simulate_party()` function. Provide parameters such as the average number of guests (`lambda`), the probability of each guest consuming one cone (`prob_one_cone`), and the probability of consuming two cones (`prob_two_cones`). For example, running `simulate_party(lambda = 10, prob_one_cone = 0.7, prob_two_cones = 0.3)` will return the total ice cream volume and coating surface area required.

You can also launch the Shiny application using `run_app()`. The app allows you to interact with weather data and dynamically predict resource requirements for a party based on temperature, humidity, and other factors.

To validate the functionality of the package, run `devtools::test()` to execute the included test suite and ensure everything works as expected.

This package is licensed under the MIT License. For more details, refer to the `LICENSE` file.
