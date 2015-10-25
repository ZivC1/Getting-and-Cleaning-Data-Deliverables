---
title: "Code Book for File: sum_tidy_data.txt"
author: "Ziv C."
date: "October 24, 2015"
output: html_document
---

##Introduction
This document describes the data set: "summ_tidy_data.txt". The data file is the result of an assignment from the course Getting and Cleaning Data. The pupose of the assignment was to clean and process a dataset that originated from an experiment "Human Activity Recognition Using Smartphones", which is described in detail [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The original dataset can be downloaded from the follwoing URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##File structure
The file follows the requirement of "tidy data".  It has 181 rows and 81 columns, each column with a descriptive names attached to it. 

The file contains summarized information for each participat and for each activity measured.  The features are a subset of the original feature list, including only averages and standard deviations of the sensors' raw measurements. 

##Variable names
The variable names included in this file are:     
[1] "user_id"                         "activity_label"                 
 [3] "tBodyAcc.mean...X"               "tBodyAcc.mean...Y"              
 [5] "tBodyAcc.mean...Z"               "tBodyAcc.std...X"               
 [7] "tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
 [9] "tGravityAcc.mean...X"            "tGravityAcc.mean...Y"           
[11] "tGravityAcc.mean...Z"            "tGravityAcc.std...X"            
[13] "tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
[15] "tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"          
[17] "tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"           
[19] "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
[21] "tBodyGyro.mean...X"              "tBodyGyro.mean...Y"             
[23] "tBodyGyro.mean...Z"              "tBodyGyro.std...X"              
[25] "tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
[27] "tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"         
[29] "tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"          
[31] "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
[33] "tBodyAccMag.mean.."              "tBodyAccMag.std.."              
[35] "tGravityAccMag.mean.."           "tGravityAccMag.std.."           
[37] "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
[39] "tBodyGyroMag.mean.."             "tBodyGyroMag.std.."             
[41] "tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."         
[43] "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
[45] "fBodyAcc.mean...Z"               "fBodyAcc.std...X"               
[47] "fBodyAcc.std...Y"                "fBodyAcc.std...Z"               
[49] "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
[51] "fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"          
[53] "fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"          
[55] "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
[57] "fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"      
[59] "fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"      
[61] "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
[63] "fBodyGyro.mean...Z"              "fBodyGyro.std...X"              
[65] "fBodyGyro.std...Y"               "fBodyGyro.std...Z"              
[67] "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
[69] "fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."             
[71] "fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."         
[73] "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
[75] "fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."        
[77] "fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."    
[79] "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
[81] "fBodyBodyGyroJerkMag.meanFreq.."


The first variable is "user_id", which is the unique number of a participant
The second variable is "activity label", which is the activity type that was perofrmed during the measurement's time. In other words, all sensors' measurements in a particular line (sample) are associated with that activity type.      
The remaining 79 variables are averages and standard deviation of:    
+Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.   
+Triaxial Angular velocity from the gyroscope. 

###Process Steps to Produce this Dataset

The file "run_analysis.R" contains the complete documented R code that converts the original data set files to this one tidy file. 
The main processing steps were: 

1. Combine the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set (instead of just code numbers)
4. Label the data set with descriptive variable names. 
5. Create an independent tidy data set with the average of each variable for each activity and each subject.





