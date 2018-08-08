# based on https://github.com/log0/perceptron/blob/master/perceptron.r
#

# Define initial points
#
# X <- X10
#
# Y <- Y10
#
#

data <- Random.Unit(100, 2, .75)

X <- data[,3:4]

Y <- data[,1]

N <- length(Y)


converged <- F

# Initialize weight vector to 0
W <- matrix(c(0, .5, .5), 1, 3)

X <- cbind(rep(1, N), X)



# point pch
shapes <- c(21, 16)


  # Run for a maximum of 10000 iterations
  for (i in 1:10000)
  {

# determine decision boundary

    # Calculate h(x) with the weight vector W and the data input X
    h.X <- sign(W %*% t(X))

    # Check if points are classified correctly

    if (sum(h.X != Y) != 0) {
      # If not all are correct, update the weight vector using a randomly selected mis point

      # Get the mis points out
      mis.points <- X[h.X != Y, , drop = F]
      mis.points.Y <- Y[h.X != Y]

      # Get one of them
      index <- sample(dim(mis.points)[1], 1)

      mis.point <- mis.points[index, , drop = FALSE]
      mis.point.Y <- mis.points.Y[index]

      par(las = 1, xpd = TRUE)

      draw_points(X[,2], X[,3], Y)

      draw_axes()

      draw_hyperplane(W)

      circle_point(mis.point)

      draw_weight_vector(W)

      draw_mis_vector(mis.point)

      draw_mis_vector_added(W, mis.point, mis.point.Y)

      draw_new_weight_vector(W, mis.point, mis.point.Y)


       # delay
       # Sys.sleep(.1)
       readline("Press enter to continue. ")


       # Now update the weight vector
       W <- W + mis.point.Y %*% mis.point

    } else {
      # Yes! We are done.
      cat('Converged! Iteration ', i, ' , with final weight : ', W, '\n')

      # final hyperplane
      draw_points(X[,2], X[,3], Y)

      draw_axes()

      draw_hyperplane(W)

      break
    }

    # repeat
  }


title(paste("Converged! Iteration ", i))

