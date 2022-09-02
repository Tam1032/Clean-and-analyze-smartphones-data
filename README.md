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

After cleaning, the data is divided into the training set and the testing set with the ratio 8:2. After that, the k-Nearest Neighbour (kNN) and the Penalized Multinomial Regression algorithms are implemented for classifying different activities. The results are evaluated on the accuracy metric and the confusion matrix:
* kNN: 
- Accuracy: 91.67%
- Confusion matrix: ![kNN](/images/kNN.png)
* Penalized Multinomial Regression: 
- Acciracy: 94.44%
- Confusion matrix: ![multinom](/images/multinom.png)

The results are quite impressive since the dataset is relatively small and we just run the algorithms once. We can run the algorithms several times and take the average results to evaluate the algorithms more precisely.