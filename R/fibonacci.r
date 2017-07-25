#' Generate a list of Fibonacci numbers
#'
#' This function generates a list of Fibonacci numbers starting at 0
#' and ending with the Nth Fibonacci number.
#'
#' @details For this function 0 is regarded as the 0th Fibonacci number
#'
#'@param N a positive integer or 0
#'@return if N is a integer >= 0, the function returns a list of lenght
#' N+1 starting a 0 and containing every Fibonacci number till the Nth
#' else the function returns 'Error'
#' @examples
#' fibonacci(0)
#' fibonacci(2)
#' fibonacci(160)
#'
#' \dontrun{
#' fibonacci("a")
#' fibonacci(-6)
#' fibonacci(3.5)
#' }
#'
#'@export
fibonacci <- function(N) {
  if (((class(N) != "numeric") || (N < 0)) || ((N %% 1 != 0))) {
    stop("wrong input")
  }                            #only integers > -1 make sense
  else {
    L <- c(0, 1)               #the Fibonacci sequence needs two starting numbers
  if (N > 1) {
    for (i in 3 : (N + 1)) {
      L <- append(L, L[i - 2] + L[i - 1]) #every new number is determined only
    }                                     #once
  }
  else {
    if (N == 0) {
      L <- 0           #in this case only one number is wanted
    }
  }
  return(L)
  }
}


