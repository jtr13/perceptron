X10 <- matrix(c(-1, 1, 2, 4, 6, 4, 6, 6, 5, 8,
                -3, 7, 4, 4, 2, 8, 6, 8, 10, 10)/5, 10)

Y10 <- c(-1, -1, -1, -1, -1, 1, 1, 1, 1, 1)

X4 <- matrix(c(0,0,1,1,0,1,0,1), 4)

Y4 <- c(-1, 1, 1, 1)


# function to generate random linearly separable points
# from : github.com/billderose-zz/perceptron

Random.Unit <-function(n, dim, threshold) {
  points <- runif(n * dim)
  points <- matrix(points, ncol = dim)
  label <- ifelse(apply(points, 1, sum) < threshold, -1, 1)
  return(cbind(label, x0 = rep(1, n), points))
}

intercept <- function(w) -w[1]/w[3]

slope <- function(w) -w[2]/w[3]

shift <- function(w) {
  s <- vector()
  s["x"] <- intercept(w) / (w[2]/w[3] + w[3]/w[2])
  s["y"] <- s["x"] * W[3]/W[2]
  return(s)
}





draw_axes <- function() {
  abline(h = 0, col = "grey80")
  abline(v = 0, col = "grey80")
}


draw_hyperplane <- function(w) {
  slope <- slope(w)
  intercept <- intercept(w)
  if (is.finite(slope) & is.finite(intercept)) {
    abline(a = intercept, b = slope,
           col="grey80", lwd = 2)
  }
}


draw_weight_vector <- function(w) {
  shift <- shift(w)
  arrows(shift["x"], shift["y"], w[2] + shift["x"],
         w[3] + shift["y"],
         col = "#CF0000",
         length = .1)
}


circle_point <- function(x, y) {
  points(x, y, col = "blue", cex = 2)
}

