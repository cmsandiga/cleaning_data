# cleaning_data
## Requirements

Download zip data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
Extract the zip into your working directory. 

## Analysis

First we load dplyr library, then we need to load
 - feature ("./UCI HAR Dataset/features.txt")

 - training ("./UCI HAR Dataset/train/X_train.txt")
 - training subject ("./UCI HAR Dataset/train/subject_train.txt")
 - training activity ("./UCI HAR Dataset/train/y_train.txt")

 - test ("./UCI HAR Dataset/train/X_train.txt")
 - test subject ("./UCI HAR Dataset/train/subject_train.txt")
 - test activity ("./UCI HAR Dataset/train/y_train.txt")

When we load training and test data set, we have to bind column with subject (student_id) and activity , we use cbind for add subject_id & student_id to training & test dataset.

Second we merge training and test dataset using rbind() function.

Third, we need add and clean column names, add student_id, activity_id names to features and finally clean our col names.
Use gsub() function for convert to lower case, remove parenthesis "()" and end parenthesis ")", then replace "-,(" symbols with underline and finally add the clean columns to dataset generaed.

Fourth, Using grep function we going to extract all features that start with mean and std (standard desviation).

Five, We need to change activity with respectively name, so we need to load dataset with activities names from ("./UCI HAR Dataset/activity_labels.txt") adding column name , activity_id and column name, then we going to use merge() function for merging with our generated dataset using activity_id as key, and we going to exclude activity_id using select function with negative sign(-activity_id).

Finally, generate a new data set, using group_by function by student_id and activity_id, then use sumarize_each for calculate mean for each metric, and finally we going to write to a file. with our summarize data.

