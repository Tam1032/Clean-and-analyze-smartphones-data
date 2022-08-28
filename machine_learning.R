rm(list = ls())
library(caret)
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
train_index <- createDataPartition(data$Activity,
                                        p=0.80, list=FALSE)
validation <- data[-train_index,]
training <- data[train_index,]

control <- trainControl(method="cv", number=10,
                        savePredictions = TRUE)
metric <- "Accuracy"

#Define the function drawing the confusion matrix
plotConfusionMatrix <- function(cfm)
{
  plt <- as.data.frame(cfm$table)
  plt$Prediction <- factor(plt$Prediction, levels=rev(levels(plt$Prediction)))
  
  ggplot(plt, aes(x = Reference,y= Prediction, fill= Freq)) +
    geom_tile() + geom_text(aes(label=Freq)) +
    scale_fill_gradient(low="white", high="#009194") +
    labs(x = "Actual",y = "Prediction") +
    scale_x_discrete(labels=label, position = "top") +
    scale_y_discrete(labels=rev(label))
}

#Run the KNN algorithm and plot confusion matrix
set.seed(7)
fit.knn <- train(Activity~., data=training, method="knn",
                 metric=metric, trControl=control)
knn_predictions <- predict(fit.knn, validation)
cfm_knn <- confusionMatrix(knn_predictions, as.factor(validation$Activity))
cfm_knn$overall['Accuracy']
plotConfusionMatrix(cfm_knn)