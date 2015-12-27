### Introduction
This is a programming assignment of Data Cleaning course. The task is to create tidy data using the Samsung data. 

THe analysis program merges data from trining data set and test dataset. Once it merges data, it removes all columns except columns with mean and standard deviation values. It creates independent tidy data set with the average of each variable for each activity and each subject and saves it in finalResult.txt

### How to use analysis file

1. Download run_analysis.R file and folder UCI HAR Dataset with all its content in your working directory. 
2. Run following.
3. source('run_analysis.R')

### What run_analysis.R does

1. It reads ./UCI HAR Dataset/features.txt to set data frame header. It cleans up valu by removing (, ), - from it.
2. It reads X_test.txt and update column names with names from features.txt. Result is testDataSet dataframe.
3. It reads Y_test.txt and Subject_test.txt and add them to the testDataSet dataframe. This task is to add subject and activity in data frame.
4. In similar way, R file works on training data.
5. It reads X_train.txt and update column names with names from features.txt. Result is trainDataSet dataframe.
6. It reads Y_train.txt and Subject_train.txt and add them to the trainDataSet dataframe. This task is to add subject and activity in data frame.
7. Once both training data frame and test data frame are ready, it merges them to create a new dataframe resultData.
8. It extracts only the measurements on the mean and standard deviation for each measurement. 
9. It creates a second data frame finalResult, independent tidy data set with the average of each variable for each activity and each subject.
10. Order finalResult based on subject and activity and save result in finalResult.txt
