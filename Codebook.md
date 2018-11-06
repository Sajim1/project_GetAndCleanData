# CodeBook for Getting and Cleaning Data Course Project
This is a code book that describes the variables, the data for the project

## The data source

```javascript
```
1. Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The variables
The code includes the following variables:

```javascript
```
* 'directory': the working directory where it is assumed that the Samsung data is stored

* 'file_name*': file paths for training and test set files

* 'FT': List of all features

* 'Lbl_ac':  activity labels

* 'trainset_X':  Training set only variables

* 'trainset_y':  Training set activities

* 'trainset_sj':  Training set test subjects

* 'testset_X':  Test set only variables

* 'testset_y':  Test set activities

* 'testset_sj':  Test set test subjects

* 'DT_X':  Combined Test and training set only variables

* 'DT_y':  Combined Test and training set activities

* 'DT_sj':  Combined Test and training set test subjects

* 'DT_X_meanstd':  Combined Test and training only selected variables with mean or std of measurements

* 'DT':  Combined Test and training with selected variables with mean or std of measurements, activities and test subjects
 
* 'new_DT': new independent test set with average value of variables for each test subject and each acitivity
