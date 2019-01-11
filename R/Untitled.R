library(ggplot2)

myfunc <- function(x, y, color) {
  df <- tibble(x, y, color)
  ggplot(df, aes(x, y, color = color) + geom_point()
}


