library(dplyr)
##read test data set assuming data is available in folder 'UCI HAR Dataset' in working directory
features <- read.table("./UCI HAR Dataset/features.txt")
features$V3 <- sub("\\-", "",sub("\\-", "",sub("\\)", "",sub("\\(", "", x= features$V2))))

####################  Process Test Data Set
##read test data set assuming data is available in folder 'UCI HAR Dataset' in working directory
testDataSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
##Rename all columns name
names(testDataSet) <- features$V3

testActivityDataSet <- read.table("./UCI HAR Dataset/test/Y_test.txt")
##renameing column to 'activity_id'
testActivityDataSet <- rename(testActivityDataSet, activity_id=V1)
##Merge Data to get ID
#testDataSet$activity_id <- testActivityDataSet
testDataSet <- cbind(testActivityDataSet, testDataSet)
rm(testActivityDataSet) 

testSubjectDataSet <- read.table("./UCI HAR Dataset/test/Subject_test.txt")
##renameing column to 'subject_id'
testSubjectDataSet <- rename(testSubjectDataSet, subject_id=V1)
##Merge Data to get ID
#testDataSet$subject_id <- testSubjectDataSet
testDataSet <- cbind(testSubjectDataSet, testDataSet)
rm(testSubjectDataSet)

####################  Process Training Data Set

##read train data set assuming data is available in folder 'UCI HAR Dataset' in working directory
trainDataSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
##Rename all columns name
names(trainDataSet) <- features$V3

trainActivityDataSet <- read.table("./UCI HAR Dataset/train/Y_train.txt")
##renameing column to 'train_activity_id'
trainActivityDataSet <- rename(trainActivityDataSet, activity_id=V1)
##Merge Data to get ID
#trainDataSet$activity_id <- trainActivityDataSet
trainDataSet <- cbind(trainActivityDataSet, trainDataSet)
rm(trainActivityDataSet)

trainSubjectDataSet <- read.table("./UCI HAR Dataset/train/Subject_train.txt")
##renameing column to 'subject_id'
trainSubjectDataSet <- rename(trainSubjectDataSet, subject_id=V1)
##Merge Data to get ID
##trainDataSet$subject_id <- trainSubjectDataSet
trainDataSet <- cbind(trainSubjectDataSet, trainDataSet)
rm(trainSubjectDataSet)

##merge both data frames
resultData <- rbind(trainDataSet, testDataSet)
#resultData <- merge(testDataSet, trainDataSet) ##, by.x = "activity_id, subject_id", by.y = "activity_id, subject_id", all = TRUE)

##Extracts only the measurements on the mean and standard deviation for each measurement
resultData <- resultData[,c(1,2,grep("mean|std",colnames(resultData)))]

finalResult <- aggregate(. ~ subject_id + activity_id, FUN = mean, data = resultData)

##
finalResult <- arrange(finalResult, subject_id, activity_id)

write.table(finalResult, file = "finalResult.txt", row.name=FALSE)
####END#####