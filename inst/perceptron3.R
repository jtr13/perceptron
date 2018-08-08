# based on https://github.com/billderose-zz/perceptron/blob/master/perceptron.R

library(rgl)

# Random.Unit returns n dim-dimensional points in the unit interval labeled
# -1 or 1. The label depends on whether or not the sum of the vector's
# components exceeds the given threshold. That is, -1 if sum(vector) < threshold
# and 1 otherwise.
Random.Unit <-function(n, dim, threshold) {
  points <- runif(n * dim)
  points <- matrix(points, ncol = dim)
  label <- ifelse(apply(points, 1, sum) < threshold, -1, 1)
  return(cbind(label, x0 = rep(1, n), points))
}

# Classify is our simple classification rule for the perceptron.We simply
# return the sign of the dot-product of our observations and weights
Classify <- function(x, weights) {
  return(sign(x %*% weights))
}

# Perceptron is a simple implementation of the perceptron learning algorithm.
# It accepts data of the form data[1] = label, data[2] = x_0 = 1, data[3] = x_1,
# etc. w0 is initilized to -threshold and the weights returned are such that
# sign(w_0 * x_0 + w_1 * x_1 + ... + w_n * x_n) == label
Perceptron <- function(data, threshold) {
#  w <- c(-threshold, runif(ncol(data) - 2))
  w <- c(0, 0, 0)
  n <- nrow(data)
  label <- data[ , 1]
  obs <- data[ , 2:ncol(data)]
  misclassfied <- TRUE
  its <- 0
  while (misclassfied) {
    its <- its + 1
    slope <- -w[1]/w[3]
    intercept <- -w[2]/w[3]
    points(data[, 3:4], xlab = "X", ylab = "Y",
           pch = 16,
           #pch = ifelse(data[, 1] == 1, 2, 8),
           col = ifelse(data[, 1] == 1, "blue", "red"))
    if (is.finite(slope)) abline(slope, intercept,
                           col = "green")
#    Sys.sleep(.1)
    if (is.finite(slope)) abline(slope, intercept,
                          col = "white")
    misclassfied <- FALSE
    for (i in 1:n) {
      if (!misclassfied) {
        if (label[i] * Classify(obs[i , ], w) <= 0) {
          w <- w + label[i] * obs[i , ]
          misclassfied <- TRUE
        }

      }
    }
  }
  abline(slope, intercept, col = "red")
  title(paste("Converged! Iterations:", its))
  return(w)
}


THRESHOLD <- 0.75
# pts <- Random.Unit(100, 2, THRESHOLD)
# load("pts.rds")

#plot(pts[, 3:4], xlab = "X", ylab = "Y",
#     pch = 16,
#     pch = ifelse(pts[, 1] == 1, 2, 8),
#     col = ifelse(pts[, 1] == 1, "blue", "red"))

#w <- Perceptron(pts, THRESHOLD)


