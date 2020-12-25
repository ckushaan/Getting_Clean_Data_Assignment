## Code Book
The run_analysis.R script action the data preparation followed by the 5 steps required as described in the Coursera Getting and Cleaning Data Course Project definition.


## Download the given dataset from the provided URL link
Dataset will be downloaded and extracted under a folder called UCI HAR Dataset. 


## Assign temp variables for each of the datasets
ft variable is the data which comes from features.txt file
acts variable is the data which comes from activity_labels.txt file
sub_test variable is the data which comes from subject_test.txt file
x_test variable is the data which comes from X_test.txt file
y_test variable is the data which comes from Y_test.txt file
sub_train variable is the data which comes from subject_train.txt file
x_train variable is the data which comes from X_train.txt file
y_train variable is the data which comes from y_train.txt file


## 1.Merges the training and the test sets to create one data set
Here I have used the rbind() function to combine temp x_train, x_test, y_train, y_test, sub_train, sub_test variables,
Followed by cbind() function to combine columns of the x, y, s and name the variables called Merged_Data


## 2. Extracts only the measurements on the mean and standard deviation for each measurement
Following chaining operations is used to subset the above Merged_Data by selecting only the columns:subject, code and the measurements on the mean and standard deviation (std) for each measurement
```TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))```

