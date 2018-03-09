# Title: hw02
# Description: creates a csv file that will contain the required variables to be used in the visualisation stage
# Input(s): andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv
# Output(s): shots-data.csv

iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactor = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactor = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactor = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactor = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactor = FALSE)

iguodala <- cbind(name = "Andre Iguodala", iguodala)
iguodala[iguodala == 'n'] <- "missed shot"
iguodala[iguodala == 'y'] <- "made shot"
iguodala$minute <- (iguodala$period -1)*12 + (12 - iguodala$minutes_remaining)
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

green <- cbind(name = "Draymond Green", green)
green[green == 'n'] <- "missed shot"
green[green == 'y'] <- "made shot"
green$minute <- (green$period -1)*12 + (12 - green$minutes_remaining)
sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

durant <- cbind(name = "Kevin Durant", durant)
durant[durant == 'n'] <- "missed shot"
durant[durant == 'y'] <- "made shot"
durant$minute <- (durant$period -1)*12 + (12 - durant$minutes_remaining)
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

thompson <- cbind(name = "Klay Thompson", thompson)
thompson[thompson == 'n'] <- "missed shot"
thompson[thompson == 'y'] <- "made shot"
thompson$minute <- (thompson$period -1)*12 + (12 - thompson$minutes_remaining)
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

curry <- cbind(name = "Stephen Curry", curry)
curry[curry == 'n'] <- "missed shot"
curry[curry == 'y'] <- "made shot"
curry$minute <- (curry$period -1)*12 + (12 - curry$minutes_remaining)
sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

bind <- rbind(iguodala, green, durant, thompson, curry)
write.csv(bind, "../data/shots-data.csv")
sink(file = '../output/shots-data-summary.txt')
summary(bind)
sink()

