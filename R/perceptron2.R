# based on https://github.com/log0/perceptron/blob/master/perceptron.r
#

# Define initial points

source("utils.R")

X <- X10

Y <- Y10

N <- length(Y)

converged <- F

# Initialize weight vector to 0
W <- matrix(c(0, .5, .5), 1, 3)

X <- cbind(rep(1, N), X)

xrange <- max(X[,2]) - min(X[,2])

# point pch
shapes <- c(21, 16)

# colors

colors <- c(points = "grey50",
            mispoint = "blue",
            weight_vector = "#CF0000",
            x_i = "blue",
            vector_sum = "purple")


  # Run for a maximum of 10000 iterations
  for (i in 1:10000)
  {

# determine decision boundary

    # Calculate h(x) with the weight vector W and the data input X
    h.X <- sign(W %*% t(X))

    # Check if points are classified correctly

    if (sum(h.X != Y) != 0) {
      # If not all are correct, update the weight vector using a randomly selected misclassified point

      # Get the misclassified points out
      misclassified.points <- X[h.X != Y, , drop = F]
      misclassified.points.Y <- Y[h.X != Y]

      # Get one of them
      index <- sample(dim(misclassified.points)[1], 1)

      misclassified.point <- misclassified.points[index, , drop = F]
      misclassified.point.Y <- misclassified.points.Y[index]

      # draw points

      plot(X[,2:3], pch = shapes[as.factor(Y)],
           col = colors["points"],
           asp = 1,
           xlim = c(min(X[,2]) - xrange,
                    max(X[,2]) + xrange))

      draw_axes()

      draw_hyperplane(W)

      circle_point(misclassified.point[1, 2],
                   misclassified.point[1, 3])

      draw_weight_vector(W)

      # misclassified point vector
      arrows(0, 0,
             misclassified.point[1,2],
             misclassified.point[1,3],
             col = colors["x_i"], lty = "dashed",
             length = .1)


      # misclassified point vector added to or subtracted from weight vector
       arrows(W[2] + shift(W)["x"], W[3] + shift(W)["y"],
              W[2] + shift(W)["x"] + misclassified.point.Y * misclassified.point[1,2],
              W[3] + shift(W)["y"] + misclassified.point.Y * misclassified.point[1,3],
              col = colors["x_i"],
              length = .1)

       # direction of new weight vector w + YiXi
       arrows(shift(W)["x"], shift(W)["y"],
              W[2] + shift(W)["x"] + misclassified.point.Y * misclassified.point[1,2],
              W[3] + shift(W)["y"] + misclassified.point.Y * misclassified.point[1,3],
              col = colors["vector_sum"], # posy
              lwd = 3,
              length = .1)


       # delay
       # Sys.sleep(.5)
       readline("Press enter to continue")


       # Now update the weight vector
       W <- W + misclassified.point.Y %*% misclassified.point

    } else {
      # Yes! We are done.
      cat('Converged! Iteration ', i, ' , with final weight : ', W, '\n')

      # final hyperplane
      abline(a = intercept(W), b = slope(W), col="grey50", lwd = 2)

      break
    }

    # repeat
  }


title(paste("Converged! Iteration ", i))

