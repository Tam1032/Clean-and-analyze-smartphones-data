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

#Read the columns' names
path = "data/UCI HAR Dataset/"
features <- read.table(file = paste(path,'features.txt',sep=''),header = FALSE,sep = '',
                       col.names = c('ID','Features'))
columns <- features$Features