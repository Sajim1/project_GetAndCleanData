# Help for Getting and Cleaning Data Course Project

This is a manual describing how the script works. Script consists of 6 sections described below:

## Initializing and reading data

This part sets the file paths for both traing and test data files. Then, read thetxt files using read.table function.

## Merging data

This part merges the training and test sets together.

## Extracting variables

This part extract variables that represents mean or standard deviation of measurements.

## SAssignng the descriptive names to activities

This part first convert the activities to factor format and then sets the levels with descriptive names of the activities.

## Setting the variable names

This part sets the variables names.

## creating a new data set

This part uses 'reshape2' pachage to first reshape the data based on activity and test subjects and then calculates the mean for each activity and each subject test using 'dcast' function.

## Writing the new dataset

This part prints the new data set in a text file called 'tidy_data.txt'. 