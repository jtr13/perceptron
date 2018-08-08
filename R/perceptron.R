# based on https://github.com/log0/perceptron/blob/master/perceptron.r
#
# Compile Report to see all interations
#
# Perceptron Learning Algorithm implementation
#
# This script demonstrates how to implement a working perceptron, one of the most basic
# algorithm in the machine learning field.
#
# As long as the data is linearly separable, it is guaranteed to converge in a finite
# number of iterations.

####################################################################################
# The core perceptron learning algorithm
#
# 1) Initialize the weight vector W to 0
# 2) Calculate h(x) = sign(transpose of W * (X))
# 3) Pick any misclassified point (xn, yn)
# 4) Update the weight vector by w <- w + yn * xn
# 5) Repeat until no points are misclassified
####################################################################################
perceptron <- function(X, Y)
{

  converged <- F

  # Initialize weight vector to 0
  W <- matrix(0, 1, 3)
  X <- cbind(rep(1, 10), X)

  plot(X[,2:3], pch = 16, col = as.factor(Y),
       xlim = c(-2, 2),
       ylim = c(-2, 2))

  # Run for 10000 iterations
  for (i in 1:10000)
  {
    tmp <- readline("Press enter")
    print(paste("Iteration", i))
    print("Weights:")
    print(W)

    lines(decision.boundary(W), col="red")
    arrows(0, 0, W[2], W[3], col = "green")

    # Calculate h(x) with the weight vector W and the data input X
    h.X <- fn.sign(W %*% t(X))

    # Calculate the misclassified mask
    misclassified.mask <- h.X != Y

    # Check if all of the points are classified correctly
    if (sum(misclassified.mask) == 0)
    {
      # Yes! We are done.
      converged <- T
      break
    }
    else
    {
      # No! We have to update the weight vector now using any one of the misclassified input

      # Get the misclassified points out
      misclassified.points <- X[misclassified.mask, , drop = F]
      misclassified.points.Y <- Y[misclassified.mask]

      # Get one of them
      misclassified.point.index <- sample(dim(misclassified.points)[1], 1)
      misclassified.point <- misclassified.points[misclassified.point.index, , drop = F]
      misclassified.point.Y <- misclassified.points.Y[misclassified.point.index]

      points(misclassified.point[1, 2],
             misclassified.point[1, 3],
             col = "green", cex = 2)


      # Now update the weight vector
      W <- W + misclassified.point.Y %*% misclassified.point
    }

    # repeat
  }

  if (converged)
  {
    cat('Converged! Iteration ', i, ' , with final weight : ', W, '\n')
  }
  else
  {
    cat('DID NOT CONVERGE!\n')
  }

  return(W)
}


#####################\###############################################################
# The SIGN function in the perceptron learning algorithm
####################################################################################
fn.sign <- function(values)
{
  return(ifelse(values > 0, 1, -1))
}

####################################################################################
# This function calculates the two ending points of the decision boundary given
# a weight vector. Not necessarily in practice, but just to help visualize for
# you to see.
####################################################################################
decision.boundary <- function(W)
{
  X1 <- c(-2.0, 2.0)
  X2 <- -(W[2]/W[3]) * X1 - W[1]/W[3]
  return(matrix(cbind(X1, X2), 2, 2))
}

# Define initial points


X <- matrix(c(1, 1, 2, 4, 6, 4, 6, 6, 5, 8, 3, 7, 4, 4, 2, 8, 6, 8, 10, 10)/10, 10)

Y <- c(-1, -1, -1, -1, -1, 1, 1, 1, 1, 1)


# Run perceptron algorithm
W <- perceptron(X, Y)

# Plot learned decision boundary
#lines(decision.boundary(W), col="red")

title(paste("Perceptron training against N = 10"))


