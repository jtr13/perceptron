# https://www.reed.edu/data-at-reed/software/R/markdown_multiple_reports.html


render_report = function(echocode) {
  rmarkdown::render(
    "perceptron.Rmd",
    params = list(echocode = echocode),
    output_file = paste0("perceptron_echo_",
                         echocode, ".pdf")
  )
}

render_report(TRUE)
render_report(FALSE)
