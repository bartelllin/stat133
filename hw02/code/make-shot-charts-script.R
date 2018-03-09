# Title: make-shot-charts-script
# Description: creates shot charts for each of the players
# Input(s): shots-data.csv
# Output(s): 

library("jpeg")
library("grid")
library("ggplot2")

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))
dat <- read.csv("../data/shots-data.csv", stringsAsFactor = FALSE)
iguodala <- dat[dat$name == "Andre Iguodala", ]
green <- dat[dat$name == "Draymond Green", ]
durant <- dat[dat$name == "Kevin Durant", ]
thompson <- dat[dat$name == "Klay Thompson", ]
curry <- dat[dat$name == "Stephen Curry", ]

igoudala_shot_chart <- ggplot(data = iguodala, aes(x=x, y=y)) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") + 
  theme_minimal()

green_shot_chart <- ggplot(data = green, aes(x=x, y=y)) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle("Shot Chart: Dreymond Green (2016 season)") + 
  theme_minimal()

durant_shot_chart <- ggplot(data = durant, aes(x=x, y=y)) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle("Shot Chart: Kevin Durant (2016 season)") + 
  theme_minimal()

thompson_shot_chart <- ggplot(data = thompson, aes(x=x, y=y)) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle("Shot Chart: Klay Thompson (2016 season)") + 
  theme_minimal()

curry_shot_chart <- ggplot(data = curry, aes(x=x, y=y)) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(color = shot_made_flag)) + ylim(-50, 420) + 
  ggtitle("Shot Chart: Stephan Curry (2016 season)") + 
  theme_minimal()

pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
igoudala_shot_chart
dev.off()

pdf("../images/dreymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf("../images/stephan-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

shot_chart <- ggplot(data = dat, aes(x=x, y=y)) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(color = shot_made_flag)) + ylim(-50, 420) + 
  facet_wrap(~ name) +
  ggtitle("Shot Chart: GSW (2016 season)") + 
  theme_minimal()

pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
shot_chart
dev.off()









