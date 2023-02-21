movies_ds <- read.csv("C:\\Users\\jayja\\Desktop\\2022 Movies.csv")
library(ggplot2)
library(dplyr)
library(stringr)
library("knitr")

movies_ds <- movies_ds %>% 
  slice(1:500)

num_of_movie <- nrow(movies_ds)

num_of_movie <- n(movies_ds$Title)
summary_table <- left_join(genre_frequencies, average_runtime_by_genre, by = "genre_single")
summary_table <- left_join(summary_table, average_num_reviews_per_genre, by = "genre_single")
summary_table <- left_join(summary_table, average_rating_by_genre, by = "genre_single")
summary_table <- left_join(summary_table, most_common_agerating_by_genre, by = "genre_single")
kable(summary_table)
