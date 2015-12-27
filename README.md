### Introduction
This is a programming assignment of Data Cleaning course. The task is to create tidy data using the Samsung data. 

THe analysis program merges data from trining data set and test dataset. Once it merges data, it removes all columns except columns with mean and standard deviation values. It creates independent tidy data set with the average of each variable for each activity and each subject and saves it in finalResult.txt

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 



### How to use analysis file

1. Download run_analysis.R file and folder UCI HAR Dataset with all its content in your working directory. 
2. Run following.
3. source('run_analysis.R')

You can download UCI HAR Dataset from following source too.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You can get more info about data in README.txt of folder UCI HAR Dataset.

### What run_analysis.R does

1. It reads ./UCI HAR Dataset/features.txt to set data frame header. It cleans up valu by removing (, ), - from it.
2. It reads ./UCI HAR Dataset/test/X_test.txt and update column names with names from features.txt. Result is testDataSet dataframe.
3. It reads ./UCI HAR Dataset/test/Y_test.txt and ./UCI HAR Dataset/test/Subject_test.txt and add them to the testDataSet dataframe. This task is to add subject and activity in data frame.
4. In similar way, R file works on training data.
5. It reads ./UCI HAR Dataset/trainX_train.txt and update column names with names from features.txt. Result is trainDataSet dataframe.
6. It reads ./UCI HAR Dataset/trainY_train.txt and ./UCI HAR Dataset/train/Subject_train.txt and add them to the trainDataSet dataframe. This task is to add subject and activity in data frame.
7. Once both training data frame and test data frame are ready, it merges them to create a new dataframe resultData.
8. It extracts only the measurements on the mean and standard deviation for each measurement. 
9. It creates a second data frame finalResult, independent tidy data set with the average of each variable for each activity and each subject.
10. Order finalResult based on subject and activity and save result in finalResult.txt


