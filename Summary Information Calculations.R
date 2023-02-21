movies_ds <- read.csv("C:\\Users\\jayja\\Desktop\\2022 Movies.csv")
library(ggplot2)
library(dplyr)
library(stringr)

movies_ds <- movies_ds %>% 
  slice(1:500)

#number of movies per genre
movies_ds <- movies_ds %>% 
  mutate(genre_single = word(genre, 1))
movies_ds$genre_single = gsub(',','', as.character(movies_ds$genre_single))
genre_frequencies <- count(movies_ds, genre_single)
genre_frequencies <- genre_frequencies %>% 
  mutate(genre_frequency = genre_frequencies$n)

#puts IMDb scores into new column and makes them numeric
movies_ds <- movies_ds %>% 
  mutate(IMDb_Score = word(Score, 1))
movies_ds$IMDb_Score <- as.numeric(movies_ds$IMDb_Score)
#average IMDb scores per genre
average_rating_by_genre <- movies_ds %>% 
  group_by(genre_single) %>% 
  summarize(average_rating_by_genre = mean(IMDb_Score, na.rm=TRUE))
average_rating_by_genre$average_rating_by_genre <- round(average_rating_by_genre$average_rating_by_genre)


#puts Time into new column and makes them numeric
movies_ds <- movies_ds %>% 
  mutate(length = word(Time, 1))
movies_ds$length <- as.numeric(movies_ds$length)
#average time per genre
average_runtime_by_genre <- movies_ds %>% 
  group_by(genre_single) %>% 
  summarize(average_runtime_by_genre = mean(length, na.rm=TRUE))

#turns number of reviews in numeric
movies_ds$reviews = gsub(',','', as.character(movies_ds$reviews))
movies_ds$reviews <- as.numeric(movies_ds$reviews)
#average number of reviews per genre
average_num_reviews_per_genre <- movies_ds %>% 
  group_by(genre_single) %>% 
  summarize(average_num_reviews_per_genre = mean(reviews, na.rm=TRUE))

#determines rating grouped by genre
age_rating_frequencies_per_genre <- movies_ds %>% 
  group_by(genre_single) %>% 
  count(certificate)

#most common age rating per genre
most_common_agerating_by_genre <- age_rating_frequencies_per_genre %>% 
  group_by(genre_single) %>% 
  filter(n == max(n)) %>% 
  summarize(genre_single, certificate)
most_common_agerating_by_genre <- most_common_agerating_by_genre[-c(10), ]


  



