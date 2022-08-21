rm(list = ls())
library(caret)
library(kernlab)
library(dplyr)
library(ggplot2)

#Read the dataset
data <- read.csv("data/tidy_data.csv")

#Create labels set
label <- unique(data$Activity)
data <- select(data,-Subject)
summary(data)