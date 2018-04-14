# Title: archive functions
# Description: Contains a series of function used to plot data. Each of the functions divides
#the tasks into smaller, more managable parts.
# Author(s): Bartell Lin

library("XML")
library("stringr")
library("ggplot2")
library("plyr")


#' @title read_archive
#' @description loads HTML table
#' @param pkg an R package
#' @return dataframe
read_archive <- function(pkg) {
  as.data.frame(readHTMLTable(paste0("http://cran.r-project.org/src/contrib/Archive/", pkg)))
}


#' @title clean_archive
#' @description cleans up input to have columns name, version, date, and size
#' @param tbl output of read_archive
#' @return cleaned up dataframe
clean_archive <- function(tbl) {
  t <- tbl[,c(2,3,4)]
  t <- t[-c(1,2, length(t[[1]])), ]
  z <- strsplit(as.character(t[[1]]), "_")
  name <- lapply(z, function(l) l[[1]])
  name <- laply(name, function(x) x)[1:length(name)]
  version <- laply(z, function(l) l[[2]])
  version <- laply(version, function(x) x)
  version <- str_sub(version, 1,-8)
  
  date <- as.Date(substr(t[[2]], 1, 10))
  myte <- str_sub(t[[3]], -1, -1) == "M"
  size <- as.numeric(str_sub(t[[3]], 1, -2))
  for (i in 1:length(myte)) {
    if (myte[i] == TRUE) {
      size[i] = round(size[i]*1000, 1)
    }
  }
  data.frame(name, version, date, size, stringsAsFactors=FALSE)
}


#' @title plot_archive
#' @description graphs output of clean_archive
#' @param clean output of clean_archive
#' @return step graph of date and size
plot_archive <- function(clean) {
  ggplot(clean) + geom_step(aes(date, size))
}





















