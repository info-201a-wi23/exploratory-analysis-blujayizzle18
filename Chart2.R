movies_ds <- read.csv("C:\\Users\\jayja\\Desktop\\2022 Movies.csv")
library(ggplot2)
library(dplyr)
library(stringr)

movies_ds <- movies_ds %>% 
  slice(1:500)
movies_ds <- movies_ds %>% 
  mutate(genre_single = word(genre, 1))
movies_ds$genre_single = gsub(',','', as.character(movies_ds$genre_single))
genre_frequencies <- count(movies_ds, genre_single)
genre_frequencies <- genre_frequencies %>% 
  mutate(genre_frequency = genre_frequencies$n)

ggplot(genre_frequencies) +
  geom_col(aes(x=genre_single, y = genre_frequency)) +
  theme(axis.text.x=element_text(size=6)) +
  labs(
    title = "Frequency of Genres",
    y = "Number of Instances",
    x = "Genre"
  )
