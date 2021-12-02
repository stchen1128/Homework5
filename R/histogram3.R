here::i_am("R/histogram3.R")
movies <- read.csv(here::here('data','movies.csv'),stringsAsFactors=FALSE)
ratings <- read.csv(here::here('data',"ratings.csv"))
movie_rating <- merge(ratings,movies,by="movieId")
library(readr)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(scales)
png(file= here::here('figs','hist3.png'))
movie_rating %>% group_by(userId)%>%
  summarise(n=n()) %>%
  ggplot(aes(n)) + 
  geom_histogram(color = "white") + 
  scale_x_log10()+
  ggtitle("Distribution of Users")+
  xlab("Number of Ratings") +
  ylab("Number of Users")+
  scale_y_continuous(labels=comma)+
  theme_economist()
dev.off()
