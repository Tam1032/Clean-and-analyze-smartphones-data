rm(list = ls())
library(magrittr)
library(dplyr)

#Create the data folder
if (!file.exists('data')){
  dir.create('data')
}

#Download and unzip data
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = url,destfile = "human_activity.zip")
unzip('human_activity.zip',exdir = 'data')
date_of_download <- date()

#Read the columns names
path = "data/UCI HAR Dataset/"
features <- read.table(file = paste(path,'features.txt',sep=''),header = FALSE,sep = '',
                       col.names = c('ID','Features'))
columns <- features$Features

#Read train and test
X_train <- read.table(file = paste(path,'train/X_train.txt',sep=''),header = FALSE)
names(X_train) <- columns
y_train <- read.table(file = paste(path,'train/y_train.txt',sep=''),header = FALSE)
subject_train <- read.table(file = paste(path,'train/subject_train.txt',sep=''),header = FALSE)

X_test <- read.table(file = paste(path,'test/X_test.txt',sep=''),header = FALSE)
names(X_test) <- columns
y_test <- read.table(file = paste(path,'test/y_test.txt',sep=''),header = FALSE)
subject_test <- read.table(file = paste(path,'test/subject_test.txt',sep=''),header = FALSE)

#Merge columns x, y and subject
train_data <- cbind(y_train,subject_train,X_train)
train_test <- cbind(y_test,subject_test,X_test)

#Merge train and test set
full <- rbind(train_data, train_test)
names(full)[1:2] <- c('Activity','Subject')

#select the mean and std columns
col_mean <- grep(pattern = "mean\\(\\)",columns)
col_std <- grep(pattern = "std\\(\\)",columns)
data <- full %>% select(Activity,Subject,columns[c(col_mean,col_std)])

#Read the activity names
activity_label <- read.table(file = paste(path,'activity_labels.txt',sep=''),header = FALSE,
                             col.names = c('ID','Activity'))

#Convert the activity from int to string by merging with the activity names
names(data)[1] = 'ID'
data <- merge(data, activity_label,by.x = 'ID',by.y = 'ID')

#Rename the meaningless features
abb <- c('^t', '^f', '-', 'mean\\(\\)', 'std\\(\\)', '-X', '-Y', '-Z', 'AccJerk', 'Acc', 'GyroJerk', 'Gyro', 'Mag')
abb_name <- c('TimeDomain: ', 'Frequency domain: ', ', ', 'mean value', 'standard deviation value', ' on X axis', ' on Y axis', ' on Z axis',
              ' acceleration jerk', ' acceleration', ' angular velocity jerk', ' angular velocity', ' magnitude ')
for (i in 1:length(abb))
{
  colnames(data) <- names(data) %>% sub(pattern=abb[i], replacement=abb_name[i])
}

#Aggregate the data by taking the mean
tidy <- aggregate(formula = .~Subject+Activity,data = data[,2:69] ,FUN = mean)

#Save the tidy dataset into the csv file
write.csv(tidy,'data/tidy_data.csv',row.names = FALSE)
