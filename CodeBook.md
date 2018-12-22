---
title: "Summarized Average Measure of Accelerometer Data"
author: "Edson Fajilagot"
date: "December 21, 2018"
output: html_document
---


## Raw Data

The raw data is coming from the experiment called Human Activity Recognition Using Smartphones Dataset. The experiment collected data from accelerometers from Samsung Galaxy S smartphone. The raw data is stored under folder UCICHARDataset. For more details about the raw data please refer to ./UCICHARDataset/README.txt


## Code Book
Raw data is proccessed to get only measurement on mean and standard deviation for test and training data set.  Data set is then summarized to get the average of all measures for each activity and for each subject. Final data set is saved in a file 'average_measures.txt'.

Variables of the final dataset
1. activity
    Activity performed by subject of the experiment
    Values:
      WALKING
      WALKING_UPSTAIRS
      WALKING_DOWNSTAIRS
      SITTING
      STANDING
      LAYING


2. subject
    Subject who performed the experiment
    Values: Integers from 1 to 30


3. Average measures
   Average of all measures on mean and standard deviation
   This consists of all variables below for XYZ 3-axial signals:
   
    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
    
    Values: Numeric decimal number (i.e - 0.27628845)


## Steps Performed to Arrive to Final Dataset
The following are the steps performed.

1. Training and Test data sets are read from train and test folder respectively.
  - Appropriate descriptive variable name of measures are used based on file ./UCICHARDataset/features.txt
  - Descriptive activity names are used based on the file ./UCICHARDataset/activity_labels.txt
  - Only measures on mean and standard deviation is considered.

2. Training and Test data sets are merged into one data set.

3. Summarize the final dataset getting average of each measures per activity and subject.

4. Write the final dataset into txt file with file name 'average_measures.txt'


## Running the R script
Step 1 - Make sure that the folder containing the raw data is in the working directory
Step 2 - Run the R script run_analyis.R
Step 3 - Check the result file 'average_measures.txt'


