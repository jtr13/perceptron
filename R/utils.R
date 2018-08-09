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
  return(cbind(label, x0 = rep(1, n),
               x1 = points[,1] - mean(points[,1]),
               x2 = points[,2] - mean(points[,2])))
}

#' function to determine the intercept of a hyperplane
#'
#' @name intercept
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @return intercept
#'
#' @export

intercept <- function(w) -w[1]/w[3]

#' function to determine the slope of a hyperplane
#'
#' @name slope
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @return slope
#'
#' @export

slope <- function(w) -w[2]/w[3]

#' function to determine the intersection ("shift") of a weight vector and hyperplane
#'
#' @name shift
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @return `shift()` returns a named vector: "x" and "y"
#'
#' @export


shift <- function(w) {
  s <- vector()
  s["x"] <- intercept(w) / (w[2]/w[3] + w[3]/w[2])
  s["y"] <- s["x"] * w[3]/w[2]
  return(s)
}

### PLOTTING FUNCTIONS ####

#' function to circle a point
#'
#' @name circle_point
#'
#' @param pt vector or 1 row matrix of x,y coordinates
#'
#' @export

circle_point <- function(pt) {
  pt <- as.vector(pt)
  points(pt[2], pt[3], col = "blue", cex = 2)
}



#' function to draw axes
#'
#' @name draw_axes
#'
#' @export

draw_axes <- function() {
  abline(h = 0, col = "grey90")
  abline(v = 0, col = "grey90")
}

#' function to draw a hyperplane
#'
#' @name draw_hyperplane
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @export

draw_hyperplane <- function(w) {
  slope <- slope(w)
  intercept <- intercept(w)
  if (is.finite(slope) & is.finite(intercept)) {
    abline(a = intercept, b = slope,
           col="grey80", lwd = 2)
  }
}

#' function to draw points
#'
#' @name draw_points
#'
#' @param X1 vector of values
#'
#' @param X2 vector of values
#'
#' @param Y vector of values (-1 or 1)
#'
#' @export


# draw points
#

draw_points <- function(X1, X2, Y, axes = FALSE) {

  colors <- c("green", "pink")

  X1range <- max(X1) - min(X1)

  X2range <- max(X2) - min(X2)

  plot(X1, X2, pch = 16, bty = "l",
     col = colors[as.factor(Y)],
     asp = 1, axes = axes, las = 1)
}

#' function to draw a weight vector
#'
#' @name draw_weight_vector
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @export
#'

draw_weight_vector <- function(w) {
  shift <- shift(w)
  arrows(shift["x"], shift["y"], w[2] + shift["x"],
         w[3] + shift["y"],
         col = "#CF0000",
         length = .1)
}

#' function to draw a vector from origin to misclassified point
#'
#' @name draw_mis_vector
#'
#' @param pt vector or 1 row matrix of x,y coordinates
#'
#' @export
#'

draw_mis_vector <- function(pt) {
  pt <- as.vector(pt)
  arrows(0, 0, pt[2], pt[3],
         col = "blue", lty = "dashed",
         length = .1)

}

#' function to draw weight vector + yi*xi
#'
#' @name draw_mis_vector_added
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @param pt point(x, y)
#'
#' @param y class of misclassified point (-1 or 1)
#'
#' @export
#'

draw_mis_vector_added <- function(w, pt, y) {
  shift <- shift(w)
  arrows(w[2] + shift["x"], w[3] + shift["y"],
       w[2] + shift["x"] + y * pt[2],
       w[3] + shift["y"] + y * pt[3],
       col = "blue",
       length = .1)
}

#' function to draw new weight vector
#'
#' @name draw_new_weight_vector
#'
#' @param w weight vector (w0, w1, w2)
#'
#' @param pt point(x, y)
#'
#' @export
#'


draw_new_weight_vector <- function(w, pt, y) {
  shift <- shift(w)
  pt <- as.vector(pt)
  arrows(shift["x"], shift["y"],
       w[2] + shift["x"] + y * pt[2],
       w[3] + shift["y"] + y * pt[3],
       col = "#8D2273",
       lwd = 3,
       length = .1)
}








