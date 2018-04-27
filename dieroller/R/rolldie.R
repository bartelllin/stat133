# Title: Rolldie
# Description: function to simulate die roll
# Input(s): none
# Output(s): die and roll along with auxillary and methods
# Author(s): Bartell Lin


#' @title check_sides
#' @description checks if number of sides is valid
#' @param sides a vector of sides to check
#' @return error if sides not valid
#' @export
#' @examples
#' check_sides(c(1,2,3,4,5,6))
check_sides <- function(sides){
  if (length(sides) != 6) {
    stop("len must be 6")
  }
}

#' @title check prob
#' @description checks that the probabilities are valid
#' @param prob vector of probabilities
#' @return error if prob no valid
#' @export
#' @examples
#' check_prob(c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))
check_prob <- function(prob) {
  if (length(prob) != 6) {
    stop("len must be 6")
  }
  if (sum(prob) != 1) {
    stop("prob must add up to one")
  }
}



#' @title die
#' @description display information of a die
#' @param sides a vector of sides
#' @param prob a vector of probabilities for each side
#' @return a dataframe of sides and probabilities
#' @export
#' @examples
#' # default
#' fair <- die()
die <- function(sides = c(1,2,3,4,5,6), prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)) {
  check_sides(sides)
  check_prob(prob)
  x <- data.frame(sides = sides, prob = prob)
  class(x) <- "die"
  x
}

#' @title print.die
#' @description prints putput of die
#' @param x object
#' @return dataframe of sides and probabilities
#' @export
print.die <- function(x) {
  cat('object "die"\n')
  cat("\n")
  print(data.frame(sides = x$sides, prob = x$prob))
}


fair_die <- die()
fair_die
weird_die <- die(c("i", "ii", "iii", "iv", "v", "vi"))
weird_die
loaded_die <- die(prob = c(.075, .1, .125, .15, .2, .35))
loaded_die


#' @title check_times
#' @description checks if times is valid
#' @param times number of rolls
#' @return error if times is invalid
#' @export
#' @examples
#' check_times(50)
check_times <- function(times) {
 if (!(times > 0 | is.integer(times))) {
   stop("invalid time")
 }
}


#' @title roll
#' @description simulates rolling a die a given number of times
#' @param die object (a die)
#' @param times number of rolls
#' @return vector of die rolls
#' @export
#' @examples
#' fair <- die()
#' rollfair <- roll(fair, 50)
roll <- function(die, times = 1) {
  check_times(times)
  rolls <- sample(die$sides, times, TRUE, die$prob)
  x <- list(rolls = rolls, sides = die$sides, prob = die$prob, total = times)
  class(x) <- "roll"
  x
}


#' @title print.roll
#' @description prints the results of roll
#' @param x object
#' @return output of roll
#' @export
print.roll <- function(x) {
  cat('object "roll"\n')
  cat("\n")
  y <- list(rolls = x$rolls, sides = x$sides, prob = x$prob, total = x$times)
  print(list(rolls = y$rolls))
}

fair_roll50 <- roll(fair_die, 50)
fair_roll50


names(fair_roll50)
fair_roll50$rolls
fair_roll50$sides
fair_roll50$prob
fair_roll50$total


str_die <- die(c("a", "b", "c", "d", "e", "f"),  c(.075, .1, .125, .15, .2, .35))
str_rolls <- roll(str_die, 20)
names(str_rolls)
str_rolls


#' @title summary.roll
#' @description provides a table of counts and proportions for each side
#' @param x output of roll
#' @return summary of roll
#' @export
#' @examples
#' fair <- die()
#' rollfair <- roll(fair, 50)
#' summary(rollfair)
summary.roll <- function(x) {
  tbl <- table(x$rolls)
  x <- list(freqs = data.frame(side = x$sides, count = as.numeric(tbl), prop = as.numeric(tbl)/x$total))
  class(x) <- "summary.roll"
  x
}


#' @title print.summary.roll
#' @description prints the outout of summary.roll
#' @param x object
#' @return output of summary
#' @export
print.summary.roll <- function(x) {
  cat('summary "roll\n')
  cat("\n")
  x <- x$freqs
  lst <- list(freqs = data.frame(side = x$side, count = x$count, prop = x$prop))
  print(lst)
}

fair50_sum <- summary(fair_roll50)
fair50_sum
class(fair50_sum)
names(fair50_sum)
fair50_sum$freqs


#' @title plot.roll
#' @description plot the simulated die rolls
#' @param x output of rolls
#' @return plot of rolls
#' @export
#' @examples
#' fair <- die()
#' rollfair <- roll(fair, 50)
#' plot(rollfair)
plot.roll <- function(x) {
  sum <- summary(x)
  barplot(sum$freq$prop, ylab = "relative frequency", xlab = "sides of dice", names.arg = x$sides)
}
plot(fair_roll50)


#' @title extraction method
#' @description extracts the value of a given roll
#' @param x roll object
#' @param i index
#' @return value at index i
#' @export
#' @examples
#' fair <- die()
#' rollfair <- roll(fair, 50)
#' rollfair[35]
"[.roll" <- function(x, i) {
  x$rolls[i]
}

fair_die <- die()
fair500 <- roll(fair_die, 500)
summary(fair500)
fair500[500]


#' @title replacement method
#' @description replaces value at index i with value
#' @param x roll object
#' @param i index
#' @param value replacement value
#' @return new value at index i
#' @export
#' @examples
#' fair <- die()
#' rollfair <- roll(fair, 50)
#' rollfair[35] <- 2
"[<-.roll" <- function(x, i, value) {
  x$rolls[i] <- value
  return(x)
}
fair500[500] <- 1
fair500[500]
summary(fair500)


#' @title addition method
#' @description adds to the number of rolls
#' @param x roll object
#' @param inc amount to increment number of rolls
#' @return new rolls object with increased rolls
#' @export
#' @examples
#' fair <- die()
#' rollfair <- roll(fair, 50)
#' morerolls <- rollfair + 30
"+.roll" <- function(x, inc) {
  cur <- x$rolls
  new <- c(cur, sample(x$sides, inc, TRUE, x$prob))
  x$rolls <- new
  return(x)
}

fair600 <- fair500 + 100
summary(fair600)

plot(fair500)

