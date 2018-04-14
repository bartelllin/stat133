# Title: regex functions
# Description: Contains a variety of functions that are used to manipulate strings in various ways.
# Author(s): Bartell Lin



#' @title split_char
#' @description splits strings into a vector of characters
#' @param c a  string
#' @return vector of characters
split_char <- function(c) {
  strsplit(c, "")[[1]]
}

#' @title num_vowels
#' @description count of number of vowels in a vector of characters
#' @param vec a vector of character
#' @return table
num_vowels <- function(vec) {
  v <- c("a", "e", "i", "o", "u")
  z <- c(vec, v)
  s <- z[z %in% v]
  table(s) -1
}


#' @title count_vowels
#' @description returns a count of number of vowels in a string of words
#' @param str a string
#' @return table
count_vowels <- function(str) {
  str = str_to_lower(str)
  s <- str_replace_all(str, " ", "")
  s <- split_char(s)
  num_vowels(s)
}


#' @title reverse_chars
#' @description reverses the order of the character of a string
#' @param str a string
#' @return the reverse of str
reverse_chars <- function(str) {
  paste(rev(split_char(str)), collapse = "")
}


#' @title reverse_words
#' @description reverse the order in which the words in str appear
#' @param str a string
#' @return str in reverse order
reverse_words <- function(str) {
  paste(rev(str_split(str, " ", simplify = TRUE)), collapse = " ")
}

