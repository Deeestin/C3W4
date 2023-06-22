##Load the reshape2 package
library(reshape2)

filename <- "module3courseproject.zip"

## Download and unzip the dataset (and checking if archive and folder already exists)
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

## Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

## Extract only the data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

## Assigning the dataframes/tables
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
train <- cbind(trainSubjects, trainActivities, train)
test <- cbind(testSubjects, testActivities, test)


## merge training and test into one data set
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

## transforming activity and subject varbiables into factor variables
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

tidyyydata <- write.table(allData.mean, "tidy_dataset.txt", row.names = FALSE, quote = FALSE)

## Check everything
str(tidyyydata)
summary (tidyyydata)