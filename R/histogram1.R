here::i_am("R/histogram1.R")
movies <- read.csv(here::here('data','movies.csv'),stringsAsFactors=FALSE)
ratings <- read.csv(here::here('data',"ratings.csv"))
movie_rating <- merge(ratings,movies,by="movieId")
library(readr)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(scales)
library(lubridate)
png(file= here::here('figs','hist1.png'))
movie_rating %>% mutate(year = year(as_datetime(timestamp, origin="1970-01-01"))) %>%
  ggplot(aes(x=year)) +
  geom_histogram(color = "white") + 
  ggtitle("Rating Distribution Per Year") +
  xlab("Year") +
  ylab("Number of Ratings") +
  scale_y_continuous(labels = comma) + 
  theme_economist()
dev.off()