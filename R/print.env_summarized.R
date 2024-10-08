#' print.env_summarized
#'
#' @description Print method for env_summarized object
#'
#' @param x Random patterns.
#' @param return_area If true, not the ratio but the area is returned.
#' @param digits Number of decimal places (round).
#' @param ... Arguments passed to cat
#'
#' @details
#' Printing method for summarized envelope created with \code{\link{summarize_envelope}}.
#'
#' @return No return value
#'
#' @seealso
#' \code{\link{summarize_envelope}}
#'
#' @examples
#' set.seed(42)
#' input_pattern <- spatstat.random::rThomas(kappa = 15, scale = 0.05, mu = 5)
#'
#' cluster_env <- spatstat.explore::envelope(input_pattern, fun = "pcf", nsim = 39,
#' funargs = list(divisor = "d", correction = "Ripley", stoyan = 0.25))
#'
#' x <- summarize_envelope(cluster_env)
#' print(x)
#'
#' @export
print.env_summarized <- function(x, return_area = FALSE, digits = 2, ...) {

  # printing area
  if (return_area) {

    cat(paste0("Total area: ", round(x$area_total, digits = digits), " [units] \n",
               "----------- \n",
               "Above area: ", round(x$area_above, digits = digits), " [units] \n",
               "Below area: ", round(x$area_below, digits = digits), " [units] \n"), ...)

  }

  # printing ration
  else {

    cat(paste0("Total ratio: ", round(x$result_total, digits = digits), "% \n",
               "------------ \n",
               "Above ratio: ", round(x$result_above, digits = digits), "% \n",
               "Below ratio: ", round(x$result_below, digits = digits), "% \n"), ...)
  }
}
