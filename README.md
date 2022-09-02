# Clean and analyze smartphones data

This project is guided from practical exercises of the course "Data Collection and Preprocessing" of major Data Science at the University of Information and Technology - Vietnam National University Ho Chi Minh City. The IDE used is [RStudio](https://www.rstudio.com/).

## Dataset description

The dataset used in this project is the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones). The download step is already included in the code. The dataset contains the sensor signals from the smartphones of the paritcipants when they were performing one of the six activities. Please check the [README.txt](data/UCI%20HAR%20Dataset/README.txt) file for more information about this dataset.

## Collecting and cleaning data

The data collection and cleaning involve the following steps: 
1. Download, unzip and save the dataset 
2. Read the files and merge the data 
3. Select the columns containing mean and std values 
4. Rename the columns 
5. Aggregate the rows with the same *Subject* and *Activity* by taking their means 
6. Save the tidy dataset into a csv file

More details can be found in the code.

## Running Machine Learning algorithms

First, the data is divided into the training set and the testing set with the ratio 8:2. After that, the k-Nearest Neighbour (kNN) and the Penalized Multinomial Regression algorithms are run with the Accuracy metric. The results are quite impressive:
- kNN: 94.44%
- Penalized Multinomial Regression: 100%
