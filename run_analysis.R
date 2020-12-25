## Preparing Libraries
library(dplyr)

## Download the dataset from given hyperlink 
filename <- "getdata_projectfiles_UCI HAR Dataset.zip"


## Checking if the file is already exists.
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
}  


# Checking if Ziped folder exists
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}


## Assigning all the temp variables to their own data frames
ft <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
acts <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = ft$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = ft$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


## Merge {train, test} data - (1.Merges the training and the test sets to create one data set)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(sub_train, sub_test)
Merged_Data <- cbind(s_data, x_data, y_data)


## Extract only measurements, mean and SD - (2. Extracts only the measurements on the mean and standard deviation for each measurement)
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))


## Using the descriptive activity names (3. Uses descriptive activity names to name the activities in the data set)
TidyData$code <- acts[TidyData$code, 2]


## Label with descriptive variable names - (4. Appropriately labels the data set with descriptive variable names)
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))

names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)

names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))


## 2nd independent tidy data (5. From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject)

FinalData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))

write.table(FinalData, "FinalData.txt", row.name=FALSE)

