movies_ds <- read.csv("C:\\Users\\jayja\\Desktop\\2022 Movies.csv")
library(ggplot2)
library(dplyr)
library(stringr)
library(scales)

movies_ds <- movies_ds %>% 
  slice(1:500)

movies_ds$reviews = gsub(',','', as.character(movies_ds$reviews))
movies_ds$reviews <- as.numeric(movies_ds$reviews)

movies_ds <- movies_ds %>% 
  mutate(IMDb_Score = word(Score, 1))
movies_ds$IMDb_Score <- as.numeric(movies_ds$IMDb_Score)

ggplot(movies_ds) +
  geom_col(aes(x=IMDb_Score, y = reviews)) +
  scale_y_continuous(labels = label_number_si()) +
  labs(
    title = "Number of Reviews versus Movie Ratings",
    y = "Number of Reviews",
    x = "IMDb Metascores"
  )
