library(dplyr)

features <- read.csv("./UCI HAR Dataset/features.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)

training_data <- read.csv("./UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
training_subjetct <- read.csv("./UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
training_activity <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
training_merge <- cbind(training_subjetct, training_activity, training_data)

test_data <- read.csv("./UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
test_subject <- read.csv("./UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
test_activity <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
test_merge <- cbind(test_subject, test_activity, test_data)

#Merge data 
merge_data <- rbind(training_merge, test_merge)

#Clean & assign col names
features_merge <- c(c("student_id","activity_id"), features[,2])
features_to_lower <- tolower(features_merge)
features_remove <- gsub("\\()|\\)","", features_lower)
features_replace <- gsub("\\-|\\,|\\(","_", features_remove_parenthesis)
colnames(merge_data) <- features_replace

#Filter column mean & std
mean_std_data <- merge_data[,  features_replace[grep("student_id|activity_id|mean|std", features_replace)]]

#Replace activity_id by name
activity_names <- read.csv("./UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE, stringsAsFactors = FALSE, col.names = c("activity_id","activity_name"))
mean_std_data <- select(merge(mean_std_data, activity_names,by.x= "activity_id", by.y ="activity_id"), -activity_id)

# second tidy_data
group_by_data <- group_by(mean_std_data, student_id, activity_name)
summarize_dataset <- summarize_each(group_by_data, funs(mean))










