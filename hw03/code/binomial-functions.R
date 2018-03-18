# Title: binomial functions
# Description: Implements several functions that calculate binomial probability.

#' @title is_integer
#' @description checks if x is an integer
#' @param x numeric value
#' @return if x is an interger or not
is_interger <- function(x) {
  x %% 2 == 0 || x %% 2 == 1
}

is_interger(-1)
is_interger(0)
is_interger(2L)
is_interger(2)
is_interger(2.1)
is_interger(pi)
is_interger(0.01)


#' @title is_positive
#' @description checks if x is positive
#' @param x numeric value
#' @return if x is positive
is_positive <- function(x) {
  x > 0
}

is_positive(0.01)
is_positive(2)
is_positive(-2)
is_positive(0)


#' @title is_nonnegative
#' @description checks if x is nonnegative
#' @param x numeric value
#' @return if x is nonnegative
is_nonnegative <- function(x) {
  x >= 0
}

is_nonnegative(0)
is_nonnegative(2)
is_nonnegative(-0.000001)
is_nonnegative(-2)


#' @title is_positive_integer
#' @description checks if x is positive and integer
#' @param x numeric value
#' @return if x is positive and integer
is_positive_integer <- function(x) {
  is_positive(x) && is_interger(x)
}

is_positive_integer(2)
is_positive_integer(2L)
is_positive_integer(0)
is_positive_integer(-2)


#' @title is_nonneg_integer
#' @description checks if x is nonnegative and integer
#' @param x numeric value
#' @return if x is nonnegative and integer
is_nonneg_integer <- function(x) {
  is_nonnegative(x) && is_interger(x)
}

is_nonneg_integer(0)
is_nonneg_integer(1)
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)


#' @title is_probability
#' @description checks if x is a valid probability
#' @param x numeric value
#' @return if x is a probability
is_probability <- function(x) {
  x>= 0 && x <= 1
}

is_probability(0)
is_probability(0.5)
is_probability(1)
is_probability(-1)
is_probability(1.00000001)


#' @title bin_factorial
#' @description calculates factorial of n
#' @param n nonnegative integer
#' @return factorial of n
bin_factorial <- function(n) {
  t <- 1
  if (n == 0) {
    return(t)
  }
  for (i in 1:n) {
    t <- t * i
  }
  t
}

bin_factorial(5)
bin_factorial(0)


#' @title bin_combinations
#' @description calculates number of combinations in which k successes can occur in n trials
#' @param n nonnegative integer, total trials
#' @param k nonnegative integer, successful trials
#' @return combination of n choose k
bin_combinations <- function(n, k) {
  bin_factorial(n)/(bin_factorial(k) * bin_factorial(n-k))
}

bin_combinations(5, 2)
bin_combinations(10, 3)
bin_combinations(4, 4)


#' @title bin_probability
#' @description calculates the probability of getting success successes in trials trials given the probability is prob
#' @param trials nonnegative integer, total trials
#' @param success nonnegative integer, successful trials
#' @param prob probability of success, valid probability
#' @return binomial probability
bin_probability <- function(trials, success, prob) {
  if (!is_nonneg_integer(trials) || !is_nonneg_integer(success)) {
    stop("not negative integer")
  }
  if (!is_probability(prob)) {
    stop("not a valid probability")
  }
  prob^success * (1 - prob)^(trials-success) * bin_combinations(trials, success)
}

bin_probability(5, 2, 0.5)


#' @title bin_distribution
#' @description calculates the distribution of the binomial probability
#' @param trials nonnegative integer, total trials
#' @param prob probability of success, valid probability
#' @return data frame of the binomial distribution
bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- rep(0, trials + 1)
  for (i in success) {
    probability[i + 1] <- bin_probability(trials, i, prob)
  }
  data.frame(success, probability)
}

bin_distribution(5, 0.5)



