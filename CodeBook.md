# Code Book

## Data was obtained from the following sources:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
This code book summarizes the resulting data fields in `tidy_data.txt`.

## Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

## Used datasets of the original zip file linked in ReadMe.md

* `'features_info.txt'`
* `'features.txt'`
* `'activity_labels.txt'`
* `'train/x_train.txt'`
* `'train/y_train.txt'`
* `'test/x_test.txt'`
* `'test/y_test.txt'`
* `'train/subject_train.txt'`
* `test/subject_test.txt`

## Activity Labels

* `WALKING` (`1`): walked
* `WALKING_UPSTAIRS` (`2`): walked up staircase 
* `WALKING_DOWNSTAIRS` (`3`): walked down staircase 
* `SITTING` (`4`): sitting 
* `STANDING` (`5`): standing 
* `LAYING` (`6`): laying down 


## Steps

#### Downloading the dataset

#### Assigning each data to variables

#### Merging the training and the test sets to create one data set

#### Extracting only the measurements on the mean and standard deviation for each measurement
TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

#### Using descriptive activity names to name the activities in the data set
Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable

#### Labeling the data set with descriptive variable names

#### Creating an independent tidy dataset with the average of each variable for each activity and each subject
Tidy dataset can be found as `tidy_dataset` in repo