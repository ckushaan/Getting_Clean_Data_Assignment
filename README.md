# Getting_Clean_Data_Assignment
This is the Coursera Getting Clean Data Assignment which includes the following files;

1. run_analysis.R
2. CodeBook.md

The CodeBook.md file describes the variables, functions and steps on how I have transformed the data to be able to use as instructed.

In a very high level summary run_analysis.R action the following steps:

a)  Prepare the library to use in the script and download the raw file to start the process
b)  Assign all the appropriate temp variables and merged the test and train data to one data frame
c)  Extract only measurements, mean and SD
d)  Using the descriptive activity names
f)  Rename few labels with descriptive variable names
g)  2nd independent tidy dataset is created with the average of each variable for each activity and each subject