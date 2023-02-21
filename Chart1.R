movies_ds <- read.csv("C:\\Users\\jayja\\Desktop\\2022 Movies.csv")
library(ggplot2)
library(dplyr)
library(stringr)


movies_ds <- movies_ds %>% 
  slice(1:500)
movies_ds <- movies_ds %>% 
  mutate(length = word(Time, 1))
movies_ds <- movies_ds %>% 
  mutate(IMDb_Score = word(Score, 1))
movies_ds$length <- as.numeric(movies_ds$length)
movies_ds$IMDb_Score <- as.numeric(movies_ds$IMDb_Score)


ggplot(movies_ds) +
  geom_point(aes(x=length, y = IMDb_Score)) +
  scale_x_continuous(breaks = seq(0,200,10)) +
  scale_y_continuous(breaks = seq(0,100, 20)) +
  scale_color_brewer(palette = "Spectral") +
  labs(
    title = "Length of Films versus IMDb MetaScores",
    y = "IMDb MetaScore",
    x = "Length of Film in Minutes"
  )

