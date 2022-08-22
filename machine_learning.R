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

#Discover the data
summary(data)
percentage <- prop.table(table(data$Activity)) * 100
cbind(freq=table(data$Activity), percentage=percentage)

#Split the train and test set
validation_index <- createDataPartition(data$Activity,
                                        p=0.80, list=FALSE)
validation <- data[-validation_index,]
training <- data[validation_index,]

control <- trainControl(method="cv", number=10,
                        savePredictions = TRUE)
metric <- "Accuracy"
