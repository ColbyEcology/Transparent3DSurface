# Load pacakges
  library(package = "plot3D")

# Create surface (if not importing one)
  n_facets <- 50
  x_min <- y_min <- 0.1
  x_max <- y_max <- 1
  x <- seq(from = x_min, to = x_max, length.out = n_facets)
  y <- seq(from = y_min, to = y_max, length.out = n_facets)

  # Write a function, f(x, y)
  mod <- function(x, y) {
    z <- ((x -1) / y) + 1
    return(z)
  }

  out <- outer(X = x, Y = y, FUN = mod)

# Plot
  # Find z plotting limits
  out_lims <- c(min(out, na.rm = T), max(out, na.rm = T))

  # Adjust plot margin space
  par(mar = c(2, 2, 1, 1))

  # Plot
  # Note when `ticktype = "simple"` you will get arrows, alpha is transparency for whatever `col` you
  # choose and most everything else should be conventional
  persp3D(x = x, y = y, z = out, add = F, col = "#0000FF", alpha = 0.3, theta = 305, phi = 25, ticktype = "detailed", xlab = "x variable", ylab = "y variable", zlab = "z variable", shade = 0.1, border = "#00000011")
